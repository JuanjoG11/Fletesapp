/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 6 NOVIEMBRE 2026
   Generado: 2026-11-06

   ✅ REGLAS DE SEGURIDAD:
     - contratista  = vehiculos.conductor (nombre real en BD)
     - valor_ruta   = T VALOR de la programación (total facturado AP+FEP)
     - precio       = precio base de la ruta según tabla precios_fletes
                      (o valor fijo cuando dice "VALOR DE FLETE $X")
     - Cada fila solo se inserta si la placa existe en vehiculos

   Notas:
     - SYU652   fac FEP1199236 (AP 25369 + FEP 1)
     - WFR160   ADICIONAL $100.000 ENTREGA SUPERMERCADOS, 2 aux (AP 25325 25370 25381 25382 + FEP 21103)
     - EYX091   (AP 25371 25365 + FEP 21104)
     - SPU120   (AP 25372 + FEP 21105)
     - TRK507   fac FEP1199235 (AP 25373 + FEP 21106 21101)
     - WEP384   (AP 25374 + FEP 21077)
     - WGZ876   EXTRA $60.000, 2 aux (AP 25334 25375 + FEP 21076)
     - SXE867   2 aux (AP 25376 + FEP 21108)
     - WFV015   EXTRA $60.000 (AP 25364)
     - TUL630   VALOR DE FLETE $600.000 (AP 25366) fac AP797183 AP797295 AP798035
     - TTL256   2 aux (AP 25397)
     - TJX795   (AP 25367 25398)
     - EQY944   (AP 25399 + FEP 21100)
     - SXF257   (AP 25294 25400 + FEP 21069)
     - WLS478   2 aux (AP 25368 25377)
     - WHM896   (AP 25396 25378 + FEP 21099)
     - SMO183   (AP 25387)
     - VZD334   TSS (AP 25343TSS 25388)
     - TMZ674   (AP 25389)
     - SPQ814   (AP 25390)
     - MAT480   2 aux (AP 25391)
     - PEK019   (AP 25392)
     - BCS450   TSS (AP 25348TSS 25393)
     - WLC133   2 aux (AP 25394)
     - TNH494   MERCAMOS, fac AP798213 (AP 25395)
     - LUM993   (AP 25401)
     - WTN748   VALOR DE FLETE $500.000 RECORRIDO EXTRARUTA POR DERRUMBE, fac FEP1198955 FEP1199019 (AP 25402 + FEP 2)
     - ERK303   2 aux (AP 25379 + FEP 21097) fac AP798211 AP798212 AP798214
     - JVM223   2 aux (AP 25380 25363 + FEP 21098)
     - SQB119   FLEISCHMANN (FEP 21107 21109)
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
  ('WEP384'),('WGZ876'),('SXE867'),('WFV015'),('TUL630'),
  ('TTL256'),('TJX795'),('EQY944'),('SXF257'),('WLS478'),
  ('WHM896'),('SMO183'),('VZD334'),('TMZ674'),('SPQ814'),
  ('MAT480'),('PEK019'),('BCS450'),('WLC133'),('TNH494'),
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
WHERE fecha = '2026-11-06'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 06‑Nov‑2026
        valor_ruta = T VALOR de la programación
        precio     = precio de lista (precios_fletes)
                     o valor fijo cuando aplica
   ------------------------------------------------- */

/* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

/* 01 – SYU652 – fac FEP1199236  |  T VALOR: 5.459.632 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'SYU652','25369','9552 F','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
       1,0,'-',
       5459632,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       45,'FEP1199236','TYM'
FROM vehiculos v WHERE v.placa='SYU652' AND v.razon_social='TYM' LIMIT 1;

/* 02 – WFR160 – ADICIONAL $100.000 ENTREGA SUPERMERCADOS, 2 aux, FEP 21103  |  T VALOR: 11.342.666 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'WFR160','25325 25370 25381 25382','9553 9550 7001 F','MANIZALES VILLAMARIA','CARLOS JIMENEZ, CESAR CASTILLO LONDOÑO',2,
       1,100000,'ADICIONAL AL FLETE $100.000 ENTREGA DE SUPERMERCADOS',
       11342666,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       49,'21103','TYM'
FROM vehiculos v WHERE v.placa='WFR160' AND v.razon_social='TYM' LIMIT 1;

/* 03 – EYX091 – FEP 21104  |  T VALOR: 9.889.981 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'EYX091','25371 25365','9554 7000 F','MANIZALES VILLAMARIA','JHONNY LOPEZ',1,
       1,0,'-',
       9889981,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       51,'21104','TYM'
FROM vehiculos v WHERE v.placa='EYX091' AND v.razon_social='TYM' LIMIT 1;

/* 04 – SPU120 – FEP 21105  |  T VALOR: 6.594.611 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'SPU120','25372','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
       1,0,'-',
       6594611,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       55,'21105','TYM'
FROM vehiculos v WHERE v.placa='SPU120' AND v.razon_social='TYM' LIMIT 1;

/* 05 – TRK507 – fac FEP1199235, FEP 21106 21101  |  T VALOR: 6.389.999 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'TRK507','25373','9556 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
       1,0,'-',
       6389999,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       52,'21106 21101 FEP1199235','TYM'
FROM vehiculos v WHERE v.placa='TRK507' AND v.razon_social='TYM' LIMIT 1;

/* 06 – WEP384 – FEP 21077  |  T VALOR: 12.336.644 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'WEP384','25374','9557','IRRA LA FELISA VER RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ',1,
       1,0,'-',
       12336644,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='IRRA LA FELISA VER RIOSUCIO' LIMIT 1),
       35,'21077','TYM'
FROM vehiculos v WHERE v.placa='WEP384' AND v.razon_social='TYM' LIMIT 1;

/* 07 – WGZ876 – EXTRA $60.000, 2 aux, FEP 21076  |  T VALOR: 14.174.907 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'WGZ876','25334 25375','9558 F','PACORA SALAMINA','JOHN EDWAR ZAPATA ACEVEDO, ANDRES GOMEZ',2,
       1,60000,'EXTRA $60.000',
       14174907,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1),
       80,'21076','TYM'
FROM vehiculos v WHERE v.placa='WGZ876' AND v.razon_social='TYM' LIMIT 1;

/* 08 – SXE867 – 2 aux, FEP 21108  |  T VALOR: 9.808.032 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'SXE867','25376','9559 F','CHINCHINA','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
       1,0,'-',
       9808032,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1),
       73,'21108','TYM'
FROM vehiculos v WHERE v.placa='SXE867' AND v.razon_social='TYM' LIMIT 1;

/* 09 – WFV015 – EXTRA $60.000  |  T VALOR: 13.538.588 */
/* precio SUPIA RIOSUCIO SUPER = 625000 (no existe en precios_fletes, valor fijo documentado en fix_wfv015_oct30_supia.sql) */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'WFV015','25364','9560','SUPIA RIOSUCIO SUPER','MANUEL RAMIREZ',1,
       1,60000,'EXTRA $60.000',
       13538588,625000,
       9,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WFV015' AND v.razon_social='TYM' LIMIT 1;

/* 10 – TUL630 – VALOR DE FLETE $600.000, fac AP797183 AP797295 AP798035  |  T VALOR: 25.831.611 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'TUL630','25366','7002','CHINCHINA','JHON FREDY MORENO',1,
       1,0,'VALOR DE FLETE $600.000',
       25831611,600000,
       5,'AP797183 AP797295 AP798035','TYM'
FROM vehiculos v WHERE v.placa='TUL630' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA ARMENIA / EJE ───────────────────────────────────── */

