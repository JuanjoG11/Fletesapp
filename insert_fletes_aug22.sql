/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: SÁBADO 22 AGOSTO 2026
   Generado: 2026-08-22
   ✅ Nombres de auxiliares normalizados según lista oficial
   Notas:
     - WGZ876  VALOR DE FLETE $650.000 (precio fijo)
     - WEP384  EXTRA $60.000
     - EQN953  VALOR DE FLETE $400.000 (precio fijo)
     - JHONNY LOPEZ       → YHONY ALEXANDER LOPEZ LOPEZ
     - SAMUEL ARIAS       → SAMUEL ANDRES ARIAS ARCILA
     - VALENTINA GARCIA   → VALENTINA GARCIA GOMEZ
     - DANIELA CASTIBLANCO → DANIELA CASTIBLANCO RAMIREZ
     - MANUEL RAMIREZ     → MANUEL ALEJANDRO RAMIREZ OVALLE
     - DIEGO FRANCO       → JUAN DIEGO FRANCO VERGARA
     - QUEBIN LOTERO: no está en lista oficial ALPINA
     - SQB119 FLEISCHMANN: población SANTA ROSA (S/ROSA-D/BRADAS)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-22'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 22‑Ago‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – WGZ876 – VALOR DE FLETE $650.000 */
  ('2026-08-22','Sabado','ALPINA','RICARDO PINEDA','WGZ876','23144 23104 23110','7000 7001 DELCAMPO/FLORIDA/PRADERA/PALERMO','MANIZALES VILLAMARIA','JHON FREDY MORENO',1,
   1,0,'VALOR DE FLETE $650.000',
   21251617,
   650000,
   4,'AP725609 AP725610','TYM'),

  /* 02 – SYU652 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','JOHAN ECHEVERRY','SYU652','23108 23122 20132','9552 9550 DELCENTRO','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   13528951,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   51,'FEP1192852','TYM'),

  /* 03 – KOL802 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','FREDY','KOL802','23123 20131 20133','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   9443768,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   66,NULL,'TYM'),

  /* 04 – WFV015 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','YONNI VALENCIA','WFV015','23136 20134','9554 MERCAPLAZA','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   10356985,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   57,'AP725608','TYM'),

  /* 05 – SPU120 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','OSWALDO','SPU120','23137 20138','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN, YHONY ALEXANDER LOPEZ LOPEZ',2,
   2,0,'-',
   10372559,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   67,'FEP1192867-875-877','TYM'),

  /* 06 – SLI587 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','MIGUEL GONZALES','SLI587','23111 23138 20136','9556 E7000 RECREACION','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   8913474,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   36,NULL,'TYM'),

  /* 07 – WFQ635 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','JHENCI LOPEZ','WFQ635','23145 23125 20122','9557 9559 MANUELA','QUINCHIA','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   14443623,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUINCHIA' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 08 – WEP384 – EXTRA $60.000 */
  ('2026-08-22','Sabado','ALPINA','YOFER LOPEZ','WEP384','23105 23112 23126','9559 7002 E7000 GAMERO ESTACION','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'WEP384 EXTRA $60.000',
   10912089,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 60000,
   80,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 09 – ETM037 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','OSCAR MARIN','ETM037','23106 23140','9601 7008 RINDEMAX','ARMENIA','YEISON DAVID RENDON SOTO, SAMUEL ANDRES ARIAS ARCILA',2,
   2,0,'-',
   8389991,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 10 – TJX795 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','ANDRES QUINTERO','TJX795','23141 20143','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, VALENTINA GARCIA GOMEZ',2,
   2,0,'-',
   10808345,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 11 – EQN953 – VALOR DE FLETE $400.000 */
  ('2026-08-22','Sabado','ALPINA','ORLANDO VASQUEZ','EQN953','23107 23142','9603 7010 HOREB','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, SANTIAGO HENAO MORALES',2,
   2,0,'VALOR DE FLETE $400.000',
   10308652,
   400000,
   59,NULL,'TYM'),

  /* 12 – SXF257 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','FABIO RUIZ','SXF257','23025 23120 20139','9604 7010 MERCAHOGAR','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS',1,
   1,0,'-',
   5329153,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 0,
   39,NULL,'TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','HUMBERTO RINCON','WLS478','23115','9605','GENOVA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   5733556,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GENOVA' LIMIT 1) + 0,
   34,NULL,'TYM'),

  /* 14 – EQY944 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','GOBER CRISTANCHO','EQY944','23116','9606','CAIMO BARCELONA','OSCAR MAURICIO RESTREPO MORENO, DANIELA CASTIBLANCO RAMIREZ',2,
   2,0,'-',
   7549223,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAIMO BARCELONA' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','GABRIEL PEREZ','SMO183','23127','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   7325737,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','JULIAN CUELLAR','VZD334','23128','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   8661205,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','RICARDO LOPEZ','TMZ674','23129','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5290697,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   35,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','CARLOS VELASCO','SPQ814','23130','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6774563,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   61,NULL,'TYM'),

  /* 19 – LUM993 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','PABLO RAMIREZ','LUM993','23131','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   6922633,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','MIGUEL TABARES','PEK019','23132','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   6358650,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 21 – TTL256 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','ANDRES QUINTERO','TTL256','23133','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   6862138,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','JULIAN','WLC133','23134','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   6107740,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','ADALBERTO MEJIA','TNH494','23135','9461','CARTAGO','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   6380656,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 24 – WTN748 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','DIEGO RATIVA','WTN748','23143 20140','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, QUEBIN LOTERO',2,
   2,0,'-',
   9716468,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – EST067 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','JORGE RIVILLAS','EST067','23117','7005','EL AGUILA VILLA NUEVA','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   10698674,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='EL AGUILA VILLA NUEVA' LIMIT 1) + 0,
   28,NULL,'TYM'),

  /* 26 – ERK303 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','JORGE ALARCON','ERK303','23118 20141','7006','SANTA CECILIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   15113227,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA CECILIA' LIMIT 1) + 0,
   40,NULL,'TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-08-22','Sabado','ALPINA','WILMAR CARDONA','JVM223','23119 20142','7007','GUATICA ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL ALEJANDRO RAMIREZ OVALLE',2,
   2,0,'-',
   12674413,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GUATICA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-08-22','Sabado','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20130','FLEISCHMANN','SANTA ROSA','JUAN DIEGO FRANCO VERGARA',1,
   1,0,'-',
   5740847,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   56,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-08-22'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
