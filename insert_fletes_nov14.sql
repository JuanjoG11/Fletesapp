/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: SÁBADO 14 NOVIEMBRE 2026
   Generado: 2026-11-14

   ✅ REGLAS:
     - contratista  = vehiculos.conductor (nombre real en BD)
     - valor_ruta   = T VALOR de la programación (total AP+FEP)
     - precio       = precio_tabla + adicional  (EXTRA / ADICIONAL)
                      o valor fijo cuando dice "VALOR DE FLETE $X"
     - valor_adicional_negociacion = monto del adicional (trazabilidad)

   Notas:
     - SYU652   ADICIONAL $60.000 ENTREGA SUPER VILLAMARIA, fac FEP1199959 AP807697 (AP 25597 + FEP 21203 21210)
     - WFR160   ADICIONAL $200.000 ENTREGA SUPER, 2 aux, fac AP807698 AP806369 (AP 25598 + FEP 21209 21214)
     - EYX091   fac FEP1199971 (AP 25599 + FEP 21211)
     - SPU120   TSS, fac FEP1199972 (AP 25524TSS 25600 + FEP 21204 21212)
     - TRK507   $60.000 EXTRA SÁBADOS FUNDACION, fac AP806662 AP806664 (AP 25601 + FEP 21213)
     - WEP384   2 aux, Quinchía (AP 25602 25612 + FEP 21189)
     - MAT480   2 aux, fac AP806663 AP806665 (AP 25604)
     - TJX795   TSS, fac AP806375 (AP 25586TSS 25622)
     - TTL256   2 aux (AP 25623 + FEP 21208)
     - EQY944   fac AP806374 (AP 25624)
     - SXF257   ADICIONAL $300.000 ENTREGA SUPER EXTRARUTA, 2 aux (AP 25625 25594 25595 + FEP 21200)
     - WLS478   Génova (AP 25605)
     - WHM896   Caimo Barcelona (AP 25606)
     - EQN953   VALOR DE FLETE $260.000, TSS/ZENU, 0 pedidos (AP 25584TSS)
     - SMO183   (AP 25613)
     - VZD334   (AP 25614)
     - TMZ674   (AP 25615)
     - SPQ814   (AP 25616)
     - WHN317   (AP 25617)
     - PEK019   (AP 25618)
     - WFV015   EXTRA $60.000, Pereira-Dos TSS (AP 25583TSS 25619)
     - WLC133   2 aux (AP 25620)
     - TNH494   (AP 25621)
     - LUM993   2 aux (AP 25626 + FEP 21198)
     - WTN748   ADICIONAL $100.000 ENTREGA FLEISCHMANN EXTRARUTA (AP 25627 + FEP 21205)
     - ERK303   2 aux, Santa Cecilia (AP 25607 + FEP 21201)
     - JVM223   2 aux, Guática Anserma (AP 25608 + FEP 21206)
     - SQB119   FLEISCHMANN S/ROSA-D/BRADAS (FEP 21216)
   ========================================================== */

/* -------------------------------------------------
   0️⃣  DIAGNÓSTICO PREVIO
   ------------------------------------------------- */
