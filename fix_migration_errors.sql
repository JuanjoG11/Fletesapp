-- ============================================
-- 🔧 DIAGNÓSTICO Y REPARACIÓN DE ERRORES
-- ============================================
-- Ejecuta este script si tienes error 500 después de la migración

-- ============================================
-- 1. VERIFICAR ESTADO ACTUAL
-- ============================================

-- Verificar si la columna razon_social existe
SELECT 
    column_name, 
    data_type, 
    is_nullable, 
    column_default
FROM information_schema.columns 
WHERE table_name = 'usuarios' 
  AND column_name = 'razon_social';

-- Verificar usuarios con razon_social NULL
SELECT id, email, nombre, rol, razon_social 
FROM public.usuarios 
WHERE razon_social IS NULL;

-- Contar usuarios por empresa
SELECT razon_social, COUNT(*) as total
FROM public.usuarios
GROUP BY razon_social;

-- ============================================
-- 2. REPARACIÓN: Eliminar constraint y recrear
-- ============================================

-- Si hay error, eliminar la restricción NOT NULL temporalmente
ALTER TABLE public.usuarios 
ALTER COLUMN razon_social DROP NOT NULL;

-- Asignar TYM a todos los usuarios NULL
UPDATE public.usuarios 
SET razon_social = 'TYM' 
WHERE razon_social IS NULL;

-- Volver a agregar NOT NULL
ALTER TABLE public.usuarios 
ALTER COLUMN razon_social SET NOT NULL;

-- ============================================
-- 3. VERIFICAR POLÍTICAS RLS
-- ============================================

-- Ver políticas actuales
SELECT schemaname, tablename, policyname, permissive, roles, cmd, qual
FROM pg_policies
WHERE tablename = 'usuarios';

-- Si hay políticas problemáticas, recréalas
DROP POLICY IF EXISTS "Acceso usuarios por empresa" ON public.usuarios;

CREATE POLICY "Acceso usuarios por empresa" ON public.usuarios 
FOR ALL USING (
    razon_social = (
        SELECT razon_social FROM public.usuarios WHERE id = auth.uid()
    )
);

-- ============================================
-- 4. VERIFICAR TRIGGER
-- ============================================

-- Ver trigger actual
SELECT 
    trigger_name,
    event_manipulation,
    event_object_table,
    action_statement
FROM information_schema.triggers
WHERE trigger_name = 'on_auth_user_created';

-- Recrear trigger si es necesario
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;

CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION handle_new_user();

-- ============================================
-- 5. SOLUCIÓN RÁPIDA: Desactivar RLS temporalmente
-- ============================================

-- SOLO SI NADA MÁS FUNCIONA (menos seguro pero permite login)
-- Desactiva RLS para usuarios
-- ALTER TABLE public.usuarios DISABLE ROW LEVEL SECURITY;

-- Luego de hacer login, vuelve a activar:
-- ALTER TABLE public.usuarios ENABLE ROW LEVEL SECURITY;

-- ============================================
-- 6. VERIFICACIÓN FINAL
-- ============================================

-- Verificar que todo esté bien
SELECT 
    'usuarios' as tabla,
    COUNT(*) as total,
    SUM(CASE WHEN razon_social = 'TYM' THEN 1 ELSE 0 END) as tym,
    SUM(CASE WHEN razon_social = 'TAT' THEN 1 ELSE 0 END) as tat,
    SUM(CASE WHEN razon_social IS NULL THEN 1 ELSE 0 END) as nulos
FROM public.usuarios;

-- Si ves este mensaje, todo está bien ✅
DO $$
BEGIN
    RAISE NOTICE '========================================';
    RAISE NOTICE 'DIAGNÓSTICO COMPLETADO';
    RAISE NOTICE '========================================';
    RAISE NOTICE 'Si aún tienes error 500:';
    RAISE NOTICE '1. Revisa que razon_social no tenga NULLs';
    RAISE NOTICE '2. Verifica que la política RLS esté activa';
    RAISE NOTICE '3. Intenta desactivar RLS temporalmente';
    RAISE NOTICE '========================================';
END $$;
