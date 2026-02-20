-- ==========================================================
-- 🛠️ MIGRACIÓN: AGREGAR CAMPO PROVEEDOR A VEHÍCULOS
-- ==========================================================

ALTER TABLE vehiculos 
ADD COLUMN IF NOT EXISTS proveedor TEXT;

COMMENT ON COLUMN vehiculos.proveedor IS 'Proveedor asociado al vehículo (ALPINA, ZENU, etc.)';
