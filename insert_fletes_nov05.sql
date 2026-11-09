/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 5 NOVIEMBRE 2026
   Generado: 2026-11-05

   ✅ REGLAS DE SEGURIDAD:
     - contratista  = vehiculos.conductor (nombre real en BD)
     - valor_ruta   = T VALOR de la programación (total facturado AP+FEP)
     - precio       = precio base de la ruta según tabla precios_fletes
                      (o valor fijo cuando dice "VALOR DE FLETE $X")
     - Cada fila solo se inserta si la placa existe en vehiculos

   Notas:
     - SYU652   (AP 25328 + FEP 21090 21081)
     - WFR160   fac FEP1199076 (AP 25329 + FEP 21091)
     - EYX091   2 auxiliares, Neira (AP 25330 + FEP 21074)
     - SPU120   (AP 25331 + FEP 21092)
     - TRK507   fac FEP1199075 (AP 25351 25332 + FEP 21093 21082)
     - WEP384   2 auxiliares, Riosucio (AP 25333 + FEP 21078 21077)
     - SXE867   VALOR DE FLETE $450.000, 2 auxiliares (AP 25335 + FEP 21080 21079 21075)
     - WFV015   VALOR DE FLETE $600.000 INCLUYE DESCARGUE (AP 25341)
     - TTL256   2 auxiliares, TSS (AP 25311TSS 25353 25326 + FEP 21072 21070)
     - TJX795   (AP 25279 25354)
     - EQY944   fac AP795639 (AP 25355)
     - SXF257   ADICIONAL $150.000 ENTREGA SUPERMERCADO EXTRARUTA ARMENIA (AP 25356 + FEP 21068)
     - WLS478   2 auxiliares, Caicedonia (AP 25336 + FEP 21071)
     - WHM896   VALOR DE FLETE $400.000 ENTREGA EN SALENTO, 2 aux (AP 25340 25337 25324 + FEP 21067 21051)
     - SMO183   (AP 25342)
     - VZD334   (AP 25343 + FEP 21084)
     - TMZ674   (AP 25344 + FEP 21061)
     - SPQ814   fac AP796922 (AP 25345 + FEP 21073)
     - TUL630   VALOR DE FLETE $250.000 (AP 25346 + FEP 21088)
     - PEK019   (AP 25347)
     - SXE499   2 auxiliares (AP 25348)
     - WLC133   2 auxiliares (AP 25349)
     - TNH494   fac AP796916 (AP 25350)
     - WGZ876   VALOR DE FLETE $350.000, 2 aux, TSS (AP 25315TSS 25357 + FEP 21086)
     - WTN748   fac AP796917 (AP 25358)
     - ERK303   2 auxiliares, Apia (AP 25338 + FEP 21085 21083)
     - JVM223   2 auxiliares, Viterbo (AP 25339 25323 + FEP 21087)
     - SQB119   FLEISCHMANN E7001 (AP 25301 + FEP 21089)
   ========================================================== */

/* -------------------------------------------------
   0️⃣  DIAGNÓSTICO PREVIO — Placas NO registradas
        Resultado vacío = todas OK.
        Si aparece alguna fila, esa placa falta en
        vehiculos y su flete será omitido.
   ------------------------------------------------- */
