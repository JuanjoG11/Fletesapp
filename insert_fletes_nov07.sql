/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: SÁBADO 7 NOVIEMBRE 2026
   Generado: 2026-11-07

   ✅ REGLAS DE SEGURIDAD:
     - contratista  = vehiculos.conductor (nombre real en BD)
     - valor_ruta   = T VALOR de la programación (total facturado AP+FEP)
     - precio       = precio base de la ruta según tabla precios_fletes
                      (o valor fijo cuando dice "VALOR DE FLETE $X")
     - Cada fila solo se inserta si la placa existe en vehiculos

   Notas:
     - SYU652   EXTRA $60.000 (AP 25369TSS 25412 25435 + FEP 21117) fac FEP1199301
     - WFR160   ADICIONAL $200.000 ENTREGA SUPER Y EXTRA, 2 planillas FEP (AP 25413 25409 + FEP 21118 21122)
     - EYX091   2 aux (AP 25414 + FEP 21119)
     - SPU120   2 aux, fac FEP1199294 FEP1199298 (AP 25415 25408 + FEP 21123)
     - TRK507   fac AP799659 (AP 25416 + FEP 21121)
     - WEP384   2 aux, Quinchía (AP 25374TSS 25417 + FEP 21096)
     - MAT480   2 aux, fac AP799658 (AP 25440 25419)
     - WFV015   2 aux, fac AP799664 (AP 25436)
     - TJX795   2 aux (AP 25437 + FEP 21116)
     - EQN953   VALOR DE FLETE $450.000, 2 aux, fac AP799663 (AP 25438)
     - SXF257   TSS (AP 25400TSS 25439 + FEP 21112)
     - WLS478   Génova (AP 25420)
     - WHM896   VALOR DE FLETE $450.000 EXTRARUTAS (AP 25421)
     - WGZ976   VALOR DE FLETE $350.000 Pereira-Dos (AP 25426 25394TSS)
     - SMO183   (AP 25427)
     - VZD334   (AP 25428)
     - TMZ674   (AP 25429)
     - SPQ814   (AP 25430)
     - WHN317   (AP 25431)
     - PEK019   (AP 25432)
     - TTL256   fac FEFA13596 (AP 25393)
     - EQY944   (AP 25433)
     - WLC133   2 aux (AP 25434)
     - TNH494   (AP 25407)
     - LUM993   2 aux (AP 25441)
     - WTN748   El Aguila Villa Nueva (AP 25442)
     - ERK303   (AP 25422 + FEP 21113)
     - JVM223   2 aux, Guática Anserma (AP 25423 + FEP 21114)
     - SQB119   FLEISCHMANN S/ROSA-D/BRADAS (FEP 21115)
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
  ('WEP384'),('MAT480'),('WFV015'),('TJX795'),('EQN953'),
  ('SXF257'),('WLS478'),('WHM896'),('WGZ976'),('SMO183'),
  ('VZD334'),('TMZ674'),('SPQ814'),('WHN317'),('PEK019'),
  ('TTL256'),('EQY944'),('WLC133'),('TNH494'),('LUM993'),
  ('WTN748'),('ERK303'),('JVM223'),('SQB119')
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
WHERE fecha = '2026-11-07'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 07‑Nov‑2026
        valor_ruta = T VALOR de la programación
        precio     = precio de lista (precios_fletes)
                     o valor fijo cuando aplica
   ------------------------------------------------- */

/* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

/* 01 – SYU652 – EXTRA $60.000, fac FEP1199301, FEP 21117  |  T VALOR: 12.449.355 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'SYU652','25369TSS 25412 25435','9552 9550 F','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
       1,60000,'EXTRA $60.000',
       12449355,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       45,'21117 FEP1199301','TYM'
FROM vehiculos v WHERE v.placa='SYU652' AND v.razon_social='TYM' LIMIT 1;

/* 02 – WFR160 – ADICIONAL $200.000 ENTREGA SUPER Y EXTRA, FEP 21118 21122  |  T VALOR: 18.875.773 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'WFR160','25413 25409','9553 7001 F','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
       1,200000,'ADICIONAL AL FLETE $200.000 ENTREGA DE SUPER Y EXTRA',
       18875773,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       54,'21118 21122','TYM'
FROM vehiculos v WHERE v.placa='WFR160' AND v.razon_social='TYM' LIMIT 1;

/* 03 – EYX091 – 2 aux, FEP 21119  |  T VALOR: 8.416.988 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'EYX091','25414','9554 F','MANIZALES VILLAMARIA','JHONNY LOPEZ, ANDRES GOMEZ',2,
       1,0,'-',
       8416988,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       52,'21119','TYM'
FROM vehiculos v WHERE v.placa='EYX091' AND v.razon_social='TYM' LIMIT 1;

/* 04 – SPU120 – 2 aux, fac FEP1199294 FEP1199298, FEP 21123  |  T VALOR: 14.300.993 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'SPU120','25415 25408','9555 7000 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN, ELKIN GARCIA OCAMPO',2,
       1,0,'-',
       14300993,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       48,'21123 FEP1199294 FEP1199298','TYM'
FROM vehiculos v WHERE v.placa='SPU120' AND v.razon_social='TYM' LIMIT 1;

/* 05 – TRK507 – fac AP799659, FEP 21121  |  T VALOR: 11.051.333 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'TRK507','25416','9556 RECREACION F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
       1,0,'-',
       11051333,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       47,'21121 AP799659','TYM'
FROM vehiculos v WHERE v.placa='TRK507' AND v.razon_social='TYM' LIMIT 1;

/* 06 – WEP384 – 2 aux, Quinchía, FEP 21096  |  T VALOR: 14.072.803 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'WEP384','25374TSS 25417','9557 9559 F','QUINCHIA','JUAN MANUEL DELGADO NARVAEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
       1,0,'-',
       14072803,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUINCHIA' LIMIT 1),
       51,'21096','TYM'
FROM vehiculos v WHERE v.placa='WEP384' AND v.razon_social='TYM' LIMIT 1;

/* 07 – MAT480 – 2 aux, Chinchiná, fac AP799658  |  T VALOR: 7.040.062 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'MAT480','25440 25419','9559 7002 GAMERO','CHINCHINA','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
       1,0,'-',
       7040062,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1),
       81,'AP799658','TYM'
FROM vehiculos v WHERE v.placa='MAT480' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA ARMENIA / EJE ───────────────────────────────────── */

/* 08 – WFV015 – 2 aux, fac AP799664  |  T VALOR: 7.660.433 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'WFV015','25436','9601 PATRIA','ARMENIA','YEISON DAVID RENDON SOTO, JUAN RICO',2,
       1,0,'-',
       7660433,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       61,'AP799664','TYM'
FROM vehiculos v WHERE v.placa='WFV015' AND v.razon_social='TYM' LIMIT 1;

/* 09 – TJX795 – 2 aux, FEP 21116  |  T VALOR: 14.891.271 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'TJX795','25437','9602 F','ARMENIA','YERFREY FLOWER, CRISTIAN GIRALDO',2,
       1,0,'-',
       14891271,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       61,'21116','TYM'
FROM vehiculos v WHERE v.placa='TJX795' AND v.razon_social='TYM' LIMIT 1;

/* 10 – EQN953 – VALOR DE FLETE $450.000, 2 aux, fac AP799663  |  T VALOR: 9.465.218 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'EQN953','25438','9603 HOREB','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, JHON FREDY MORENO',2,
       1,0,'VALOR DE FLETE $450.000',
       9465218,450000,
       56,'AP799663','TYM'
FROM vehiculos v WHERE v.placa='EQN953' AND v.razon_social='TYM' LIMIT 1;

/* 11 – SXF257 – TSS, FEP 21112  |  T VALOR: 4.223.850 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'SXF257','25400TSS 25439','9604 F','QUIMBAYA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
       1,0,'-',
       4223850,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1),
       48,'21112','TYM'
FROM vehiculos v WHERE v.placa='SXF257' AND v.razon_social='TYM' LIMIT 1;

/* 12 – WLS478 – Génova  |  T VALOR: 5.597.129 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'WLS478','25420','9605','GENOVA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
       1,0,'-',
       5597129,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GENOVA' LIMIT 1),
       37,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WLS478' AND v.razon_social='TYM' LIMIT 1;

/* 13 – WHM896 – VALOR DE FLETE $450.000 EXTRARUTAS  |  T VALOR: 7.063.639 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'WHM896','25421','9606','CAIMO BARCELONA','JHON WILSON GIRALDO CARVAJAL',1,
       1,0,'VALOR DE FLETE $450.000 EXTRARUTAS',
       7063639,450000,
       44,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WHM896' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

/* 14 – WGZ976 – VALOR DE FLETE $350.000, Pereira-Dos TSS  |  T VALOR: 1.648.595 */
/* ⚠️ WGZ976 placa nueva — precio fijo $350.000 según observación */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'WGZ976','25426 25394TSS','E7001 9460TSS','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES',1,
       1,0,'VALOR DE FLETE $350.000 ENTREGA EN CERRITOS, ENTREGA DE ZENU Y ALPINA EN MERCASA Y ENTREGA DE 18 CLIENTES DE LA 9460 DE AYER',
       1648595,350000,
       20,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WGZ976' AND v.razon_social='TYM' LIMIT 1;