/* 11 – TTL256 – 2 aux  |  T VALOR: 9.055.434 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'TTL256','25397','9601','ARMENIA','YEISON DAVID RENDON SOTO, SAMUEL ARIAS',2,
       1,0,'-',
       9055434,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       60,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TTL256' AND v.razon_social='TYM' LIMIT 1;

/* 12 – TJX795 – sin adicional  |  T VALOR: 11.103.842 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'TJX795','25367 25398','9602 7009','ARMENIA','YERFREY FLOWER',1,
       1,0,'-',
       11103842,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       47,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TJX795' AND v.razon_social='TYM' LIMIT 1;

/* 13 – EQY944 – FEP 21100  |  T VALOR: 4.403.728 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'EQY944','25399','9603 F','CALARCA','JUAN JOSE CONTRERAS HERNANDEZ',1,
       1,0,'-',
       4403728,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1),
       51,'21100','TYM'
FROM vehiculos v WHERE v.placa='EQY944' AND v.razon_social='TYM' LIMIT 1;

/* 14 – SXF257 – 2 aux, FEP 21069  |  T VALOR: 9.388.509 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'SXF257','25294 25400','9604 7010 F','MONTENEGRO PTAPAO','JOSE ALEXANDER CONSTAIN PERLAZA, JUAN RICO',2,
       1,0,'-',
       9388509,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1),
       59,'21069','TYM'
FROM vehiculos v WHERE v.placa='SXF257' AND v.razon_social='TYM' LIMIT 1;

/* 15 – WLS478 – 2 aux  |  T VALOR: 12.459.440 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'WLS478','25368 25377','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, EDWAR GIL',2,
       1,0,'-',
       12459440,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1),
       46,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WLS478' AND v.razon_social='TYM' LIMIT 1;

/* 16 – WHM896 – FEP 21099  |  T VALOR: 11.153.641 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'WHM896','25396 25378','9606 9600 F','CIRCASIA','JHON WILSON GIRALDO CARVAJAL',1,
       1,0,'-',
       11153641,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1),
       53,'21099','TYM'
FROM vehiculos v WHERE v.placa='WHM896' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

/* 17 – SMO183 – sin adicional  |  T VALOR: 7.528.705 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'SMO183','25387','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
       1,0,'-',
       7528705,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       62,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SMO183' AND v.razon_social='TYM' LIMIT 1;

/* 18 – VZD334 – TSS  |  T VALOR: 7.893.542 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'VZD334','25343TSS 25388','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
       1,0,'-',
       7893542,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       52,NULL,'TYM'
FROM vehiculos v WHERE v.placa='VZD334' AND v.razon_social='TYM' LIMIT 1;

/* 19 – TMZ674 – sin adicional  |  T VALOR: 6.465.346 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'TMZ674','25389','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
       1,0,'-',
       6465346,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       67,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TMZ674' AND v.razon_social='TYM' LIMIT 1;

/* 20 – SPQ814 – sin adicional  |  T VALOR: 6.091.685 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'SPQ814','25390','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
       1,0,'-',
       6091685,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1),
       51,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SPQ814' AND v.razon_social='TYM' LIMIT 1;

/* 21 – MAT480 – 2 aux  |  T VALOR: 9.380.012 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'MAT480','25391','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ, CRISTIAN GIRALDO',2,
       1,0,'-',
       9380012,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       53,NULL,'TYM'
FROM vehiculos v WHERE v.placa='MAT480' AND v.razon_social='TYM' LIMIT 1;

/* 22 – PEK019 – sin adicional  |  T VALOR: 6.335.917 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'PEK019','25392','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
       1,0,'-',
       6335917,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       51,NULL,'TYM'
FROM vehiculos v WHERE v.placa='PEK019' AND v.razon_social='TYM' LIMIT 1;

/* 23 – BCS450 – TSS  |  T VALOR: 5.841.904 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'BCS450','25348TSS 25393','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
       1,0,'-',
       5841904,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       49,NULL,'TYM'
FROM vehiculos v WHERE v.placa='BCS450' AND v.razon_social='TYM' LIMIT 1;

/* 24 – WLC133 – 2 aux  |  T VALOR: 15.474.038 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'WLC133','25394','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, MARLON MURILLO',2,
       1,0,'-',
       15474038,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       76,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WLC133' AND v.razon_social='TYM' LIMIT 1;

/* 25 – TNH494 – MERCAMOS, fac AP798213  |  T VALOR: 9.713.165 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'TNH494','25395','9461 MERCAMOS','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
       1,0,'-',
       9713165,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1),
       56,'AP798213','TYM'
FROM vehiculos v WHERE v.placa='TNH494' AND v.razon_social='TYM' LIMIT 1;

/* 26 – LUM993 – sin adicional  |  T VALOR: 7.255.119 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'LUM993','25401','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
       1,0,'-',
       7255119,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       50,NULL,'TYM'
FROM vehiculos v WHERE v.placa='LUM993' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA OCCIDENTE ───────────────────────────────────────── */

