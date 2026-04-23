-- ==========================================================
-- 🚛 SCRIPT FINAL: ALPINA Y FLEISCHMANN (22 de Abril)
-- ==========================================================

-- 1. Limpiar registros de hoy para evitar duplicados
DELETE FROM fletes WHERE fecha = '2026-04-22' AND proveedor IN ('ALPINA', 'FLEISCHMANN');

-- 2. Insertar datos con el TOTAL sumado en la columna 'precio'
-- Se mantiene adicionales='No' por actualización de lógica en la App
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla, 
    zona, poblacion, auxiliares, no_auxiliares, 
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion, 
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES 
-- CALDAS (ALPINA)
('2026-04-22', 'Miercoles', 'ALPINA', 'HUMBERTO RINCON', 'WLS478', '19500', '7002', 'CHINCHINA', 'BLAIMIR VENDEDOR, LINA VENDEDORA', 2, 'No', 78000, 'WLS478 VALOR FLETE $350.000', 19775887, 350000, 4, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'JOHAN ECHEVERRY', 'TMO981', '19533 19549, 18388', '9552 9550', 'MANIZALES', 'EDWAR ZAPATA', 1, 'No', 0, '-', 9960233, 330000, 50, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'YONNI VALENCIA', 'WFV015', '19535 19551, 18384 18387', '9554 7000', 'MANIZALES', 'CRISTIAN OSPINA', 1, 'No', 0, '-', 9983021, 330000, 56, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'RUBEN', 'EYY183', '19552, 18385', '9555', 'MANIZALES', 'JUAN ALEJANDRO', 1, 'No', 0, '-', 7224862, 330000, 49, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'MIGUEL GONZALES', 'SLI587', '19553, 18389 18386', '9556', 'MANIZALES', 'ADRIAN MARTINEZ', 1, 'No', 0, '-', 9191997, 330000, 63, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'RICARDO PINEDA', 'KOL802', '19554', '9557', 'MARMATO LA MERCED', 'JUAN DELGADO', 1, 'No', 0, '-', 16232656, 550000, 32, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'CARLOS GOMEZ', 'EYX091', '19517 19555, 18391', '9558', 'AGUADAS', 'VICTOR PULGARIN, JUAN COCOMA', 2, 'No', 0, '-', 13454966, 580000, 67, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'JUAN DAVID', 'SMH182', '19556, 18392', '9559', 'ARAUCA PALESTINA', 'BRANDON BAEZ, EXTRA (YEISON)', 2, 'No', 0, '-', 8597074, 272000, 47, null, 'TYM'),

-- QUINDIO (ALPINA)
('2026-04-22', 'Miercoles', 'ALPINA', 'JUAN CARLOS', 'SJT873', '19538 19570, 18411', '7010', 'MONTENEGRO QUIMBAYA', 'SEBASTIAN VENDEDOR', 1, 'No', 18000, 'SJT873 VALOR DE FLETE $300.000', 5693739, 300000, 20, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'OSWALDO', 'SPU120', '19537 19557', '9601 7009', 'ARMENIA', 'YEISON RENDON', 1, 'No', 0, '-', 10086874, 320000, 56, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'YONNI VALENCIA', 'WFV015', '19520 19536 19568', '9602TSS 7008', 'ARMENIA', 'SEBASTIAN VILLADA, EXTRA (CAMILO)', 2, 'No', 60000, 'WFV015 EXTRA $60.000', 11275915, 380000, 61, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'JULIAN CUELLAR', 'VZD334', '19559', '9603', 'ARMENIA', 'JOHN GIRALDO', 1, 'No', 60000, 'VZD334 EXTRA $60.000', 10096705, 398000, 57, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'FABIO RUIZ', 'SXF257', '19560', '9604', 'QUIMBAYA', 'CAMILO CONTRERAS', 1, 'No', 0, '-', 9390132, 282000, 41, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'GOBER CRISTANCHO', 'EQY944', '19581, 18395 18396', '9605', 'PIJAO CORDOBA', 'CRISTIAN CAICEDO', 1, 'No', 0, '-', 6509990, 320000, 43, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'YIMERSON GARCIA', 'TTL256', '19562, 18394', '9606', 'SALENTO', 'CRISTIAN CAMACHO', 1, 'No', 0, '-', 7846553, 294000, 30, 'AP607128-129', 'TYM'),

