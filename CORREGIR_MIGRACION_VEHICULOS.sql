-- ================================================================
-- 🚑 CORRECCIÓN: DEVOLVER VEHÍCULOS A TYM
-- ================================================================
-- Al parecer, muchos vehículos de TYM hicieron viajes de Polar en el pasado
-- y por eso se movieron a TAT. Vamos a deshacer eso.

-- 1. Devolver TODOS los vehículos a TYM (Reset seguro)
UPDATE public.vehiculos
SET razon_social = 'TYM';

-- 2. Asignar SOLO el vehículo específico de TAT
-- Reemplaza 'XXX000' por la placa real del vehículo de TAT.
-- Si hay más de uno, repite la línea o usa una lista.

-- UPDATE public.vehiculos SET razon_social = 'TAT' WHERE placa = 'XXX000';

-- Verificación
SELECT razon_social, COUNT(*) as total_vehiculos
FROM public.vehiculos
GROUP BY razon_social;
