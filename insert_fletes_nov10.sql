/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 10 NOVIEMBRE 2026
   Generado: 2026-11-10

   ✅ REGLAS DE SEGURIDAD:
     - contratista  = vehiculos.conductor (nombre real en BD)
     - valor_ruta   = T VALOR de la programación (total facturado AP+FEP)
     - precio       = precio base de la ruta según tabla precios_fletes
                      (o valor fijo cuando dice "VALOR DE FLETE $X")
     - Cada fila solo se inserta si la placa existe en vehiculos

   Notas:
     - SYU652   (AP 25452)
     - WFR160   (AP 25453 + FEP 21127)
     - EYX091   (AP 25465 + FEP 21124)
     - SPU120   (AP 25454 + FEP 21125)
     - TJX795   (AP 25455 25464 + FEP 21126 21129)
     - WEP384   2 aux, Supía (AP 25443 25456 + FEP 21128)
     - MAT480   2 aux (AP 25458 25467 + FEP 21136)
     - WGZ876   2 aux, SUPIA RIOSUCIO SUPER, precio fijo $625.000, fac AP798681 (AP 25449)
     - WFV015   EXTRA $60.000, Armenia (AP 25410 25476)
     - TTL256   2 aux, fac AP801014 (AP 25477)
     - EQY944   2 aux, fac AP801015 (AP 25478 + FEP 21134)
     - SXF257   2 aux, fac AP801016 AP801017 (AP 25479 + FEP 21132)
     - WLS478   (AP 25459 + FEP 21133)
     - WHM896   (AP 25460)
     - SMO183   (AP 25468)
     - VZD334   (AP 25469)
     - TMZ674   (AP 25470)
     - SPQ814   (AP 25471)
     - WHN317   (AP 25472)
     - PEK019   (AP 25473)
     - EQN953   VALOR DE FLETE $250.000 (AP 25474)
     - WLC133   2 aux (AP 25463)
     - TNH494   (AP 25475)
     - LUM993   (AP 25480)
     - WTN748   Argelia El Cairo (AP 25466)
     - ERK303   2 aux, ADICIONAL $100.000 ENTREGA SUPER (AP 25447 25461 + FEP 21135)
     - JVM223   2 aux (AP 25462 25448 + FEP 21130)
     - SQB119   FLEISCHMANN Armenia (FEP 21137)
   ========================================================== */

/* -------------------------------------------------
   0️⃣  DIAGNÓSTICO PREVIO — Placas NO registradas
        Resultado vacío = todas OK.
   ------------------------------------------------- */
