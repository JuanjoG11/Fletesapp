-- ================================================================
-- 🚛 CORRECCIÓN DEFINITIVA DE ASIGNACIÓN DE VEHÍCULOS (TAT vs TYM)
-- ================================================================
-- Este script realiza tres acciones fundamentales:
-- 1. Resetea todos los vehículos para que pertenezcan a 'TYM'.
-- 2. Asegura que los 16 vehículos específicos de TAT estén creados o actualizados.
-- 3. Asigna estos 16 vehículos a la razón social 'TAT'.
-- ================================================================

BEGIN;

-- 1. Resetear todos los vehículos existentes a TYM (Borrón y cuenta nueva)
UPDATE public.vehiculos 
SET razon_social = 'TYM';

-- 2. Insertar o actualizar los vehículos de TAT según la lista oficial
-- Usamos UPSERT (ON CONFLICT) para no duplicar placas y actualizar datos si ya existen
INSERT INTO public.vehiculos (placa, conductor, modelo, razon_social, activo)
VALUES 
    ('DQA454', 'LUIS MONTOYA', 'DAHIJASUT', 'TAT', true),
    ('BCS450', 'CRISTIAN DAVID ZULUAGA BUITRAGO', 'TOYOTA HILUX', 'TAT', true),
    ('ZMN804', 'ALEJANDRO VARGAS LONDOÑO', 'CAMIÓN', 'TAT', true),
    ('SLJ329', 'JOHN FREDY GIRALDO CUERVO', 'KIA K2500', 'TAT', true),
    ('PEQ714', 'EDILBERTO MARIN NIETO', 'CHEVEROLET LUV', 'TAT', true),
    ('EST590', 'FREDDY HUMBERTO GALLEGO JIMENEZ', 'FOTON BJ1039V3JD3-1', 'TAT', true),
    ('WPP948', 'SEBASTIAN OROZCO', 'CHEVROLET NHR', 'TAT', true),
    ('TRS860', 'GONZALO ALBERTO CONTRERAS AMAYA', 'CAMIÓN', 'TAT', true),
    ('VIK442', 'DANNY ARCILA', 'CAMIÓN', 'TAT', true),
    ('GTU624', 'LUIS FELIPE VALLEJO', 'CAMIÓN', 'TAT', true),
    ('ZNN771', 'AUGUSTO ARIAS OSORIO', 'FOTON BJ1044V9JD4-F1', 'TAT', true),
    ('VDX363', 'JOSE OSNIDIO MARIN GALVIS', 'CHEVROLET NHR', 'TAT', true),
    ('WEF511', 'IVAN RICARDO VERGARA LOAIZA', 'CAMIÓN', 'TAT', true),
    ('ESK522', 'CESAR AUGUSTO', 'CHEVROLET NHR', 'TAT', true),
    ('SJT873', 'JUAN CARLOS ARANGO QUINTERO', 'CHEVROLET LUV DIMAX', 'TAT', true),
    ('TEJQ665', 'GUILLERMO RODRIGUEZ', 'CAMIÓN', 'TAT', true)
ON CONFLICT (placa) 
DO UPDATE SET 
    conductor = EXCLUDED.conductor,
    modelo = EXCLUDED.modelo,
    razon_social = EXCLUDED.razon_social,
    activo = EXCLUDED.activo;

COMMIT;

-- ================================================================
-- VERIFICACIÓN (Ejecutar después para confirmar)
-- ================================================================
-- SELECT razon_social, COUNT(*) as total FROM public.vehiculos GROUP BY razon_social;
-- SELECT * FROM public.vehiculos WHERE razon_social = 'TAT' ORDER BY placa ASC;
