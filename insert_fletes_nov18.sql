/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 18 NOVIEMBRE 2026
   Generado: 2026-11-18

   ✅ REGLAS:
     - contratista  = vehiculos.conductor (nombre real en BD)
     - valor_ruta   = T VALOR de la programación (total AP+FEP)
     - precio       = precio_tabla + adicional, o valor fijo con VALOR DE FLETE
     - valor_adicional_negociacion = monto del adicional (trazabilidad)

   Notas:
     - SYU652   MANIZALES VILLAMARIA, 1 aux (AP 25638 + FEP 21235)
     - WFR160   MANIZALES VILLAMARIA, 2 aux, ADICIONAL $200.000 ENTREGA SUPERMERCADOS, fac AP808904 AP808905 AP808909 (AP 25639)
     - EYX091   MANIZALES VILLAMARIA, 1 aux, fac AP808902 AP808907 (AP 25640 + FEP 21236)
     - SPU120   MANIZALES VILLAMARIA, 1 aux (AP 25641 + FEP 21237)
     - TRK507   MANIZALES VILLAMARIA, 1 aux, fac AP808903 (AP 25649 + FEP 21231)
     - WEP384   SUPIA, 2 aux (AP 25642)
     - WGZ876   AGUADAS PACORA, 2 aux (AP 25643 + FEP 21220)
     - MAT480   CHINCHINA, 2 aux, fac AP806370 (AP 25636 25644 + FEP 21232)
     - WFV015   SUPIA RIOSUCIO SUPER, sin aux, ADICIONAL $100.000 ENTREGA SUPER CONDUCTOR (AP 25633)
     - TJX795   ARMENIA, 1 aux (AP 25661)
     - TTL256   ARMENIA, 1 aux (AP 25662)
     - EQY944   CALARCA, 1 aux (AP 25663 + FEP 21224)
     - SXF257   MONTENEGRO PTAPAO, 1 aux, fac AP809051 AP809052 (AP 25664 + FEP 21222)
     - WLS478   TEBAIDA, 1 aux (AP 25645 + FEP 21223)
     - WHM896   CIRCASIA, 1 aux (AP 25646)
     - TUL630   PEREIRA-DOSQUEBRADAS, VALOR DE FLETE $320.000, 0 pedidos (AP 25651-4993)
     - VZD334   PEREIRA-DOSQUEBRADAS, 1 aux (AP 25653)
     - WHN317   PEREIRA-DOSQUEBRADAS, 1 aux (AP 25654)
     - SPQ814   SANTA ROSA, 1 aux (AP 25655)
     - EQN953   PEREIRA-DOSQUEBRADAS, 1 aux (AP 25656)
     - PEK019   PEREIRA-DOSQUEBRADAS, 1 aux (AP 25657)
     - SMO183   PEREIRA-DOSQUEBRADAS, 2 aux (AP 25658)
     - WLC133   PEREIRA-DOSQUEBRADAS, 2 aux (AP 25659)
     - TNH494   CARTAGO, 1 aux, fac AP807709 (AP 25660)
     - LUM993   PEREIRA-DOSQUEBRADAS, 1 aux (AP 25665)
     - WTN748   ARGELIA EL CAIRO, 1 aux, VALOR DE FLETE $480.000 (AP 25666)
     - ERK303   SANTUARIO, 2 aux, fac AP807701 AP807702 (AP 25647 + FEP 21226 21225)
     - JVM223   BELEN DE UMBRIA, 2 aux (AP 25632 25648)
     - SQB119   FLEISCHMANN ARMENIA (FEP 21233)
     - TRF860   FLEISCHMANN CARTAGO 2T (FEP 21230 21227 21219)
   ========================================================== */

/* -------------------------------------------------
   0️⃣  DIAGNÓSTICO PREVIO
   ------------------------------------------------- */
