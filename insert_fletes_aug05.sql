/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 5 AGOSTO 2026
   Generado: 2026-08-05
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-05'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 05‑Ago‑2026
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
  ('2026-08-05','Miércoles','ALPINA','JOHAN ECHEVERRY','SYU652','22624','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   7508762,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-08-05','Miércoles','ALPINA','FREDY','KOL802','22603 22625','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON, JHONNY LOPEZ',2,
   2,0,'-',
   13859234,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* 03 – WFV015 – EXTRA $60.000 con facturas AP */
  ('2026-08-05','Miércoles','ALPINA','YONNI VALENCIA','WFV015','22602 22626','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,60000,'WFV015 EXTRA $60.000',
   11916940,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   58,'AP709113 AP709114 9919903','TYM'),

  /* 04 – EYY183 – sin adicional */
  ('2026-08-05','Miércoles','ALPINA','JOHN ARENAS','EYY183','22627','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   7330570,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   50,'9919907 9919904 9919902','TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-08-05','Miércoles','ALPINA','MIGUEL GONZALES','SLI587','22628','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   6281414,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   43,'9919905','TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-08-05','Miércoles','ALPINA','RICARDO PINEDA','WGZ876','22629','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   9027266,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1) + 0,
   29,NULL,'TYM'),

  /* 07 – EYX091 – sin adicional */
  ('2026-08-05','Miércoles','ALPINA','ANDRES GOMEZ','EYX091','22586 22607','9558','AGUADAS PACORA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   17774067,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1) + 0,
   69,'9919908','TYM'),

  /* 08 – WEP384 – EXTRA $60.000 */
  ('2026-08-05','Miércoles','ALPINA','YOFER','WEP384','22630','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'WEP384 EXTRA $60.000',
   11191446,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 60000,
   47,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 09 – ETM037 – sin adicional */
  ('2026-08-05','Miércoles','ALPINA','OSCAR MARIN','ETM037','22613 22631','9601','ARMENIA','YEISON DAVID RENDON SOTO, OSCAR MAURICIO RESTREPO MORENO',2,
   2,0,'-',
   9495728,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 10 – VZD334 – EXTRA $40.000 */
  ('2026-08-05','Miércoles','ALPINA','JULIAN CUELLAR','VZD334','22605 22632','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, CARLOS JIMENEZ',2,
   2,40000,'VZD334 EXTRA $40.000',
   10373853,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 40000,
   63,'9919897','TYM'),

  /* 11 – EQY944 – sin adicional */
  ('2026-08-05','Miércoles','ALPINA','GOBER CRISTANCHO','EQY944','22633','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   1049065,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   65,'9919898','TYM'),

  /* 12 – SXF257 – EXTRA $60.000 super otra ciudad */
  ('2026-08-05','Miércoles','ALPINA','FABIO RUIZ','SXF257','22606 22634','9604','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS, SAMUEL ANDRES ARIAS',2,
   2,60000,'SXF257 EXTRA $60.000 SUPER OTRA CIUDAD',
   12240711,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 60000,
   41,NULL,'TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-08-05','Miércoles','ALPINA','HUMBERTO RINCON','WLS478','22608','9605','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   6590301,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1) + 0,
   41,'9919910 9919911 9919912','TYM'),

  /* 14 – TTL256 – con facturas AP */
  ('2026-08-05','Miércoles','ALPINA','ANDRES QUINTERO','TTL256','22609','9606','SALENTO','CRISTIAN FABIAN CAMACHO MARTINEZ, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   12772709,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1) + 0,
   36,'AP709865 AP710018 9919894','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-08-05','Miércoles','ALPINA','GABRIEL PEREZ','SMO183','22615','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   7357797,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 16 – SPU120 – sin adicional (zona 9454) */
  ('2026-08-05','Miércoles','ALPINA','OSWALDO','SPU120','22616','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7643072,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   47,'9919913','TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-08-05','Miércoles','ALPINA','RICARDO LOPEZ','TMZ674','22617','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, JHON FREDY MORENO',2,
   2,0,'-',
   11886069,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   69,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-08-05','Miércoles','ALPINA','CARLOS VELASCO','SPQ814','22604 22618','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   8822897,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 19 – WHM896 – sin adicional */
  ('2026-08-05','Miércoles','ALPINA','ALEXANDER CUELLAR','WHM896','22619','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7906660,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-08-05','Miércoles','ALPINA','MIGUEL TABARES','PEK019','22620','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   7831107,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 21 – XVI496 – sin adicional */
  ('2026-08-05','Miércoles','ALPINA','PABLO RAMIREZ','XVI496','22621','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   8276075,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-08-05','Miércoles','ALPINA','JULIAN','WLC133','22622','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, DANIELA CASTIBLANCO',2,
   2,0,'-',
   9209402,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   79,NULL,'TYM'),

  /* 23 – TNH494 – con factura AP */
  ('2026-08-05','Miércoles','ALPINA','ADALBERTO MEJIA','TNH494','22623','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   11161178,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   53,'AP710017','TYM'),

  /* 24 – WTN748 – sin adicional */
  ('2026-08-05','Miércoles','ALPINA','DIEGO RATIVA','WTN748','22635','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   10189451,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   68,'9919914','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – EST067 – con factura AP */
  ('2026-08-05','Miércoles','ALPINA','JORGE RIVILLAS','EST067','22636','7005','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   9242236,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARGELIA EL CAIRO' LIMIT 1) + 0,
   39,'AP710020 9919893','TYM'),

  /* 26 – ERK303 – sin adicional */
  ('2026-08-05','Miércoles','ALPINA','JORGE ALARCON','ERK303','22610','7006','BALBOA LA CELIA','ROVINSON TORRES RIVERA',1,
   1,0,'-',
   8090218,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1) + 0,
   41,'9919899','TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-08-05','Miércoles','ALPINA','WILMAR CARDONA','JVM223','22600 22611','7007 9451','ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   16757295,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1) + 0,
   51,'9919892','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-08-05','Miércoles','FLEISCHMANN','CARLOS CASTAÑO','SQB119','9919901 9919900','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   6065570,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   54,NULL,'TYM');

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
WHERE fecha = '2026-08-05'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
