/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 3 NOVIEMBRE 2026
   Generado: 2026-11-03

   ✅ REGLAS DE SEGURIDAD:
     - El campo contratista se toma de vehiculos.conductor (nombre real en BD).
     - Cada fila solo se inserta si la placa existe en la tabla vehiculos.
     - Si la placa no está registrada, el INSERT de esa fila se omite silenciosamente.

   Notas:
     - SYU652   ADICIONAL AL FLETE $100.000 ENTREGA DE NEGOCIACION (AP 25240 25254 + FEP1198782)
     - WFR160   ADICIONAL AL FLETE $100.000 ENTREGA DE NEGOCIACION (AP 25255)
     - EYX091   extra $60.000 (AP 25256 + FEP 21044)
     - TRK507   fac FEP1198785 (AP 25244 25258)
     - WEP384   ADICIONAL AL FLETE $200.000 ENTREGA DE SUPERMERCADOS ZONA 9560 (AP 25259 25262 + FEP 21043)
     - SXE867   2 auxiliares (AP 25261 + FEP 21042)
     - WGZ876   2 auxiliares (AP 25215 + FEP 21021)
     - MAT480   VALOR DE FLETE $700.000 INCLUYE DESCARGUE (AP 25241)
     - WFV015   fac AP794486 (AP 25263)
     - EQY944   2 auxiliares, facs AP790619 AP790620 (AP 25265 + FEP 21037)
     - SXF257   fac AP794485 (AP 25266 + FEP 21035)
     - WLS478   fac AP793387 (AP 25267 + FEP 21036)
     - SPQ814   (AP 25248 + FEP 21040)
     - WTN748   (AP 25270 + FEP 21038)
     - ERK303   2 auxiliares (AP 25271 25243 + FEP 21033 21034)
     - SQB119   FLEISCHMANN (FEP 21041 21046)
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
  ('SMO183'),('VZD334'),('TMZ674'),('SPQ814'),('WHN317'),
  ('PEK019'),('EQN953'),('TTL256'),('TNH494'),('SXE499'),
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
WHERE fecha = '2026-11-03'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 03‑Nov‑2026
        contratista = conductor real de tabla vehiculos
        La fila se omite si la placa no existe en vehiculos
   ------------------------------------------------- */

/* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

/* 01 – SYU652 – ADICIONAL AL FLETE $100.000 ENTREGA DE NEGOCIACION */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'SYU652','25240 25254','9552 DELCENTRO F','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ, JUAN RICO',2,
       1,100000,'ADICIONAL AL FLETE $100.000 ENTREGA DE NEGOCIACION',
       16856868,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),16856868)+100000,
       55,'FEP1198782','TYM'
FROM vehiculos v WHERE v.placa='SYU652' AND v.razon_social='TYM' LIMIT 1;

/* 02 – WFR160 – ADICIONAL AL FLETE $100.000 ENTREGA DE NEGOCIACION */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'WFR160','25255','9553 DELCENTRO F','MANIZALES VILLAMARIA','CARLOS JIMENEZ, EDWAR GIL',2,
       1,100000,'ADICIONAL AL FLETE $100.000 ENTREGA DE NEGOCIACION',
       3635729,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),3635729)+100000,
       36,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WFR160' AND v.razon_social='TYM' LIMIT 1;

/* 03 – EYX091 – extra $60.000 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'EYX091','25256','9554 F','MANIZALES VILLAMARIA','JHONNY LOPEZ',1,
       1,60000,'extra $60.000',
       5545297,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),5545297)+60000,
       53,'21044','TYM'
FROM vehiculos v WHERE v.placa='EYX091' AND v.razon_social='TYM' LIMIT 1;

/* 04 – SPU120 – sin adicional */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'SPU120','25257','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
       1,0,'-',
       4317787,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),4317787)+0,
       46,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SPU120' AND v.razon_social='TYM' LIMIT 1;

