/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 28 JULIO 2026
   Generado: 2026-07-28
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: EYX091 aparece dos veces (lunes Aranzazu + martes Supia Riosucio)
         SQB119 incluye pedido Alpina $30.000 adicional
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-28'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 28‑Jul‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – SYU652 – sin adicional */
  ('2026-07-28','Martes','ALPINA','JOHAN ECHEVERRY','SYU652','22369','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   7810895,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   66,NULL,'TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-07-28','Martes','ALPINA','FREDY','KOL802','22370','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   5180668,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 03 – WFV015 – sin adicional */
  ('2026-07-28','Martes','ALPINA','YONNI VALENCIA','WFV015','22347 22371','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   9217632,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   60,'9919776','TYM'),

  /* 04 – EYY183 – sin adicional */
  ('2026-07-28','Martes','ALPINA','JOHN ARENAS','EYY183','22372','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6871693,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   63,'9919777 9919775','TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-07-28','Martes','ALPINA','MIGUEL GONZALES','SLI587','22345 22373','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   8203636,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-07-28','Martes','ALPINA','RICARDO PINEDA','WGZ876','22374','9557','SUPIA','JUAN MANUEL DELGADO NARVAEZ',1,
   1,0,'-',
   8983617,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 0,
   39,NULL,'TYM'),

  /* 07 – EYX091 (LUNES) – Aranzazu Filadelfia */
  ('2026-07-28','Martes','ALPINA','ANDRES GOMEZ','EYX091','22322','9558','ARANZAZU FILADELFIA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   5676702,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARANZAZU FILADELFIA' LIMIT 1) + 0,
   52,'9919771','TYM'),

  /* 08 – EYX091 (MARTES) – Supia Riosucio Super */
  ('2026-07-28','Martes','ALPINA','ANDRES GOMEZ','EYX091','22346','9560','RIOSUCIO-SUPIA SUPERMERCADO','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   12864576,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 0,
   10,NULL,'TYM'),

  /* 09 – WEP384 – sin adicional */
  ('2026-07-28','Martes','ALPINA','YOFER','WEP384','22353 22376','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,0,'-',
   6824195,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   64,'9919778','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 10 – ETM037 – sin adicional */
  ('2026-07-28','Martes','ALPINA','OSCAR MARIN','ETM037','22377','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   7011243,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 11 – VZD334 – EXTRA $40.000 SUPER FUERA DE RUTA */
  ('2026-07-28','Martes','ALPINA','JULIAN CUELLAR','VZD334','22378','9602','ARMENIA','SANTIAGO HENAO MORALES, CARLOS JIMENEZ',2,
   2,40000,'VZD334 EXTRA $40.000 SUPER FUERA DE RUTA',
   7345960,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 40000,
   66,'AP701419','TYM'),

  /* 12 – EQY944 – sin adicional */
  ('2026-07-28','Martes','ALPINA','GOBER CRISTANCHO','EQY944','22379','9603','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA, SEBASTIAN MONTES',2,
   2,0,'-',
   8172418,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   66,'9919780 9919781 9919783','TYM'),

  /* 13 – SXF257 – con facturas AP */
  ('2026-07-28','Martes','ALPINA','FABIO RUIZ','SXF257','22380','9604','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS, OSCAR MAURICIO RESTREPO MORENO',2,
   2,0,'-',
   8937821,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   56,'AP701421 AP701420 9919779','TYM'),

  /* 14 – WLS478 – sin adicional */
  ('2026-07-28','Martes','ALPINA','HUMBERTO RINCON','WLS478','22356','9605','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   6494920,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   49,'9919782','TYM'),

  /* 15 – TTL256 – sin adicional */
  ('2026-07-28','Martes','ALPINA','ANDRES QUINTERO','TTL256','22357','9606','CIRCASIA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   3298952,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   34,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 16 – SMO183 – sin adicional */
  ('2026-07-28','Martes','ALPINA','GABRIEL PEREZ','SMO183','22360','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   7259220,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 17 – SPU120 – sin adicional (zona 9454 hoy) */
  ('2026-07-28','Martes','ALPINA','OSWALDO','SPU120','22361','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   9070003,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 18 – TMZ674 – sin adicional */
  ('2026-07-28','Martes','ALPINA','RICARDO LOPEZ','TMZ674','22362','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, CAMILO SUAREZ GARCIA',2,
   2,0,'-',
   6967063,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   69,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional */
  ('2026-07-28','Martes','ALPINA','CARLOS VELASCO','SPQ814','22363','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6442666,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 20 – DQA454 – sin adicional */
  ('2026-07-28','Martes','ALPINA','LUIS MONTOYA','DQA454','22364','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7806555,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional */
  ('2026-07-28','Martes','ALPINA','MIGUEL TABARES','PEK019','22365','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   7095078,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 22 – XVI496 – sin adicional */
  ('2026-07-28','Martes','ALPINA','PABLO RAMIREZ','XVI496','22366','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA, JHON FREDY MORENO',2,
   2,0,'-',
   10822418,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   70,NULL,'TYM'),

  /* 23 – WLC133 – sin adicional */
  ('2026-07-28','Martes','ALPINA','JULIAN','WLC133','22367','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, JUAN LARGO',2,
   2,0,'-',
   10072019,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional */
  ('2026-07-28','Martes','ALPINA','ADALBERTO MEJIA','TNH494','22368','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   6295280,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 25 – WTN748 – EXTRA $60.000 AEROPUERTO */
  ('2026-07-28','Martes','ALPINA','DIEGO RATIVA','WTN748','22381','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,60000,'WTN748 EXTRA $60.000 AEROPUERTO',
   9883088,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   60,NULL,'TYM'),

  /* 26 – TUL630 – sin adicional (La Virginia, lo lleva Diego supervisor) */
  ('2026-07-28','Martes','ALPINA','JUAN','TUL630','22344','9450','CARTAGO 2T','',0,
   0,0,'-',
   2301763,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   3,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 27 – EST067 – sin adicional */
  ('2026-07-28','Martes','ALPINA','JORGE RIVILLAS','EST067','22382','7005','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   7846411,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARGELIA EL CAIRO' LIMIT 1) + 0,
   33,NULL,'TYM'),

  /* 28 – ERK303 – sin adicional */
  ('2026-07-28','Martes','ALPINA','JORGE ALARCON','ERK303','22358','7006','SANTUARIO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   16905542,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1) + 0,
   53,'9919784 9919773','TYM'),

  /* 29 – JVM223 – sin adicional */
  ('2026-07-28','Martes','ALPINA','WILMAR CARDONA','JVM223','22352 22359','7007','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   12612176,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   61,'9919785','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 30 – SQB119 – ADICIONAL $30.000 PEDIDO ALPINA */
  ('2026-07-28','Martes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','22314 9919774','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,30000,'SQB119 ADICIONAL $30.000 PEDIDO ALPINA',
   8308422,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 30000,
   53,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha,
       placa,
       zona,
       poblacion,
       precio                      AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos,
       facturas_adicionales,
       proveedor
FROM fletes
WHERE fecha = '2026-07-28'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
