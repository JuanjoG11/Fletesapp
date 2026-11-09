/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIERCOLES 4 NOVIEMBRE 2026
   Generado: 2026-11-04

   ✅ REGLAS DE SEGURIDAD:
     - El campo contratista se toma de vehiculos.conductor (nombre real en BD).
     - Cada fila solo se inserta si la placa existe en la tabla vehiculos.
     - Si la placa no está registrada, el INSERT de esa fila se omite silenciosamente.

   Notas:
     - SYU652   EXTRA $60.000 (AP 25254TSS 25282)
     - WFR160   (AP 25283 + FEP 21050)
     - EYX091   2 auxiliares (AP 25277 25284 + FEP 21064)
     - TRK507   (AP 25286 + FEP 21065)
     - SXE867   VALOR DE FLETE $350.000 (AP 25289 + FEP 21048, 2 auxiliares)
     - WGZ876   EXTRA $60.000 (AP 25260 25288 + FEP 21049, 2 auxiliares)
     - WFV015   2 auxiliares (AP 25280 25311)
     - TJX795   2 auxiliares (AP 25312)
     - EQY944   2 auxiliares (AP 25313)
     - SXF257   2 auxiliares (AP 25281 25314)
     - WLS478   (AP 25290 + FEP 21053 21054)
     - WHM896   fac AP795640 (AP 25291 + FEP 21052)
     - SMO183   TSS (AP 25245TSS 25302)
     - VZD334   EXTRA $60.000 (AP 25303 + FEP 21056)
     - TNH494   (AP 25310 25296)
     - SXE499   2 auxiliares (AP 25315 + FEP 21057)
     - ERK303   2 auxiliares (AP 25292 + FEP 21055)
     - JVM223   2 auxiliares (AP 25275 25293 + FEP 21058)
     - SQB119   FLEISCHMANN (FEP 21063)
     - TRF860   VALOR DE RUTA $350.000, FLEISCHMANN (AP 25301 + FEP 21059 21062)
   ========================================================== */

/* -------------------------------------------------
   0️⃣  DIAGNÓSTICO PREVIO — Placas NO registradas
        Este SELECT muestra las placas del día que
        NO existen en vehiculos. Si el resultado está
        vacío, todas están OK y puedes continuar.
        Si hay filas, crea esas placas antes de ejecutar
        el resto del script.
   ------------------------------------------------- */
SELECT placa_programada, 'NO EXISTE EN vehiculos — flete se OMITIRÁ' AS alerta
FROM (VALUES
  ('SYU652'),('WFR160'),('EYX091'),('SPU120'),('TRK507'),
  ('WEP384'),('SXE867'),('WGZ876'),('MAT480'),('WFV015'),
  ('TJX795'),('EQY944'),('SXF257'),('WLS478'),('WHM896'),
  ('SMO183'),('VZD334'),('TMZ674'),('SPQ814'),('TTL256'),
  ('PEK019'),('BCS450'),('WLC133'),('TNH494'),('SXE499'),
  ('WTN748'),('ERK303'),('JVM223'),('SQB119'),('TRF860')
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
WHERE fecha = '2026-11-04'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 04‑Nov‑2026
        contratista = conductor real de tabla vehiculos
        La fila se omite si la placa no existe en vehiculos
   ------------------------------------------------- */

/* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

/* 01 – SYU652 – EXTRA $60.000 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'SYU652','25254TSS 25282','9552 TSS','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
       1,60000,'EXTRA $60.000',
       6596950,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),6596950)+60000,
       39,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SYU652' AND v.razon_social='TYM' LIMIT 1;

/* 02 – WFR160 – FEP 21050 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'WFR160','25283','9553 F','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
       1,0,'-',
       7625192,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),7625192)+0,
       49,'21050','TYM'
FROM vehiculos v WHERE v.placa='WFR160' AND v.razon_social='TYM' LIMIT 1;

/* 03 – EYX091 – 2 auxiliares, FEP 21064 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'EYX091','25277 25284','9554 7000 F','MANIZALES VILLAMARIA','JHONNY LOPEZ, ANDRES GOMEZ',2,
       1,0,'-',
       8524174,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),8524174)+0,
       58,'21064','TYM'
FROM vehiculos v WHERE v.placa='EYX091' AND v.razon_social='TYM' LIMIT 1;

/* 04 – SPU120 – sin adicional */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'SPU120','25278 25285','9555 7001','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
       1,0,'-',
       8545879,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),8545879)+0,
       37,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SPU120' AND v.razon_social='TYM' LIMIT 1;

