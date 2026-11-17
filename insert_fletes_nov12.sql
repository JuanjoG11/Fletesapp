/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 12 NOVIEMBRE 2026
   Generado: 2026-11-12

   ✅ REGLAS:
     - contratista  = vehiculos.conductor (nombre real en BD)
     - valor_ruta   = T VALOR de la programación (total AP+FEP)
     - precio       = precio_tabla + adicional (cuando hay EXTRA/ADICIONAL)
                      o valor fijo cuando dice "VALOR DE FLETE $X"
     - valor_adicional_negociacion = monto del adicional (para trazabilidad)

   Notas:
     - SYU652   fac FEP1199654 (AP 25485 25521)
     - WFR160   (AP 25518 25522 + FEP 21180 21177)
     - EYX091   Neira (AP 25523 + FEP 21173)
     - SPU120   fac FEP1199642 (AP 25524 + FEP 21178)
     - TRK507   2 aux (AP 25533 25525 + FEP 21179)
     - WEP384   2 aux, Riosucio (AP 25526 + FEP 21168)
     - TJX795   VALOR DE FLETE $500.000 (AP 25528 + FEP 21172 21171 21170)
     - MAT480   VALOR DE FLETE $450.000, Calarcá (AP 25519)
     - WFV015   2 aux (AP 25520 25545 + FEP 21174 21158)
     - TTL256   2 aux (AP 25546)
     - EQY944   fac AP803994 (AP 25547)
     - SXF257   (AP 25548 + FEP 21162)
     - WLS478   2 aux (AP 25529 + FEP 21159)
     - WHM896   MERCAHORRO, fac AP803703 (AP 25530 + FEP 21140)
     - SMO183   (AP 25536)
     - VZD334   (AP 25537)
     - TMZ674   (AP 25538)
     - SPQ814   (AP 25539)
     - WHN317   Arabia Altagracia (AP 25540 + FEP 21165)
     - PEK019   (AP 25541)
     - LUM993   (AP 25542)
     - WLC133   2 aux (AP 25543)
     - TNH494   SUPERMISCELANIA, fac AP803981 (AP 25544)
     - WGZ876   VALOR DE FLETE $350.000, 2 aux (AP 25549 + FEP 21160)
     - WTN748   MERCAPLAZA, fac AP803700 (AP 25550)
     - ERK303   2 aux (AP 25531 + FEP 21164)
     - JVM223   2 aux (AP 25516 25532 + FEP 21166)
     - SQB119   FLEISCHMANN Pereira-Dos (FEP 21175 21161)
   ========================================================== */

/* -------------------------------------------------
   0️⃣  DIAGNÓSTICO PREVIO
   ------------------------------------------------- */
