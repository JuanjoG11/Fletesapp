-- ==========================================================
-- 🔧 SOLUCIÓN: AGREGAR PLACA FALTANTE TJQ665 A TAT
-- ==========================================================
-- Este script inserta el vehículo que falta en la empresa TAT
-- para que aparezca el nombre del conductor automáticamente.

INSERT INTO vehiculos (placa, conductor, contratista, modelo, activo, razon_social)
VALUES 
    -- TJQ665: ALBEIRO RODRIGUEZ
    ('TJQ665', 'ALBEIRO RODRIGUEZ', 'ALBEIRO RODRIGUEZ', 'Estándar', true, 'TAT')

ON CONFLICT (placa, razon_social) 
DO UPDATE SET 
    conductor = EXCLUDED.conductor,
    contratista = EXCLUDED.contratista,
    activo = true;

-- Verificación
SELECT id, placa, conductor, razon_social, activo 
FROM vehiculos 
WHERE placa = 'TJQ665' AND razon_social = 'TAT';
