/* ==========================================================
   🔧 FIX: Fletes omitidos por placa no registrada en vehiculos
   
   TRF860 → nov-04, nov-11
   SXE499 → nov-05
   TRK507 → nov-05
   ========================================================== */

/* ----------------------------------------------------------
   1️⃣  Registrar vehículos si no existen
   ---------------------------------------------------------- */
INSERT INTO vehiculos (placa, conductor, modelo, activo, estado_vehiculo, razon_social)
VALUES ('TRF860', 'ALBERTO GONZALO', 'Estándar', true, 'activo', 'TYM')
ON CONFLICT (placa, razon_social) DO NOTHING;

INSERT INTO vehiculos (placa, conductor, modelo, activo, estado_vehiculo, razon_social)
VALUES ('SXE499', 'BRAHIAN STIVEN VALENCIA IGLESIAS', 'Estándar', true, 'activo', 'TYM')
ON CONFLICT (placa, razon_social) DO NOTHING;

INSERT INTO vehiculos (placa, conductor, modelo, activo, estado_vehiculo, razon_social)
VALUES ('TRK507', 'MILTON GILMER OSORIO CALLE', 'Estándar', true, 'activo', 'TYM')
ON CONFLICT (placa, razon_social) DO NOTHING;

/* ----------------------------------------------------------
   2️⃣  TRF860 — nov-04 FLEISCHMANN CARTAGO 2T
   ---------------------------------------------------------- */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','FLEISCHMANN',v.conductor,'TRF860','25301','FLEISCHMANN','CARTAGO 2T','JULIAN RODRIGUEZ',1,
       1,0,'VALOR DE RUTA $350.000',
       7210613,350000,
       42,'21059 21062','TYM'
FROM vehiculos v WHERE v.placa='TRF860' AND v.razon_social='TYM' LIMIT 1;

/* ----------------------------------------------------------
   3️⃣  TRF860 — nov-11 FLEISCHMANN CARTAGO 2T
   ---------------------------------------------------------- */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','FLEISCHMANN',v.conductor,'TRF860','4913','FLEISCHMANN','CARTAGO 2T','JULIAN RODRIGUEZ',1,
       1,0,'VALOR FLETE $350.000',
       6535325,350000,
       49,'21150 21147','TYM'
FROM vehiculos v WHERE v.placa='TRF860' AND v.razon_social='TYM' LIMIT 1;

/* ----------------------------------------------------------
   4️⃣  SXE499 — nov-05 ALPINA PEREIRA - DOSQUEBRADAS (2 aux)
   ---------------------------------------------------------- */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'SXE499','25348','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO, MANUEL RAMIREZ',2,
       1,0,'-',
       8782085,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       45,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SXE499' AND v.razon_social='TYM' LIMIT 1;

/* ----------------------------------------------------------
   5️⃣  TRK507 — nov-05 ALPINA MANIZALES VILLAMARIA
   ---------------------------------------------------------- */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'TRK507','25351 25332','9556 9550 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
       1,0,'-',
       9243030,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       NULL,'21093 21082','TYM'
FROM vehiculos v WHERE v.placa='TRK507' AND v.razon_social='TYM' LIMIT 1;

/* ----------------------------------------------------------
   ✅ Verificar resultado
   ---------------------------------------------------------- */
SELECT fecha, dia, placa, contratista, proveedor, poblacion, precio, no_pedidos, facturas_adicionales
FROM fletes
WHERE placa IN ('TRF860','SXE499','TRK507')
  AND fecha IN ('2026-11-04','2026-11-05','2026-11-11')
ORDER BY placa, fecha;
