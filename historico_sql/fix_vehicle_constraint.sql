-- ==========================================================
-- 🛠️ CORRECCIÓN: UNICIDAD DE PLACAS POR EMPRESA
-- ==========================================================
-- Este script permite que una misma placa exista en diferentes
-- empresas (TAT y TYM) de forma aislada.

-- 1. Identificar el nombre de la restricción de unicidad actual (usualmente es vehiculos_placa_key)
-- 2. Eliminar la restricción antigua y crear la nueva por (placa, razon_social)

DO $$ 
BEGIN
    -- Intentar eliminar la restricción de placa única global si existe
    IF EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'vehiculos_placa_key') THEN
        ALTER TABLE vehiculos DROP CONSTRAINT vehiculos_placa_key;
    END IF;

    -- Crear la nueva restricción compuesta
    -- Esto permite Placa ABC123 en TAT y Placa ABC123 en TYM simultáneamente.
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'vehiculos_placa_razon_social_key') THEN
        ALTER TABLE vehiculos ADD CONSTRAINT vehiculos_placa_razon_social_key UNIQUE (placa, razon_social);
    END IF;
END $$;