/* 15 – SMO183 – sin adicional  |  T VALOR: 7.230.310 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'SMO183','25427','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
       1,0,'-',
       7230310,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       53,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SMO183' AND v.razon_social='TYM' LIMIT 1;

/* 16 – VZD334 – sin adicional  |  T VALOR: 6.743.056 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'VZD334','25428','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
       1,0,'-',
       6743056,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       43,NULL,'TYM'
FROM vehiculos v WHERE v.placa='VZD334' AND v.razon_social='TYM' LIMIT 1;

/* 17 – TMZ674 – sin adicional  |  T VALOR: 6.308.686 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'TMZ674','25429','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
       1,0,'-',
       6308686,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       56,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TMZ674' AND v.razon_social='TYM' LIMIT 1;

/* 18 – SPQ814 – sin adicional  |  T VALOR: 6.773.600 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'SPQ814','25430','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
       1,0,'-',
       6773600,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1),
       61,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SPQ814' AND v.razon_social='TYM' LIMIT 1;

/* 19 – WHN317 – sin adicional  |  T VALOR: 7.210.877 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'WHN317','25431','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
       1,0,'-',
       7210877,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       56,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WHN317' AND v.razon_social='TYM' LIMIT 1;

/* 20 – PEK019 – sin adicional  |  T VALOR: 6.038.571 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'PEK019','25432','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
       1,0,'-',
       6038571,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       46,NULL,'TYM'
FROM vehiculos v WHERE v.placa='PEK019' AND v.razon_social='TYM' LIMIT 1;

/* 21 – TTL256 – fac FEFA13596  |  T VALOR: 5.841.904 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'TTL256','25393','9459','PEREIRA - DOSQUEBRADAS','PABLO RAMIREZ',1,
       1,0,'-',
       5841904,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       49,'FEFA13596','TYM'
FROM vehiculos v WHERE v.placa='TTL256' AND v.razon_social='TYM' LIMIT 1;

/* 22 – EQY944 – sin adicional  |  T VALOR: 7.249.902 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'EQY944','25433','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
       1,0,'-',
       7249902,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       55,NULL,'TYM'
FROM vehiculos v WHERE v.placa='EQY944' AND v.razon_social='TYM' LIMIT 1;

/* 23 – WLC133 – 2 aux  |  T VALOR: 6.763.049 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'WLC133','25434','9460','PEREIRA - DOSQUEBRADAS','MARLON MURILLO, MANUEL RAMIREZ',2,
       1,0,'-',
       6763049,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       61,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WLC133' AND v.razon_social='TYM' LIMIT 1;

/* 24 – TNH494 – sin adicional  |  T VALOR: 7.672.105 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'TNH494','25407','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
       1,0,'-',
       7672105,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1),
       51,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TNH494' AND v.razon_social='TYM' LIMIT 1;

/* 25 – LUM993 – 2 aux  |  T VALOR: 7.778.494 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'LUM993','25441','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, SAMUEL ARIAS',2,
       1,0,'-',
       7778494,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       61,NULL,'TYM'
FROM vehiculos v WHERE v.placa='LUM993' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA OCCIDENTE ───────────────────────────────────────── */

