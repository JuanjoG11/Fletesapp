/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 28 OCTUBRE 2026
   Generado: 2026-10-28

   Notas:
     - WFR160   ADICIONAL AL FLETE $200.000 (AP 25106 25090, 2 auxiliares, CARLOS JIMENEZ / PABLO RAMIREZ)
     - WEP384   EXTRA $60.000 (AP 25094, 2 auxiliares)
     - SXE867   VALOR DE FLETE $350.000 (AP 25096 + FEP 20964, 2 auxiliares)
     - WGZ876   ADICIONAL AL FLETE $180.000 (AP 25060 25095 + FEP 20963, 2 auxiliares)
     - MAT480   VALOR DE FLETE $700.000 (AP 25113 25112, ARMENIA SUPER)
     - SXF257   ADICIONAL AL FLETE $150.000 (AP 25115 25088 25128, 2 auxiliares)
     - VZD334   extra $60.000 (AP 25118 + FEP 20956)
     - WHM896   fac AP788998 AP788999 (AP 25098 + FEP 20959)
     - TJX795   fac AP787644 (AP 25127 + FEP 20961, 2 auxiliares)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-28'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 28‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

  /* 01 – SYU652 – sin adicional (AP 25089 25104 + FEP 20966) */
  ('2026-10-28','Miércoles','ALPINA',
   'JOHAN ECHEVERRY',
   'SYU652','25089 25104','9552 F 9550','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,0,'-',
   16226248,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 16226248) + 0,
   37,'20966','TYM'),

  /* 02 – WFR160 – ADICIONAL AL FLETE $200.000 (AP 25106 25090, 2 auxiliares) */
  ('2026-10-28','Miércoles','ALPINA',
   'LEANDRO LOPEZ',
   'WFR160','25106 25090','9553 7001','MANIZALES VILLAMARIA','CARLOS JIMENEZ, PABLO RAMIREZ',2,
   2,200000,'ADICIONAL AL FLETE $200.000',
   15215695,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 15215695) + 200000,
   60,NULL,'TYM'),

  /* 03 – EYX091 – sin adicional (AP 25105 25091 + FEP 20973, 2 auxiliares) */
  ('2026-10-28','Miércoles','ALPINA',
   'CAMILO COCOMA',
   'EYX091','25105 25091','9554 F 7000','MANIZALES VILLAMARIA','JHONNY LOPEZ, ANDRES GOMEZ',2,
   2,0,'-',
   10924578,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 10924578) + 0,
   59,'20973','TYM'),

  /* 04 – SPU120 – sin adicional (AP 25092 + FEP 20974) */
  ('2026-10-28','Miércoles','ALPINA',
   'OSWALDO IBARRA',
   'SPU120','25092','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   7954824,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7954824) + 0,
   52,'20974','TYM'),

  /* 05 – TRK507 – sin adicional (AP 25093 + FEP 20962 20975) */
  ('2026-10-28','Miércoles','ALPINA',
   'MIGUEL GONZALES',
   'TRK507','25093','9556 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   9044777,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 9044777) + 0,
   49,'20962 20975','TYM'),

  /* 06 – WEP384 – EXTRA $60.000 (AP 25094, 2 auxiliares) */
  ('2026-10-28','Miércoles','ALPINA',
   'YOFER LOPEZ',
   'WEP384','25094','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,60000,'EXTRA $60.000',
   16609311,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1), 16609311) + 60000,
   39,NULL,'TYM'),

  /* 07 – SXE867 – VALOR DE FLETE $350.000 (AP 25096 + FEP 20964, 2 auxiliares) */
  ('2026-10-28','Miércoles','ALPINA',
   'HERIBERTO GARCIA',
   'SXE867','25096','9559 F','PALESTINA ARAUCA','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
   2,0,'-',
   10346569,
   350000,
   47,'20964','TYM'),

  /* 08 – WGZ876 – ADICIONAL AL FLETE $180.000 (AP 25060 25095 + FEP 20963, 2 auxiliares) */
  ('2026-10-28','Miércoles','ALPINA',
   'RICARDO PINEDA',
   'WGZ876','25060 25095','9558 F','AGUADAS PACORA','JOHN EDWAR ZAPATA ACEVEDO, YESID PATIÑO',2,
   2,180000,'ADICIONAL AL FLETE $180.000',
   20177761,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1), 20177761) + 180000,
   81,'20963','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ───────────────────────────────── */

  /* 09 – MAT480 – VALOR DE FLETE $700.000 (AP 25113 25112, ARMENIA SUPER) */
  ('2026-10-28','Miércoles','ALPINA',
   'ELKIN AGUIRRE',
   'MAT480','25113 25112','7009 7010 N','ARMENIA SUPER','JHON FREDY MORENO',1,
   1,0,'-',
   23871020,
   700000,
   2,NULL,'TYM'),

  /* 10 – WFV015 – sin adicional (AP 25107 25126, 2 auxiliares) */
  ('2026-10-28','Miércoles','ALPINA',
   'YONI VALENCIA',
   'WFV015','25107 25126','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO, AUX NUEVO',2,
   2,0,'-',
   10467430,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 10467430) + 0,
   56,NULL,'TYM'),

  /* 11 – TJX795 – sin adicional (AP 25127 + FEP 20961, fac AP787644, 2 auxiliares) */
  ('2026-10-28','Miércoles','ALPINA',
   'ANDRES QUINTERO',
   'TJX795','25127','9602 EXITO16 F','ARMENIA','YERFREY FLOWER, SAMUEL ARIAS',2,
   2,0,'-',
   12945211,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 12945211) + 0,
   62,'20961 AP787644','TYM'),

  /* 12 – EQY944 – sin adicional (AP 25101, 2 auxiliares) */
  ('2026-10-28','Miércoles','ALPINA',
   'GOBER CRISTANCHO',
   'EQY944','25101','9603','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, CRISTIAN GIRALDO',2,
   2,0,'-',
   9790985,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 9790985) + 0,
   63,NULL,'TYM'),

  /* 13 – SXF257 – ADICIONAL AL FLETE $150.000 (AP 25115 25088 25128, 2 auxiliares) */
  ('2026-10-28','Miércoles','ALPINA',
   'FABIO RUIZ',
   'SXF257','25115 25088 25128','9604 7010 N','QUIMBAYA','JOSE ALEXANDER CONSTAIN PERLAZA, JUAN RICO',2,
   2,150000,'ADICIONAL AL FLETE $150.000',
   16132459,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1), 16132459) + 150000,
   36,NULL,'TYM'),

  /* 14 – WLS478 – sin adicional (AP 25097 + FEP 20954) */
  ('2026-10-28','Miércoles','ALPINA',
   'HUMBERTO RINCON',
   'WLS478','25097','9605 F 9602','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   9353885,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1), 9353885) + 0,
   39,'20954','TYM'),

  /* 15 – WHM896 – sin adicional (AP 25098 + FEP 20959, fac AP788998 AP788999) */
  ('2026-10-28','Miércoles','ALPINA',
   'ALEXANDER CUELLAR',
   'WHM896','25098','9606 F','SALENTO','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   9227595,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1), 9227595) + 0,
   31,'20959 AP788998 AP788999','TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

  /* 16 – SMO183 – sin adicional (AP 25117 + FEP 20958) */
  ('2026-10-28','Miércoles','ALPINA',
   'GABRIEL PEREZ',
   'SMO183','25117','9453 F','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   7296615,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7296615) + 0,
   61,'20958','TYM'),

  /* 17 – VZD334 – extra $60.000 (AP 25118 + FEP 20956) */
  ('2026-10-28','Miércoles','ALPINA',
   'JULIAN CUELLAR',
   'VZD334','25118','9454 F','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,60000,'EXTRA $60.000',
   8469317,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8469317) + 60000,
   50,'20956','TYM'),

  /* 18 – TMZ674 – sin adicional (AP 25119) */
  ('2026-10-28','Miércoles','ALPINA',
   'RICARDO LOPEZ',
   'TMZ674','25119','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   6005146,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6005146) + 0,
   47,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional (AP 25086 25120) */
  ('2026-10-28','Miércoles','ALPINA',
   'CARLOS VELASCO',
   'SPQ814','25086 25120','9456 7002','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   11167691,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 11167691) + 0,
   58,NULL,'TYM'),

  /* 20 – WHN317 – sin adicional (AP 25121) */
  ('2026-10-28','Miércoles','ALPINA',
   'HUMBERTO PARRA',
   'WHN317','25121','9457','PEREIRA - DOSQUEBRADAS','MARLON MURILLO',1,
   1,0,'-',
   8166970,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8166970) + 0,
   54,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional (AP 25122) */
  ('2026-10-28','Miércoles','ALPINA',
   'MIGUEL TABARES',
   'PEK019','25122','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,0,'-',
   6319620,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6319620) + 0,
   53,NULL,'TYM'),

  /* 22 – LUM993 – sin adicional (AP 25123) */
  ('2026-10-28','Miércoles','ALPINA',
   'ANDRES',
   'LUM993','25123','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
   1,0,'-',
   8406256,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8406256) + 0,
   55,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional (AP 25103 25125) */
  ('2026-10-28','Miércoles','ALPINA',
   'ADALBERTO MEJIA',
   'TNH494','25103 25125','9461 9450','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   11207946,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 11207946) + 0,
   54,NULL,'TYM'),

  /* 24 – SXE499 – sin adicional (AP 25129 + FEP 20957) */
  ('2026-10-28','Miércoles','ALPINA',
   'HECTOR MARIN',
   'SXE499','25129','7004 F','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   10968852,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 10968852) + 0,
   59,'20957','TYM'),

  /* ── ZONA OCCIDENTE ───────────────────────────────────────── */

  /* 25 – WTN748 – sin adicional (AP 25130 + FEP 20968) */
  ('2026-10-28','Miércoles','ALPINA',
   'DIEGO RATIVA',
   'WTN748','25130','7005 F','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   6158979,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1), 6158979) + 0,
   36,'20968','TYM'),

  /* 26 – ERK303 – sin adicional (AP 25099 + FEP 20955, 2 auxiliares) */
  ('2026-10-28','Miércoles','ALPINA',
   'JORGE ALARCON',
   'ERK303','25099','7006 F','BALBOA LA CELIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   8304554,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1), 8304554) + 0,
   42,'20955','TYM'),

  /* 27 – JVM223 – sin adicional (AP 25084 25100 + FEP 20969, 2 auxiliares) */
  ('2026-10-28','Miércoles','ALPINA',
   'WILMAR CARDONA',
   'JVM223','25084 25100','7007 9451 F','ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   14956443,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1), 14956443) + 0,
   56,'20969','TYM'),

  /* ── FLEISCHMANN ──────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional (FEP 20972, PEREIRA - DOSQUEBRADAS) */
  ('2026-10-28','Miércoles','FLEISCHMANN',
   'CARLOS CASTAÑO',
   'SQB119','20972','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   4728155,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 4728155) + 0,
   52,NULL,'TYM'),

  /* 29 – TRF860 – sin adicional (FEP 20970 20971, CARTAGO 2T) */
  ('2026-10-28','Miércoles','FLEISCHMANN',
   'ALBERTO GONZALO',
   'TRF860','20970 20971','FLEISCHMANN','CARTAGO 2T','JULIAN RODRIGUEZ',1,
   1,0,'-',
   7196304,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1), 7196304) + 0,
   50,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa,
       contratista     AS conductor,
       zona, poblacion,
       precio          AS precio_flete,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-10-28'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
