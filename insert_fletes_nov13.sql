/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 13 NOVIEMBRE 2026
   Generado: 2026-11-13

   ✅ REGLAS:
     - contratista  = vehiculos.conductor (nombre real en BD)
     - valor_ruta   = T VALOR de la programación (total AP+FEP)
     - precio       = precio_tabla + adicional  (EXTRA / ADICIONAL)
                      o valor fijo cuando dice "VALOR DE FLETE $X"
     - valor_adicional_negociacion = monto del adicional (trazabilidad)

   Notas:
     - SYU652   2 aux, TSS, fac FEP1199836-839-841 AP804989 (AP 25487TSS 25559)
     - WFR160   (AP 25571 25560 + FEP 21192)
     - EYX091   fac AP804988 (AP 25561 + FEP 21193)
     - SPU120   (AP 25562 + FEP 21194)
     - TRK507   fac FEP1199837 (AP 25563 + FEP 21190 21195)
     - WEP384   EXTRAS 2 $120.000 → precio = tabla + 120.000 (AP 25564 + FEP 21169)
     - WGZ876   EXTRA $60.000, 2 aux → precio = tabla + 60.000 (AP 25565 25527 + FEP 21167)
     - MAT480   2 aux (AP 25566 + FEP 21187)
     - WFV015   EXTRA $100.000, SUPIA RIOSUCIO SUPER → precio = 625.000 + 100.000 = 725.000 (AP 25555)
     - TUL630   VALOR DE FLETE $800.000, fac AP802413 (AP 25573)
     - TJX795   2 aux (AP 25586)
     - TTL256   (AP 25558 25587)
     - EQY944   (AP 25588 + FEP 21184)
     - SXF257   ADICIONAL $100.000 TSS Y ENTREGA SUPER → precio = tabla + 100.000 (AP 25589 + FEP 21163)
     - WLS478   2 aux (AP 25557 25567)
     - WHM896   (AP 25554 25568 + FEP 21183)
     - SMO183   (AP 25577)
     - VZD334   EXTRA $60.000 → precio = tabla + 60.000 (AP 25578)
     - TMZ674   (AP 25579)
     - SPQ814   (AP 25580 25574)
     - WHN317   (AP 25581)
     - PEK019   (AP 25582)
     - EQN953   (AP 25583)
     - WLC133   2 aux (AP 25584)
     - TNH494   (AP 25585)
     - LUM993   2 aux (AP 25590)
     - WTN748   MERCAMOS, fac AP804976 (AP 25591)
     - ERK303   2 aux, fac AP804974-975-977 (AP 25569 + FEP 21185)
     - JVM223   2 aux (AP 25570 25553 + FEP 21186)
     - SQB119   FLEISCHMANN Armenia, adicional $30.000 → precio = tabla + 30.000 (FEP 21196)
   ========================================================== */

/* -------------------------------------------------
   0️⃣  DIAGNÓSTICO PREVIO
   ------------------------------------------------- */