SELECT placa_programada, 'NO EXISTE EN vehiculos — flete se OMITIRÁ' AS alerta
FROM (VALUES
  ('SYU652'),('WFR160'),('EYX091'),('SPU120'),('TRK507'),
  ('WEP384'),('TJX795'),('MAT480'),('WFV015'),('TTL256'),
  ('EQY944'),('SXF257'),('WLS478'),('WHM896'),('SMO183'),
  ('VZD334'),('TMZ674'),('SPQ814'),('WHN317'),('PEK019'),
  ('LUM993'),('WLC133'),('TNH494'),('WGZ876'),('WTN748'),
  ('ERK303'),('JVM223'),('SQB119')
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
WHERE fecha = '2026-11-12'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 12‑Nov‑2026
   ------------------------------------------------- */

/* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

/* 01 – SYU652 – fac FEP1199654  |  T VALOR: 7.984.828 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'SYU652','25485 25521','9552 7001 F','MANIZALES VILLAMARIA','MANUEL RAMIREZ',1,
       1,0,'-',
       7984828,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       40,'FEP1199654','TYM'
FROM vehiculos v WHERE v.placa='SYU652' AND v.razon_social='TYM' LIMIT 1;

/* 02 – WFR160 – FEP 21180 21177  |  T VALOR: 7.875.826 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'WFR160','25518 25522','9553 7000 F','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
       1,0,'-',
       7875826,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       42,'21180 21177','TYM'
FROM vehiculos v WHERE v.placa='WFR160' AND v.razon_social='TYM' LIMIT 1;

/* 03 – EYX091 – Neira, FEP 21173  |  T VALOR: 10.099.892 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'EYX091','25523','9554 F','NEIRA','JHONNY LOPEZ',1,
       1,0,'-',
       10099892,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1),
       60,'21173','TYM'
FROM vehiculos v WHERE v.placa='EYX091' AND v.razon_social='TYM' LIMIT 1;

/* 04 – SPU120 – fac FEP1199642, FEP 21178  |  T VALOR: 5.704.677 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'SPU120','25524','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
       1,0,'-',
       5704677,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       51,'21178 FEP1199642','TYM'
FROM vehiculos v WHERE v.placa='SPU120' AND v.razon_social='TYM' LIMIT 1;

/* 05 – TRK507 – 2 aux, FEP 21179  |  T VALOR: 12.860.455 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'TRK507','25533 25525','9556 9550 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE, AUX NUEVO',2,
       1,0,'-',
       12860455,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       56,'21179','TYM'
FROM vehiculos v WHERE v.placa='TRK507' AND v.razon_social='TYM' LIMIT 1;

/* 06 – WEP384 – 2 aux, Riosucio, FEP 21168  |  T VALOR: 13.937.495 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'WEP384','25526','9557 F','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ, CESAR CASTILLO LONDOÑO',2,
       1,0,'-',
       13937495,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1),
       51,'21168','TYM'
FROM vehiculos v WHERE v.placa='WEP384' AND v.razon_social='TYM' LIMIT 1;

/* 07 – TJX795 – VALOR DE FLETE $500.000, FEP 21172 21171 21170  |  T VALOR: 12.157.241 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'TJX795','25528','9559 F','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ',1,
       1,0,'VALOR DE FLETE $500.000',
       12157241,500000,
       52,'21172 21171 21170','TYM'
FROM vehiculos v WHERE v.placa='TJX795' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA ARMENIA / EJE ───────────────────────────────────── */

/* 08 – MAT480 – VALOR DE FLETE $450.000, Calarcá  |  T VALOR: 18.501.992 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'MAT480','25519','7008','CALARCA','JHON FREDY MORENO',1,
       1,0,'VALOR DE FLETE $450.000',
       18501992,450000,
       2,NULL,'TYM'
FROM vehiculos v WHERE v.placa='MAT480' AND v.razon_social='TYM' LIMIT 1;

/* 09 – WFV015 – 2 aux, FEP 21174 21158  |  T VALOR: 8.478.723 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'WFV015','25520 25545','9601 7009 F','ARMENIA','YEISON DAVID RENDON SOTO, JUAN RICO',2,
       1,0,'-',
       8478723,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       60,'21174 21158','TYM'
FROM vehiculos v WHERE v.placa='WFV015' AND v.razon_social='TYM' LIMIT 1;

/* 10 – TTL256 – 2 aux  |  T VALOR: 5.973.283 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'TTL256','25546','9602','ARMENIA','YERFREY FLOWER, AUX NUEVO',2,
       1,0,'-',
       5973283,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       59,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TTL256' AND v.razon_social='TYM' LIMIT 1;

/* 11 – EQY944 – fac AP803994  |  T VALOR: 7.102.249 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'EQY944','25547','9603 ANDY','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
       1,0,'-',
       7102249,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       58,'AP803994','TYM'
FROM vehiculos v WHERE v.placa='EQY944' AND v.razon_social='TYM' LIMIT 1;

/* 12 – SXF257 – FEP 21162  |  T VALOR: 7.531.375 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'SXF257','25548','9604 F','ALCALA ULLOA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
       1,0,'-',
       7531375,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1),
       42,'21162','TYM'
FROM vehiculos v WHERE v.placa='SXF257' AND v.razon_social='TYM' LIMIT 1;

/* 13 – WLS478 – 2 aux, Caicedonia, FEP 21159  |  T VALOR: 10.058.870 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'WLS478','25529','9605 F','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, EDWAR GIL',2,
       1,0,'-',
       10058870,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1),
       53,'21159','TYM'
FROM vehiculos v WHERE v.placa='WLS478' AND v.razon_social='TYM' LIMIT 1;

/* 14 – WHM896 – MERCAHORRO, fac AP803703, FEP 21140  |  T VALOR: 8.897.179 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'WHM896','25530','9606 MERCAHORRO F','FILANDIA','JHON WILSON GIRALDO CARVAJAL',1,
       1,0,'-',
       8897179,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1),
       37,'21140 AP803703','TYM'
FROM vehiculos v WHERE v.placa='WHM896' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

/* 15 – SMO183 – sin adicional  |  T VALOR: 6.375.430 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'SMO183','25536','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
       1,0,'-',
       6375430,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       42,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SMO183' AND v.razon_social='TYM' LIMIT 1;

/* 16 – VZD334 – sin adicional  |  T VALOR: 9.704.072 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'VZD334','25537','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
       1,0,'-',
       9704072,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       59,NULL,'TYM'
FROM vehiculos v WHERE v.placa='VZD334' AND v.razon_social='TYM' LIMIT 1;

/* 17 – TMZ674 – sin adicional  |  T VALOR: 5.185.585 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'TMZ674','25538','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
       1,0,'-',
       5185585,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       51,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TMZ674' AND v.razon_social='TYM' LIMIT 1;

/* 18 – SPQ814 – sin adicional  |  T VALOR: 4.285.741 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'SPQ814','25539','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
       1,0,'-',
       4285741,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1),
       41,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SPQ814' AND v.razon_social='TYM' LIMIT 1;

/* 19 – WHN317 – Arabia Altagracia, FEP 21165  |  T VALOR: 5.855.556 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'WHN317','25540','9457 F','ARABIA ALTAGRACIA','JUAN ESTEBAN GALLEGO DIEZ',1,
       1,0,'-',
       5855556,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARABIA ALTAGRACIA' LIMIT 1),
       51,'21165','TYM'
FROM vehiculos v WHERE v.placa='WHN317' AND v.razon_social='TYM' LIMIT 1;

/* 20 – PEK019 – sin adicional  |  T VALOR: 8.130.724 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'PEK019','25541','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
       1,0,'-',
       8130724,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       52,NULL,'TYM'
FROM vehiculos v WHERE v.placa='PEK019' AND v.razon_social='TYM' LIMIT 1;

/* 21 – LUM993 – sin adicional  |  T VALOR: 7.327.919 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'LUM993','25542','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
       1,0,'-',
       7327919,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       47,NULL,'TYM'
FROM vehiculos v WHERE v.placa='LUM993' AND v.razon_social='TYM' LIMIT 1;

/* 22 – WLC133 – 2 aux, Pereira  |  T VALOR: 5.763.504 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'WLC133','25543','9460','PEREIRA','MARLON MURILLO, SANTIAGO HENAO MORALES',2,
       1,0,'-',
       5763504,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1),
       41,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WLC133' AND v.razon_social='TYM' LIMIT 1;

/* 23 – TNH494 – SUPERMISCELANIA, fac AP803981  |  T VALOR: 6.896.827 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'TNH494','25544','9461 SUPERMISCELANIA','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
       1,0,'-',
       6896827,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1),
       46,'AP803981','TYM'
FROM vehiculos v WHERE v.placa='TNH494' AND v.razon_social='TYM' LIMIT 1;

/* 24 – WGZ876 – VALOR DE FLETE $350.000, 2 aux, FEP 21160  |  T VALOR: 13.321.831 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'WGZ876','25549','7004 F','MARSELLA','BRAHIAN STIVEN VALENCIA IGLESIAS, CRISTIAN GIRALDO',2,
       1,0,'VALOR DE FLETE $350.000',
       13321831,350000,
       51,'21160','TYM'
FROM vehiculos v WHERE v.placa='WGZ876' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA OCCIDENTE ───────────────────────────────────────── */

/* 25 – WTN748 – MERCAPLAZA, fac AP803700  |  T VALOR: 6.051.206 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'WTN748','25550','7005 MERCAPLAZA','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
       1,0,'-',
       6051206,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1),
       34,'AP803700','TYM'
FROM vehiculos v WHERE v.placa='WTN748' AND v.razon_social='TYM' LIMIT 1;

/* 26 – ERK303 – 2 aux, Apia, FEP 21164  |  T VALOR: 10.431.502 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'ERK303','25531','7006 F','APIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
       1,0,'-',
       10431502,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA' LIMIT 1),
       51,'21164','TYM'
FROM vehiculos v WHERE v.placa='ERK303' AND v.razon_social='TYM' LIMIT 1;

/* 27 – JVM223 – 2 aux, Viterbo, FEP 21166  |  T VALOR: 13.384.149 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','ALPINA',v.conductor,'JVM223','25516 25532','7007 9451 F','VITERBO','LUIS CARLOS CADAVID RESTREPO, PABLO RAMIREZ',2,
       1,0,'-',
       13384149,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1),
       64,'21166','TYM'
FROM vehiculos v WHERE v.placa='JVM223' AND v.razon_social='TYM' LIMIT 1;

/* ── FLEISCHMANN ──────────────────────────────────────────── */

/* 28 – SQB119 – FLEISCHMANN Pereira-Dos, FEP 21175 21161  |  T VALOR: 4.724.404 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-12','Jueves','FLEISCHMANN',v.conductor,'SQB119',NULL,'FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
       1,0,'-',
       4724404,
       (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       41,'21175 21161','TYM'
FROM vehiculos v WHERE v.placa='SQB119' AND v.razon_social='TYM' LIMIT 1;

/* -------------------------------------------------
   3️⃣  Verificación
   ------------------------------------------------- */
SELECT '✅ INSERTADO' AS estado, placa, contratista AS conductor_bd,
       zona, poblacion, valor_ruta, precio, no_pedidos, proveedor
FROM fletes
WHERE fecha = '2026-11-12'
  AND proveedor IN ('ALPINA','FLEISCHMANN')

UNION ALL

SELECT '❌ OMITIDO — placa no existe en vehiculos' AS estado,
       placa_programada AS placa, NULL, NULL, NULL, NULL, NULL, NULL, NULL
FROM (VALUES
  ('SYU652'),('WFR160'),('EYX091'),('SPU120'),('TRK507'),
  ('WEP384'),('TJX795'),('MAT480'),('WFV015'),('TTL256'),
  ('EQY944'),('SXF257'),('WLS478'),('WHM896'),('SMO183'),
  ('VZD334'),('TMZ674'),('SPQ814'),('WHN317'),('PEK019'),
  ('LUM993'),('WLC133'),('TNH494'),('WGZ876'),('WTN748'),
  ('ERK303'),('JVM223'),('SQB119')
) AS prog(placa_programada)
WHERE NOT EXISTS (
  SELECT 1 FROM fletes f
  WHERE f.placa = prog.placa_programada
    AND f.fecha = '2026-11-12'
    AND f.proveedor IN ('ALPINA','FLEISCHMANN')
)

ORDER BY estado DESC, placa;
