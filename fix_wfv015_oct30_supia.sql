/* Fix: WFV015 2026-10-30 – SUPIA RIOSUCIO SUPER siempre vale $625.000 */
UPDATE fletes
SET precio = 625000
WHERE fecha = '2026-10-30'
  AND placa = 'WFV015'
  AND poblacion = 'SUPIA RIOSUCIO SUPER';

-- Verificación
SELECT fecha, placa, poblacion, valor_ruta, precio
FROM fletes
WHERE fecha = '2026-10-30' AND placa = 'WFV015';
