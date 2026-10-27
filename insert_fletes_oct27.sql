/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 27 OCTUBRE 2026
   Generado: 2026-10-27

   Notas:
     - EYX091   ADICIONAL $200.000 POR 1.500 KILOS DE PESOS SOLO EN LECHE
                (AP 25026 25056 + FEP 20944, 2 auxiliares, conductor CAMILO COCOCA)
     - SPU120   EXTRA $60.000 PENDIENTE DEL SABADO POR 10 PEDIDOS DE OTRA ZONA
                (AP 25057 + FEP 20945 20942, conductor OSWALDO IBARRA)
     - BCS450   ADICIONAL AL FLETE $100.000 (AP 25063, fac AP786563)
     - ERK303   ADICIONAL AL FLETE $100.000 (AP 25049 25064 + FEP 20939 20940, 2 auxiliares)
     - WTN748   VALOR DE FLETE $480.000 (AP 25081, ARGELIA EL CAIRO, 2 auxiliares)
     - WGZ876   SUPIA RIOSUCIO SUPER → precio fijo $625.000 (AP 25052)
     - WEP384   fac AP787266 (AP 25059 + FEP 20947, 2 auxiliares)
     - SXE867   fac AP786101 (AP 25061 + FEP 20952)
     - SXF257   fac AP787643 (AP 25079 + FEP 20938, 2 auxiliares)
     - SQB119   FLEISCHMANN ARMENIA (FEP 20953)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-27'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 27‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

  /* 01 – SYU652 – sin adicional (AP 25054) */
  ('2026-10-27','Martes','ALPINA',
   'JOHAN ECHEVERRY',
   'SYU652','25054','9552','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,0,'-',
   5283898,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5283898) + 0,
   56,NULL,'TYM'),

  /* 02 – WFR160 – sin adicional (AP 25055 + FEP 20943) */
  ('2026-10-27','Martes','ALPINA',
   'LEANDRO LOPEZ',
   'WFR160','25055','9553 F','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,0,'-',
   6117440,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6117440) + 0,
   51,'20943','TYM'),

  /* 03 – EYX091 – ADICIONAL $200.000 POR 1.500 KILOS DE PESOS SOLO EN LECHE
                   (AP 25026 25056 + FEP 20944, 2 auxiliares) */
  ('2026-10-27','Martes','ALPINA',
   'CAMILO COCOMA',
   'EYX091','25026 25056','9554 7000 F','MANIZALES VILLAMARIA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,200000,'ADICIONAL $200.000 POR 1.500 KILOS DE PESOS SOLO EN LECHE',
   12127616,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 12127616) + 200000,
   58,'20944','TYM'),

  /* 04 – SPU120 – EXTRA $60.000 PENDIENTE DEL SABADO (AP 25057 + FEP 20945 20942) */
  ('2026-10-27','Martes','ALPINA',
   'OSWALDO IBARRA',
   'SPU120','25057','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,60000,'EXTRA $60.000 PENDIENTE DEL SABADO POR 10 PEDIDOS DE OTRA ZONA',
   6837588,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6837588) + 60000,
   58,'20945 20942','TYM'),

  /* 05 – TRK507 – sin adicional (AP 25051 25058 + FEP 20941 20946) */
  ('2026-10-27','Martes','ALPINA',
   'MIGUEL GONZALES',
   'TRK507','25051 25058','9556 9550 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   8443784,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 8443784) + 0,
   47,'20941 20946','TYM'),

  /* 06 – WEP384 – sin adicional (AP 25059 + FEP 20947, fac AP787266, 2 auxiliares) */
  ('2026-10-27','Martes','ALPINA',
   'YOFER LOPEZ',
   'WEP384','25059','9557 MANUELA F','SUPIA','JUAN MANUEL DELGADO NARVAEZ, YESID PATIÑO',2,
   2,0,'-',
   12031969,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1), 12031969) + 0,
   48,'20947 AP787266','TYM'),

  /* 07 – SXE867 – sin adicional (AP 25061 + FEP 20952, fac AP786101, 2 auxiliares) */
  ('2026-10-27','Martes','ALPINA',
   'HERIBERTO GARCIA',
   'SXE867','25061','9559 F','CHINCHINA','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
   2,0,'-',
   6509563,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1), 6509563) + 0,
   58,'20952 AP786101','TYM'),

  /* 08 – WGZ876 – SUPIA RIOSUCIO SUPER precio fijo $625.000 (AP 25052, 2 auxiliares) */
  ('2026-10-27','Martes','ALPINA',
   'RICARDO PINEDA',
   'WGZ876','25052','9560','SUPIA RIOSUCIO SUPER','JOHN EDWAR ZAPATA ACEVEDO, ANDRES GOMEZ',2,
   2,0,'-',
   9611964,
   625000,
   8,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ───────────────────────────────── */

  /* 09 – WFV015 – sin adicional (AP 25076) */
  ('2026-10-27','Martes','ALPINA',
   'YONI VALENCIA',
   'WFV015','25076','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   4495130,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 4495130) + 0,
   42,NULL,'TYM'),

  /* 10 – TJX795 – sin adicional (AP 25077, 2 auxiliares) */
  ('2026-10-27','Martes','ALPINA',
   'ANDRES QUINTERO',
   'TJX795','25077','9602','ARMENIA','YERFREY FLOWER, SAMUEL ARIAS',2,
   2,0,'-',
   6118529,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 6118529) + 0,
   59,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional (AP 25078 + FEP 20950) */
  ('2026-10-27','Martes','ALPINA',
   'GOBER CRISTANCHO',
   'EQY944','25078','9603 F','CALARCA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   6566368,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1), 6566368) + 0,
   55,'20950','TYM'),

  /* 12 – SXF257 – sin adicional (AP 25079 + FEP 20938, fac AP787643, 2 auxiliares) */
  ('2026-10-27','Martes','ALPINA',
   'FABIO RUIZ',
   'SXF257','25079','9604 MERCAMOS F','MONTENEGRO PTAPAO','JOSE ALEXANDER CONSTAIN PERLAZA, JUAN RICO',2,
   2,0,'-',
   8669214,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1), 8669214) + 0,
   61,'20938 AP787643','TYM'),

  /* 13 – TDY481 – sin adicional (AP 25062 + FEP 20949) */
  ('2026-10-27','Martes','ALPINA',
   'SANDRO ZULUAGA',
   'TDY481','25062','9605 F','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   4455703,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1), 4455703) + 0,
   35,'20949','TYM'),

  /* 14 – BCS450 – ADICIONAL AL FLETE $100.000 (AP 25063, fac AP786563) */
  ('2026-10-27','Martes','ALPINA',
   'CRISTIAN ZULUAGA',
   'BCS450','25063','9606','CIRCASIA','JHON WILSON GIRALDO CARVAJAL',1,
   1,100000,'ADICIONAL AL FLETE $100.000',
   3652100,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1), 3652100) + 100000,
   38,'AP786563','TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

  /* 15 – SMO183 – sin adicional (AP 25067) */
  ('2026-10-27','Martes','ALPINA',
   'GABRIEL PEREZ',
   'SMO183','25067','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6143317,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6143317) + 0,
   55,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional (AP 25068) */
  ('2026-10-27','Martes','ALPINA',
   'JULIAN CUELLAR',
   'VZD334','25068','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7278633,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7278633) + 0,
   47,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional (AP 25069, 2 auxiliares) */
  ('2026-10-27','Martes','ALPINA',
   'RICARDO LOPEZ',
   'TMZ674','25069','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, JHON FREDY MORENO',2,
   2,0,'-',
   7283608,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7283608) + 0,
   66,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional (AP 25070 + FEP 20951) */
  ('2026-10-27','Martes','ALPINA',
   'CARLOS VELASCO',
   'SPQ814','25070','9456 F','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5933001,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 5933001) + 0,
   53,'20951','TYM'),

  /* 19 – WHN317 – sin adicional (AP 25071) */
  ('2026-10-27','Martes','ALPINA',
   'HUMBERTO PARRA',
   'WHN317','25071','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   9655102,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 9655102) + 0,
   51,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional (AP 25072) */
  ('2026-10-27','Martes','ALPINA',
   'MIGUEL TABARES',
   'PEK019','25072','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,0,'-',
   7009914,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7009914) + 0,
   54,NULL,'TYM'),

  /* 21 – LUM993 – sin adicional (AP 25073, 2 auxiliares) */
  ('2026-10-27','Martes','ALPINA',
   'ANDRES',
   'LUM993','25073','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO, PABLO RAMIREZ',2,
   2,0,'-',
   9111382,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 9111382) + 0,
   67,NULL,'TYM'),

  /* 22 – TTL256 – sin adicional (AP 25074 25066, 2 auxiliares) */
  ('2026-10-27','Martes','ALPINA',
   'ANDRES QUINTERO',
   'TTL256','25074 25066','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, MARLON MURILLO',2,
   2,0,'-',
   12258514,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 12258514) + 0,
   60,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional (AP 25075) */
  ('2026-10-27','Martes','ALPINA',
   'ADALBERTO MEJIA',
   'TNH494','25075','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   5758753,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 5758753) + 0,
   48,NULL,'TYM'),

  /* 24 – SXE499 – sin adicional (AP 25080, 2 auxiliares) */
  ('2026-10-27','Martes','ALPINA',
   'ANDRES',
   'SXE499','25080','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, CRISTIAN GIRALDO',2,
   2,0,'-',
   4603711,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 4603711) + 0,
   31,NULL,'TYM'),

  /* ── ZONA OCCIDENTE ───────────────────────────────────────── */

  /* 25 – WTN748 – VALOR DE FLETE $480.000 (AP 25081, ARGELIA EL CAIRO, 2 auxiliares) */
  ('2026-10-27','Martes','ALPINA',
   'DIEGO RATIVA',
   'WTN748','25081','7005','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   10159944,
   480000,
   33,NULL,'TYM'),

  /* 26 – ERK303 – ADICIONAL AL FLETE $100.000 (AP 25049 25064 + FEP 20939 20940, 2 auxiliares) */
  ('2026-10-27','Martes','ALPINA',
   'JORGE ALARCON',
   'ERK303','25049 25064','7006 9450 F','SANTUARIO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,100000,'ADICIONAL AL FLETE $100.000',
   12719841,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1), 12719841) + 100000,
   48,'20939 20940','TYM'),

  /* 27 – JVM223 – sin adicional (AP 25065 25050) */
  ('2026-10-27','Martes','ALPINA',
   'WILMAR CARDONA',
   'JVM223','25065 25050','7007 9451 F','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   13041270,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1), 13041270) + 0,
   60,NULL,'TYM'),

  /* ── FLEISCHMANN ──────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional (FEP 20953, ARMENIA) */
  ('2026-10-27','Martes','FLEISCHMANN',
   'CARLOS CASTAÑO',
   'SQB119','20953','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   3455780,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 3455780) + 0,
   38,NULL,'TYM');

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
WHERE fecha = '2026-10-27'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
