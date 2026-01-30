-- ==========================================================
-- 🔧 CORRECCIÓN URGENTE: PLACA TRL186
-- ==========================================================
-- Este script corrige el vehículo TRL186 que fue creado en TYM
-- y no tiene el nombre del conductor, impidiendo crear fletes

-- OPCIÓN 1: Si el vehículo existe pero sin conductor, actualizarlo
UPDATE vehiculos 
SET 
    conductor = 'RUBEN DARIO ESCOBAR DELGADO',
    contratista = 'RUBEN DARIO ESCOBAR DELGADO',
    activo = true
WHERE placa = 'TRL186' AND razon_social = 'TYM';

-- OPCIÓN 2: Si no existe, crearlo (esto fallará si ya existe por la restricción UNIQUE)
-- Descomenta las siguientes líneas si necesitas crear el vehículo desde cero:
/*
INSERT INTO vehiculos (placa, conductor, contratista, modelo, activo, razon_social)
VALUES ('TRL186', 'RUBEN DARIO ESCOBAR DELGADO', 'RUBEN DARIO ESCOBAR DELGADO', 'Estándar', true, 'TYM')
ON CONFLICT (placa, razon_social) 
DO UPDATE SET 
    conductor = 'RUBEN DARIO ESCOBAR DELGADO',
    contratista = 'RUBEN DARIO ESCOBAR DELGADO',
    activo = true;
*/

-- Verificar que quedó bien
SELECT * FROM vehiculos WHERE placa = 'TRL186';
