/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 11 NOVIEMBRE 2026
   Generado: 2026-11-11

   ✅ REGLAS:
     - contratista  = vehiculos.conductor (nombre real en BD)
     - valor_ruta   = T VALOR de la programación (total AP+FEP)
     - precio       = precio_tabla + adicional  (EXTRA / ADICIONAL)
                      o valor fijo cuando dice "VALOR DE FLETE $X"
     - valor_adicional_negociacion = monto del adicional (trazabilidad)

   ⚠️  POSTOBON/TAT (JKV745) se gestiona en script separado.

   Notas:
     - SYU652   (AP 25487 25485 + FEP 21152)
     - WFR160   EXTRA $60.000, precio = tabla + 60.000 (AP 25488 + FEP 21153)
     - EYX091   (AP 25489 + FEP 21154)
     - SPU120   (AP 25490 + FEP 21155)
     - TRK507   (AP 25491 + FEP 21156 21151)
     - WEP384   2 aux, Marmato La Merced (AP 25492)
     - MAT480   VALOR DE FLETE $380.000, 2 aux (AP 25494 + FEP 21139)
     - WGZ876   EXTRA $60.000, 2 aux, precio = tabla + 60.000 (AP 25457 25493 + FEP 21138)
     - WFV015   2 aux (AP 25512)
     - TTL256   2 aux, fac AP801018 (AP 25503)
     - EQY944   2 aux (AP 25513)
     - SXF257   2 aux (AP 25500 25514)
     - WLS478   (AP 25495 + FEP 21142)
     - WHM896   (AP 25484 25496 + FEP 21141)
     - SMO183   (AP 25504)
     - VZD334   (AP 25505 + FEP 21145)
     - TMZ674   (AP 25506)
     - SPQ814   (AP 25507)
     - WHN317   (AP 25508)
     - PEK019   (AP 25509)
     - TJX795   (AP 25510)
     - WLC133   2 aux (AP 25511)
     - TNH494   (AP 25482 25499)
     - LUM993   2 aux (AP 25501 + FEP 21146)
     - WTN748   EXTRA $60.000 DE AYER, precio = tabla + 60.000 (AP 25502 + FEP 21131)
     - ERK303   2 aux (AP 25497 + FEP 21144 21143)
     - JVM223   2 aux (AP 25483 25498 + FEP 21148)
     - SQB119   FLEISCHMANN Pereira-Dos (FEP 21157 21149)
     - TRF860   FLEISCHMANN Cartago 2T, VALOR FLETE $350.000 (AP 4913 + FEP 21150 21147)
   ========================================================== */

/* -------------------------------------------------
   0️⃣  DIAGNÓSTICO PREVIO
   ------------------------------------------------- */
SELECT placa_programada, 'NO EXISTE EN vehiculos — flete se OMITIRÁ' AS alerta
FROM (VALUES
  ('SYU652'),('WFR160'),('EYX091'),('SPU120'),('TRK507'),
  ('WEP384'),('MAT480'),('WGZ876'),('WFV015'),('TTL256'),
  ('EQY944'),('SXF257'),('WLS478'),('WHM896'),('SMO183'),
  ('VZD334'),('TMZ674'),('SPQ814'),('WHN317'),('PEK019'),
  ('TJX795'),('WLC133'),('TNH494'),('LUM993'),('WTN748'),
  ('ERK303'),('JVM223'),('SQB119'),('TRF860')
) AS prog(placa_programada)
WHERE NOT EXISTS (
  SELECT 1 FROM vehiculos v
  WHERE v.placa = prog.placa_programada
    AND v.razon_social = 'TYM'
);

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-11-11'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 11‑Nov‑2026
   ------------------------------------------------- */

/* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

/* 01 – SYU652 – FEP 21152  |  T VALOR: 7.270.338 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'SYU652','25487 25485','9552 7001 F','MANIZALES VILLAMARIA','MANUEL RAMIREZ',1,
       1,0,'-',
       7270338,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       48,'21152','TYM'
FROM vehiculos v WHERE v.placa='SYU652' AND v.razon_social='TYM' LIMIT 1;

/* 02 – WFR160 – EXTRA $60.000, precio = tabla + 60.000, FEP 21153  |  T VALOR: 10.092.027 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'WFR160','25488','9553 F','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
       1,60000,'EXTRA $60.000',
       10092027,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
       55,'21153','TYM'
FROM vehiculos v WHERE v.placa='WFR160' AND v.razon_social='TYM' LIMIT 1;

/* 03 – EYX091 – FEP 21154  |  T VALOR: 8.716.964 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'EYX091','25489','9554 F','MANIZALES VILLAMARIA','JHONNY LOPEZ',1,
       1,0,'-',
       8716964,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       54,'21154','TYM'
FROM vehiculos v WHERE v.placa='EYX091' AND v.razon_social='TYM' LIMIT 1;

/* 04 – SPU120 – FEP 21155  |  T VALOR: 7.272.883 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'SPU120','25490','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
       1,0,'-',
       7272883,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       45,'21155','TYM'
FROM vehiculos v WHERE v.placa='SPU120' AND v.razon_social='TYM' LIMIT 1;

/* 05 – TRK507 – FEP 21156 21151  |  T VALOR: 6.552.415 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'TRK507','25491','9556 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
       1,0,'-',
       6552415,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       46,'21156 21151','TYM'
FROM vehiculos v WHERE v.placa='TRK507' AND v.razon_social='TYM' LIMIT 1;

/* 06 – WEP384 – 2 aux, Marmato La Merced  |  T VALOR: 16.319.151 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'WEP384','25492','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ, CESAR CASTILLO LONDOÑO',2,
       1,0,'-',
       16319151,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1),
       35,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WEP384' AND v.razon_social='TYM' LIMIT 1;

/* 07 – MAT480 – VALOR DE FLETE $380.000, 2 aux, FEP 21139  |  T VALOR: 10.479.252 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'MAT480','25494','9559 F','PALESTINA ARAUCA','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
       1,0,'VALOR DE FLETE $380.000',
       10479252,380000,
       46,'21139','TYM'
FROM vehiculos v WHERE v.placa='MAT480' AND v.razon_social='TYM' LIMIT 1;

/* 08 – WGZ876 – EXTRA $60.000, 2 aux, precio = tabla + 60.000, FEP 21138  |  T VALOR: 13.837.309 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'WGZ876','25457 25493','9558 F','AGUADAS PACORA','JOHN EDWAR ZAPATA ACEVEDO, YESID PATIÑO',2,
       1,60000,'EXTRA $60.000',
       13837309,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1) + 60000,
       84,'21138','TYM'
FROM vehiculos v WHERE v.placa='WGZ876' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA ARMENIA / EJE ───────────────────────────────────── */

