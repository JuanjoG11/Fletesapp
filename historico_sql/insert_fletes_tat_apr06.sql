-- ==========================================================
-- 🚛 INSERCIÓN DE FLETES: TAT (UNILEVER / POLAR)
-- FECHA: 06 de Abril, 2026 (Lunes)
-- ==========================================================

INSERT INTO fletes (
    fecha, dia, proveedor, placa, contratista, no_planilla, 
    zona, poblacion, auxiliares, no_auxiliares, 
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion, 
    precio, valor_ruta, no_pedidos, razon_social
)
VALUES 
-- JOSE MARIN (UNILEVER)
('2026-04-06', 'Lunes', 'UNILEVER', '', 'JOSE MARIN', '18825-18838', 'TEJ1402-1403-1405', 'MANIZALES', 'LUIS EXTRA', 1, 'No', 0, '-', 251000, 5937113, 88, 'TAT'),

-- DON DANNY (UNILEVER)
('2026-04-06', 'Lunes', 'UNILEVER', 'VIK442', 'DANY ARCILA SALGADO', '18837', 'TEJ1401-1402', 'MANIZALES', 'DANNY', 1, 'No', 0, '-', 261000, 5232328, 66, 'TAT'),

-- CRISTIAN (UNILEVER)
('2026-04-06', 'Lunes', 'UNILEVER', '', 'CRISTIAN', '18830-18827', 'TEJ1400-1400', 'MANIZALES', 'MAICOL', 1, 'No', 0, '-', 360000, 3214723, 74, 'TAT'),

-- AUGUSTO (UNILEVER)
('2026-04-06', 'Lunes', 'UNILEVER', 'ZNN771', 'AUGUSTO ARIAS OSORIO', '18835-18834-18828-18829-18792', 'MXEJ1401', 'RIO SUCIO', 'LINO', 1, 'No', 0, '-', 630000, 9993690, 50, 'TAT'),

-- LUIS FELIPE (UNILEVER)
('2026-04-06', 'Lunes', 'UNILEVER', 'GTU624', 'LUIS FELIPE VALLEJO', '18841-18839-18808', 'MXEJ1402', 'QUINCHIA', 'LUZ', 1, 'No', 0, '-', 450000, 4759648, 30, 'TAT'),

-- SEBASTIAN (UNILEVER CROSS)
('2026-04-06', 'Lunes', 'UNILEVER', '', 'SEBASTIAN', '18832-18831-18842', 'MANIZALES', 'MANIZALES', 'EXTRA', 1, 'No', 0, '-', 360000, 8968658, 24, 'TAT'),

-- RUBEN (POLAR)
('2026-04-06', 'Lunes', 'POLAR', 'EYY183', 'RUBEN DARIO ESCOBAR DELGADO', '9918069', 'MANIZALES POLAR', 'MANIZALES', 'JHONY', 1, 'No', 0, '-', 300000, 7128540, 40, 'TAT'),

-- DANILO (POLAR)
('2026-04-06', 'Lunes', 'POLAR', '', 'DANILO', '9918070', 'POLAR', 'MANIZALES', 'DANILO', 1, 'No', 0, '-', 265000, 1911820, 87, 'TAT');

-- 🔍 Verificación
SELECT fecha, proveedor, placa, contratista, zona, no_pedidos, valor_ruta, precio
FROM fletes
WHERE razon_social = 'TAT' AND fecha = '2026-04-06'
ORDER BY proveedor, placa;