SELECT placa_programada, 'NO EXISTE EN vehiculos — flete se OMITIRÁ' AS alerta
FROM (VALUES
  ('SYU652'),('WFR160'),('EYX091'),('SPU120'),('TRK507'),
  ('WEP384'),('WGZ876'),('MAT480'),('WFV015'),('TUL630'),
  ('TJX795'),('TTL256'),('EQY944'),('SXF257'),('WLS478'),
  ('WHM896'),('SMO183'),('VZD334'),('TMZ674'),('SPQ814'),
  ('WHN317'),('PEK019'),('EQN953'),('WLC133'),('TNH494'),
  ('LUM993'),('WTN748'),('ERK303'),('JVM223'),('SQB119')
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
WHERE fecha = '2026-11-13'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 13‑Nov‑2026
   ------------------------------------------------- */

/* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

/* 01 – SYU652 – 2 aux, TSS, fac FEP1199836-839-841 AP804989  |  T VALOR: 12.869.737 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'SYU652','25487TSS 25559','9552 UNOAC F TSS','MANIZALES VILLAMARIA','MANUEL RAMIREZ, EDWAR GIL',2,
       1,0,'-',
       12869737,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       49,'FEP1199836-839-841 AP804989','TYM'
FROM vehiculos v WHERE v.placa='SYU652' AND v.razon_social='TYM' LIMIT 1;

/* 02 – WFR160 – FEP 21192  |  T VALOR: 7.622.170 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'WFR160','25571 25560','9553 9550 F','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
       1,0,'-',
       7622170,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       49,'21192','TYM'
FROM vehiculos v WHERE v.placa='WFR160' AND v.razon_social='TYM' LIMIT 1;

/* 03 – EYX091 – fac AP804988, FEP 21193  |  T VALOR: 9.324.124 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'EYX091','25561','9554 MANA F','MANIZALES VILLAMARIA','JHONNY LOPEZ',1,
       1,0,'-',
       9324124,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       54,'21193 AP804988','TYM'
FROM vehiculos v WHERE v.placa='EYX091' AND v.razon_social='TYM' LIMIT 1;

/* 04 – SPU120 – FEP 21194  |  T VALOR: 6.689.254 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'SPU120','25562','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
       1,0,'-',
       6689254,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       54,'21194','TYM'
FROM vehiculos v WHERE v.placa='SPU120' AND v.razon_social='TYM' LIMIT 1;

/* 05 – TRK507 – fac FEP1199837, FEP 21190 21195  |  T VALOR: 5.950.577 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'TRK507','25563','9556 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
       1,0,'-',
       5950577,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       48,'21190 21195 FEP1199837','TYM'
FROM vehiculos v WHERE v.placa='TRK507' AND v.razon_social='TYM' LIMIT 1;

/* 06 – WEP384 – EXTRAS 2 $120.000, precio = tabla + 120.000, FEP 21169  |  T VALOR: 7.642.696 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'WEP384','25564','9557 F','IRRA LA FELISA VER RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ',1,
       1,120000,'EXTRAS 2 $120.000',
       7642696,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='IRRA LA FELISA VER RIOSUCIO' LIMIT 1) + 120000,
       28,'21169','TYM'
FROM vehiculos v WHERE v.placa='WEP384' AND v.razon_social='TYM' LIMIT 1;

/* 07 – WGZ876 – EXTRA $60.000, 2 aux, precio = tabla + 60.000, FEP 21167  |  T VALOR: 12.634.131 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'WGZ876','25565 25527','9558 F','PACORA SALAMINA','JOHN EDWAR ZAPATA ACEVEDO, YESID PATIÑO',2,
       1,60000,'EXTRA $60.000',
       12634131,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1) + 60000,
       77,'21167','TYM'
FROM vehiculos v WHERE v.placa='WGZ876' AND v.razon_social='TYM' LIMIT 1;

/* 08 – MAT480 – 2 aux, Chinchiná, FEP 21187  |  T VALOR: 8.261.833 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'MAT480','25566','9559 F','CHINCHINA','BRANDON STEVEN GIL BAEZ, JAIDER MARTINEZ',2,
       1,0,'-',
       8261833,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1),
       72,'21187','TYM'
FROM vehiculos v WHERE v.placa='MAT480' AND v.razon_social='TYM' LIMIT 1;

/* 09 – WFV015 – EXTRA $100.000, SUPIA RIOSUCIO SUPER, precio = 625.000 + 100.000 = 725.000  |  T VALOR: 10.654.956 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'WFV015','25555','9560','SUPIA RIOSUCIO SUPER','CESAR CASTILLO LONDOÑO',1,
       1,100000,'EXTRA $100.000',
       10654956,725000,
       9,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WFV015' AND v.razon_social='TYM' LIMIT 1;

/* 10 – TUL630 – VALOR DE FLETE $800.000, fac AP802413  |  T VALOR: 30.836.977 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'TUL630','25573','7002','CHINCHINA','JHON FREDY MORENO',1,
       1,0,'VALOR DE FLETE $800.000',
       30836977,800000,
       5,'AP802413','TYM'
FROM vehiculos v WHERE v.placa='TUL630' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA ARMENIA / EJE ───────────────────────────────────── */

/* 11 – TJX795 – 2 aux  |  T VALOR: 8.375.876 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'TJX795','25586','9601','ARMENIA','YEISON DAVID RENDON SOTO, SAMUEL ARIAS',2,
       1,0,'-',
       8375876,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       65,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TJX795' AND v.razon_social='TYM' LIMIT 1;

/* 12 – TTL256 – sin adicional  |  T VALOR: 8.776.121 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'TTL256','25558 25587','9602 7009','ARMENIA','YERFREY FLOWER',1,
       1,0,'-',
       8776121,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       47,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TTL256' AND v.razon_social='TYM' LIMIT 1;

/* 13 – EQY944 – FEP 21184  |  T VALOR: 4.501.163 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'EQY944','25588','9603 F','CALARCA','JUAN JOSE CONTRERAS HERNANDEZ',1,
       1,0,'-',
       4501163,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1),
       51,'21184','TYM'
FROM vehiculos v WHERE v.placa='EQY944' AND v.razon_social='TYM' LIMIT 1;

/* 14 – SXF257 – ADICIONAL $100.000 TSS Y ENTREGA SUPER, precio = tabla + 100.000, FEP 21163  |  T VALOR: 6.097.538 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'SXF257','25589','9604 F','MONTENEGRO PTAPAO','JOSE ALEXANDER CONSTAIN PERLAZA',1,
       1,100000,'ADICIONAL AL FLETE $100.000 TSS Y ENTREGA DE SUPER EXTRARUTA',
       6097538,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 100000,
       51,'21163','TYM'
FROM vehiculos v WHERE v.placa='SXF257' AND v.razon_social='TYM' LIMIT 1;

/* 15 – WLS478 – 2 aux  |  T VALOR: 9.673.522 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'WLS478','25557 25567','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, ABRAHAM RIOS',2,
       1,0,'-',
       9673522,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1),
       42,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WLS478' AND v.razon_social='TYM' LIMIT 1;

/* 16 – WHM896 – FEP 21183  |  T VALOR: 6.276.807 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'WHM896','25554 25568','9606 9600 F','CIRCASIA','JHON WILSON GIRALDO CARVAJAL',1,
       1,0,'-',
       6276807,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1),
       47,'21183','TYM'
FROM vehiculos v WHERE v.placa='WHM896' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

/* 17 – SMO183 – sin adicional  |  T VALOR: 6.480.670 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'SMO183','25577','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
       1,0,'-',
       6480670,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       57,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SMO183' AND v.razon_social='TYM' LIMIT 1;

/* 18 – VZD334 – EXTRA $60.000, precio = tabla + 60.000  |  T VALOR: 8.832.968 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'VZD334','25578','9454','PEREIRA - DOSQUEBRADAS','JUAN RICO',1,
       1,60000,'EXTRA $60.000',
       8832968,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
       60,NULL,'TYM'
FROM vehiculos v WHERE v.placa='VZD334' AND v.razon_social='TYM' LIMIT 1;

/* 19 – TMZ674 – sin adicional  |  T VALOR: 6.565.190 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'TMZ674','25579','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
       1,0,'-',
       6565190,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       60,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TMZ674' AND v.razon_social='TYM' LIMIT 1;

/* 20 – SPQ814 – sin adicional  |  T VALOR: 8.063.042 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'SPQ814','25580 25574','9456 7002','SANTA ROSA','GERMAN GALVEZ CORTES',1,
       1,0,'-',
       8063042,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1),
       52,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SPQ814' AND v.razon_social='TYM' LIMIT 1;

/* 21 – WHN317 – sin adicional  |  T VALOR: 6.884.743 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'WHN317','25581','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
       1,0,'-',
       6884743,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       49,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WHN317' AND v.razon_social='TYM' LIMIT 1;

/* 22 – PEK019 – sin adicional  |  T VALOR: 6.851.984 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'PEK019','25582','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
       1,0,'-',
       6851984,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       57,NULL,'TYM'
FROM vehiculos v WHERE v.placa='PEK019' AND v.razon_social='TYM' LIMIT 1;

/* 23 – EQN953 – sin adicional  |  T VALOR: 6.631.120 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'EQN953','25583','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
       1,0,'-',
       6631120,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       49,NULL,'TYM'
FROM vehiculos v WHERE v.placa='EQN953' AND v.razon_social='TYM' LIMIT 1;

/* 24 – WLC133 – 2 aux  |  T VALOR: 15.721.816 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'WLC133','25584','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, MARLON MURILLO',2,
       1,0,'-',
       15721816,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       74,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WLC133' AND v.razon_social='TYM' LIMIT 1;

/* 25 – TNH494 – sin adicional  |  T VALOR: 6.445.450 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'TNH494','25585','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
       1,0,'-',
       6445450,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1),
       56,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TNH494' AND v.razon_social='TYM' LIMIT 1;

/* 26 – LUM993 – 2 aux  |  T VALOR: 6.073.316 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'LUM993','25590','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, JOHN UTIMA',2,
       1,0,'-',
       6073316,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       54,NULL,'TYM'
FROM vehiculos v WHERE v.placa='LUM993' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA OCCIDENTE ───────────────────────────────────────── */

/* 27 – WTN748 – MERCAMOS, fac AP804976  |  T VALOR: 6.158.460 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'WTN748','25591','7005 MERCAMOS','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
       1,0,'-',
       6158460,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1),
       38,'AP804976','TYM'
FROM vehiculos v WHERE v.placa='WTN748' AND v.razon_social='TYM' LIMIT 1;

/* 28 – ERK303 – 2 aux, La Virginia, fac AP804974-975-977, FEP 21185  |  T VALOR: 10.410.562 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'ERK303','25569','7006 F','LA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
       1,0,'-',
       10410562,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='LA VIRGINIA' LIMIT 1),
       66,'21185 AP804974-975-977','TYM'
FROM vehiculos v WHERE v.placa='ERK303' AND v.razon_social='TYM' LIMIT 1;

/* 29 – JVM223 – 2 aux, Mistrató, FEP 21186  |  T VALOR: 14.428.958 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','ALPINA',v.conductor,'JVM223','25570 25553','7007 9451 F','MISTRATO','LUIS CARLOS CADAVID RESTREPO, CRISTIAN GIRALDO',2,
       1,0,'-',
       14428958,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MISTRATO' LIMIT 1),
       62,'21186','TYM'
FROM vehiculos v WHERE v.placa='JVM223' AND v.razon_social='TYM' LIMIT 1;

/* ── FLEISCHMANN ──────────────────────────────────────────── */

/* 30 – SQB119 – FLEISCHMANN Armenia, adicional $30.000, precio = tabla + 30.000, FEP 21196  |  T VALOR: 5.061.371 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-13','Viernes','FLEISCHMANN',v.conductor,'SQB119',NULL,'FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
       1,30000,'ADICIONAL $30.000',
       5061371,
       (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 30000,
       55,'21196','TYM'
FROM vehiculos v WHERE v.placa='SQB119' AND v.razon_social='TYM' LIMIT 1;

/* -------------------------------------------------
   3️⃣  Verificación
   ------------------------------------------------- */
SELECT '✅ INSERTADO' AS estado, placa, contratista AS conductor_bd,
       zona, poblacion, valor_ruta, precio, no_pedidos, proveedor
FROM fletes
WHERE fecha = '2026-11-13'
  AND proveedor IN ('ALPINA','FLEISCHMANN')

UNION ALL

SELECT '❌ OMITIDO — placa no existe en vehiculos' AS estado,
       placa_programada AS placa, NULL, NULL, NULL, NULL, NULL, NULL, NULL
FROM (VALUES
  ('SYU652'),('WFR160'),('EYX091'),('SPU120'),('TRK507'),
  ('WEP384'),('WGZ876'),('MAT480'),('WFV015'),('TUL630'),
  ('TJX795'),('TTL256'),('EQY944'),('SXF257'),('WLS478'),
  ('WHM896'),('SMO183'),('VZD334'),('TMZ674'),('SPQ814'),
  ('WHN317'),('PEK019'),('EQN953'),('WLC133'),('TNH494'),
  ('LUM993'),('WTN748'),('ERK303'),('JVM223'),('SQB119')
) AS prog(placa_programada)
WHERE NOT EXISTS (
  SELECT 1 FROM fletes f
  WHERE f.placa = prog.placa_programada
    AND f.fecha = '2026-11-13'
    AND f.proveedor IN ('ALPINA','FLEISCHMANN')
)

ORDER BY estado DESC, placa;
