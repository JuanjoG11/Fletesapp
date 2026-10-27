/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: SÁBADO 24 OCTUBRE 2026
   Generado: 2026-10-24

   Notas:
     - SMH182   VALOR DE FLETE $800.000 (7001 LECHE, sin planilla, facs AP786620 AP786619)
     - EQN953   VALOR DE FLETE $450.000 (7001, sin planilla, facs AP786290 AP786618 AP786291)
     - SYU652   EXTRA $60.000 (AP 25009 + FEP 20931, fac AP784904)
     - WFR160   ADICIONAL AL FLETE $100.000 (AP 25010 + FEP 20928, fac AP786617)
     - TRK507   EXTRA $60.000 (AP 25003 25013 + FEP 20934)
     - SXF257   ADICIONAL AL FLETE $200.000 (AP 25007 25041 + FEP 20925)
     - WTN748   VALOR DE FLETE $480.000 (AP 25043, EL AGUILA)
     - TTL256   CHINCHINA, fac AP785171 (AP 25004 25016)
     - WFV015   fac AP786289 (AP 25038)
     - EQY944   fac AP786288 (AP 25040)
     - SQB119   FLEISCHMANN S/ROSA-D/BRADAS (FEP 20930)
     - MAT480   zona 7006 PUEBLO RICO (AP 25019 + FEP 20926)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-24'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 24‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

  /* 01 – SMH182 – VALOR DE FLETE $800.000 (7001 LECHE, sin planilla, facs AP786620 AP786619) */
  ('2026-10-24','Sábado','ALPINA',
   'ANDRES QUINTERO',
   'SMH182','-','7001 LECHE','MANIZALES VILLAMARIA',NULL,0,
   0,0,'-',
   18072000,
   800000,
   2,'AP786620 AP786619','TYM'),

  /* 02 – EQN953 – VALOR DE FLETE $450.000 (7001, sin planilla, facs AP786290 AP786618 AP786291) */
  ('2026-10-24','Sábado','ALPINA',
   'ORLANDO VASQUEZ',
   'EQN953','-','7001','MANIZALES VILLAMARIA','JORGE RIVILLAS',1,
   1,0,'-',
   14152895,
   450000,
   3,'AP786290 AP786618 AP786291','TYM'),

  /* 03 – SYU652 – EXTRA $60.000 (AP 25009 + FEP 20931, fac AP784904) */
  ('2026-10-24','Sábado','ALPINA',
   'JOHAN ECHEVERRY',
   'SYU652','25009','9552 F','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,60000,'EXTRA $60.000',
   5014705,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5014705) + 60000,
   44,'20931 AP784904','TYM'),

  /* 04 – WFR160 – ADICIONAL AL FLETE $100.000 (AP 25010 + FEP 20928, fac AP786617) */
  ('2026-10-24','Sábado','ALPINA',
   'LEANDRO LOPEZ',
   'WFR160','25010','9553 PARQUE F','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,100000,'ADICIONAL AL FLETE $100.000',
   7999162,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7999162) + 100000,
   52,'20928 AP786617','TYM'),

  /* 05 – EYX091 – sin adicional (AP 25023 25011 + FEP 20932, 2 auxiliares) */
  ('2026-10-24','Sábado','ALPINA',
   'ANDRES GOMEZ',
   'EYX091','25023 25011','9554 7000 F','MANIZALES VILLAMARIA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   9459225,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 9459225) + 0,
   58,'20932','TYM'),

  /* 06 – SPU120 – sin adicional (AP 25012 + FEP 20935 20933) */
  ('2026-10-24','Sábado','ALPINA',
   'OSWALDO',
   'SPU120','25012','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6183438,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6183438) + 0,
   50,'20935 20933','TYM'),

  /* 07 – TRK507 – EXTRA $60.000 (AP 25003 25013 + FEP 20934) */
  ('2026-10-24','Sábado','ALPINA',
   'MIGUEL GONZALES',
   'TRK507','25003 25013','9556 E7000 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,60000,'EXTRA $60.000',
   8864811,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 8864811) + 60000,
   49,'20934','TYM'),

  /* 08 – WEP384 – sin adicional (AP 25025 25014 + FEP 20909, 2 auxiliares) */
  ('2026-10-24','Sábado','ALPINA',
   'YOFER LOPEZ',
   'WEP384','25025 25014','9557 9559 F','QUINCHIA','ELKIN GARCIA OCAMPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   12287022,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUINCHIA' LIMIT 1), 12287022) + 0,
   52,'20909','TYM'),

  /* 09 – TTL256 – sin adicional (AP 25004 25016, fac AP785171, 2 auxiliares) */
  ('2026-10-24','Sábado','ALPINA',
   'ANDRES QUINTERO',
   'TTL256','25004 25016','9559 E7000 MILPAS','CHINCHINA','BRANDON STEVEN GIL BAEZ, CRISTIAN GIRALDO',2,
   2,0,'-',
   11040145,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1), 11040145) + 0,
   82,'AP785171','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ───────────────────────────────── */

  /* 10 – WFV015 – sin adicional (AP 25038, fac AP786289) */
  ('2026-10-24','Sábado','ALPINA',
   'YONNI VALENCIA',
   'WFV015','25038','9601 PATRIA','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   5124250,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 5124250) + 0,
   53,'AP786289','TYM'),

  /* 11 – TJX795 – sin adicional (AP 25039 + FEP 20923, 2 auxiliares) */
  ('2026-10-24','Sábado','ALPINA',
   'ANDRES QUINTERO',
   'TJX795','25039','9602 F','ARMENIA','YERFREY FLOWER, SAMUEL ARIAS',2,
   2,0,'-',
   8551487,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 8551487) + 0,
   64,'20923','TYM'),

  /* 12 – EQY944 – sin adicional (AP 25040, fac AP786288, 2 auxiliares) */
  ('2026-10-24','Sábado','ALPINA',
   'GOBER CRISTANCHO',
   'EQY944','25040','9603 HOREB','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, JUAN RICO',2,
   2,0,'-',
   9521352,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 9521352) + 0,
   62,'AP786288','TYM'),

  /* 13 – SXF257 – ADICIONAL AL FLETE $200.000 (AP 25007 25041 + FEP 20925) */
  ('2026-10-24','Sábado','ALPINA',
   'FABIO RUIZ',
   'SXF257','25007 25041','9604 7008 F','QUIMBAYA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,200000,'ADICIONAL AL FLETE $200.000',
   5867569,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1), 5867569) + 200000,
   38,'20925','TYM'),

  /* 14 – WLS478 – sin adicional (AP 25017) */
  ('2026-10-24','Sábado','ALPINA',
   'HUMBERTO RINCON',
   'WLS478','25017','9605','GENOVA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   4509804,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GENOVA' LIMIT 1), 4509804) + 0,
   32,NULL,'TYM'),

  /* 15 – WHM896 – sin adicional (AP 25018, 2 auxiliares) */
  ('2026-10-24','Sábado','ALPINA',
   'ALEXANDER CUELLAR',
   'WHM896','25018','9606','CAIMO BARCELONA','JHON WILSON GIRALDO CARVAJAL, MARLON MURILLO',2,
   2,0,'-',
   7383269,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAIMO BARCELONA' LIMIT 1), 7383269) + 0,
   55,NULL,'TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

  /* 16 – SMO183 – sin adicional (AP 25029) */
  ('2026-10-24','Sábado','ALPINA',
   'GABRIEL PEREZ',
   'SMO183','25029','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6537261,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6537261) + 0,
   51,NULL,'TYM'),

  /* 17 – VZD334 – sin adicional (AP 25030) */
  ('2026-10-24','Sábado','ALPINA',
   'JULIAN CUELLAR',
   'VZD334','25030','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   6258244,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6258244) + 0,
   50,NULL,'TYM'),

  /* 18 – TMZ674 – sin adicional (AP 25031) */
  ('2026-10-24','Sábado','ALPINA',
   'RICARDO LOPEZ',
   'TMZ674','25031','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5358438,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5358438) + 0,
   54,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional (AP 25032) */
  ('2026-10-24','Sábado','ALPINA',
   'CARLOS VELASCO',
   'SPQ814','25032','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5391781,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 5391781) + 0,
   49,NULL,'TYM'),

  /* 20 – BCS450 – sin adicional (AP 25033) */
  ('2026-10-24','Sábado','ALPINA',
   'CRISTIAN ZULUAGA',
   'BCS450','25033','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   5284070,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5284070) + 0,
   52,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional (AP 25034) */
  ('2026-10-24','Sábado','ALPINA',
   'MIGUEL TABARES',
   'PEK019','25034','9458','PEREIRA - DOSQUEBRADAS','JHON FREDY MORENO',1,
   1,0,'-',
   4682557,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 4682557) + 0,
   45,NULL,'TYM'),

  /* 22 – LUM993 – sin adicional (AP 25035, 2 auxiliares) */
  ('2026-10-24','Sábado','ALPINA',
   'PABLO RAMIREZ',
   'LUM993','25035','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO, PABLO RAMIREZ',2,
   2,0,'-',
   7506522,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7506522) + 0,
   59,NULL,'TYM'),

  /* 23 – WLC133 – sin adicional (AP 25036) */
  ('2026-10-24','Sábado','ALPINA',
   'GABRIEL PEREZ',
   'WLC133','25036','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES',1,
   1,0,'-',
   5375245,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5375245) + 0,
   57,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional (AP 25005) */
  ('2026-10-24','Sábado','ALPINA',
   'ADALBERTO MEJIA',
   'TNH494','25005','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   7711822,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 7711822) + 0,
   52,NULL,'TYM'),

  /* 25 – SXE499 – sin adicional (AP 25042) */
  ('2026-10-24','Sábado','ALPINA',
   'ANDRES',
   'SXE499','25042','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   7105831,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7105831) + 0,
   59,NULL,'TYM'),

  /* ── ZONA OCCIDENTE ───────────────────────────────────────── */

  /* 26 – WTN748 – VALOR DE FLETE $480.000 (AP 25043, EL AGUILA) */
  ('2026-10-24','Sábado','ALPINA',
   'DIEGO RATIVA',
   'WTN748','25043','7005','EL AGUILA','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   6025931,
   480000,
   23,NULL,'TYM'),

  /* 27 – MAT480 – sin adicional (AP 25019 + FEP 20926, zona 7006 PUEBLO RICO) */
  ('2026-10-24','Sábado','ALPINA',
   'ELKIN AGUIRRE',
   'MAT480','25019','7006 F','PUEBLO RICO','ROVINSON TORRES RIVERA',1,
   1,0,'-',
   7696391,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PUEBLO RICO' LIMIT 1), 7696391) + 0,
   34,'20926','TYM'),

  /* 28 – JVM223 – sin adicional (AP 25020 + FEP 20929, 2 auxiliares) */
  ('2026-10-24','Sábado','ALPINA',
   'WILMAR CARDONA',
   'JVM223','25020','7007 F','GUATICA ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   12403262,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GUATICA ANSERMA' LIMIT 1), 12403262) + 0,
   67,'20929','TYM'),

  /* ── FLEISCHMANN ──────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional (FEP 20930, SANTA ROSA - DOSQUEBRADAS) */
  ('2026-10-24','Sábado','FLEISCHMANN',
   'CARLOS CASTAÑO',
   'SQB119','20930','FLEISCHMANN','SANTA ROSA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   4775568,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 4775568) + 0,
   51,NULL,'TYM');

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
WHERE fecha = '2026-10-24'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