SELECT placa_programada, 'NO EXISTE EN vehiculos — flete se OMITIRÁ' AS alerta
FROM (VALUES
  ('SYU652'),('WFR160'),('EYX091'),('SPU120'),('TRK507'),
  ('WEP384'),('WGZ876'),('MAT480'),('WFV015'),
  ('TJX795'),('TTL256'),('EQY944'),('SXF257'),('WLS478'),('WHM896'),
  ('TUL630'),('VZD334'),('WHN317'),('SPQ814'),('EQN953'),('PEK019'),
  ('SMO183'),('WLC133'),('TNH494'),('LUM993'),
  ('WTN748'),('ERK303'),('JVM223'),
  ('SQB119'),('TRF860')
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
WHERE fecha = '2026-11-18'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 18‑Nov‑2026
   ------------------------------------------------- */

/* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

/* 01 – SYU652 – MANIZALES VILLAMARIA, 1 aux
        AP 25638 | FEP 21235 | T VALOR: 7.102.480 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'SYU652','25638','9552 F','MANIZALES VILLAMARIA','MANUEL RAMIREZ',1,
       1,0,'-',
       7102480,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       58,'21235','TYM'
FROM vehiculos v WHERE v.placa='SYU652' AND v.razon_social='TYM' LIMIT 1;

/* 02 – WFR160 – MANIZALES VILLAMARIA, 2 aux, ADICIONAL $200.000 ENTREGA SUPERMERCADOS
        precio = tabla + 200.000 | fac AP808904 AP808905 AP808909 | AP 25639 | T VALOR: 19.015.829 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'WFR160','25639','9553 FLORIDA/CAMPO','MANIZALES VILLAMARIA','CARLOS JIMENEZ, JOHN UTIMA',2,
       1,200000,'ADICIONAL AL FLETE $200.000 ENTREGA DE SUPERMERCADOS',
       19015829,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 200000,
       46,'AP808904 AP808905 AP808909','TYM'
FROM vehiculos v WHERE v.placa='WFR160' AND v.razon_social='TYM' LIMIT 1;

/* 03 – EYX091 – MANIZALES VILLAMARIA, 1 aux, fac AP808902 AP808907
        AP 25640 | FEP 21236 | T VALOR: 10.007.727 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'EYX091','25640','9554 PALERMO F','MANIZALES VILLAMARIA','JHONNY LOPEZ',1,
       1,0,'-',
       10007727,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       57,'21236 AP808902 AP808907','TYM'
FROM vehiculos v WHERE v.placa='EYX091' AND v.razon_social='TYM' LIMIT 1;

/* 04 – SPU120 – MANIZALES VILLAMARIA, 1 aux
        AP 25641 | FEP 21237 | T VALOR: 7.115.961 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'SPU120','25641','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
       1,0,'-',
       7115961,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       58,'21237','TYM'
FROM vehiculos v WHERE v.placa='SPU120' AND v.razon_social='TYM' LIMIT 1;

/* 05 – TRK507 – MANIZALES VILLAMARIA, 1 aux, fac AP808903
        AP 25649 | FEP 21231 | T VALOR: 8.295.296 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'TRK507','25649','9556 UNOAC F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
       1,0,'-',
       8295296,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       38,'21231 AP808903','TYM'
FROM vehiculos v WHERE v.placa='TRK507' AND v.razon_social='TYM' LIMIT 1;

/* 06 – WEP384 – SUPIA, 2 aux
        AP 25642 | T VALOR: 8.971.973 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'WEP384','25642','9557 F','SUPIA','JUAN MANUEL DELGADO NARVAEZ, CESAR CASTILLO LONDOÑO',2,
       1,0,'-',
       8971973,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1),
       40,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WEP384' AND v.razon_social='TYM' LIMIT 1;

/* 07 – WGZ876 – AGUADAS PACORA, 2 aux
        AP 25643 | FEP 21220 | T VALOR: 19.307.206 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'WGZ876','25643','9558 F','AGUADAS PACORA','JOHN EDWAR ZAPATA ACEVEDO, YESID PATIÑO',2,
       1,0,'-',
       19307206,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1),
       71,'21220','TYM'
FROM vehiculos v WHERE v.placa='WGZ876' AND v.razon_social='TYM' LIMIT 1;

/* 08 – MAT480 – CHINCHINA, 2 aux, fac AP806370
        AP 25636 25644 | FEP 21232 | T VALOR: 8.026.621 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'MAT480','25636 25644','9559 7002 F','CHINCHINA','BRANDON STEVEN GIL BAEZ, ABRAHAM RIOS',2,
       1,0,'-',
       8026621,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1),
       58,'21232 AP806370','TYM'
FROM vehiculos v WHERE v.placa='MAT480' AND v.razon_social='TYM' LIMIT 1;

/* 09 – WFV015 – SUPIA RIOSUCIO SUPER, sin aux, ADICIONAL $100.000 ENTREGA SUPER CONDUCTOR
        precio = 625.000 (tabla hardcodeada, no está en precios_fletes) + 100.000 adicional = 725.000
        AP 25633 | T VALOR: 11.026.459 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'WFV015','25633','9560','SUPIA RIOSUCIO SUPER',NULL,0,
       1,100000,'ADICIONAL AL FLETE $100.000 ENTREGA DE SUPER POR PARTE DEL CONDUCTOR',
       11026459,725000,
       9,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WFV015' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA ARMENIA / EJE ───────────────────────────────────── */

/* 10 – TJX795 – ARMENIA, 1 aux
        AP 25661 | T VALOR: 6.242.549 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'TJX795','25661','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
       1,0,'-',
       6242549,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       48,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TJX795' AND v.razon_social='TYM' LIMIT 1;

/* 11 – TTL256 – ARMENIA, 1 aux
        AP 25662 | T VALOR: 7.316.213 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'TTL256','25662','9602','ARMENIA','YERFREY FLOWER',1,
       1,0,'-',
       7316213,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       55,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TTL256' AND v.razon_social='TYM' LIMIT 1;

/* 12 – EQY944 – CALARCA, 1 aux
        AP 25663 | FEP 21224 | T VALOR: 7.943.509 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'EQY944','25663','9603 F','CALARCA','JUAN JOSE CONTRERAS HERNANDEZ',1,
       1,0,'-',
       7943509,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1),
       60,'21224','TYM'
FROM vehiculos v WHERE v.placa='EQY944' AND v.razon_social='TYM' LIMIT 1;

/* 13 – SXF257 – MONTENEGRO PTAPAO, 1 aux, fac AP809051 AP809052
        AP 25664 | FEP 21222 | T VALOR: 7.812.529 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'SXF257','25664','9604 MERCA/HOGAR F','MONTENEGRO PTAPAO','JOSE ALEXANDER CONSTAIN PERLAZA',1,
       1,0,'-',
       7812529,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1),
       55,'21222 AP809051 AP809052','TYM'
FROM vehiculos v WHERE v.placa='SXF257' AND v.razon_social='TYM' LIMIT 1;

/* 14 – WLS478 – TEBAIDA, 1 aux
        AP 25645 | FEP 21223 | T VALOR: 5.657.285 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'WLS478','25645','9605 F','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
       1,0,'-',
       5657285,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1),
       40,'21223','TYM'
FROM vehiculos v WHERE v.placa='WLS478' AND v.razon_social='TYM' LIMIT 1;

/* 15 – WHM896 – CIRCASIA, 1 aux
        AP 25646 | T VALOR: 4.442.054 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'WHM896','25646','9606','CIRCASIA','JHON WILSON GIRALDO CARVAJAL',1,
       1,0,'-',
       4442054,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1),
       48,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WHM896' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

/* 16 – TUL630 – PEREIRA-DOSQUEBRADAS, VALOR DE FLETE $320.000, 0 pedidos
        ⚠️ E7000 + pedidos POSTOBON — precio fijo, $0 valor ruta | AP 25651-4993 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'TUL630','25651-4993','E7000+PEDIDOS POSTOBON','PEREIRA - DOSQUEBRADAS',NULL,0,
       1,0,'VALOR DE FLETE $320.000',
       0,320000,
       0,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TUL630' AND v.razon_social='TYM' LIMIT 1;

/* 17 – VZD334 – PEREIRA-DOSQUEBRADAS, 1 aux
        AP 25653 | T VALOR: 8.231.495 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'VZD334','25653','9454','PEREIRA - DOSQUEBRADAS','JUAN RICO',1,
       1,0,'-',
       8231495,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       40,NULL,'TYM'
FROM vehiculos v WHERE v.placa='VZD334' AND v.razon_social='TYM' LIMIT 1;

/* 18 – WHN317 – PEREIRA-DOSQUEBRADAS, 1 aux
        AP 25654 | T VALOR: 7.417.252 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'WHN317','25654','9455','PEREIRA - DOSQUEBRADAS','JHON FREDY MORENO',1,
       1,0,'-',
       7417252,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       63,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WHN317' AND v.razon_social='TYM' LIMIT 1;

/* 19 – SPQ814 – SANTA ROSA, 1 aux
        AP 25655 | T VALOR: 6.801.245 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'SPQ814','25655','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
       1,0,'-',
       6801245,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1),
       57,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SPQ814' AND v.razon_social='TYM' LIMIT 1;

/* 20 – EQN953 – PEREIRA-DOSQUEBRADAS, 1 aux
        AP 25656 | T VALOR: 9.739.091 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'EQN953','25656','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
       1,0,'-',
       9739091,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       54,NULL,'TYM'
FROM vehiculos v WHERE v.placa='EQN953' AND v.razon_social='TYM' LIMIT 1;

/* 21 – PEK019 – PEREIRA-DOSQUEBRADAS, 1 aux
        AP 25657 | T VALOR: 8.317.293 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'PEK019','25657','9458','PEREIRA - DOSQUEBRADAS','CRISTIAN GIRALDO',1,
       1,0,'-',
       8317293,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       51,NULL,'TYM'
FROM vehiculos v WHERE v.placa='PEK019' AND v.razon_social='TYM' LIMIT 1;

/* 22 – SMO183 – PEREIRA-DOSQUEBRADAS, 2 aux
        AP 25658 | T VALOR: 8.541.742 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'SMO183','25658','9459','PEREIRA - DOSQUEBRADAS','PABLO RAMIREZ, EDWAR GIL',2,
       1,0,'-',
       8541742,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       57,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SMO183' AND v.razon_social='TYM' LIMIT 1;

/* 23 – WLC133 – PEREIRA-DOSQUEBRADAS, 2 aux
        AP 25659 | T VALOR: 11.702.975 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'WLC133','25659','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, MARLON MURILLO',2,
       1,0,'-',
       11702975,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       70,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WLC133' AND v.razon_social='TYM' LIMIT 1;

/* 24 – TNH494 – CARTAGO, 1 aux, fac AP807709
        AP 25660 | T VALOR: 8.849.451 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'TNH494','25660','9461 PETROCHELY','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
       1,0,'-',
       8849451,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1),
       63,'AP807709','TYM'
FROM vehiculos v WHERE v.placa='TNH494' AND v.razon_social='TYM' LIMIT 1;

/* 25 – LUM993 – PEREIRA-DOSQUEBRADAS, 1 aux
        AP 25665 | T VALOR: 7.701.445 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'LUM993','25665','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
       1,0,'-',
       7701445,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       47,NULL,'TYM'
FROM vehiculos v WHERE v.placa='LUM993' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA OCCIDENTE ───────────────────────────────────────── */

/* 26 – WTN748 – ARGELIA EL CAIRO, 1 aux, VALOR DE FLETE $480.000
        ⚠️ precio fijo $480.000 | AP 25666 | T VALOR: 10.392.462 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'WTN748','25666','7005 F','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO',1,
       1,0,'VALOR DE FLETE $480.000',
       10392462,480000,
       29,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WTN748' AND v.razon_social='TYM' LIMIT 1;

/* 27 – ERK303 – SANTUARIO, 2 aux, fac AP807701 AP807702
        AP 25647 | FEP 21226 21225 | T VALOR: 15.289.917 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'ERK303','25647','7006 F','SANTUARIO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
       1,0,'-',
       15289917,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1),
       46,'21226 21225 AP807701 AP807702','TYM'
FROM vehiculos v WHERE v.placa='ERK303' AND v.razon_social='TYM' LIMIT 1;

/* 28 – JVM223 – BELEN DE UMBRIA, 2 aux
        AP 25632 25648 | T VALOR: 13.850.686 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','ALPINA',v.conductor,'JVM223','25632 25648','7007 9451 F','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, JAIDER MARTINEZ',2,
       1,0,'-',
       13850686,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1),
       47,NULL,'TYM'
FROM vehiculos v WHERE v.placa='JVM223' AND v.razon_social='TYM' LIMIT 1;

/* ── FLEISCHMANN ──────────────────────────────────────────── */

/* 29 – SQB119 – FLEISCHMANN ARMENIA
        FEP 21233 | T VALOR: 3.826.866 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','FLEISCHMANN',v.conductor,'SQB119',NULL,'FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
       1,0,'-',
       3826866,
       (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       39,'21233','TYM'
FROM vehiculos v WHERE v.placa='SQB119' AND v.razon_social='TYM' LIMIT 1;

/* 30 – TRF860 – FLEISCHMANN CARTAGO 2T
        FEP 21230 21227 21219 | T VALOR: 6.060.730 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-18','Miércoles','FLEISCHMANN',v.conductor,'TRF860',NULL,'FLEISCHMANN','CARTAGO','JULIAN RODRIGUEZ',1,
       1,0,'-',
       6060730,
       (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='CARTAGO' LIMIT 1),
       39,'21230 21227 21219','TYM'
FROM vehiculos v WHERE v.placa='TRF860' AND v.razon_social='TYM' LIMIT 1;

/* -------------------------------------------------
   3️⃣  Verificación
   ------------------------------------------------- */
SELECT '✅ INSERTADO' AS estado, placa, contratista AS conductor_bd,
       zona, poblacion, valor_ruta, precio, no_pedidos, proveedor
FROM fletes
WHERE fecha = '2026-11-18'
  AND proveedor IN ('ALPINA','FLEISCHMANN')

UNION ALL

SELECT '❌ OMITIDO — placa no existe en vehiculos' AS estado,
       placa_programada AS placa, NULL, NULL, NULL, NULL, NULL, NULL, NULL
FROM (VALUES
  ('SYU652'),('WFR160'),('EYX091'),('SPU120'),('TRK507'),
  ('WEP384'),('WGZ876'),('MAT480'),('WFV015'),
  ('TJX795'),('TTL256'),('EQY944'),('SXF257'),('WLS478'),('WHM896'),
  ('TUL630'),('VZD334'),('WHN317'),('SPQ814'),('EQN953'),('PEK019'),
  ('SMO183'),('WLC133'),('TNH494'),('LUM993'),
  ('WTN748'),('ERK303'),('JVM223'),
  ('SQB119'),('TRF860')
) AS prog(placa_programada)
WHERE NOT EXISTS (
  SELECT 1 FROM fletes f
  WHERE f.placa = prog.placa_programada
    AND f.fecha = '2026-11-18'
    AND f.proveedor IN ('ALPINA','FLEISCHMANN')
)

ORDER BY estado DESC, placa;