/* 09 – WFV015 – 2 aux  |  T VALOR: 6.229.670 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'WFV015','25512','9601','ARMENIA','YEISON DAVID RENDON SOTO, SAMUEL ARIAS',2,
       1,0,'-',
       6229670,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       49,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WFV015' AND v.razon_social='TYM' LIMIT 1;

/* 10 – TTL256 – 2 aux, fac AP801018  |  T VALOR: 10.012.740 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'TTL256','25503','9602 ÉXITO','ARMENIA','YERFREY FLOWER, CRISTIAN GIRALDO',2,
       1,0,'-',
       10012740,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       61,'AP801018','TYM'
FROM vehiculos v WHERE v.placa='TTL256' AND v.razon_social='TYM' LIMIT 1;

/* 11 – EQY944 – 2 aux  |  T VALOR: 9.619.550 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'EQY944','25513','9603','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, JHON FREDY MORENO',2,
       1,0,'-',
       9619550,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       57,NULL,'TYM'
FROM vehiculos v WHERE v.placa='EQY944' AND v.razon_social='TYM' LIMIT 1;

/* 12 – SXF257 – 2 aux, Quimbaya  |  T VALOR: 11.684.555 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'SXF257','25500 25514','9604 7010','QUIMBAYA','JOSE ALEXANDER CONSTAIN PERLAZA, JHON UTIMA',2,
       1,0,'-',
       11684555,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1),
       34,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SXF257' AND v.razon_social='TYM' LIMIT 1;

/* 13 – WLS478 – Córdoba Pijao Buenavista, FEP 21142  |  T VALOR: 7.531.934 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'WLS478','25495','9605 F','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
       1,0,'-',
       7531934,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1),
       44,'21142','TYM'
FROM vehiculos v WHERE v.placa='WLS478' AND v.razon_social='TYM' LIMIT 1;

/* 14 – WHM896 – Salento, FEP 21141  |  T VALOR: 7.871.060 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'WHM896','25484 25496','9606 9600 F','SALENTO','JHON WILSON GIRALDO CARVAJAL',1,
       1,0,'-',
       7871060,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1),
       28,'21141','TYM'
FROM vehiculos v WHERE v.placa='WHM896' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

/* 15 – SMO183 – sin adicional  |  T VALOR: 6.413.681 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'SMO183','25504','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
       1,0,'-',
       6413681,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       55,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SMO183' AND v.razon_social='TYM' LIMIT 1;

/* 16 – VZD334 – FEP 21145  |  T VALOR: 6.910.775 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'VZD334','25505','9454 F','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
       1,0,'-',
       6910775,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       35,'21145','TYM'
FROM vehiculos v WHERE v.placa='VZD334' AND v.razon_social='TYM' LIMIT 1;

/* 17 – TMZ674 – sin adicional  |  T VALOR: 6.480.649 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'TMZ674','25506','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
       1,0,'-',
       6480649,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       48,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TMZ674' AND v.razon_social='TYM' LIMIT 1;

/* 18 – SPQ814 – sin adicional  |  T VALOR: 7.741.438 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'SPQ814','25507','9456','SANTA ROSA','JUAN RICO',1,
       1,0,'-',
       7741438,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1),
       47,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SPQ814' AND v.razon_social='TYM' LIMIT 1;

/* 19 – WHN317 – sin adicional  |  T VALOR: 8.155.712 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'WHN317','25508','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
       1,0,'-',
       8155712,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       53,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WHN317' AND v.razon_social='TYM' LIMIT 1;

/* 20 – PEK019 – sin adicional  |  T VALOR: 8.054.989 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'PEK019','25509','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
       1,0,'-',
       8054989,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       52,NULL,'TYM'
FROM vehiculos v WHERE v.placa='PEK019' AND v.razon_social='TYM' LIMIT 1;

/* 21 – TJX795 – sin adicional  |  T VALOR: 9.884.246 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'TJX795','25510','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
       1,0,'-',
       9884246,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       68,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TJX795' AND v.razon_social='TYM' LIMIT 1;

/* 22 – WLC133 – 2 aux  |  T VALOR: 8.799.638 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'WLC133','25511','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, MARLON MURILLO',2,
       1,0,'-',
       8799638,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       67,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WLC133' AND v.razon_social='TYM' LIMIT 1;

/* 23 – TNH494 – sin adicional  |  T VALOR: 9.658.448 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'TNH494','25482 25499','9461 9450','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
       1,0,'-',
       9658448,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1),
       49,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TNH494' AND v.razon_social='TYM' LIMIT 1;

/* 24 – LUM993 – 2 aux, FEP 21146  |  T VALOR: 9.913.970 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'LUM993','25501','7004 F','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, EDWAR GIL',2,
       1,0,'-',
       9913970,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       59,'21146','TYM'
FROM vehiculos v WHERE v.placa='LUM993' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA OCCIDENTE ───────────────────────────────────────── */