/* 26 – WTN748 – El Aguila Villa Nueva  |  T VALOR: 5.862.257 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'WTN748','25442','7005','EL AGUILA VILLA NUEVA','ARBEY DE JESUS LARGO LARGO',1,
       1,0,'-',
       5862257,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='EL AGUILA VILLA NUEVA' LIMIT 1),
       22,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WTN748' AND v.razon_social='TYM' LIMIT 1;

/* 27 – ERK303 – FEP 21113  |  T VALOR: 8.518.950 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'ERK303','25422','7006 F','PUEBLO RICO','ROVINSON TORRES RIVERA',1,
       1,0,'-',
       8518950,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PUEBLO RICO' LIMIT 1),
       34,'21113','TYM'
FROM vehiculos v WHERE v.placa='ERK303' AND v.razon_social='TYM' LIMIT 1;

/* 28 – JVM223 – 2 aux, Guática Anserma, FEP 21114  |  T VALOR: 10.200.463 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','ALPINA',v.conductor,'JVM223','25423','7007 F','GUATICA ANSERMA','LUIS CARLOS CADAVID RESTREPO, EDWAR GIL',2,
       1,0,'-',
       10200463,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GUATICA ANSERMA' LIMIT 1),
       62,'21114','TYM'
FROM vehiculos v WHERE v.placa='JVM223' AND v.razon_social='TYM' LIMIT 1;

/* ── FLEISCHMANN ──────────────────────────────────────────── */

/* 29 – SQB119 – FLEISCHMANN S/ROSA-D/BRADAS, FEP 21115  |  T VALOR: 5.199.514 */
/* población = SANTA ROSA - DOSQUEBRADAS, precio tabla SANTA ROSA (patrón oct-17, ago-22, ago-29) */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-07','Sábado','FLEISCHMANN',v.conductor,'SQB119',NULL,'FLEISCHMANN','SANTA ROSA - DOSQUEBRADAS','DIEGO FRANCO',1,
       1,0,'-',
       5199514,
       (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1),
       44,'21115','TYM'
FROM vehiculos v WHERE v.placa='SQB119' AND v.razon_social='TYM' LIMIT 1;

/* -------------------------------------------------
   3️⃣  Verificación — fletes insertados vs programados
   ------------------------------------------------- */

-- ✅ Fletes que SÍ quedaron en la base de datos
SELECT '✅ INSERTADO' AS estado, placa, contratista AS conductor_bd,
       zona, poblacion, valor_ruta, precio, no_pedidos, proveedor
FROM fletes
WHERE fecha = '2026-11-07'
  AND proveedor IN ('ALPINA','FLEISCHMANN')

UNION ALL

-- ❌ Placas programadas que NO quedaron (placa no existe en vehiculos)
SELECT '❌ OMITIDO — placa no existe en vehiculos' AS estado,
       placa_programada AS placa, NULL, NULL, NULL, NULL, NULL, NULL, NULL
FROM (VALUES
  ('SYU652'),('WFR160'),('EYX091'),('SPU120'),('TRK507'),
  ('WEP384'),('MAT480'),('WFV015'),('TJX795'),('EQN953'),
  ('SXF257'),('WLS478'),('WHM896'),('WGZ976'),('SMO183'),
  ('VZD334'),('TMZ674'),('SPQ814'),('WHN317'),('PEK019'),
  ('TTL256'),('EQY944'),('WLC133'),('TNH494'),('LUM993'),
  ('WTN748'),('ERK303'),('JVM223'),('SQB119')
) AS prog(placa_programada)
WHERE NOT EXISTS (
  SELECT 1 FROM fletes f
  WHERE f.placa = prog.placa_programada
    AND f.fecha = '2026-11-07'
    AND f.proveedor IN ('ALPINA','FLEISCHMANN')
)

ORDER BY estado DESC, placa;
