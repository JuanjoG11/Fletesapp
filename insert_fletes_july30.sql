/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 30 JULIO 2026
   Generado: 2026-07-30
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-30'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 30‑Jul‑2026
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
  ('2026-07-30','Jueves','ALPINA','JOHAN ECHEVERRY','SYU652','22462','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   6820110,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   50,'9919796 9919814','TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-07-30','Jueves','ALPINA','FREDY','KOL802','22463','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   6141754,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   46,'9919820 9919815','TYM'),

  /* 03 – EYX091 – sin adicional */
  ('2026-07-30','Jueves','ALPINA','CARLOS GOMEZ','EYX091','22451','9554','NEIRA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   8258957,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1) + 0,
   60,'9919816','TYM'),

  /* 04 – EYY183 – con factura AP */
  ('2026-07-30','Jueves','ALPINA','JOHN ARENAS','EYY183','22465','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   9421430,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   52,'AP702888 9919817 9919811','TYM'),

  /* 05 – SLI587 – EXTRA $50.000 */
  ('2026-07-30','Jueves','ALPINA','MIGUEL GONZALES','SLI587','22448 22466','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,50000,'SLI587 EXTRA $50.000',
   12066237,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 50000,
   57,'9919818','TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-07-30','Jueves','ALPINA','RICARDO PINEDA','WGZ876','22467','9557','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   13542673,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1) + 0,
   58,'9919796','TYM'),

  /* 07 – TRL186 – sin adicional (Supercentro Manizales) */
  ('2026-07-30','Jueves','ALPINA','WILLIAM','TRL186','22477','DELCAMPO LAFLORIDA LA PRADERA','MANIZALES VILLAMARIA','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   19410309,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   3,'AP704292 AP704303','TYM'),

  /* 08 – WEP384 – EXTRA $60.000 */
  ('2026-07-30','Jueves','ALPINA','YOFER','WEP384','22469','9559','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'WEP384 EXTRA $60.000',
   11363199,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RDA S JOSE BELALCAZAR' LIMIT 1) + 60000,
   56,'9919821','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 09 – MAT480 – VALOR FLETE $600.000 */
  ('2026-07-30','Jueves','ALPINA','ELKIN AGUIRRE','MAT480','','TJARAMILLO MERCQUIMB LAGUAIRA','MONTENEGRO PTAPAO','JHON FREDY MORENO',1,
   1,0,'MAT480 VALOR FLETE $600.000',
   8491420,
   600000,
   3,'AP702940 AP702943 AP702942','TYM'),

  /* 10 – TUL630 – EXTRA $60.000 DESCARGUE (sin T VALOR en planilla) */
  ('2026-07-30','Jueves','ALPINA','JUAN','TUL630','22437 22401','7008','CALARCA','',0,
   0,60000,'TUL630 EXTRA $60.000 DESCARGUE',
   19221249,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 60000,
   6,NULL,'TYM'),

  /* 11 – WFV015 – EXTRA $100.000 DESCARGUE */
  ('2026-07-30','Jueves','ALPINA','YONNI VALENCIA','WFV015','22437 22402','7008','CALARCA','',0,
   0,100000,'WFV015 EXTRA $100.000 DESCARGUE',
   19221249,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 100000,
   7,NULL,'TYM'),

  /* 12 – ETM037 – sin adicional */
  ('2026-07-30','Jueves','ALPINA','OSCAR MARIN','ETM037','22438 22470','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   8528716,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 13 – VZD334 – EXTRA $70.000 con factura AP */
  ('2026-07-30','Jueves','ALPINA','JULIAN CUELLAR','VZD334','22389 22471','9602','ARMENIA','SANTIAGO HENAO MORALES',1,
   1,70000,'VZD334 EXTRA $70.000',
   7433533,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 70000,
   62,'AP704010','TYM'),

  /* 14 – EQY944 – con factura AP */
  ('2026-07-30','Jueves','ALPINA','GOBER CRISTANCHO','EQY944','22472','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   6394920,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   58,'AP702883','TYM'),

  /* 15 – SXF257 – EXTRA $100.000 CARGUE (del día 29) */
  ('2026-07-30','Jueves','ALPINA','FABIO RUIZ','SXF257','22473','9604','ALCALA ULLOA','CAMILO ANDRES CONTRERAS RIVAS',1,
   1,100000,'SXF257 EXTRA $100.000 CARGUE EL 29',
   7782051,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1) + 100000,
   48,'9919825','TYM'),

  /* 16 – WLS478 – sin adicional */
  ('2026-07-30','Jueves','ALPINA','HUMBERTO RINCON','WLS478','22439','9605','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, SEBASTIAN MONTES',2,
   2,0,'-',
   11892335,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1) + 0,
   52,'9919826','TYM'),

  /* 17 – TTL256 – sin adicional */
  ('2026-07-30','Jueves','ALPINA','ANDRES QUINTERO','TTL256','22476 22440','9606','FILANDIA','CRISTIAN FABIAN CAMACHO MARTINEZ, CAMILO SUAREZ GARCIA',2,
   2,0,'-',
   15476967,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1) + 0,
   37,'9919829','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 18 – SMO183 – sin adicional */
  ('2026-07-30','Jueves','ALPINA','GABRIEL PEREZ','SMO183','22453','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6289627,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   48,'9919810','TYM'),

  /* 19 – SPU120 – sin adicional (zona 9454) */
  ('2026-07-30','Jueves','ALPINA','OSWALDO','SPU120','22454','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   10453882,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* 20 – TMZ674 – sin adicional */
  ('2026-07-30','Jueves','ALPINA','RICARDO LOPEZ','TMZ674','22455','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   6011697,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 21 – SPQ814 – sin adicional */
  ('2026-07-30','Jueves','ALPINA','CARLOS VELASCO','SPQ814','22446 22456','9456 7002','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5737944,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   41,NULL,'TYM'),

  /* 22 – DQA454 – sin adicional */
  ('2026-07-30','Jueves','ALPINA','LUIS MONTOYA','DQA454','22457','9457','ARABIA ALTAGRACIA','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   8982045,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARABIA ALTAGRACIA' LIMIT 1) + 0,
   50,'9919812','TYM'),

  /* 23 – PEK019 – sin adicional */
  ('2026-07-30','Jueves','ALPINA','MIGUEL TABARES','PEK019','22458','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   6006447,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 24 – XVI496 – sin adicional */
  ('2026-07-30','Jueves','ALPINA','PABLO RAMIREZ','XVI496','22459','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   6553088,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 25 – WLC133 – sin adicional */
  ('2026-07-30','Jueves','ALPINA','JULIAN','WLC133','22460','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   6284850,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 26 – TNH494 – con factura AP */
  ('2026-07-30','Jueves','ALPINA','ADALBERTO MEJIA','TNH494','22461','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   7257613,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   52,'AP704287','TYM'),

  /* 27 – WTN748 – sin adicional */
  ('2026-07-30','Jueves','ALPINA','DIEGO RATIVA','WTN748','22474','7004','MARSELLA','BRAHIAN STIVEN VALENCIA IGLESIAS, JUAN JOSE CONTRERAS HERNANDEZ',2,
   2,0,'-',
   12767482,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARSELLA' LIMIT 1) + 0,
   55,'9919808','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 28 – EST067 – sin adicional */
  ('2026-07-30','Jueves','ALPINA','JORGE RIVILLAS','EST067','22475','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   6352868,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 29 – ERK303 – sin adicional */
  ('2026-07-30','Jueves','ALPINA','JORGE ALARCON','ERK303','22441','7006','APIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   10815255,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 0,
   49,'9919809','TYM'),

  /* 30 – JVM223 – sin adicional */
  ('2026-07-30','Jueves','ALPINA','WILMAR CARDONA','JVM223','22435 22442','7007 9451','VITERBO','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   14001747,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1) + 0,
   51,'9919828','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 31 – SQB119 – sin adicional */
  ('2026-07-30','Jueves','FLEISCHMANN','CARLOS CASTAÑO','SQB119','9919827','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   3961630,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   33,'FEP1190993','TYM');

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
WHERE fecha = '2026-07-30'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
