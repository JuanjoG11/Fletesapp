/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 13 AGOSTO 2026
   Generado: 2026-08-13
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-13'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 13‑Ago‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – WFQ635 – sin adicional */
  ('2026-08-13','Jueves','ALPINA','JHENCI LOPEZ','WFQ635','22802 22797','9550 7001','MANIZALES VILLAMARIA','JHON FREDY MORENO',1,
   1,0,'-',
   9886782,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   2,NULL,'TYM'),

  /* 02 – SYU652 – sin adicional */
  ('2026-08-13','Jueves','ALPINA','JOHAN ECHEVERRY','SYU652','22818','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   5888793,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   42,'19999','TYM'),

  /* 03 – KOL802 – sin adicional */
  ('2026-08-13','Jueves','ALPINA','JUAN','KOL802','22819','9553','MANIZALES VILLAMARIA','VALENTINA GARCIA, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   5660571,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   41,'20000 20005','TYM'),

  /* 04 – EYX091 – sin adicional */
  ('2026-08-13','Jueves','ALPINA','CARLOS GOMEZ','EYX091','22820','9554','NEIRA','JUAN CAMILO COCOMA OROZCO, JHONNY LOPEZ',2,
   2,0,'-',
   8437273,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1) + 0,
   55,'20001','TYM'),

  /* 05 – EYY183 – sin adicional */
  ('2026-08-13','Jueves','ALPINA','JOHN ARENAS','EYY183','22821','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6291978,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   54,'20002','TYM'),

  /* 06 – SLI587 – sin adicional */
  ('2026-08-13','Jueves','ALPINA','MIGUEL GONZALES','SLI587','22822','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   5008352,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   52,'20003 19997','TYM'),

  /* 07 – WGZ876 – sin adicional (Marmato La Merced) */
  ('2026-08-13','Jueves','ALPINA','RICARDO PINEDA','WGZ876','22832 22834','9557 9559','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   17476219,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1) + 0,
   33,NULL,'TYM'),

  /* 08 – WEP384 – EXTRA $60.000 */
  ('2026-08-13','Jueves','ALPINA','YOFER','WEP384','22833','9559','PALESTINA ARAUCA','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'WEP384 EXTRA $60.000',
   10907315,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PALESTINA ARAUCA' LIMIT 1) + 60000,
   42,'19979','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 09 – WFV015 – ADICIONAL $60.000 */
  ('2026-08-13','Jueves','ALPINA','YONNI VALENCIA','WFV015','22798','7008','CALARCA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,60000,'WFV015 ADICIONAL $60.000',
   14611258,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 60000,
   3,NULL,'TYM'),

  /* 10 – ETM037 – sin adicional */
  ('2026-08-13','Jueves','ALPINA','OSCAR MARIN','ETM037','22805 22823','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO, OSCAR MAURICIO RESTREPO MORENO',2,
   2,0,'-',
   11124572,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 11 – WFR160 – sin adicional */
  ('2026-08-13','Jueves','ALPINA','LEANDRO LOPEZ','WFR160','22824','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'-',
   6189575,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   59,'20015','TYM'),

  /* 12 – EQY944 – sin adicional */
  ('2026-08-13','Jueves','ALPINA','GOBER CRISTANCHO','EQY944','22769 22825','9603 9600','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   6921526,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 13 – SXF257 – EXTRA $60.000 */
  ('2026-08-13','Jueves','ALPINA','FABIO RUIZ','SXF257','22826','9604','ALCALA ULLOA','CAMILO ANDRES CONTRERAS RIVAS',1,
   1,60000,'SXF257 EXTRA $60.000',
   3672790,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1) + 60000,
   20,'20008','TYM'),

  /* 14 – WLS478 – sin adicional */
  ('2026-08-13','Jueves','ALPINA','HUMBERTO RINCON','WLS478','22827','9605','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, CARLOS JIMENEZ',2,
   2,0,'-',
   9673736,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1) + 0,
   44,'20011','TYM'),

  /* 15 – TTL256 – sin adicional */
  ('2026-08-13','Jueves','ALPINA','ANDRES QUINTERO','TTL256','22803 22828','9606 9600','FILANDIA','DANIELA CASTIBLANCO',1,
   1,0,'-',
   12262876,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1) + 0,
   38,'19978','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 16 – SPU120 – sin adicional (zona 9453) */
  ('2026-08-13','Jueves','ALPINA','OSWALDO','SPU120','22809','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   9458996,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 17 – VZD334 – EXTRA $60.000 */
  ('2026-08-13','Jueves','ALPINA','JULIAN CUELLAR','VZD334','22810','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,60000,'VZD334 EXTRA $60.000',
   10822877,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   49,'20016','TYM'),

  /* 18 – TMZ674 – sin adicional */
  ('2026-08-13','Jueves','ALPINA','RICARDO LOPEZ','TMZ674','22811','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, QUEBIN LOTERO',2,
   2,0,'-',
   8820262,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional */
  ('2026-08-13','Jueves','ALPINA','CARLOS VELASCO','SPQ814','22804 22812','9456 7002','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   7599948,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 20 – WHM896 – sin adicional */
  ('2026-08-13','Jueves','ALPINA','ALEXANDER CUELLAR','WHM896','22776TSS 22813','9457','ARABIA ALTAGRACIA','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   6075617,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARABIA ALTAGRACIA' LIMIT 1) + 0,
   31,'19996','TYM'),

  /* 21 – PEK019 – sin adicional */
  ('2026-08-13','Jueves','ALPINA','MIGUEL TABARES','PEK019','22814','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   7492414,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 22 – LUM993 – sin adicional */
  ('2026-08-13','Jueves','ALPINA','PABLO RAMIREZ','LUM993','22815','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   4061584,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   21,NULL,'TYM'),

  /* 23 – WLC133 – sin adicional */
  ('2026-08-13','Jueves','ALPINA','JULIAN','WLC133','22816','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   7947033,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   39,NULL,'TYM'),

  /* 24 – TNH494 – con factura AP */
  ('2026-08-13','Jueves','ALPINA','ADALBERTO MEJIA','TNH494','22817','9461','CARTAGO 2T','CESAR AUGUSTO CASTILLO LONDOÑO',1,
   1,0,'-',
   7689255,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   52,'AP716376','TYM'),

  /* 25 – WTN748 – EXTRA $60.000 */
  ('2026-08-13','Jueves','ALPINA','DIEGO RATIVA','WTN748','22829','7004','MARSELLA','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,60000,'WTN748 EXTRA $60.000',
   10159074,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARSELLA' LIMIT 1) + 60000,
   47,'19998','TYM'),

  /* 26 – MAT480 – VALOR FLETE $400.000 */
  ('2026-08-13','Jueves','ALPINA','ELKIN AGUIRRE','MAT480','22807','7004 MERCAPAN','PEREIRA - DOSQUEBRADAS','',0,
   0,0,'MAT480 VALOR DE FLETE $400.000',
   7360000,
   400000,
   1,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 27 – EST067 – con factura AP */
  ('2026-08-13','Jueves','ALPINA','JORGE RIVILLAS','EST067','22830','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   6961484,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   41,'AP716377','TYM'),

  /* 28 – ERK303 – ADICIONAL $100.000 entrega en Santuario */
  ('2026-08-13','Jueves','ALPINA','JORGE ALARCON','ERK303','22831','7006','APIA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,100000,'ERK303 ADICIONAL $100.000 ENTREGA EN SANTUARIO',
   10448452,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 100000,
   51,'19993 19994 19995','TYM'),

  /* 29 – JVM223 – sin adicional */
  ('2026-08-13','Jueves','ALPINA','WILMAR CARDONA','JVM223','22759 22801','7007 9451','ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   18059142,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1) + 0,
   48,'19975','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 30 – SQB119 – sin adicional */
  ('2026-08-13','Jueves','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20014 19992 20012','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   3368145,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   30,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-08-13'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