/* 05 – TRK507 – FEP 21065 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'TRK507','25286','9556 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
       1,0,'-',
       4994314,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),4994314)+0,
       38,'21065','TYM'
FROM vehiculos v WHERE v.placa='TRK507' AND v.razon_social='TYM' LIMIT 1;

/* 06 – WEP384 – 2 auxiliares, Marmato La Merced */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'WEP384','25287','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ, CESAR CASTILLO LONDOÑO',2,
       1,0,'-',
       12095595,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1),12095595)+0,
       29,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WEP384' AND v.razon_social='TYM' LIMIT 1;

/* 07 – SXE867 – VALOR DE FLETE $350.000, 2 auxiliares, FEP 21048 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'SXE867','25289','9559 F','PALESTINA ARAUCA','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
       1,0,'VALOR DE FLETE $350.000',
       9064204,350000,
       47,'21048','TYM'
FROM vehiculos v WHERE v.placa='SXE867' AND v.razon_social='TYM' LIMIT 1;

/* 08 – WGZ876 – EXTRA $60.000, 2 auxiliares, FEP 21049 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'WGZ876','25260 25288','9558 F','AGUADAS PACORA','JOHN EDWAR ZAPATA ACEVEDO, YESID PATIÑO',2,
       1,60000,'EXTRA $60.000',
       16325498,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1),16325498)+60000,
       83,'21049','TYM'
FROM vehiculos v WHERE v.placa='WGZ876' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA ARMENIA / EJE ───────────────────────────────────── */

/* 09 – MAT480 – Cartago 2T */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'MAT480','25239','9450','CARTAGO 2T','JHON FREDY MORENO',1,
       1,0,'-',
       18072000,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1),18072000)+0,
       1,NULL,'TYM'
FROM vehiculos v WHERE v.placa='MAT480' AND v.razon_social='TYM' LIMIT 1;

/* 10 – WFV015 – 2 auxiliares */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'WFV015','25280 25311','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO, MANUEL RAMIREZ',2,
       1,0,'-',
       10636807,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),10636807)+0,
       56,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WFV015' AND v.razon_social='TYM' LIMIT 1;

/* 11 – TJX795 – 2 auxiliares */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'TJX795','25312','9602','ARMENIA','YERFREY FLOWER, SAMUEL ARIAS',2,
       1,0,'-',
       7082995,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),7082995)+0,
       56,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TJX795' AND v.razon_social='TYM' LIMIT 1;

/* 12 – EQY944 – 2 auxiliares */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'EQY944','25313','9603','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, CRISTIAN GIRALDO',2,
       1,0,'-',
       8089861,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),8089861)+0,
       48,NULL,'TYM'
FROM vehiculos v WHERE v.placa='EQY944' AND v.razon_social='TYM' LIMIT 1;

/* 13 – SXF257 – 2 auxiliares, Quimbaya */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'SXF257','25281 25314','9604 7010','QUIMBAYA','JOSE ALEXANDER CONSTAIN PERLAZA, JUAN RICO',2,
       1,0,'-',
       10616344,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1),10616344)+0,
       34,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SXF257' AND v.razon_social='TYM' LIMIT 1;

/* 14 – WLS478 – FEP 21053 21054 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'WLS478','25290','9605 F','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
       1,0,'-',
       7341652,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1),7341652)+0,
       43,'21053 21054','TYM'
FROM vehiculos v WHERE v.placa='WLS478' AND v.razon_social='TYM' LIMIT 1;

/* 15 – WHM896 – fac AP795640, FEP 21052 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'WHM896','25291','9606 F','SALENTO','JHON WILSON GIRALDO CARVAJAL',1,
       1,0,'-',
       5052021,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1),5052021)+0,
       32,'21052 AP795640','TYM'
FROM vehiculos v WHERE v.placa='WHM896' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

/* 16 – SMO183 – TSS */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'SMO183','25245TSS 25302','9453 TSS F','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
       1,0,'-',
       6765969,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),6765969)+0,
       55,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SMO183' AND v.razon_social='TYM' LIMIT 1;

