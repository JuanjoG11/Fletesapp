-- ==========================================================
-- 🛠️ CORRECCIÓN DE SCHEMA Y REPARACIÓN DE BÚSQUEDA
-- ==========================================================

-- 1. Crear la columna 'placa' si no existe
ALTER TABLE fletes ADD COLUMN IF NOT EXISTS placa text;

-- 2. Copiar placas de los vehículos (Backfill)
UPDATE fletes F
SET placa = V.placa
FROM vehiculos V
WHERE F.vehiculo_id = V.id
AND (F.placa IS NULL OR F.placa = '');

-- 3. Confirmación
SELECT count(*) as fletes_con_placa
FROM fletes
WHERE placa IS NOT NULL;