SELECT placa_programada, 'NO EXISTE EN vehiculos — flete se OMITIRÁ' AS alerta
FROM (VALUES
  ('SYU652'),('WFR160'),('EYX091'),('SPU120'),('TJX795'),
  ('WEP384'),('MAT480'),('WGZ876'),('WFV015'),('TTL256'),
  ('EQY944'),('SXF257'),('WLS478'),('WHM896'),('SMO183'),
  ('VZD334'),('TMZ674'),('SPQ814'),('WHN317'),('PEK019'),
  ('EQN953'),('WLC133'),('TNH494'),('LUM993'),('WTN748'),
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
WHERE fecha = '2026-11-10'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 10‑Nov‑2026
   ------------------------------------------------- */

/* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

/* 01 – SYU652 – sin adicional  |  T VALOR: 6.971.173 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'SYU652','25452','9552 F','MANIZALES VILLAMARIA','MANUEL RAMIREZ',1,
       1,0,'-',
       6971173,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       62,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SYU652' AND v.razon_social='TYM' LIMIT 1;

/* 02 – WFR160 – FEP 21127  |  T VALOR: 6.843.722 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'WFR160','25453','9553 F','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
       1,0,'-',
       6843722,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       55,'21127','TYM'
FROM vehiculos v WHERE v.placa='WFR160' AND v.razon_social='TYM' LIMIT 1;

/* 03 – EYX091 – FEP 21124  |  T VALOR: 7.186.613 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'EYX091','25465','9554 F','MANIZALES VILLAMARIA','JHONNY LOPEZ',1,
       1,0,'-',
       7186613,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       56,'21124','TYM'
FROM vehiculos v WHERE v.placa='EYX091' AND v.razon_social='TYM' LIMIT 1;

/* 04 – SPU120 – FEP 21125  |  T VALOR: 6.678.319 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'SPU120','25454','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
       1,0,'-',
       6678319,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       54,'21125','TYM'
FROM vehiculos v WHERE v.placa='SPU120' AND v.razon_social='TYM' LIMIT 1;

/* 05 – TJX795 – FEP 21126 21129  |  T VALOR: 11.076.319 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'TJX795','25455 25464','9556 9550 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
       1,0,'-',
       11076319,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       48,'21126 21129','TYM'
FROM vehiculos v WHERE v.placa='TJX795' AND v.razon_social='TYM' LIMIT 1;

/* 06 – WEP384 – 2 aux, Supía, FEP 21128  |  T VALOR: 9.727.041 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'WEP384','25443 25456','9557 9559 F','SUPIA','JUAN MANUEL DELGADO NARVAEZ, CESAR CASTILLO LONDOÑO',2,
       1,0,'-',
       9727041,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1),
       45,'21128','TYM'
FROM vehiculos v WHERE v.placa='WEP384' AND v.razon_social='TYM' LIMIT 1;

/* 07 – MAT480 – 2 aux, Chinchiná, FEP 21136  |  T VALOR: 11.366.168 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'MAT480','25458 25467','9559 7002 F','CHINCHINA','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
       1,0,'-',
       11366168,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1),
       54,'21136','TYM'
FROM vehiculos v WHERE v.placa='MAT480' AND v.razon_social='TYM' LIMIT 1;

/* 08 – WGZ876 – 2 aux, SUPIA RIOSUCIO SUPER, precio fijo $625.000, fac AP798681  |  T VALOR: 12.971.900 */
/* precio SUPIA RIOSUCIO SUPER = 625000 (documentado en fix_wfv015_oct30_supia.sql) */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'WGZ876','25449','9560 TSS','SUPIA RIOSUCIO SUPER','JOHN EDWAR ZAPATA ACEVEDO, JHON FREDY MORENO',2,
       1,0,'-',
       12971900,625000,
       9,'AP798681','TYM'
FROM vehiculos v WHERE v.placa='WGZ876' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA ARMENIA / EJE ───────────────────────────────────── */

/* 09 – WFV015 – EXTRA $60.000, Armenia  |  T VALOR: 7.554.107 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'WFV015','25410 25476','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO',1,
       1,60000,'EXTRA $60.000',
       7554107,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       48,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WFV015' AND v.razon_social='TYM' LIMIT 1;

/* 10 – TTL256 – 2 aux, fac AP801014  |  T VALOR: 8.114.487 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'TTL256','25477','9602 RINDEMAX','ARMENIA','YERFREY FLOWER, CRISTIAN GIRALDO',2,
       1,0,'-',
       8114487,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       66,'AP801014','TYM'
FROM vehiculos v WHERE v.placa='TTL256' AND v.razon_social='TYM' LIMIT 1;

/* 11 – EQY944 – 2 aux, Calarcá, fac AP801015, FEP 21134  |  T VALOR: 10.290.998 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'EQY944','25478','9603 COLON F','CALARCA','JUAN JOSE CONTRERAS HERNANDEZ, EDWAR GIL',2,
       1,0,'-',
       10290998,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1),
       63,'21134 AP801015','TYM'
FROM vehiculos v WHERE v.placa='EQY944' AND v.razon_social='TYM' LIMIT 1;

/* 12 – SXF257 – 2 aux, fac AP801016 AP801017, FEP 21132  |  T VALOR: 11.458.284 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'SXF257','25479','9604 SUPER F','MONTENEGRO PTAPAO','JOSE ALEXANDER CONSTAIN PERLAZA, JUAN RICO',2,
       1,0,'-',
       11458284,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1),
       61,'21132 AP801016 AP801017','TYM'
FROM vehiculos v WHERE v.placa='SXF257' AND v.razon_social='TYM' LIMIT 1;

/* 13 – WLS478 – FEP 21133  |  T VALOR: 5.202.170 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'WLS478','25459','9605 F','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
       1,0,'-',
       5202170,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1),
       45,'21133','TYM'
FROM vehiculos v WHERE v.placa='WLS478' AND v.razon_social='TYM' LIMIT 1;

/* 14 – WHM896 – sin adicional, Circasia  |  T VALOR: 3.310.459 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'WHM896','25460','9606','CIRCASIA','JHON WILSON GIRALDO CARVAJAL',1,
       1,0,'-',
       3310459,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1),
       42,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WHM896' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

/* 15 – SMO183 – sin adicional  |  T VALOR: 7.009.222 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'SMO183','25468','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
       1,0,'-',
       7009222,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       49,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SMO183' AND v.razon_social='TYM' LIMIT 1;

/* 16 – VZD334 – sin adicional  |  T VALOR: 5.988.604 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'VZD334','25469','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
       1,0,'-',
       5988604,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       37,NULL,'TYM'
FROM vehiculos v WHERE v.placa='VZD334' AND v.razon_social='TYM' LIMIT 1;

/* 17 – TMZ674 – sin adicional  |  T VALOR: 7.134.604 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'TMZ674','25470','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
       1,0,'-',
       7134604,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       66,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TMZ674' AND v.razon_social='TYM' LIMIT 1;

/* 18 – SPQ814 – sin adicional  |  T VALOR: 6.353.974 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'SPQ814','25471','9456','SANTA ROSA','SAMUEL ARIAS',1,
       1,0,'-',
       6353974,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1),
       58,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SPQ814' AND v.razon_social='TYM' LIMIT 1;

/* 19 – WHN317 – sin adicional  |  T VALOR: 7.615.989 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'WHN317','25472','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
       1,0,'-',
       7615989,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       47,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WHN317' AND v.razon_social='TYM' LIMIT 1;

/* 20 – PEK019 – sin adicional  |  T VALOR: 8.728.191 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'PEK019','25473','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
       1,0,'-',
       8728191,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       54,NULL,'TYM'
FROM vehiculos v WHERE v.placa='PEK019' AND v.razon_social='TYM' LIMIT 1;

/* 21 – EQN953 – VALOR DE FLETE $250.000  |  T VALOR: 7.973.429 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'EQN953','25474','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
       1,0,'VALOR DE FLETE $250.000',
       7973429,250000,
       60,NULL,'TYM'
FROM vehiculos v WHERE v.placa='EQN953' AND v.razon_social='TYM' LIMIT 1;

/* 22 – WLC133 – 2 aux  |  T VALOR: 12.123.981 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'WLC133','25463','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, MARLON MURILLO',2,
       1,0,'-',
       12123981,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       65,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WLC133' AND v.razon_social='TYM' LIMIT 1;

/* 23 – TNH494 – sin adicional  |  T VALOR: 5.316.557 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'TNH494','25475','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
       1,0,'-',
       5316557,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1),
       49,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TNH494' AND v.razon_social='TYM' LIMIT 1;

/* 24 – LUM993 – sin adicional  |  T VALOR: 7.440.552 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'LUM993','25480','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
       1,0,'-',
       7440552,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       47,NULL,'TYM'
FROM vehiculos v WHERE v.placa='LUM993' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA OCCIDENTE ───────────────────────────────────────── */

/* 25 – WTN748 – Argelia El Cairo  |  T VALOR: 8.598.763 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'WTN748','25466','7005 F','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO',1,
       1,0,'-',
       8598763,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARGELIA EL CAIRO' LIMIT 1),
       33,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WTN748' AND v.razon_social='TYM' LIMIT 1;

/* 26 – ERK303 – 2 aux, ADICIONAL $100.000 ENTREGA SUPER, FEP 21135  |  T VALOR: 16.540.680 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'ERK303','25447 25461','7006 9450 F','SANTUARIO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
       1,100000,'ADICIONAL AL FLETE $100.000 ENTREGA DE SUPER',
       16540680,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1),
       53,'21135','TYM'
FROM vehiculos v WHERE v.placa='ERK303' AND v.razon_social='TYM' LIMIT 1;

/* 27 – JVM223 – 2 aux, Belén de Umbría, FEP 21130  |  T VALOR: 12.900.961 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','ALPINA',v.conductor,'JVM223','25462 25448','7007 9451 F','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, PABLO RAMIREZ',2,
       1,0,'-',
       12900961,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1),
       64,'21130','TYM'
FROM vehiculos v WHERE v.placa='JVM223' AND v.razon_social='TYM' LIMIT 1;

/* ── FLEISCHMANN ──────────────────────────────────────────── */

/* 28 – SQB119 – FLEISCHMANN Armenia, FEP 21137  |  T VALOR: 4.354.819 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-10','Martes','FLEISCHMANN',v.conductor,'SQB119',NULL,'FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
       1,0,'-',
       4354819,
       (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       43,'21137','TYM'
FROM vehiculos v WHERE v.placa='SQB119' AND v.razon_social='TYM' LIMIT 1;

/* -------------------------------------------------
   3️⃣  Verificación — fletes insertados vs programados
   ------------------------------------------------- */

SELECT '✅ INSERTADO' AS estado, placa, contratista AS conductor_bd,
       zona, poblacion, valor_ruta, precio, no_pedidos, proveedor
FROM fletes
WHERE fecha = '2026-11-10'
  AND proveedor IN ('ALPINA','FLEISCHMANN')

UNION ALL

SELECT '❌ OMITIDO — placa no existe en vehiculos' AS estado,
       placa_programada AS placa, NULL, NULL, NULL, NULL, NULL, NULL, NULL
FROM (VALUES
  ('SYU652'),('WFR160'),('EYX091'),('SPU120'),('TJX795'),
  ('WEP384'),('MAT480'),('WGZ876'),('WFV015'),('TTL256'),
  ('EQY944'),('SXF257'),('WLS478'),('WHM896'),('SMO183'),
  ('VZD334'),('TMZ674'),('SPQ814'),('WHN317'),('PEK019'),
  ('EQN953'),('WLC133'),('TNH494'),('LUM993'),('WTN748'),
  ('ERK303'),('JVM223'),('SQB119')
) AS prog(placa_programada)
WHERE NOT EXISTS (
  SELECT 1 FROM fletes f
  WHERE f.placa = prog.placa_programada
    AND f.fecha = '2026-11-10'
    AND f.proveedor IN ('ALPINA','FLEISCHMANN')
)

ORDER BY estado DESC, placa;
