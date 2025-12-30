-- ============================================
-- 🏢 MIGRACIÓN MULTI-TENANT (TYM + TAT)
-- ============================================
-- Este script agrega soporte multi-empresa al sistema de fletes
-- Permite aislar datosde TYM y TAT completamente

-- ============================================
-- 1. AGREGAR COLUMNAS razon_social
-- ============================================

-- Tabla usuarios: Agregar empresa del usuario
ALTER TABLE public.usuarios 
ADD COLUMN IF NOT EXISTS razon_social TEXT NOT NULL DEFAULT 'TYM' 
CHECK (razon_social IN ('TYM', 'TAT'));

-- Tabla fletes: Agregar empresa del flete
ALTER TABLE public.fletes 
ADD COLUMN IF NOT EXISTS razon_social TEXT NOT NULL DEFAULT 'TYM' 
CHECK (razon_social IN ('TYM', 'TAT'));

-- Tabla vehiculos: Agregar empresa del vehículo (TAT tiene su propia flota)
ALTER TABLE public.vehiculos 
ADD COLUMN IF NOT EXISTS razon_social TEXT NOT NULL DEFAULT 'TYM' 
CHECK (razon_social IN ('TYM', 'TAT'));

-- ============================================
-- 2. MIGRAR DATOS EXISTENTES
-- ============================================

-- Asignar todos los usuarios existentes a TYM
UPDATE public.usuarios 
SET razon_social = 'TYM' 
WHERE razon_social IS NULL;

-- Asignar todos los vehículos existentes a TYM
UPDATE public.vehiculos 
SET razon_social = 'TYM' 
WHERE razon_social IS NULL;

-- Asignar todos los fletes existentes a TYM
-- (heredan la razón social del usuario que los creó)
UPDATE public.fletes f
SET razon_social = COALESCE(
    (SELECT razon_social FROM public.usuarios WHERE id = f.user_id),
    'TYM'
)
WHERE f.razon_social IS NULL;

-- ============================================
-- 3. CREAR ÍNDICES PARA PERFORMANCE
-- ============================================

-- Índice en usuarios para búsquedas por empresa
CREATE INDEX IF NOT EXISTS idx_usuarios_razon_social 
ON public.usuarios(razon_social);

-- Índice en fletes para filtrado rápido por empresa
CREATE INDEX IF NOT EXISTS idx_fletes_razon_social 
ON public.fletes(razon_social);

-- Índice compuesto para consultas frecuentes de fletes
CREATE INDEX IF NOT EXISTS idx_fletes_razon_fecha 
ON public.fletes(razon_social, fecha DESC);

-- Índice en vehículos para filtrado por empresa
CREATE INDEX IF NOT EXISTS idx_vehiculos_razon_social 
ON public.vehiculos(razon_social);

-- ============================================
-- 4. ACTUALIZAR ROW LEVEL SECURITY (RLS)
-- ============================================

-- POLÍTICA PARA USUARIOS
-- Los usuarios solo pueden ver otros usuarios de su misma empresa
DROP POLICY IF EXISTS "Acceso total autenticados" ON public.usuarios;
DROP POLICY IF EXISTS "Acceso usuarios por empresa" ON public.usuarios;

CREATE POLICY "Acceso usuarios por empresa" ON public.usuarios 
FOR ALL USING (
    razon_social = (
        SELECT razon_social FROM public.usuarios WHERE id = auth.uid()
    )
);

-- POLÍTICA PARA FLETES
-- Los usuarios solo pueden ver/editar fletes de su empresa
DROP POLICY IF EXISTS "Acceso total autenticados" ON public.fletes;
DROP POLICY IF EXISTS "Acceso fletes por empresa" ON public.fletes;

CREATE POLICY "Acceso fletes por empresa" ON public.fletes 
FOR ALL USING (
    razon_social = (
        SELECT razon_social FROM public.usuarios WHERE id = auth.uid()
    )
);

-- POLÍTICA PARA VEHÍCULOS
-- Los usuarios solo pueden ver/editar vehículos de su empresa
DROP POLICY IF EXISTS "Acceso total autenticados" ON public.vehiculos;
DROP POLICY IF EXISTS "Acceso vehiculos por empresa" ON public.vehiculos;