/* 27 – WTN748 – VALOR DE FLETE $500.000 RECORRIDO EXTRARUTA POR DERRUMBE, fac FEP1198955 FEP1199019  |  T VALOR: 6.406.655 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'WTN748','25402','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
       1,0,'VALOR DE FLETE $500.000 RECORRIDO EXTRARUTA POR DERRUMBE',
       6406655,500000,
       45,'FEP1198955 FEP1199019','TYM'
FROM vehiculos v WHERE v.placa='WTN748' AND v.razon_social='TYM' LIMIT 1;

/* 28 – ERK303 – 2 aux, FEP 21097, fac AP798211 AP798212 AP798214  |  T VALOR: 10.941.375 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'ERK303','25379','7006 F','LA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
       1,0,'-',
       10941375,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='LA VIRGINIA' LIMIT 1),
       71,'21097 AP798211 AP798212 AP798214','TYM'
FROM vehiculos v WHERE v.placa='ERK303' AND v.razon_social='TYM' LIMIT 1;

/* 29 – JVM223 – 2 aux, FEP 21098  |  T VALOR: 18.732.029 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','ALPINA',v.conductor,'JVM223','25380 25363','7007 9451 F','MISTRATO','LUIS CARLOS CADAVID RESTREPO, PABLO RAMIREZ',2,
       1,0,'-',
       18732029,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MISTRATO' LIMIT 1),
       69,'21098','TYM'
FROM vehiculos v WHERE v.placa='JVM223' AND v.razon_social='TYM' LIMIT 1;

/* ── FLEISCHMANN ──────────────────────────────────────────── */

/* 30 – SQB119 – FLEISCHMANN, FEP 21107 21109  |  T VALOR: 7.806.075 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-06','Viernes','FLEISCHMANN',v.conductor,'SQB119',NULL,'FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
       1,0,'-',
       7806075,
       (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       68,'21107 21109','TYM'
FROM vehiculos v WHERE v.placa='SQB119' AND v.razon_social='TYM' LIMIT 1;

/* -------------------------------------------------
   3️⃣  Verificación — fletes insertados vs programados
   ------------------------------------------------- */

-- ✅ Fletes que SÍ quedaron en la base de datos
SELECT '✅ INSERTADO' AS estado, placa, contratista AS conductor_bd,
       zona, poblacion, valor_ruta, precio, no_pedidos, proveedor
FROM fletes
WHERE fecha = '2026-11-06'
  AND proveedor IN ('ALPINA','FLEISCHMANN')

UNION ALL

-- ❌ Placas programadas que NO quedaron (placa no existe en vehiculos)
SELECT '❌ OMITIDO — placa no existe en vehiculos' AS estado,
       placa_programada AS placa, NULL, NULL, NULL, NULL, NULL, NULL, NULL
FROM (VALUES
  ('SYU652'),('WFR160'),('EYX091'),('SPU120'),('TRK507'),
  ('WEP384'),('WGZ876'),('SXE867'),('WFV015'),('TUL630'),
  ('TTL256'),('TJX795'),('EQY944'),('SXF257'),('WLS478'),
  ('WHM896'),('SMO183'),('VZD334'),('TMZ674'),('SPQ814'),
  ('MAT480'),('PEK019'),('BCS450'),('WLC133'),('TNH494'),
  ('LUM993'),('WTN748'),('ERK303'),('JVM223'),('SQB119')
) AS prog(placa_programada)
WHERE NOT EXISTS (
  SELECT 1 FROM fletes f
  WHERE f.placa = prog.placa_programada
    AND f.fecha = '2026-11-06'
    AND f.proveedor IN ('ALPINA','FLEISCHMANN')
)

ORDER BY estado DESC, placa;
