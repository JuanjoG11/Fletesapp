-- ================================================================
-- 🚛 CREACIÓN MASIVA DE VEHÍCULOS PARA "TAT"
-- ================================================================
-- Instrucciones:
-- 1. Copia este script en Supabase SQL Editor.
-- 2. Edita los valores abajo según necesites.
-- 3. Ejecuta el script.
-- ================================================================

-- Insertar Vehículos TAT
INSERT INTO public.vehiculos (placa, conductor, modelo, razon_social, activo, created_by)
VALUES 
    -- EJEMPLO 1
    ('TAT101', 'Juan Perez (TAT)', 'NQR', 'TAT', true, auth.uid()),
    
    -- EJEMPLO 2
    ('TAT102', 'Carlos Gomez (TAT)', 'Turbo', 'TAT', true, auth.uid()),
    
    -- EJEMPLO 3
    ('TAT103', 'Andres Lopez (TAT)', 'Sencillo', 'TAT', true, auth.uid())

    -- ... Agrega más filas aquí si necesitas
ON CONFLICT (placa) DO NOTHING; -- Evita error si la placa ya existe

-- Verificación
SELECT COUNT(*) as vehiculos_tat_total 
FROM public.vehiculos 
WHERE razon_social = 'TAT';

-- Mostrar los últimos creados
SELECT * FROM public.vehiculos 
WHERE razon_social = 'TAT' 
ORDER BY created_at DESC 
LIMIT 5;
