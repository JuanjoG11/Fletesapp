-- ==========================================================
-- 🛠️ MIGRACIÓN: NUEVOS CAMPOS PARA VEHÍCULOS
-- ==========================================================
-- Este script añade campos para carrocería, capacidad, servicio y contrato.

ALTER TABLE vehiculos 
ADD COLUMN IF NOT EXISTS carroceria TEXT,
ADD COLUMN IF NOT EXISTS capacidad TEXT,
ADD COLUMN IF NOT EXISTS servicio TEXT,
ADD COLUMN IF NOT EXISTS contrato TEXT DEFAULT 'SI';

COMMENT ON COLUMN vehiculos.carroceria IS 'Tipo de carrocería del vehículo';
COMMENT ON COLUMN vehiculos.capacidad IS 'Capacidad de carga del vehículo';
COMMENT ON COLUMN vehiculos.servicio IS 'Tipo de servicio que presta';
COMMENT ON COLUMN vehiculos.contrato IS 'Si tiene contrato (SI/NO), por defecto SI';

-- Actualizar vehículos existentes para que tengan 'SI' en contrato
UPDATE vehiculos 
SET contrato = 'SI' 
WHERE contrato IS NULL;
