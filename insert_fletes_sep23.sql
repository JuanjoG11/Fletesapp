/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 23 SEPTIEMBRE 2026
   Generado: 2026-09-23
   Notas:
     - WFV015  ADICIONAL AL FLETE $100.000
     - WFR160  ADICIONAL AL FLETE $100.000
     - WEP384  EXTRA $60.000
     - EYX091  EXTRA $60.000
     - MAT480  VALOR DE FLETE $1.200.000 DOS VEHICULOS (7009 + 7010)
     - SXF257  ADICIONAL AL FLETE $150.000
     - WLS478  ADICIONAL $100.000 NEGOCIACION
     - WLC133  ADICIONAL AL FLETE $26.000
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-09-23'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 23‑Sep‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ─────────────────────────────── */

  /* 01 – WFV015 – ADICIONAL AL FLETE $100.000 */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFV015' AND razon_social='TYM'),
   'WFV015','24081 20523','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,100000,'ADICIONAL AL FLETE $100.000',
   5226319,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 100000,
   37,NULL,'TYM'),

  /* 02 – WFR160 – ADICIONAL AL FLETE $100.000 */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24082','9553','MANIZALES VILLAMARIA','CARLOS JIMENEZ, MARLON MURILLO',2,
   1,100000,'ADICIONAL AL FLETE $100.000',
   10255533,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 100000,
   67,NULL,'TYM'),

  /* 03 – SYU652 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24054 24083 20530','9554 7000MERCA','MANIZALES VILLAMARIA','DUVIER GALVIZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   1,0,'-',
   11450948,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 04 – SPU120 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24084 20531','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   7858945,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SLI587' AND razon_social='TYM'),
   'SLI587','24029 24057 20529 20532','9556 9550UNOAG','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   11382221,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','24058','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   1,0,'-',
   14737299,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1) + 0,
   34,NULL,'TYM'),

  /* 07 – WEP384 – EXTRA $60.000 */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24060 20522','9559','PALESTINA ARAUCA','BRANDON STEVEN GIL BAEZ, SAMUEL ARIAS',2,
   1,60000,'EXTRA $60.000',
   10650407,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PALESTINA ARAUCA' LIMIT 1) + 60000,
   48,NULL,'TYM'),

  /* 08 – EYX091 – EXTRA $60.000 */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','24021 24059 20521','9558','AGUADAS PACORA','JHONNY LOPEZ',1,
   1,60000,'EXTRA $60.000',
   17294057,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1) + 60000,
   82,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ──────────────────────────────────── */

  /* 09 – MAT480 – VALOR DE FLETE $1.200.000 DOS VEHICULOS */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='MAT480' AND razon_social='TYM'),
   'MAT480','24010 24009 24006 24011','7009 7010','ARMENIA SUPER','JHON FREDY MORENO',1,
   1,1200000,'VALOR DE FLETE $1.200.000 DOS VEHICULOS',
   26690110,
   1200000,
   4,NULL,'TYM'),

  /* 10 – WFQ635 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFQ635' AND razon_social='TYM'),
   'WFQ635','24085 24070','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   8448631,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 11 – TJX795 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TJX795' AND razon_social='TYM'),
   'TJX795','24086','9602','ARMENIA','YERFREY FLOWER, CRISTIAN GIRALDO',2,
   1,0,'-',
   6110069,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 12 – EQY944 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24087','9603','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, AUX NUEVO',2,
   1,0,'-',
   7712347,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 13 – SXF257 – ADICIONAL AL FLETE $150.000 */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24056 24088','9604 7010','QUIMBAYA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,150000,'ADICIONAL AL FLETE $150.000',
   11130829,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 150000,
   40,NULL,'TYM'),

  /* 14 – WLS478 – ADICIONAL $100.000 NEGOCIACION */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24061 20517','9605','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,100000,'ADICIONAL $100.000 NEGOCIACION',
   6214342,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1) + 100000,
   40,NULL,'TYM'),

  /* 15 – TTL256 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TTL256' AND razon_social='TYM'),
   'TTL256','24053 24062 20516','9606 9600','SALENTO','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   9165880,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1) + 0,
   36,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ─────────────────────────────── */

  /* 16 – SMO183 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24073','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   8036130,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   61,NULL,'TYM'),

  /* 17 – VZD334 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24074 20518','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   9071242,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 18 – TMZ674 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TMZ674' AND razon_social='TYM'),
   'TMZ674','24075','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5020882,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24076','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   7624652,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 20 – WHM896 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24077','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   8288778,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24078','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,0,'-',
   7066197,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 22 – LUM993 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='LUM993' AND razon_social='TYM'),
   'LUM993','24079','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
   1,0,'-',
   7725049,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 23 – WLC133 – ADICIONAL AL FLETE $26.000 */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24080','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, JUAN RICO',2,
   1,26000,'ADICIONAL AL FLETE $26.000',
   9665719,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 26000,
   74,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','24072 24068','9461 9450','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   11011806,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 25 – EQN953 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQN953' AND razon_social='TYM'),
   'EQN953','24089 20519','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, JORGE RIVILLAS',2,
   1,0,'-',
   9973969,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   64,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ──────────────────────────────── */

  /* 26 – WTN748 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','24090 20526','7005','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   6049188,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1) + 0,
   34,NULL,'TYM'),

  /* 27 – ERK303 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','24063 20514','7006','BALBOA LA CELIA','CESAR AUGUSTO CASTILLO LONDOÑO, ELKIN GARCIA OCAMPO',2,
   1,0,'-',
   8062083,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 28 – JVM223 – sin adicional */
  ('2026-09-23','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24052 24064 20524','7007 9451','ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   1,0,'-',
   17891206,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional */
  ('2026-09-23','Miércoles','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','20528 AP755421-448-457','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   5634916,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 30 – TRF860 – sin adicional */
  ('2026-09-23','Miércoles','FLEISCHMANN',
   'ALBERTO GONZALO',
   'TRF860','20525 20527','FLEISCHMANN','CARTAGO 2T','JULIAN RODRIGUEZ',1,
   1,0,'-',
   5512701,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   36,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, contratista AS conductor_bd, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-09-23'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
