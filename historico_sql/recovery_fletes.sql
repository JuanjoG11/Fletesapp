-- ==========================================================
-- 🚑 EMERGENCIA: RECUPERACIÓN / LOCALIZACIÓN DE FLETES
-- ==========================================================

-- PASO 1: Buscar los fletes por PLACA (Sin importar la fecha)
-- Esto nos dirá si siguen en la base de datos y con qué valores.
SELECT id, placa, no_planilla, fecha, dia, created_at, proveedor
FROM fletes 
WHERE placa IN ('SNP761', 'EQY944', 'ESU446', 'SMO183')
ORDER BY created_at DESC;

-- PASO 2: Si el Paso 1 NO devuelve nada, los fletes desaparecieron.
-- Ejecuta este script para RE-INSERTAR los 4 fletes manualmente con los datos correctos.
-- NOTA: Se añadió 'precio' (valor de carga) para cumplir con la restricción de la DB.

/*
INSERT INTO fletes (fecha, dia, proveedor, contratista, placa, no_planilla, zona, poblacion, auxiliares, no_auxiliares, adicionales, valor_adicional_negociacion, razon_adicional_negociacion, precio, valor_ruta, razon_social)
VALUES 
('2026-02-09', 'Lunes', 'ALPINA-FLEISCHMANN', 'JORGE HERNANN SUAREZ ALZATE', 'SNP761', '17269', 'M9604', 'QUIMBAYA', '1 (CAMILO CONTRERAS)', 1, 'No', 0, '-', 6074270, 260000, 'TYM'),
('2026-02-09', 'Lunes', 'ALPINA-FLEISCHMANN', 'GOVER CRISTANCHO VILLADA', 'EQY944', '17242', 'M9605', 'CAIMO BARCELONA', '1 (CRISTIAN CAICEDO)', 1, 'No', 0, '-', 5151973, 340000, 'TYM'),
('2026-02-09', 'Lunes', 'ALPINA-FLEISCHMANN', 'ALEJANDRO PULGARIN RESTREPO', 'ESU446', '17243', 'M9606', 'CALARCA', '1 (EDWIN GOMEZ)', 1, 'No', 0, '-', 3740990, 312000, 'TYM'),
('2026-02-09', 'Lunes', 'ALPINA-FLEISCHMANN', 'GABRIEL EDUARDO PEREZ REDONDO', 'SMO183', '17254', 'M9453', 'CARTAGO', '1 (JUAN QUINTERO)', 1, 'No', 0, '-', 3998388, 250000, 'TYM');
*/
