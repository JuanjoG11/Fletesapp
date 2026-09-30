/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 24 SEPTIEMBRE 2026
   Generado: 2026-09-24
   Notas:
     - WFR160  ADICIONAL AL FLETE $200.000
     - EYX091  EXTRA $60.000
     - WGZ876  ADICIONAL AL FLETE $130.000
     - WFV015  ADICIONAL AL FLETE $100.000
     - TTL256  EXTRA $30.000
     - EQY944  EXTRA $100.000 (8 pedidos de ORO PUEBLO)
     - WLC133  ADICIONAL AL FLETE $26.000
     - EQN953  VALOR DE FLETE $350.000
     - MAT480  VALOR DE FLETE $500.000
     - SQB119  ADICIONAL AL FLETE $200.000
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-09-24'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 24‑Sep‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ─────────────────────────────── */

  /* 01 – SYU652 – sin adicional */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24119 20548','9552 DELCAMPO','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   9045371,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   43,'AP755536','TYM'),

  /* 02 – WFR160 – ADICIONAL AL FLETE $200.000 */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24120 20549','9553 FLORIDA','MANIZALES VILLAMARIA','CARLOS JIMENEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   1,200000,'ADICIONAL AL FLETE $200.000',
   16323301,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 200000,
   43,'FEP1195464 AP755535','TYM'),

  /* 03 – EYX091 – EXTRA $60.000 */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','24121 20533','9554','NEIRA','JHONNY LOPEZ',1,
   1,60000,'EXTRA $60.000',
   8678292,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1) + 60000,
   59,NULL,'TYM'),

  /* 04 – SPU120 – sin adicional */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24122 20550','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   7784662,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SLI587' AND razon_social='TYM'),
   'SLI587','24099 20552','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   6636761,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   52,'FEP1195460-471-479','TYM'),

  /* 06 – WGZ876 – ADICIONAL AL FLETE $130.000 */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','24100','9557','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   1,130000,'ADICIONAL AL FLETE $130.000',
   11409103,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1) + 130000,
   58,NULL,'TYM'),

  /* 07 – WEP384 – sin adicional */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24102 20547','9559','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ, SAMUEL ARIAS',2,
   1,0,'-',
   13043974,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RDA S JOSE BELALCAZAR' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ──────────────────────────────────── */

  /* 08 – WFV015 – ADICIONAL AL FLETE $100.000 */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFV015' AND razon_social='TYM'),
   'WFV015','24011TSS 24097','7008 7010LECHE PENDIENTE','CALARCA',NULL,0,
   1,100000,'ADICIONAL AL FLETE $100.000',
   11181012,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 100000,
   3,NULL,'TYM'),

  /* 09 – TTL256 – EXTRA $30.000 */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TTL256' AND razon_social='TYM'),
   'TTL256','24123 24098 20541','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,30000,'EXTRA $30.000',
   9481965,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 30000,
   55,NULL,'TYM'),

  /* 10 – TJX795 – sin adicional */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TJX795' AND razon_social='TYM'),
   'TJX795','24124','9602','ARMENIA','YERFREY FLOWER, APOYO VENDEDOR',2,
   1,0,'-',
   6022988,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 11 – EQY944 – EXTRA $100.000 (8 pedidos ORO PUEBLO) */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24125','9603 ANDY','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, CRISTIAN GIRALDO',2,
   1,100000,'EXTRA $100.000 POR 8 PEDIDOS DE ORO PUEBLO QUE EL VENDEDOR SACO EL DIA QUE NO ERA',
   7311854,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 100000,
   70,'AP757221','TYM'),

  /* 12 – SXF257 – sin adicional */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24126 20534','9604','ALCALA ULLOA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   4854472,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1) + 0,
   26,NULL,'TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24103 20536','9605','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, MARLON MURILLO',2,
   1,0,'-',
   10339987,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 14 – WFQ635 – sin adicional */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFQ635' AND razon_social='TYM'),
   'WFQ635','24104 20515','9606','FILANDIA','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   8029137,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1) + 0,
   34,'AP757074','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ─────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24110','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   5392591,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24111 20539','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   9968074,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TMZ674' AND razon_social='TYM'),
   'TMZ674','24112','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   6263232,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24113 24096','9456 7002','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5616862,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 19 – WHM896 – sin adicional */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24114 20543','9457','ARABIA ALTAGRACIA','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   6001645,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARABIA ALTAGRACIA' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24115','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,0,'-',
   5941257,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 21 – LUM993 – sin adicional */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='LUM993' AND razon_social='TYM'),
   'LUM993','24116','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
   1,0,'-',
   7194579,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 22 – WLC133 – ADICIONAL AL FLETE $26.000 */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24117','9460','PEREIRA - DOSQUEBRADAS','JUAN RICO, APOYO VENDEDOR',2,
   1,26000,'ADICIONAL AL FLETE $26.000',
   6133008,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 26000,
   42,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','24118','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   7126032,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   52,'AP757070','TYM'),

  /* 24 – EQN953 – VALOR DE FLETE $350.000 */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQN953' AND razon_social='TYM'),
   'EQN953','24089TSS 24127 20520 20540','7004','MARSELLA','BRAHIAN STIVEN VALENCIA IGLESIAS, DUVIER GALVIZ',2,
   1,350000,'VALOR DE FLETE $350.000',
   9373429,
   350000,
   54,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ──────────────────────────────── */

  /* 25 – MAT480 – VALOR DE FLETE $500.000 */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='MAT480' AND razon_social='TYM'),
   'MAT480','24002','9450 N','CARTAGO 2T','JHON FREDY MORENO',1,
   1,500000,'VALOR DE FLETE $500.000',
   13636930,
   500000,
   1,NULL,'TYM'),

  /* 26 – WTN748 – sin adicional */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','24105','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   6238124,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   40,'AP757071','TYM'),

  /* 27 – ERK303 – sin adicional */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','24106 20537','7006','APIA','JORGE RIVILLAS, ELKIN GARCIA OCAMPO',2,
   1,0,'-',
   11821098,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 28 – JVM223 – sin adicional */
  ('2026-09-24','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24094 24107 20542','7007 9451','VITERBO','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   1,0,'-',
   12014106,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1) + 0,
   66,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – ADICIONAL AL FLETE $200.000 */
  ('2026-09-24','Jueves','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','24079TSS 20544 20538','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,200000,'ADICIONAL AL FLETE $200.000',
   12361139,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 200000,
   43,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, contratista AS conductor_bd, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-09-24'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
