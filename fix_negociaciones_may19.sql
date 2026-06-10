-- ==========================================================
-- 🔧 CORRECCIÓN NEGOCIACIONES - MARTES 19 MAYO 2026
-- Suma el adicional negociado al precio de flete de los 3 vehículos
-- ==========================================================

-- VZD334 | JULIAN CUELLAR | ARMENIA | Base $320.000 + Extra $60.000 = $380.000
UPDATE fletes
SET precio = 380000
WHERE fecha = '2026-05-19' AND placa = 'VZD334' AND proveedor = 'ALPINA';

-- SXF257 | FABIO RUIZ | MONTENEGRO PTAPAO | Base $305.000 + Adicional $100.000 = $405.000
UPDATE fletes
SET precio = 405000
WHERE fecha = '2026-05-19' AND placa = 'SXF257' AND proveedor = 'ALPINA';

-- EST067 | JORGE RIVILLAS | ANSERMA NUEVO VIRGINIA | Base $302.000 + Adicional $50.000 = $352.000
UPDATE fletes
SET precio = 352000
WHERE fecha = '2026-05-19' AND placa = 'EST067' AND proveedor = 'ALPINA';

-- 🔍 Verificación de los 3 corregidos
SELECT placa, poblacion, precio AS precio_total, valor_adicional_negociacion AS adicional, razon_adicional_negociacion AS razon
FROM fletes
WHERE fecha = '2026-05-19' AND placa IN ('VZD334', 'SXF257', 'EST067');
