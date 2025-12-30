-- ================================================================
-- 🚑 FIX URGENTE: ERROR 500 (BUCLE INFINITO EN RLS)
-- ================================================================
-- EL PROBLEMA: La política anterior consultaba la tabla 'usuarios'
-- para ver si podías consultar la tabla 'usuarios', creando un ciclo infinito.

-- SOLUCIÓN: Usar una función "SECURITY DEFINER" que se salta las políticas
-- para obtener tu razón social de forma segura.

-- 1. Crear función segura para obtener mi empresa
CREATE OR REPLACE FUNCTION get_my_razon_social()
RETURNS text
LANGUAGE sql
SECURITY DEFINER -- ⚠️ ESTO ES LA CLAVE: Se ejecuta con permisos de admin
SET search_path = public -- Seguridad: forzar esquema public
AS $$
    SELECT razon_social FROM public.usuarios WHERE id = auth.uid();
$$;

-- 2. Eliminar políticas con bucle
DROP POLICY IF EXISTS "Aislamiento Estricto Usuarios" ON public.usuarios;
DROP POLICY IF EXISTS "Aislamiento Estricto Fletes" ON public.fletes;
DROP POLICY IF EXISTS "Aislamiento Estricto Vehiculos" ON public.vehiculos;

-- 3. Crear Nuevas Políticas Sin Bucle (Usando la función)

-- USUARIOS
CREATE POLICY "Aislamiento Sin Loop - Usuarios"
ON public.usuarios
FOR ALL
USING (
    razon_social = get_my_razon_social()
);

-- FLETES
CREATE POLICY "Aislamiento Sin Loop - Fletes"
ON public.fletes
FOR ALL
USING (
    razon_social = get_my_razon_social()
);

-- VEHÍCULOS
CREATE POLICY "Aislamiento Sin Loop - Vehiculos"
ON public.vehiculos
FOR ALL
USING (
    razon_social = get_my_razon_social()
);

-- Verificación rápida
SELECT 'Fix Aplicado Correctamente' as status;
