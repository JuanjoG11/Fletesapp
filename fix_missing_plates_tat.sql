-- ==========================================================
-- 🔧 SOLUCIÓN: AGREGAR PLACAS FALTANTES A TAT
-- ==========================================================
-- Este script inserta los vehículos que faltan en la empresa TAT
-- para que aparezcan el nombre del conductor automáticamente.

INSERT INTO vehiculos (placa, conductor, contratista, modelo, activo, razon_social)
VALUES 
    -- TDY481: JHON SANDRO ZULUAGA BARRERA
    ('TDY481', 'JHON SANDRO ZULUAGA BARRERA', 'JHON SANDRO ZULUAGA BARRERA', 'Estándar', true, 'TAT'),
    
    -- WLL481: DAVID RAMIREZ BUENO
    ('WLL481', 'DAVID RAMIREZ BUENO', 'DAVID RAMIREZ BUENO', 'Estándar', true, 'TAT'),
    
    -- CRZ810: BLANCA INES HIDALGO DE DIAZ
    ('CRZ810', 'BLANCA INES HIDALGO DE DIAZ', 'BLANCA INES HIDALGO DE DIAZ', 'Estándar', true, 'TAT')

ON CONFLICT (placa, razon_social) 
DO UPDATE SET 
    conductor = EXCLUDED.conductor,
    contratista = EXCLUDED.contratista,
    activo = true;

-- Verificación
SELECT id, placa, conductor, razon_social, activo 
FROM vehiculos 
WHERE placa IN ('TDY481', 'WLL481', 'CRZ810') AND razon_social = 'TAT';