/* 05 – TRK507 – fac FEP1198785 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'TRK507','25244 25258','9556 9550 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
       1,0,'-',
       6961268,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1),6961268)+0,
       31,'FEP1198785','TYM'
FROM vehiculos v WHERE v.placa='TRK507' AND v.razon_social='TYM' LIMIT 1;

/* 06 – WEP384 – ADICIONAL AL FLETE $200.000 ENTREGA DE SUPERMERCADOS ZONA 9560 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'WEP384','25259 25262','9557 9560 F','SUPIA','JUAN MANUEL DELGADO NARVAEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
       1,200000,'ADICIONAL AL FLETE $200.000 ENTREGA DE SUPERMERCADOS ZONA 9560',
       10947068,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1),10947068)+200000,
       40,'21043','TYM'
FROM vehiculos v WHERE v.placa='WEP384' AND v.razon_social='TYM' LIMIT 1;

/* 07 – SXE867 – 2 auxiliares */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'SXE867','25261','9559 F','CHINCHINA','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
       1,0,'-',
       7866842,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1),7866842)+0,
       55,'21042','TYM'
FROM vehiculos v WHERE v.placa='SXE867' AND v.razon_social='TYM' LIMIT 1;

/* 08 – WGZ876 – 2 auxiliares */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'WGZ876','25215','9558 F','ARANZAZU FILADELFIA','JOHN EDWAR ZAPATA ACEVEDO, ANDRES GOMEZ',2,
       1,0,'-',
       7190762,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARANZAZU FILADELFIA' LIMIT 1),7190762)+0,
       42,'21021','TYM'
FROM vehiculos v WHERE v.placa='WGZ876' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA ARMENIA ─────────────────────────────────────────── */

/* 09 – MAT480 – VALOR DE FLETE $700.000 INCLUYE DESCARGUE */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'MAT480','25241','7009','ARMENIA','JHON FREDY MORENO',1,
       1,0,'VALOR DE FLETE $700.000 INCLUYE DESCARGUE',
       15813000,700000,
       1,NULL,'TYM'
FROM vehiculos v WHERE v.placa='MAT480' AND v.razon_social='TYM' LIMIT 1;

/* 10 – WFV015 – fac AP794486 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'WFV015','25263','9601 EXITO16','ARMENIA','YEISON DAVID RENDON SOTO, PABLO RAMIREZ',2,
       1,0,'-',
       4807485,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),4807485)+0,
       45,'AP794486','TYM'
FROM vehiculos v WHERE v.placa='WFV015' AND v.razon_social='TYM' LIMIT 1;

/* 11 – TJX795 – sin adicional */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'TJX795','25264','9602','ARMENIA','YERFREY FLOWER',1,
       1,0,'-',
       4869521,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1),4869521)+0,
       41,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TJX795' AND v.razon_social='TYM' LIMIT 1;

/* 12 – EQY944 – 2 auxiliares, facs AP790619 AP790620 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'EQY944','25265','9603 SUPER F','CALARCA','SAMUEL ARIAS, CRISTIAN GIRALDO',2,
       1,0,'-',
       8160325,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1),8160325)+0,
       43,'21037 AP790619 AP790620','TYM'
FROM vehiculos v WHERE v.placa='EQY944' AND v.razon_social='TYM' LIMIT 1;

/* 13 – SXF257 – fac AP794485 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'SXF257','25266','9604 MERCAMOS F','MONTENEGRO PTAPAO','JOSE ALEXANDER CONSTAIN PERLAZA',1,
       1,0,'-',
       5366369,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1),5366369)+0,
       43,'21035 AP794485','TYM'
FROM vehiculos v WHERE v.placa='SXF257' AND v.razon_social='TYM' LIMIT 1;

/* 14 – WLS478 – fac AP793387 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'WLS478','25267','9605 F','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
       1,0,'-',
       5547282,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1),5547282)+0,
       37,'21036 AP793387','TYM'
FROM vehiculos v WHERE v.placa='WLS478' AND v.razon_social='TYM' LIMIT 1;

/* 15 – WHM896 – sin adicional */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'WHM896','25268','9606','CIRCASIA','JHON WILSON GIRALDO CARVAJAL',1,
       1,0,'-',
       2796770,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1),2796770)+0,
       38,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WHM896' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

