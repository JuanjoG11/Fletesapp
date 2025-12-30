-- ============================================
-- 🚨 CORRECCIÓN URGENTE: AISLAR TAT DE TYM
-- ============================================
-- El usuario TAT está viendo datos de TYM - esto lo soluciona AHORA

-- ============================================
-- 1. VERIFICAR EL PROBLEMA
-- ============================================

-- Ver usuario TAT y su empresa
SELECT id, email, nombre, razon_social, rol
FROM public.usuarios
WHERE email LIKE '%sebastian%' OR email LIKE '%tat%';

-- Ver todos los usuarios y sus empresas
SELECT email, nombre, razon_social, rol
FROM public.usuarios
ORDER BY razon_social, email;

-- ============================================
-- 2. CORREGIR razon_social del usuario TAT
-- ============================================

-- IMPORTANTE: Reemplaza 'sebastian@ejemplo.com' con el email real del usuario TAT
UPDATE public.usuarios 
SET razon_social = 'TAT'
WHERE email = 'tu-email-tat@ejemplo.com'; -- ⚠️ CAMBIA ESTO

-- Verificar que se actualizó
SELECT email, razon_social FROM public.usuarios WHERE razon_social = 'TAT';

-- ============================================
-- 3. ELIMINAR POLÍTICAS INCORRECTAS
-- ============================================

-- USUARIOS
DROP POLICY IF EXISTS "Acceso temporal usuarios" ON public.usuarios;
DROP POLICY IF EXISTS "Acceso total autenticados" ON public.usuarios;
DROP POLICY IF EXISTS "Acceso usuarios por empresa" ON public.usuarios;

-- FLETES
DROP POLICY IF EXISTS "Acceso temporal fletes" ON public.fletes;
DROP POLICY IF EXISTS "Acceso total autenticados" ON public.fletes;
DROP POLICY IF EXISTS "Acceso fletes por empresa" ON public.fletes;
DROP POLICY IF EXISTS "Acceso por empresa" ON public.fletes;

-- VEHÍCULOS
DROP POLICY IF EXISTS "Acceso temporal vehiculos" ON public.vehiculos;
DROP POLICY IF EXISTS "Acceso total autenticados" ON public.vehiculos;
DROP POLICY IF EXISTS "Acceso vehiculos por empresa" ON public.vehiculos;

-- ============================================
-- 4. CREAR POLÍTICAS CORRECTAS DE AISLAMIENTO
-- ============================================

-- USUARIOS: Solo ver usuarios de mi empresa
CREATE POLICY "Aislamiento por empresa - usuarios" 
ON public.usuarios 
FOR ALL 
USING (
    razon_social = (
        SELECT razon_social 
        FROM public.usuarios 
        WHERE id = auth.uid()
    )
);

-- FLETES: Solo ver fletes de mi empresa
CREATE POLICY "Aislamiento por empresa - fletes" 
ON public.fletes 
FOR ALL 
USING (
    razon_social = (
        SELECT razon_social 
        FROM public.usuarios 
        WHERE id = auth.uid()
    )
);

-- VEHÍCULOS: Solo ver vehículos de mi empresa
CREATE POLICY "Aislamiento por empresa - vehiculos" 
ON public.vehiculos 
FOR ALL 
USING (
    razon_social = (
        SELECT razon_social 
        FROM public.usuarios 
        WHERE id = auth.uid()
    )
);

-- ============================================
-- 5. VERIFICAR QUE RLS ESTÁ ACTIVO
-- ============================================

-- Asegurar que RLS esté activado en todas las tablas
ALTER TABLE public.usuarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.fletes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.vehiculos ENABLE ROW LEVEL SECURITY;

-- ============================================
-- 6. VERIFICACIÓN FINAL
-- ============================================

-- Ver políticas aplicadas
SELECT 
    tablename,
    policyname,
    permissive,
    cmd
FROM pg_policies
WHERE schemaname = 'public'
  AND tablename IN ('usuarios', 'fletes', 'vehiculos')
ORDER BY tablename, policyname;

-- Ver distribución de datos
SELECT 
    'Usuarios' as tabla,
    razon_social,
    COUNT(*) as cantidad
FROM public.usuarios
GROUP BY razon_social

UNION ALL

SELECT 
    'Fletes' as tabla,
    razon_social,
    COUNT(*) as cantidad
FROM public.fletes
GROUP BY razon_social

UNION ALL

SELECT 
    'Vehículos' as tabla,
    razon_social,
    COUNT(*) as cantidad
FROM public.vehiculos
GROUP BY razon_social
ORDER BY tabla, razon_social;

-- ============================================
-- 7. TEST DE AISLAMIENTO
-- ============================================

-- Este query debe retornar 0 cuando lo ejecuta un usuario TAT
-- (porque TAT no debe ver fletes TYM)
SELECT COUNT(*) as fletes_tym_visibles
FROM public.fletes
WHERE razon_social = 'TYM';

-- Mensaje final
DO $$
DECLARE
    usuarios_tat INTEGER;
    usuarios_tym INTEGER;
BEGIN
    SELECT COUNT(*) INTO usuarios_tat FROM public.usuarios WHERE razon_social = 'TAT';
    SELECT COUNT(*) INTO usuarios_tym FROM public.usuarios WHERE razon_social = 'TYM';

    RAISE NOTICE '========================================';
    RAISE NOTICE 'CORRECCIÓN COMPLETADA';
    RAISE NOTICE '========================================';
    RAISE NOTICE 'Usuarios TAT: %', usuarios_tat;
    RAISE NOTICE 'Usuarios TYM: %', usuarios_tym;
    RAISE NOTICE '';
    RAISE NOTICE 'IMPORTANTE:';
    RAISE NOTICE '1. Cierra sesión del usuario TAT';
    RAISE NOTICE '2. Vuelve a iniciar sesión';
    RAISE NOTICE '3. TAT debe ver 0 fletes y 0 vehículos';
    RAISE NOTICE '4. TYM debe seguir viendo todos sus datos';
    RAISE NOTICE '========================================';
END $$;