-- RISARALDA / VALLE (ALPINA)
('2026-04-22', 'Miercoles', 'ALPINA', 'GABRIEL PEREZ', 'SMO183', '19502', '9453', 'PEREIRA', 'JUAN QUINTERO', 1, 'No', 0, '-', 8952595, 224000, 59, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'PABLO', 'LUM993', '19542', '9454', 'PEREIRA', 'ANDRES PINEDA', 1, 'No', 0, '-', 7617507, 224000, 43, 'FEP1181717-804-821-829-838', 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'RICARDO LOPEZ', 'TMZ674', '19504', '9455', 'PEREIRA', 'ANDRES RIOS', 1, 'No', 60000, 'TMZ674 EXTRA $60.000', 7219735, 284000, 61, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'CARLOS VELASCO', 'SPQ814', '19543', '9456', 'SANTA ROSA', 'SANTIAGO HENAO', 1, 'No', 0, '-', 7940367, 238000, 58, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'HUMBERTO PARRA', 'WHM317', '19544', '9457', 'PEREIRA', 'CESAR CASTILLO', 1, 'No', 0, '-', 8401444, 224000, 55, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'MIGUEL TABARES', 'PEK019', '19545', '9458', 'PEREIRA', 'JHON GARCIA', 1, 'No', 0, '-', 6635111, 224000, 54, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'JAMES MUÑOZ', 'XVI496', '19508', '9459', 'PEREIRA', 'CRISTIAN JIMENEZ, FABIAN VENDEDOR', 2, 'No', 0, '-', 8790207, 224000, 62, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'JULIAN', 'WLC133', '19547', '9460', 'PEREIRA', 'EDWIN GOMEZ', 1, 'No', 0, '-', 7547698, 224000, 68, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'ALEXANDER CUELLAR', 'WHM896', '19548', '9461', 'CARTAGO', 'DIORLAN', 1, 'No', 0, '-', 8876000, 290000, 52, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'DIEGO RATIVA', 'WTN748', '19563', '7004', 'PEREIRA', 'BRAHIAN VALENCIA', 1, 'No', 0, '-', 8862119, 224000, 56, 'FEP1181718-800-802-803-807-809-815-817-820-827-828-832-834', 'TYM'),

-- PUEBLOS (ALPINA)
('2026-04-22', 'Miercoles', 'ALPINA', 'JORGE RIVILLAS', 'EST067', '19540 19564, 18403', '7005 7001', 'ANSERMA NUEVO / MERCASA', 'EXTRA (VILLALBA)', 1, 'No', 50000, 'ADICIONAL AL FLETE $50.000', 8230004, 420000, 34, null, 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'JORGE ALARCON', 'ERK303', '19565', '7006', 'BALBOA LA CELIA', 'ROBINSON TORRES', 1, 'No', 0, '-', 6543999, 330000, 39, 'FEP1181624-626-630-632-628', 'TYM'),
('2026-04-22', 'Miercoles', 'ALPINA', 'ADALBERTO MEJIA', 'TNH494', '19566 19532, 18404', '7007 9451', 'ANSERMA', 'LUIS CADAVID, OSCAR RESTREPO', 2, 'No', 0, '-', 16372716, 290000, 55, null, 'TYM'),

-- FLEISCHMANN
('2026-04-22', 'Miercoles', 'FLEISCHMANN', 'CARLOS CASTAÑO', 'SQB119', '18399 18410 18409', 'FLEISCHMANN', 'PEREIRA', 'DIEGO FRANCO', 1, 'No', 0, '-', 4736966, 320000, 51, 'FEP1181795-796-797-801-818 FEP1181682-684-676-677-678-679-680-681', 'TYM');

-- 🔍 Verificación Final (Deben aparecer los totales sumados)
SELECT fecha, placa, precio AS total_flete, valor_adicional_negociacion AS extra
FROM fletes
WHERE fecha = '2026-04-22';