/* 16 – SMO183 – sin adicional */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'SMO183','25245','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
       1,0,'-',
       4323722,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),4323722)+0,
       37,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SMO183' AND v.razon_social='TYM' LIMIT 1;

/* 17 – VZD334 – sin adicional */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'VZD334','25246','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
       1,0,'-',
       7356317,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),7356317)+0,
       43,NULL,'TYM'
FROM vehiculos v WHERE v.placa='VZD334' AND v.razon_social='TYM' LIMIT 1;

/* 18 – TMZ674 – sin adicional */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'TMZ674','25247','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
       1,0,'-',
       6575610,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),6575610)+0,
       59,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TMZ674' AND v.razon_social='TYM' LIMIT 1;

/* 19 – SPQ814 – FEP 21040 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'SPQ814','25248','9456 F','SANTA ROSA','GERMAN GALVEZ CORTES',1,
       1,0,'-',
       5281130,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1),5281130)+0,
       52,'21040','TYM'
FROM vehiculos v WHERE v.placa='SPQ814' AND v.razon_social='TYM' LIMIT 1;

/* 20 – WHN317 – sin adicional */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'WHN317','25249','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
       1,0,'-',
       6280236,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),6280236)+0,
       42,NULL,'TYM'
FROM vehiculos v WHERE v.placa='WHN317' AND v.razon_social='TYM' LIMIT 1;

/* 21 – PEK019 – sin adicional */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'PEK019','25250','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
       1,0,'-',
       5682543,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),5682543)+0,
       51,NULL,'TYM'
FROM vehiculos v WHERE v.placa='PEK019' AND v.razon_social='TYM' LIMIT 1;

/* 22 – EQN953 – 2 auxiliares */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'EQN953','25251','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO, MANUEL RAMIREZ',2,
       1,0,'-',
       6250518,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),6250518)+0,
       57,NULL,'TYM'
FROM vehiculos v WHERE v.placa='EQN953' AND v.razon_social='TYM' LIMIT 1;

/* 23 – TTL256 – 2 auxiliares */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'TTL256','25252','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, MARLON MURILLO',2,
       1,0,'-',
       9589386,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),9589386)+0,
       57,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TTL256' AND v.razon_social='TYM' LIMIT 1;

/* 24 – TNH494 – sin adicional */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'TNH494','25253','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
       1,0,'-',
       4111929,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1),4111929)+0,
       49,NULL,'TYM'
FROM vehiculos v WHERE v.placa='TNH494' AND v.razon_social='TYM' LIMIT 1;

/* 25 – SXE499 – sin adicional */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'SXE499','25269','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
       1,0,'-',
       6664989,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),6664989)+0,
       49,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SXE499' AND v.razon_social='TYM' LIMIT 1;

/* ── ZONA OCCIDENTE ───────────────────────────────────────── */

/* 26 – WTN748 – FEP 21038 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'WTN748','25270','7005 F','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
       1,0,'-',
       3993164,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1),3993164)+0,
       23,'21038','TYM'
FROM vehiculos v WHERE v.placa='WTN748' AND v.razon_social='TYM' LIMIT 1;

/* 27 – ERK303 – 2 auxiliares */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'ERK303','25271 25243','7006 9450 F','SANTUARIO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
       1,0,'-',
       10860484,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1),10860484)+0,
       49,'21033 21034','TYM'
FROM vehiculos v WHERE v.placa='ERK303' AND v.razon_social='TYM' LIMIT 1;

/* 28 – JVM223 – sin adicional */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'JVM223','25273 25272','7007 9451 F','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO',1,
       1,0,'-',
       8119420,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1),8119420)+0,
       46,NULL,'TYM'
FROM vehiculos v WHERE v.placa='JVM223' AND v.razon_social='TYM' LIMIT 1;

/* ── FLEISCHMANN ──────────────────────────────────────────── */

/* 29 – SQB119 – FLEISCHMANN (FEP 21041 21046) */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','FLEISCHMANN',v.conductor,'SQB119','21041 21046','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
       1,0,'-',
       4196748,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1),4196748)+0,
       41,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SQB119' AND v.razon_social='TYM' LIMIT 1;

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
WHERE fecha = '2026-11-03'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