SELECT placa_programada, 'NO EXISTE EN vehiculos — flete se OMITIRÁ' AS alerta
FROM (VALUES
  ('SYU652'),('WFR160'),('EYX091'),('SPU120'),('TRK507'),
  ('WEP384'),('SXE867'),('WFV015'),('TTL256'),('TJX795'),
  ('EQY944'),('SXF257'),('WLS478'),('WHM896'),('SMO183'),
  ('VZD334'),('TMZ674'),('SPQ814'),('TUL630'),('PEK019'),
  ('SXE499'),('WLC133'),('TNH494'),('WGZ876'),('WTN748'),
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
WHERE fecha = '2026-11-05'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 05‑Nov‑2026
        valor_ruta = T VALOR de la programación
        precio     = precio de lista (precios_fletes)
                     o valor fijo cuando aplica
   ------------------------------------------------- */

/* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

/* 01 – SYU652 – FEP 21090 21081  |  T VALOR: 7.508.187 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'SYU652','25328','9552 F','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
       1,0,'-',
       7508187,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       53,'21090 21081','TYM'
FROM vehiculos v WHERE v.placa='SYU652' AND v.razon_social='TYM' LIMIT 1;

/* 02 – WFR160 – fac FEP1199076, FEP 21091  |  T VALOR: 5.226.924 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'WFR160','25329','9553 F','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
       1,0,'-',
       5226924,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       40,'21091 FEP1199076','TYM'
FROM vehiculos v WHERE v.placa='WFR160' AND v.razon_social='TYM' LIMIT 1;

/* 03 – EYX091 – 2 auxiliares, Neira, FEP 21074  |  T VALOR: 9.238.828 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'EYX091','25330','9554 F','NEIRA','JHONNY LOPEZ, ANDRES GOMEZ',2,
       1,0,'-',
       9238828,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1),
       59,'21074','TYM'
FROM vehiculos v WHERE v.placa='EYX091' AND v.razon_social='TYM' LIMIT 1;

/* 04 – SPU120 – FEP 21092  |  T VALOR: 6.664.746 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'SPU120','25331','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
       1,0,'-',
       6664746,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       45,'21092','TYM'
FROM vehiculos v WHERE v.placa='SPU120' AND v.razon_social='TYM' LIMIT 1;

/* 05 – TRK507 – fac FEP1199075, FEP 21093 21082  |  T VALOR: 9.243.030 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'TRK507','25351 25332','9556 9550 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
       1,0,'-',
       9243030,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       55,'21093 21082 FEP1199075','TYM'
FROM vehiculos v WHERE v.placa='TRK507' AND v.razon_social='TYM' LIMIT 1;

/* 06 – WEP384 – 2 auxiliares, Riosucio, FEP 21078 21077  |  T VALOR: 13.791.372 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'WEP384','25333','9557 F','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ, CESAR CASTILLO LONDOÑO',2,
       1,0,'-',
       13791372,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1),
       59,'21078 21077','TYM'
FROM vehiculos v WHERE v.placa='WEP384' AND v.razon_social='TYM' LIMIT 1;

/* 07 – SXE867 – VALOR DE FLETE $450.000, 2 aux  |  T VALOR: 12.863.758 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'SXE867','25335','9559 F','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
       1,0,'VALOR DE FLETE $450.000',
       12863758,450000,
       59,'21080 21079 21075','TYM'
FROM vehiculos v WHERE v.placa='SXE867' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA ARMENIA / EJE ───────────────────────────────────── */

/* 08 – WFV015 – VALOR DE FLETE $600.000 INCLUYE DESCARGUE  |  T VALOR: 13.636.352 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'WFV015','25341','7008','CALARCA','',0,
       1,0,'VALOR DE FLETE $600.000 INCLUYE DESCARGUE',
       13636352,600000,
       2,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WFV015' AND v.razon_social='TYM' LIMIT 1;

/* 09 – TTL256 – 2 aux, TSS, FEP 21072 21070  |  T VALOR: 10.535.204 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'TTL256','25311TSS 25353 25326','9601 7009 F TSS','ARMENIA','YEISON DAVID RENDON SOTO, JUAN RICO',2,
       1,0,'-',
       10535204,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       59,'21072 21070','TYM'
FROM vehiculos v WHERE v.placa='TTL256' AND v.razon_social='TYM' LIMIT 1;

/* 10 – TJX795 – sin adicional  |  T VALOR: 7.859.982 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'TJX795','25279 25354','9602 7008RINDEMAX','ARMENIA','YERFREY FLOWER',1,
       1,0,'-',
       7859982,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       56,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TJX795' AND v.razon_social='TYM' LIMIT 1;

/* 11 – EQY944 – fac AP795639  |  T VALOR: 6.100.801 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'EQY944','25355','9603 ANDY','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
       1,0,'-',
       6100801,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       60,'AP795639','TYM'
FROM vehiculos v WHERE v.placa='EQY944' AND v.razon_social='TYM' LIMIT 1;

/* 12 – SXF257 – ADICIONAL $150.000, FEP 21068  |  T VALOR: 8.681.902 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'SXF257','25356','9604 F','ALCALA ULLOA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
       1,150000,'ADICIONAL $150.000 ENTREGA DE SUPERMERCADO EXTRARUTA EN ARMENIA',
       8681902,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1),
       49,'21068','TYM'
FROM vehiculos v WHERE v.placa='SXF257' AND v.razon_social='TYM' LIMIT 1;

/* 13 – WLS478 – 2 aux, Caicedonia, FEP 21071  |  T VALOR: 10.291.620 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'WLS478','25336','9605 F','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, EDWAR GIL',2,
       1,0,'-',
       10291620,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1),
       53,'21071','TYM'
FROM vehiculos v WHERE v.placa='WLS478' AND v.razon_social='TYM' LIMIT 1;

/* 14 – WHM896 – VALOR DE FLETE $400.000 ENTREGA EN SALENTO, 2 aux  |  T VALOR: 11.616.665 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'WHM896','25340 25337 25324','9606 9600 F','FILANDIA','JHON WILSON GIRALDO CARVAJAL, SAMUEL ARIAS',2,
       1,0,'VALOR DE FLETE $400.000 ENTREGA EN SALENTO',
       11616665,400000,
       36,'21067 21051','TYM'
FROM vehiculos v WHERE v.placa='WHM896' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

/* 15 – SMO183 – sin adicional  |  T VALOR: 5.831.573 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'SMO183','25342','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
       1,0,'-',
       5831573,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       43,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SMO183' AND v.razon_social='TYM' LIMIT 1;

/* 16 – VZD334 – FEP 21084  |  T VALOR: 9.414.559 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'VZD334','25343','9454 F','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
       1,0,'-',
       9414559,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       56,'21084','TYM'
FROM vehiculos v WHERE v.placa='VZD334' AND v.razon_social='TYM' LIMIT 1;

/* 17 – TMZ674 – FEP 21061  |  T VALOR: 5.556.318 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'TMZ674','25344','9455 F','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
       1,0,'-',
       5556318,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       53,'21061','TYM'
FROM vehiculos v WHERE v.placa='TMZ674' AND v.razon_social='TYM' LIMIT 1;

/* 18 – SPQ814 – fac AP796922, FEP 21073  |  T VALOR: 5.995.770 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'SPQ814','25345','9456 MERCALOCURA F','SANTA ROSA','GERMAN GALVEZ CORTES',1,
       1,0,'-',
       5995770,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1),
       39,'21073 AP796922','TYM'
FROM vehiculos v WHERE v.placa='SPQ814' AND v.razon_social='TYM' LIMIT 1;

/* 19 – TUL630 – VALOR DE FLETE $250.000, FEP 21088  |  T VALOR: 6.218.022 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'TUL630','25346','9457 F','ARABIA ALTAGRACIA','JUAN ESTEBAN GALLEGO DIEZ',1,
       1,0,'VALOR DE FLETE $250.000',
       6218022,250000,
       53,'21088','TYM'
FROM vehiculos v WHERE v.placa='TUL630' AND v.razon_social='TYM' LIMIT 1;

/* 20 – PEK019 – sin adicional  |  T VALOR: 5.260.577 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'PEK019','25347','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
       1,0,'-',
       5260577,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       42,NULL,'TYM'
FROM vehiculos v WHERE v.placa='PEK019' AND v.razon_social='TYM' LIMIT 1;

/* 21 – SXE499 – 2 auxiliares  |  T VALOR: 8.782.085 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'SXE499','25348','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO, MANUEL RAMIREZ',2,
       1,0,'-',
       8782085,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       45,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SXE499' AND v.razon_social='TYM' LIMIT 1;

/* 22 – WLC133 – 2 auxiliares  |  T VALOR: 6.665.849 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'WLC133','25349','9460','PEREIRA','MARLON MURILLO, SANTIAGO HENAO MORALES',2,
       1,0,'-',
       6665849,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1),
       44,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WLC133' AND v.razon_social='TYM' LIMIT 1;

/* 23 – TNH494 – fac AP796916  |  T VALOR: 7.508.098 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'TNH494','25350','9461 SUPERMISCELANIA','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
       1,0,'-',
       7508098,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1),
       55,'AP796916','TYM'
FROM vehiculos v WHERE v.placa='TNH494' AND v.razon_social='TYM' LIMIT 1;

/* 24 – WGZ876 – VALOR DE FLETE $350.000, 2 aux, TSS  |  T VALOR: 10.823.198 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'WGZ876','25315TSS 25357','7004 F TSS','MARSELLA','BRAHIAN STIVEN VALENCIA IGLESIAS, CRISTIAN GIRALDO',2,
       1,0,'VALOR DE FLETE $350.000',
       10823198,350000,
       52,'21086','TYM'
FROM vehiculos v WHERE v.placa='WGZ876' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA OCCIDENTE ───────────────────────────────────────── */

/* 25 – WTN748 – fac AP796917, Cartago 2T  |  T VALOR: 7.943.943 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'WTN748','25358','7005 MERCAPLAZA','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
       1,0,'-',
       7943943,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1),
       41,'AP796917','TYM'
FROM vehiculos v WHERE v.placa='WTN748' AND v.razon_social='TYM' LIMIT 1;

/* 26 – ERK303 – 2 auxiliares, Apia, FEP 21085 21083  |  T VALOR: 10.801.867 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'ERK303','25338','7006 F','APIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
       1,0,'-',
       10801867,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA' LIMIT 1),
       49,'21085 21083','TYM'
FROM vehiculos v WHERE v.placa='ERK303' AND v.razon_social='TYM' LIMIT 1;

/* 27 – JVM223 – 2 auxiliares, Viterbo, FEP 21087  |  T VALOR: 12.098.846 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'JVM223','25339 25323','7007 9451 F','VITERBO','LUIS CARLOS CADAVID RESTREPO, PABLO RAMIREZ',2,
       1,0,'-',
       12098846,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1),
       60,'21087','TYM'
FROM vehiculos v WHERE v.placa='JVM223' AND v.razon_social='TYM' LIMIT 1;

/* ── FLEISCHMANN ──────────────────────────────────────────── */

/* 28 – SQB119 – FLEISCHMANN E7001, FEP 21089  |  T VALOR: 4.634.580 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','FLEISCHMANN',v.conductor,'SQB119','25301','FLEISCHMANN E7001','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
       1,0,'-',
       4634580,
       (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       48,'21089','TYM'
FROM vehiculos v WHERE v.placa='SQB119' AND v.razon_social='TYM' LIMIT 1;

/* -------------------------------------------------
   3️⃣  Verificación — fletes insertados vs programados
   ------------------------------------------------- */

-- ✅ Fletes que SÍ quedaron en la base de datos
SELECT '✅ INSERTADO' AS estado, placa, contratista AS conductor_bd,
       zona, poblacion, valor_ruta, precio, no_pedidos, proveedor
FROM fletes
WHERE fecha = '2026-11-05'
  AND proveedor IN ('ALPINA','FLEISCHMANN')

UNION ALL

-- ❌ Placas programadas que NO quedaron (placa no existe en vehiculos)
SELECT '❌ OMITIDO — placa no existe en vehiculos' AS estado,
       placa_programada AS placa, NULL, NULL, NULL, NULL, NULL, NULL, NULL
FROM (VALUES
  ('SYU652'),('WFR160'),('EYX091'),('SPU120'),('TRK507'),
  ('WEP384'),('SXE867'),('WFV015'),('TTL256'),('TJX795'),
  ('EQY944'),('SXF257'),('WLS478'),('WHM896'),('SMO183'),
  ('VZD334'),('TMZ674'),('SPQ814'),('TUL630'),('PEK019'),
  ('SXE499'),('WLC133'),('TNH494'),('WGZ876'),('WTN748'),
  ('ERK303'),('JVM223'),('SQB119')
) AS prog(placa_programada)
WHERE NOT EXISTS (
  SELECT 1 FROM fletes f
  WHERE f.placa = prog.placa_programada
    AND f.fecha = '2026-11-05'
    AND f.proveedor IN ('ALPINA','FLEISCHMANN')
)

ORDER BY estado DESC, placa;
