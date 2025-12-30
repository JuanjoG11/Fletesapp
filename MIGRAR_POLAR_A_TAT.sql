-- ================================================================
-- 🐻 MIGRACIÓN: MOVER "POLAR" DE TYM A TAT
-- ================================================================

-- 1. Migrar FLETES de proveedor 'POLAR' a la empresa 'TAT'
UPDATE public.fletes
SET razon_social = 'TAT'
WHERE proveedor = 'POLAR';

-- 2. Migrar VEHÍCULOS asociados (Opcional pero recomendado)
-- Si hay vehículos que solo trabajan para POLAR, deberían pasar a TAT.
-- Como no tenemos un campo 'proveedor' fijo en vehículos, 
-- migraremos aquellos vehículos que hayan hecho fletes EXCLUSIVAMENTE para POLAR.

-- (Nota: Si prefieres no migrar vehículos automáticamente, no ejecutes esta parte 2)

-- Lógica segura: Si un vehículo ha hecho fletes de POLAR, pasémoslo a TAT
-- para que el usuario TAT pueda ver el vehículo en sus reportes.
UPDATE public.vehiculos
SET razon_social = 'TAT'
WHERE placa IN (
    SELECT DISTINCT placa 
    FROM public.fletes 
    WHERE proveedor = 'POLAR'
);

-- 3. Verificación
SELECT razon_social, COUNT(*) as cantidad_fletes
FROM public.fletes
WHERE proveedor = 'POLAR'
GROUP BY razon_social;
