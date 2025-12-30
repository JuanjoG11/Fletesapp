-- ================================================================
-- 🔒 SOLUCIÓN DEFINITIVA: AISLAMIENTO SEGURO DE DATOS (TAT vs TYM)
-- ================================================================

-- PASO 1: Habilitar Row Level Security (RLS) en todas las tablas sensibles
ALTER TABLE public.usuarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.fletes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.vehiculos ENABLE ROW LEVEL SECURITY;

-- PASO 2: Eliminar políticas antiguas (Limpieza total)
-- Usuarios
DROP POLICY IF EXISTS "Acceso total autenticados" ON public.usuarios;
DROP POLICY IF EXISTS "Acceso temporal usuarios" ON public.usuarios;
DROP POLICY IF EXISTS "Acceso usuarios por empresa" ON public.usuarios;
DROP POLICY IF EXISTS "Aislamiento por empresa - usuarios" ON public.usuarios;
-- Fletes
DROP POLICY IF EXISTS "Acceso total autenticados" ON public.fletes;
DROP POLICY IF EXISTS "Acceso temporal fletes" ON public.fletes;
DROP POLICY IF EXISTS "Acceso fletes por empresa" ON public.fletes;
DROP POLICY IF EXISTS "Aislamiento por empresa - fletes" ON public.fletes;
-- Vehículos
DROP POLICY IF EXISTS "Acceso total autenticados" ON public.vehiculos;
DROP POLICY IF EXISTS "Acceso temporal vehiculos" ON public.vehiculos;
DROP POLICY IF EXISTS "Acceso vehiculos por empresa" ON public.vehiculos;
DROP POLICY IF EXISTS "Aislamiento por empresa - vehiculos" ON public.vehiculos;

-- PASO 3: Crear Nuevas Políticas Estrictas
-- Lógica: Un usuario solo puede ver filas donde 'razon_social' coincida con SU 'razon_social'

-- 3.1 POLÍTICA PARA USUARIOS
-- Permite que un usuario se vea a sí mismo y a otros de su misma empresa
CREATE POLICY "Aislamiento Estricto Usuarios"
ON public.usuarios
FOR ALL
USING (
    razon_social = (
        SELECT razon_social FROM public.usuarios WHERE id = auth.uid()
    )
);

-- 3.2 POLÍTICA PARA FLETES
-- Solo ver fletes de mi empresa
CREATE POLICY "Aislamiento Estricto Fletes"
ON public.fletes
FOR ALL
USING (
    razon_social = (
        SELECT razon_social FROM public.usuarios WHERE id = auth.uid()
    )
);

-- 3.3 POLÍTICA PARA VEHÍCULOS
-- Solo ver vehículos de mi empresa
CREATE POLICY "Aislamiento Estricto Vehiculos"
ON public.vehiculos
FOR ALL
USING (
    razon_social = (
        SELECT razon_social FROM public.usuarios WHERE id = auth.uid()
    )
);

-- PASO 4: Verificación (Opcional, para confirmar)
-- Si ejecutas esto como Admin de BD verás todo, pero la política aplicará a usuarios conectados vía App.
SELECT tablename, policyname, cmd FROM pg_policies WHERE schemaname = 'public';
