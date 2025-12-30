-- ================================================================
-- 🔧 CORRECCIÓN INDIVIDUAL: VEHÍCULO DQA454 A TAT
-- ================================================================

-- El script anterior movió TODO a TYM como medida de limpieza.
-- Ahora devolvemos explícitamente el vehículo que reportaste a TAT.

UPDATE public.vehiculos
SET razon_social = 'TAT'
WHERE placa = 'DQA454';

-- Verificación
SELECT * FROM public.vehiculos WHERE placa = 'DQA454';
