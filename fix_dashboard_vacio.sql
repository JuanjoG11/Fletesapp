-- ============================================
-- 🔧 REPARAR DATOS VACÍOS EN DASHBOARD
-- ============================================
-- Ejecuta este script para que vuelvas a ver tus fletes y vehículos

-- ============================================
-- 1. DIAGNÓSTICO: Ver qué está pasando
-- ============================================

-- Ver tu usuario y su empresa
SELECT id, email, nombre, razon_social 
FROM public.usuarios 
WHERE id = auth.uid();

-- Ver distribución de fletes por empresa
SELECT razon_social, COUNT(*) as total_fletes
FROM public.fletes
GROUP BY razon_social;

-- Ver fletes sin empresa asignada
SELECT COUNT(*) as fletes_sin_empresa
FROM public.fletes
WHERE razon_social IS NULL;

-- Ver vehículos sin empresa
SELECT COUNT(*) as vehiculos_sin_empresa
FROM public.vehiculos
WHERE razon_social IS NULL;

-- ============================================
-- 2. SOLUCIÓN: Asignar TYM a todos los datos
-- ============================================

-- Asegurar que FLETES tengan razon_social
UPDATE public.fletes 
SET razon_social = 'TYM' 
WHERE razon_social IS NULL;

-- Asegurar que VEHÍCULOS tengan razon_social  
UPDATE public.vehiculos 
SET razon_social = 'TYM' 
WHERE razon_social IS NULL;

-- Asegurar que tu USUARIO tenga razon_social
UPDATE public.usuarios 
SET razon_social = 'TYM' 
WHERE razon_social IS NULL;

-- ============================================
-- 3. VERIFICAR POLÍTICAS RLS
-- ============================================

-- Ver políticas en fletes
SELECT policyname, cmd, qual
FROM pg_policies
WHERE tablename = 'fletes';

-- Ver políticas en vehículos
SELECT policyname, cmd, qual
FROM pg_policies
WHERE tablename = 'vehiculos';

-- ============================================
-- 4. RECREAR POLÍTICAS (Si están mal)
-- ============================================

-- FLETES
DROP POLICY IF EXISTS "Acceso fletes por empresa" ON public.fletes;
DROP POLICY IF EXISTS "Acceso por empresa" ON public.fletes;
DROP POLICY IF EXISTS "Acceso total autenticados" ON public.fletes;

CREATE POLICY "Acceso fletes por empresa" ON public.fletes 
FOR ALL USING (
    razon_social = (
        SELECT razon_social FROM public.usuarios WHERE id = auth.uid()
    )
);

-- VEHÍCULOS
DROP POLICY IF EXISTS "Acceso vehiculos por empresa" ON public.vehiculos;
DROP POLICY IF EXISTS "Acceso total autenticados" ON public.vehiculos;

CREATE POLICY "Acceso vehiculos por empresa" ON public.vehiculos 
FOR ALL USING (
    razon_social = (
        SELECT razon_social FROM public.usuarios WHERE id = auth.uid()
    )
);

-- ============================================
-- 5. VERIFICACIÓN FINAL
-- ============================================

-- Contar tus datos
SELECT 
    'Tu usuario' as tipo,
    razon_social,
    COUNT(*) as cantidad
FROM public.usuarios 
WHERE id = auth.uid()
GROUP BY razon_social

UNION ALL

SELECT 
    'Fletes' as tipo,
    razon_social,
    COUNT(*) as cantidad
FROM public.fletes
GROUP BY razon_social

UNION ALL

SELECT 
    'Vehículos' as tipo,
    razon_social,
    COUNT(*) as cantidad
FROM public.vehiculos
GROUP BY razon_social;

-- Mensaje de confirmación
DO $$
DECLARE
    mi_empresa TEXT;
    mis_fletes INTEGER;
    mis_vehiculos INTEGER;
BEGIN
    -- Obtener tu empresa
    SELECT razon_social INTO mi_empresa
    FROM public.usuarios
    WHERE id = auth.uid();

    -- Contar fletes
    SELECT COUNT(*) INTO mis_fletes
    FROM public.fletes
    WHERE razon_social = mi_empresa;

    -- Contar vehículos
    SELECT COUNT(*) INTO mis_vehiculos
    FROM public.vehiculos
    WHERE razon_social = mi_empresa;

    RAISE NOTICE '========================================';
    RAISE NOTICE 'REPARACIÓN COMPLETADA';
    RAISE NOTICE '========================================';
    RAISE NOTICE 'Tu empresa: %', mi_empresa;
    RAISE NOTICE 'Tus fletes: %', mis_fletes;
    RAISE NOTICE 'Tus vehículos: %', mis_vehiculos;
    RAISE NOTICE '========================================';
    RAISE NOTICE 'Recarga el dashboard (F5) para ver los datos';
    RAISE NOTICE '========================================';
END $$;
