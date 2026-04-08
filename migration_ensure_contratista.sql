-- ==========================================================
-- 🛠️ MIGRACIÓN: ASEGURAR COLUMNA CONTRATISTA EN VEHÍCULOS
-- ==========================================================

ALTER TABLE vehiculos 
ADD COLUMN IF NOT EXISTS contratista TEXT;

COMMENT ON COLUMN vehiculos.contratista IS 'Nombre del contratista o propietario del vehículo';