CREATE POLICY "Acceso vehiculos por empresa" ON public.vehiculos 
FOR ALL USING (
    razon_social = (
        SELECT razon_social FROM public.usuarios WHERE id = auth.uid()
    )
);

-- ============================================
-- 5. ACTUALIZAR TRIGGER handle_new_user
-- ============================================

-- Modificar trigger para incluir razon_social al crear usuario
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
    -- Eliminar perfiles huérfanos
    DELETE FROM public.usuarios WHERE email = NEW.email AND id != NEW.id;

    INSERT INTO public.usuarios (id, email, nombre, rol, razon_social)
    VALUES (
        NEW.id,
        NEW.email,
        COALESCE(NEW.raw_user_meta_data->>'nombre', 'Usuario Nuevo'),
        COALESCE(NEW.raw_user_meta_data->>'rol', 'operario'),
        COALESCE(NEW.raw_user_meta_data->>'razon_social', 'TYM') -- DEFAULT TYM
    ) ON CONFLICT (id) DO UPDATE SET 
        email = EXCLUDED.email,
        nombre = EXCLUDED.nombre,
        rol = EXCLUDED.rol,
        razon_social = COALESCE(public.usuarios.razon_social, EXCLUDED.razon_social);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================
-- 6. ACTUALIZAR VISTA vista_fletes_completos
-- ============================================

-- Recrear vista para incluir razon_social
DROP VIEW IF EXISTS public.vista_fletes_completos;

CREATE OR REPLACE VIEW public.vista_fletes_completos AS
SELECT 
    f.*,
    v.placa,
    v.conductor,
    v.modelo as vehiculo_modelo,
    u.nombre as creado_por,
    u.razon_social as empresa_usuario
FROM public.fletes f
LEFT JOIN public.vehiculos v ON f.vehiculo_id = v.id
LEFT JOIN public.usuarios u ON f.user_id = u.id;

-- ============================================
-- 7. VERIFICACIÓN
-- ============================================

-- Verificar conteo de registros por empresa
DO $$
DECLARE
    count_usuarios_tym INTEGER;
    count_usuarios_tat INTEGER;
    count_fletes_tym INTEGER;
    count_fletes_tat INTEGER;
    count_vehiculos_tym INTEGER;
    count_vehiculos_tat INTEGER;
BEGIN
    SELECT COUNT(*) INTO count_usuarios_tym FROM public.usuarios WHERE razon_social = 'TYM';
    SELECT COUNT(*) INTO count_usuarios_tat FROM public.usuarios WHERE razon_social = 'TAT';
    SELECT COUNT(*) INTO count_fletes_tym FROM public.fletes WHERE razon_social = 'TYM';
    SELECT COUNT(*) INTO count_fletes_tat FROM public.fletes WHERE razon_social = 'TAT';
    SELECT COUNT(*) INTO count_vehiculos_tym FROM public.vehiculos WHERE razon_social = 'TYM';
    SELECT COUNT(*) INTO count_vehiculos_tat FROM public.vehiculos WHERE razon_social = 'TAT';

    RAISE NOTICE '========================================';
    RAISE NOTICE 'MIGRACIÓN COMPLETADA EXITOSAMENTE';
    RAISE NOTICE '========================================';
    RAISE NOTICE 'Usuarios TYM: %', count_usuarios_tym;
    RAISE NOTICE 'Usuarios TAT: %', count_usuarios_tat;
    RAISE NOTICE 'Fletes TYM: %', count_fletes_tym;
    RAISE NOTICE 'Fletes TAT: %', count_fletes_tat;
    RAISE NOTICE 'Vehículos TYM: %', count_vehiculos_tym;
    RAISE NOTICE 'Vehículos TAT: %', count_vehiculos_tat;
    RAISE NOTICE '========================================';
END $$;

-- ============================================
-- SCRIPT COMPLETADO ✅
-- ============================================
-- Todos los datos existentes fueron asignados a TYM
-- Para crear usuarios TAT, ver GUIA_CREAR_USUARIOS_TAT.md