/* 25 – WTN748 – EXTRA $60.000 DE AYER, precio = tabla + 60.000, FEP 21131  |  T VALOR: 6.762.916 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'WTN748','25502','7005 F','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
       1,60000,'EXTRA $60.000 DE AYER',
       6762916,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1) + 60000,
       33,'21131','TYM'
FROM vehiculos v WHERE v.placa='WTN748' AND v.razon_social='TYM' LIMIT 1;

/* 26 – ERK303 – 2 aux, Balboa La Celia, FEP 21144 21143  |  T VALOR: 7.109.060 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'ERK303','25497','7006 F','BALBOA LA CELIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
       1,0,'-',
       7109060,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1),
       37,'21144 21143','TYM'
FROM vehiculos v WHERE v.placa='ERK303' AND v.razon_social='TYM' LIMIT 1;

/* 27 – JVM223 – 2 aux, Anserma, FEP 21148  |  T VALOR: 18.767.822 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','ALPINA',v.conductor,'JVM223','25483 25498','7007 9451 F','ANSERMA','LUIS CARLOS CADAVID RESTREPO, PABLO RAMIREZ',2,
       1,0,'-',
       18767822,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1),
       60,'21148','TYM'
FROM vehiculos v WHERE v.placa='JVM223' AND v.razon_social='TYM' LIMIT 1;

/* ── FLEISCHMANN ──────────────────────────────────────────── */

/* 28 – SQB119 – FLEISCHMANN Pereira-Dos, FEP 21157 21149  |  T VALOR: 4.614.507 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','FLEISCHMANN',v.conductor,'SQB119',NULL,'FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
       1,0,'-',
       4614507,
       (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       53,'21157 21149','TYM'
FROM vehiculos v WHERE v.placa='SQB119' AND v.razon_social='TYM' LIMIT 1;

/* 29 – TRF860 – FLEISCHMANN Cartago 2T, VALOR FLETE $350.000, FEP 21150 21147  |  T VALOR: 6.535.325 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','FLEISCHMANN',v.conductor,'TRF860','4913','FLEISCHMANN','CARTAGO 2T','JULIAN RODRIGUEZ',1,
       1,0,'VALOR FLETE $350.000',
       6535325,350000,
       49,'21150 21147','TYM'
FROM vehiculos v WHERE v.placa='TRF860' AND v.razon_social='TYM' LIMIT 1;

/* -------------------------------------------------
   3️⃣  Verificación
   ------------------------------------------------- */
SELECT '✅ INSERTADO' AS estado, placa, contratista AS conductor_bd,
       zona, poblacion, valor_ruta, precio, no_pedidos, proveedor
FROM fletes
WHERE fecha = '2026-11-11'
  AND proveedor IN ('ALPINA','FLEISCHMANN')

UNION ALL

SELECT '❌ OMITIDO — placa no existe en vehiculos' AS estado,
       placa_programada AS placa, NULL, NULL, NULL, NULL, NULL, NULL, NULL
FROM (VALUES
  ('SYU652'),('WFR160'),('EYX091'),('SPU120'),('TRK507'),
  ('WEP384'),('MAT480'),('WGZ876'),('WFV015'),('TTL256'),
  ('EQY944'),('SXF257'),('WLS478'),('WHM896'),('SMO183'),
  ('VZD334'),('TMZ674'),('SPQ814'),('WHN317'),('PEK019'),
  ('TJX795'),('WLC133'),('TNH494'),('LUM993'),('WTN748'),
  ('ERK303'),('JVM223'),('SQB119'),('TRF860')
) AS prog(placa_programada)
WHERE NOT EXISTS (
  SELECT 1 FROM fletes f
  WHERE f.placa = prog.placa_programada
    AND f.fecha = '2026-11-11'
    AND f.proveedor IN ('ALPINA','FLEISCHMANN')
)

ORDER BY estado DESC, placa;