SELECT placa_programada, 'NO EXISTE EN vehiculos — flete se OMITIRÁ' AS alerta
FROM (VALUES
  ('SYU652'),('WFR160'),('EYX091'),('SPU120'),('TRK507'),
  ('WEP384'),('MAT480'),('TJX795'),('TTL256'),('EQY944'),
  ('SXF257'),('WLS478'),('WHM896'),('EQN953'),('SMO183'),
  ('VZD334'),('TMZ674'),('SPQ814'),('WHN317'),('PEK019'),
  ('WFV015'),('WLC133'),('TNH494'),('LUM993'),('WTN748'),
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
WHERE fecha = '2026-11-14'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 14‑Nov‑2026
   ------------------------------------------------- */

/* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

/* 01 – SYU652 – ADICIONAL $60.000 ENTREGA SUPER VILLAMARIA, precio = tabla + 60.000
        fac FEP1199959 AP807697  |  T VALOR: 8.390.287 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'SYU652','25597','9552 PARQUE F','MANIZALES VILLAMARIA','MANUEL RAMIREZ',1,
       1,60000,'ADICIONAL $60.000 ENTREGA DE SUPER EN VILLAMARIA',
       8390287,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
       52,'21203 21210 FEP1199959 AP807697','TYM'
FROM vehiculos v WHERE v.placa='SYU652' AND v.razon_social='TYM' LIMIT 1;

/* 02 – WFR160 – ADICIONAL $200.000 ENTREGA SUPER, 2 aux, precio = tabla + 200.000
        fac AP807698 AP806369  |  T VALOR: 22.897.131 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'WFR160','25598','9553 DELCAMPO/FLORIDA F','MANIZALES VILLAMARIA','CARLOS JIMENEZ, CESAR CASTILLO LONDOÑO',2,
       1,200000,'ADICIONAL AL FLETE $200.000 ENTREGA DE SUPER',
       22897131,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 200000,
       54,'21209 21214 AP807698 AP806369','TYM'
FROM vehiculos v WHERE v.placa='WFR160' AND v.razon_social='TYM' LIMIT 1;

/* 03 – EYX091 – fac FEP1199971, FEP 21211  |  T VALOR: 8.659.377 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'EYX091','25599','9554 F','MANIZALES VILLAMARIA','JHONNY LOPEZ',1,
       1,0,'-',
       8659377,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       54,'21211 FEP1199971','TYM'
FROM vehiculos v WHERE v.placa='EYX091' AND v.razon_social='TYM' LIMIT 1;

/* 04 – SPU120 – TSS, fac FEP1199972, FEP 21204 21212  |  T VALOR: 5.974.820 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'SPU120','25524TSS 25600','9555 F TSS','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
       1,0,'-',
       5974820,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),
       50,'21204 21212 FEP1199972','TYM'
FROM vehiculos v WHERE v.placa='SPU120' AND v.razon_social='TYM' LIMIT 1;

/* 05 – TRK507 – $60.000 EXTRA SÁBADOS FUNDACION, precio = tabla + 60.000
        fac AP806662 AP806664, FEP 21213  |  T VALOR: 9.685.467 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'TRK507','25601','9556 RECREACION F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
       1,60000,'$60.000 EXTRA DE LOS DIAS SABADOS POR LA FUNDACION',
       9685467,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
       46,'21213 AP806662 AP806664','TYM'
FROM vehiculos v WHERE v.placa='TRK507' AND v.razon_social='TYM' LIMIT 1;

/* 06 – WEP384 – 2 aux, Quinchía, FEP 21189  |  T VALOR: 10.573.155 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'WEP384','25602 25612','9557 9559 F','QUINCHIA','JUAN MANUEL DELGADO NARVAEZ, ABRAHAM RIOS',2,
       1,0,'-',
       10573155,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUINCHIA' LIMIT 1),
       44,'21189','TYM'
FROM vehiculos v WHERE v.placa='WEP384' AND v.razon_social='TYM' LIMIT 1;

/* 07 – MAT480 – 2 aux, Chinchiná, fac AP806663 AP806665  |  T VALOR: 6.624.701 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'MAT480','25604','9559 GAMERO','CHINCHINA','BRANDON STEVEN GIL BAEZ, JAIDER MARTINEZ',2,
       1,0,'-',
       6624701,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1),
       76,'AP806663 AP806665','TYM'
FROM vehiculos v WHERE v.placa='MAT480' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA ARMENIA / EJE ───────────────────────────────────── */

/* 08 – TJX795 – TSS, fac AP806375  |  T VALOR: 5.917.993 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'TJX795','25586TSS 25622','9601 PATRIA TSS','ARMENIA','YEISON DAVID RENDON SOTO',1,
       1,0,'-',
       5917993,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       48,'AP806375','TYM'
FROM vehiculos v WHERE v.placa='TJX795' AND v.razon_social='TYM' LIMIT 1;

/* 09 – TTL256 – 2 aux, FEP 21208  |  T VALOR: 9.035.218 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'TTL256','25623','9602 F','ARMENIA','YERFREY FLOWER, EDWAR GIL',2,
       1,0,'-',
       9035218,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       65,'21208','TYM'
FROM vehiculos v WHERE v.placa='TTL256' AND v.razon_social='TYM' LIMIT 1;

/* 10 – EQY944 – fac AP806374  |  T VALOR: 9.083.643 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'EQY944','25624','9603 HOREB','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, JHON FREDY MORENO',2,
       1,0,'-',
       9083643,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),
       51,'AP806374','TYM'
FROM vehiculos v WHERE v.placa='EQY944' AND v.razon_social='TYM' LIMIT 1;

/* 11 – SXF257 – ADICIONAL $300.000 ENTREGA SUPER EXTRARUTA, 2 aux, precio = tabla + 300.000
        FEP 21200  |  T VALOR: 10.844.724 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'SXF257','25625 25594 25595','9604 7008 7009 F','QUIMBAYA','JOSE ALEXANDER CONSTAIN PERLAZA, CRISTIAN GIRALDO',2,
       1,300000,'ADICIONAL AL FLETE $300.000 ENTREGA DE SUPER EXTRARUTA',
       10844724,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 300000,
       41,'21200','TYM'
FROM vehiculos v WHERE v.placa='SXF257' AND v.razon_social='TYM' LIMIT 1;

/* 12 – WLS478 – Génova  |  T VALOR: 5.286.995 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'WLS478','25605','9605','GENOVA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
       1,0,'-',
       5286995,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GENOVA' LIMIT 1),
       33,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WLS478' AND v.razon_social='TYM' LIMIT 1;

/* 13 – WHM896 – Caimo Barcelona  |  T VALOR: 8.542.718 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'WHM896','25606','9606','CAIMO BARCELONA','JHON WILSON GIRALDO CARVAJAL',1,
       1,0,'-',
       8542718,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAIMO BARCELONA' LIMIT 1),
       49,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WHM896' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

/* 14 – EQN953 – VALOR DE FLETE $260.000, TSS/ZENU, 0 pedidos, $0 valor ruta  */
/* ⚠️ 0 pedidos y $0 T valor — se registra solo el flete como precio fijo */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'EQN953','25584TSS','9460TSS / ZENU','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, CRISTIAN MENDOZA ZENU',2,
       1,0,'VALOR DE FLETE $260.000',
       0,260000,
       0,NULL,'TYM'
FROM vehiculos v WHERE v.placa='EQN953' AND v.razon_social='TYM' LIMIT 1;

/* 15 – SMO183 – sin adicional  |  T VALOR: 7.187.389 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'SMO183','25613','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
       1,0,'-',
       7187389,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       50,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SMO183' AND v.razon_social='TYM' LIMIT 1;

/* 16 – VZD334 – sin adicional  |  T VALOR: 7.011.164 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'VZD334','25614','9454','PEREIRA - DOSQUEBRADAS','JUAN RICO',1,
       1,0,'-',
       7011164,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       45,NULL,'TYM'
FROM vehiculos v WHERE v.placa='VZD334' AND v.razon_social='TYM' LIMIT 1;

/* 17 – TMZ674 – sin adicional  |  T VALOR: 6.226.002 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'TMZ674','25615','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
       1,0,'-',
       6226002,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       54,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TMZ674' AND v.razon_social='TYM' LIMIT 1;

/* 18 – SPQ814 – sin adicional  |  T VALOR: 5.045.177 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'SPQ814','25616','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
       1,0,'-',
       5045177,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1),
       53,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SPQ814' AND v.razon_social='TYM' LIMIT 1;

/* 19 – WHN317 – sin adicional  |  T VALOR: 7.822.334 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'WHN317','25617','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
       1,0,'-',
       7822334,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       53,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WHN317' AND v.razon_social='TYM' LIMIT 1;

/* 20 – PEK019 – sin adicional  |  T VALOR: 6.035.410 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'PEK019','25618','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
       1,0,'-',
       6035410,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       47,NULL,'TYM'
FROM vehiculos v WHERE v.placa='PEK019' AND v.razon_social='TYM' LIMIT 1;

/* 21 – WFV015 – EXTRA $60.000, Pereira-Dos TSS, precio = tabla + 60.000  |  T VALOR: 6.784.974 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'WFV015','25583TSS 25619','9459 TSS','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
       1,60000,'EXTRA $60.000',
       6784974,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
       57,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WFV015' AND v.razon_social='TYM' LIMIT 1;

/* 22 – WLC133 – 2 aux  |  T VALOR: 6.316.952 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'WLC133','25620','9460','PEREIRA - DOSQUEBRADAS','MARLON MURILLO, JOHN UTIMA',2,
       1,0,'-',
       6316952,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       53,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WLC133' AND v.razon_social='TYM' LIMIT 1;

/* 23 – TNH494 – sin adicional  |  T VALOR: 5.967.827 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'TNH494','25621','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
       1,0,'-',
       5967827,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1),
       51,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TNH494' AND v.razon_social='TYM' LIMIT 1;

/* 24 – LUM993 – 2 aux, FEP 21198  |  T VALOR: 8.049.646 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'LUM993','25626','7004 F','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, SAMUEL ARIAS',2,
       1,0,'-',
       8049646,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       59,'21198','TYM'
FROM vehiculos v WHERE v.placa='LUM993' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA OCCIDENTE ───────────────────────────────────────── */

/* 25 – WTN748 – ADICIONAL $100.000 ENTREGA FLEISCHMANN EXTRARUTA, precio = tabla + 100.000
        FEP 21205  |  T VALOR: 10.015.347 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'WTN748','25627','7005 F','EL AGUILA VILLA NUEVA','ARBEY DE JESUS LARGO LARGO',1,
       1,100000,'ADICIONAL $100.000 ENTREGA FLEISCHMANN EXTRARUTA',
       10015347,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='EL AGUILA VILLA NUEVA' LIMIT 1) + 100000,
       28,'21205','TYM'
FROM vehiculos v WHERE v.placa='WTN748' AND v.razon_social='TYM' LIMIT 1;

/* 26 – ERK303 – 2 aux, Santa Cecilia, FEP 21201  |  T VALOR: 13.446.794 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'ERK303','25607','7006 F','SANTA CECILIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
       1,0,'-',
       13446794,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA CECILIA' LIMIT 1),
       49,'21201','TYM'
FROM vehiculos v WHERE v.placa='ERK303' AND v.razon_social='TYM' LIMIT 1;

/* 27 – JVM223 – 2 aux, Guática Anserma, FEP 21206  |  T VALOR: 10.918.674 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','ALPINA',v.conductor,'JVM223','25608','7007 F','GUATICA ANSERMA','LUIS CARLOS CADAVID RESTREPO, PABLO RAMIREZ',2,
       1,0,'-',
       10918674,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GUATICA ANSERMA' LIMIT 1),
       61,'21206','TYM'
FROM vehiculos v WHERE v.placa='JVM223' AND v.razon_social='TYM' LIMIT 1;

/* ── FLEISCHMANN ──────────────────────────────────────────── */

/* 28 – SQB119 – FLEISCHMANN S/ROSA-D/BRADAS, FEP 21216  |  T VALOR: 5.005.737 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-14','Sábado','FLEISCHMANN',v.conductor,'SQB119',NULL,'FLEISCHMANN','SANTA ROSA - DOSQUEBRADAS','DIEGO FRANCO',1,
       1,0,'-',
       5005737,
       (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1),
       52,'21216','TYM'
FROM vehiculos v WHERE v.placa='SQB119' AND v.razon_social='TYM' LIMIT 1;

/* -------------------------------------------------
   3️⃣  Verificación
   ------------------------------------------------- */
SELECT '✅ INSERTADO' AS estado, placa, contratista AS conductor_bd,
       zona, poblacion, valor_ruta, precio, no_pedidos, proveedor
FROM fletes
WHERE fecha = '2026-11-14'
  AND proveedor IN ('ALPINA','FLEISCHMANN')

UNION ALL

SELECT '❌ OMITIDO — placa no existe en vehiculos' AS estado,
       placa_programada AS placa, NULL, NULL, NULL, NULL, NULL, NULL, NULL
FROM (VALUES
  ('SYU652'),('WFR160'),('EYX091'),('SPU120'),('TRK507'),
  ('WEP384'),('MAT480'),('TJX795'),('TTL256'),('EQY944'),
  ('SXF257'),('WLS478'),('WHM896'),('EQN953'),('SMO183'),
  ('VZD334'),('TMZ674'),('SPQ814'),('WHN317'),('PEK019'),
  ('WFV015'),('WLC133'),('TNH494'),('LUM993'),('WTN748'),
  ('ERK303'),('JVM223'),('SQB119')
) AS prog(placa_programada)
WHERE NOT EXISTS (
  SELECT 1 FROM fletes f
  WHERE f.placa = prog.placa_programada
    AND f.fecha = '2026-11-14'
    AND f.proveedor IN ('ALPINA','FLEISCHMANN')
)

ORDER BY estado DESC, placa;
