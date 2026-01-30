-- ==========================================================
-- 🔧 SOLUCIÓN COMPLETA: PLACA TRL186 - TYM
-- ==========================================================
-- Este script verifica y corrige el vehículo TRL186 en TYM

-- PASO 1: Verificar si existe el vehículo
SELECT 
    id, 
    placa, 
    conductor, 
    contratista, 
    razon_social, 
    activo,
    created_at
FROM vehiculos 
WHERE placa = 'TRL186';

-- PASO 2: Eliminar duplicados si existen (mantener solo el de TYM)
DELETE FROM vehiculos 
WHERE placa = 'TRL186' AND (conductor IS NULL OR conductor = '' OR razon_social != 'TYM');

-- PASO 3: Insertar o actualizar el vehículo correcto
INSERT INTO vehiculos (placa, conductor, contratista, modelo, activo, razon_social)
VALUES ('TRL186', 'RUBEN DARIO ESCOBAR DELGADO', 'RUBEN DARIO ESCOBAR DELGADO', 'Estándar', true, 'TYM')
ON CONFLICT (placa, razon_social) 
DO UPDATE SET 
    conductor = 'RUBEN DARIO ESCOBAR DELGADO',
    contratista = 'RUBEN DARIO ESCOBAR DELGADO',
    modelo = 'Estándar',
    activo = true;

-- PASO 4: Verificar que quedó correctamente
SELECT 
    id, 
    placa, 
    conductor, 
    contratista, 
    razon_social, 
    activo
FROM vehiculos 
WHERE placa = 'TRL186';

-- PASO 5: Verificar la restricción de unicidad
SELECT 
    conname AS constraint_name,
    contype AS constraint_type
FROM pg_constraint 
WHERE conrelid = 'vehiculos'::regclass 
AND conname LIKE '%placa%';