/* 17 – VZD334 – EXTRA $60.000, FEP 21056 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'VZD334','25303','9454 F','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
       1,60000,'EXTRA $60.000',
       8701191,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),8701191)+60000,
       46,'21056','TYM'
FROM vehiculos v WHERE v.placa='VZD334' AND v.razon_social='TYM' LIMIT 1;

/* 18 – TMZ674 – sin adicional */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'TMZ674','25304','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
       1,0,'-',
       6572935,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),6572935)+0,
       48,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TMZ674' AND v.razon_social='TYM' LIMIT 1;

/* 19 – SPQ814 – Santa Rosa */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'SPQ814','25305','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
       1,0,'-',
       8813978,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1),8813978)+0,
       55,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SPQ814' AND v.razon_social='TYM' LIMIT 1;

/* 20 – TTL256 – sin adicional */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'TTL256','25306','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
       1,0,'-',
       8247084,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),8247084)+0,
       58,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TTL256' AND v.razon_social='TYM' LIMIT 1;

/* 21 – PEK019 – sin adicional */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'PEK019','25307','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
       1,0,'-',
       5322060,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),5322060)+0,
       38,NULL,'TYM'
FROM vehiculos v WHERE v.placa='PEK019' AND v.razon_social='TYM' LIMIT 1;

/* 22 – BCS450 – sin adicional */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'BCS450','25308','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
       1,0,'-',
       6183580,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),6183580)+0,
       48,NULL,'TYM'
FROM vehiculos v WHERE v.placa='BCS450' AND v.razon_social='TYM' LIMIT 1;

/* 23 – WLC133 – 2 auxiliares */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'WLC133','25309','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, MARLON MURILLO',2,
       1,0,'-',
       8753324,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),8753324)+0,
       65,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WLC133' AND v.razon_social='TYM' LIMIT 1;

/* 24 – TNH494 – sin adicional */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'TNH494','25310 25296','9461 9450','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
       1,0,'-',
       10260876,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1),10260876)+0,
       48,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TNH494' AND v.razon_social='TYM' LIMIT 1;

/* 25 – SXE499 – 2 auxiliares, FEP 21057 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'SXE499','25315','7004 F','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, EDWAR GIL',2,
       1,0,'-',
       10612039,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),10612039)+0,
       71,'21057','TYM'
FROM vehiculos v WHERE v.placa='SXE499' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA OCCIDENTE ───────────────────────────────────────── */

/* 26 – WTN748 – Argelia El Cairo */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'WTN748','25316','7005 F','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO',1,
       1,0,'-',
       10075993,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARGELIA EL CAIRO' LIMIT 1),10075993)+0,
       31,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WTN748' AND v.razon_social='TYM' LIMIT 1;

/* 27 – ERK303 – 2 auxiliares, FEP 21055 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'ERK303','25292','7006 F','BALBOA LA CELIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
       1,0,'-',
       8726476,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1),8726476)+0,
       41,'21055','TYM'
FROM vehiculos v WHERE v.placa='ERK303' AND v.razon_social='TYM' LIMIT 1;

/* 28 – JVM223 – 2 auxiliares, FEP 21058 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'JVM223','25275 25293','7007 9451 F','ANSERMA','LUIS CARLOS CADAVID RESTREPO, PABLO RAMIREZ',2,
       1,0,'-',
       17997002,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1),17997002)+0,
       60,'21058','TYM'
FROM vehiculos v WHERE v.placa='JVM223' AND v.razon_social='TYM' LIMIT 1;

/* ── FLEISCHMANN ──────────────────────────────────────────── */

/* 29 – SQB119 – FLEISCHMANN, FEP 21063 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','FLEISCHMANN',v.conductor,'SQB119','21063','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
       1,0,'-',
       5684644,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),5684644)+0,
       54,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SQB119' AND v.razon_social='TYM' LIMIT 1;

/* 30 – TRF860 – VALOR DE RUTA $350.000, FEP 21059 21062 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','FLEISCHMANN',v.conductor,'TRF860','25301','FLEISCHMANN','CARTAGO 2T','JULIAN RODRIGUEZ',1,
       1,0,'VALOR DE RUTA $350.000',
       7210613,350000,
       42,'21059 21062','TYM'
FROM vehiculos v WHERE v.placa='TRF860' AND v.razon_social='TYM' LIMIT 1;

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa,
       contratista     AS conductor_bd,
       zona, poblacion,
       precio          AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-11-04'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
