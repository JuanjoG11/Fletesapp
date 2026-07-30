/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 15 JULIO 2026
   Generado: 2026-07-15
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-15'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 15‑Jul‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – ETM037 – VALOR DE FLETE $430.000 */
  ('2026-07-15','Miércoles','ALPINA','OSCAR MARIN','ETM037','21995 22004','7000 7001','MANIZALES VILLAMARIA','ANDRES MATEO VILLALBA DIAZ',1,
   1,0,'ETM037 VALOR DE FLETE $430.000',
   21495444,
   430000,
   5,NULL,'TYM'),

  /* 02 – SYU652 – con factura FEP */
  ('2026-07-15','Miércoles','ALPINA','JOHAN ECHEVERRY','SYU652','22014','9552','MANIZALES VILLAMARIA','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   6459721,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   47,'FEP1189734 19606','TYM'),

  /* 03 – KOL802 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','FREDY','KOL802','22015','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   7758311,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   54,'19607','TYM'),

  /* 04 – WFV015 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','YONNI VALENCIA','WFV015','22016','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   7428525,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   60,'19608','TYM'),

  /* 05 – EYY183 – con facturas FEP */
  ('2026-07-15','Miércoles','ALPINA','JOHN ARENAS','EYY183','22017','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   8362452,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   48,'FEP1189666-672','TYM'),

  /* 06 – SLI587 – ADICIONAL $30.000 SE DEBÍAN ENTREGA TSS */
  ('2026-07-15','Miércoles','ALPINA','MIGUEL GONZALES','SLI587','22018','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,30000,'SLI587 ADICIONAL AL FLETE $30.000 SE LE DEBIAN ENTREGA DE TSS',
   4481432,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 30000,
   36,NULL,'TYM'),

  /* 07 – WGZ876 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','RICARDO PINEDA','WGZ876','22019','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ, CAMILO SUAREZ GARCIA',2,
   2,0,'-',
   13019895,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1) + 0,
   30,NULL,'TYM'),

  /* 08 – EYX091 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','CARLOS GOMEZ','EYX091','22003 21990','9558','AGUADAS PACORA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   15509385,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1) + 0,
   78,'19612','TYM'),

  /* 09 – TRL186 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','WILLIAM','TRL186','22020','9559','PALESTINA ARAUCA','BRANDON STEVEN GIL BAEZ, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   10306328,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PALESTINA ARAUCA' LIMIT 1) + 0,
   52,'19613','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 10 – WEP384 – VALOR DE FLETE $400.000 */
  ('2026-07-15','Miércoles','ALPINA','YOFER','WEP384','21962','AV/COLON GALERIA N','CALARCA','',0,
   0,0,'WEP384 VALOR DE FLETE $400.000',
   7327530,
   400000,
   2,NULL,'TYM'),

  /* 11 – MAT480 – VALOR DE FLETE $700.000 */
  ('2026-07-15','Miércoles','ALPINA','ELKIN AGUIRRE','MAT480','','LA19 LA50 LAPATRIA N','ARMENIA','JHON FREDY MORENO',1,
   1,0,'MAT480 VALOR DE FLETE $700.000',
   15478370,
   700000,
   3,'AP687900 AP687894 AP687895','TYM'),

  /* 12 – SPU120 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','OSWALDO','SPU120','21996 22021','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   8324406,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 13 – VZD334 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','JULIAN CUELLAR','VZD334','22022','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, CARLOS JIMENEZ',2,
   2,0,'-',
   6656539,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   58,'19621','TYM'),

  /* 14 – EQY944 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','GOBER CRISTANCHO','EQY944','22023','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   8070889,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 15 – SXF257 – ADICIONAL $100.000 ENTREGA NEGOCIACION QUIMBAYA */
  ('2026-07-15','Miércoles','ALPINA','FABIO RUIZ','SXF257','21997 22024','9604 7010','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS, SEBASTIAN MONTES',2,
   2,100000,'SXF257 ADICIONAL AL FLETE $100.000 ENTREGA DE NEGOCIACION QUIMBAYA',
   11616590,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 100000,
   46,'AP687902','TYM'),

  /* 16 – WLS478 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','HUMBERTO RINCON','WLS478','21998','9605','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   7380077,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1) + 0,
   44,'19615 19616','TYM'),

  /* 17 – SMH182 – con facturas AP */
  ('2026-07-15','Miércoles','ALPINA','CRISTIAN','SMH182','21999','9606','SALENTO','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   12247975,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1) + 0,
   37,'AP689120-121 19614','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 18 – SMO183 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','GABRIEL PEREZ','SMO183','22005','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6573095,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 19 – WHM896 – sin adicional (zona 9454 hoy) */
  ('2026-07-15','Miércoles','ALPINA','ALEXANDER CUELLAR','WHM896','22006','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   8426623,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,'19618','TYM'),

  /* 20 – TMZ674 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','RICARDO LOPEZ','TMZ674','22007','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   8083489,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   66,NULL,'TYM'),

  /* 21 – SPQ814 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','CARLOS VELASCO','SPQ814','22008','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   7734456,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 22 – WHM317 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','HUMBERTO PARRA','WHM317','22009','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7852407,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 23 – PEK019 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','MIGUEL TABARES','PEK019','22010','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   5308147,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 24 – XVI496 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','PABLO RAMIREZ','XVI496','22011','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   5845294,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 25 – WLC133 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','JULIAN','WLC133','22012','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, JUAN LARGO',2,
   2,0,'-',
   6936827,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   69,NULL,'TYM'),

  /* 26 – TNH494 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','ADALBERTO MEJIA','TNH494','22002 22013','9461 9450','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   8779161,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 27 – WTN748 – con factura FEP */
  ('2026-07-15','Miércoles','ALPINA','DIEGO RATIVA','WTN748','22025','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   8859252,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   65,'FEP1189677 19619','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 28 – EST067 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','JORGE RIVILLAS','EST067','22026','7005','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   11084064,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARGELIA EL CAIRO' LIMIT 1) + 0,
   36,NULL,'TYM'),

  /* 29 – ERK303 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','JORGE ALARCON','ERK303','22000','7006','BALBOA LA CELIA','ROVINSON TORRES RIVERA',1,
   1,0,'-',
   8260902,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1) + 0,
   42,'19602','TYM'),

  /* 30 – JVM223 – sin adicional */
  ('2026-07-15','Miércoles','ALPINA','WILMAR CARDONA','JVM223','21993 22001','7007 9451','ANSERMA','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   14373180,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1) + 0,
   56,'19605','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 31 – SQB119 – sin adicional */
  ('2026-07-15','Miércoles','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19603 19617','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   4864418,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
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
WHERE fecha = '2026-07-15'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
