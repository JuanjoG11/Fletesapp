/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 20 AGOSTO 2026
   Generado: 2026-08-20
   ✅ Nombres de auxiliares normalizados según lista oficial
   Notas:
     - SLI587  EXTRA $60.000 (JHONNY LOPEZ = YHONY ALEXANDER LOPEZ LOPEZ)
     - WEP384  EXTRA $60.000
     - WFV015  ADICIONAL AL FLETE $170.000 (sin auxiliares, flete negociado)
     - SXF257  EXTRA $60.000
     - VZD334  EXTRA $60.000
     - TNH494  EXTRA $60.000
     - MAT480  VALOR DE FLETE $330.000
     - EST067  zona 7005 MERCAPLAZA → CARTAGO 2T
     - TTL256  QUEBIN LOTERO no está en lista oficial ALPINA
     - VALENTINA GARCIA → VALENTINA GARCIA GOMEZ
     - MANUEL RAMIREZ   → MANUEL ALEJANDRO RAMIREZ OVALLE
     - DIEGO FRANCO     → JUAN DIEGO FRANCO VERGARA
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-20'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 20‑Ago‑2026
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
  ('2026-08-20','Jueves','ALPINA','JOHAN ECHEVERRY','SYU652','23044 20099','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   7879107,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   50,'FEP1192615-625-569','TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-08-20','Jueves','ALPINA','FREDY','KOL802','23045','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   6291714,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   40,'FEP1192622','TYM'),

  /* 03 – EYX091 – sin adicional */
  ('2026-08-20','Jueves','ALPINA','ANDRES GOMEZ','EYX091','23031 20101','9554','NEIRA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   9538663,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 04 – SPU120 – sin adicional */
  ('2026-08-20','Jueves','ALPINA','OSWALDO','SPU120','23046 20102','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   7819077,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   55,'FEP1192614','TYM'),

  /* 05 – SLI587 – EXTRA $60.000 */
  ('2026-08-20','Jueves','ALPINA','MIGUEL GONZALES','SLI587','23026 23047 20103 20098','9556 9550 UNOAG','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE, YHONY ALEXANDER LOPEZ LOPEZ',2,
   2,60000,'SLI587 EXTRA $60.000',
   13865086,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   63,'FEP1192612','TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-08-20','Jueves','ALPINA','RICARDO PINEDA','WGZ876','23020 23033 20104 20089 20092','9557 9560','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   13846200,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 07 – WEP384 – EXTRA $60.000 */
  ('2026-08-20','Jueves','ALPINA','YOFER LOPEZ','WEP384','23049','9559','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'WEP384 EXTRA $60.000',
   13031498,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RDA S JOSE BELALCAZAR' LIMIT 1) + 60000,
   59,'FEP1192505-506-509-510-511','TYM'),

  /* ── WFV015 – CALARCA – FLETE NEGOCIADO $170.000 ADICIONAL ─── */

  /* 08 – WFV015 – ADICIONAL AL FLETE $170.000 */
  ('2026-08-20','Jueves','ALPINA','YONNI VALENCIA','WFV015','22990TSS 23023','7008','CALARCA','NO APLICA',0,
   0,170000,'ADICIONAL AL FLETE $170.000',
   10908663,
   170000,
   4,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 09 – ETM037 – sin adicional */
  ('2026-08-20','Jueves','ALPINA','OSCAR MARIN','ETM037','23024 23050','9601 7009 P/ESPEJO','ARMENIA','YEISON DAVID RENDON SOTO, OSCAR MAURICIO RESTREPO MORENO',2,
   2,0,'-',
   9346492,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 10 – WFQ635 – sin adicional */
  ('2026-08-20','Jueves','ALPINA','JHENCI LOPEZ','WFQ635','23051','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'-',
   7049796,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional */
  ('2026-08-20','Jueves','ALPINA','GOBER CRISTANCHO','EQY944','22988 22976TSS 23052','9603 9600 ANDY','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   7531309,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 12 – SXF257 – EXTRA $60.000 */
  ('2026-08-20','Jueves','ALPINA','FABIO RUIZ','SXF257','23009TSS 23053 20110 20109','9604','ALCALA ULLOA','CAMILO ANDRES CONTRERAS RIVAS, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,60000,'SXF257 EXTRA $60.000',
   15119275,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1) + 60000,
   50,NULL,'TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-08-20','Jueves','ALPINA','HUMBERTO RINCON','WLS478','23027 20106','9605','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, JUAN JOSE CONTRERAS HERNANDEZ',2,
   2,0,'-',
   14019231,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 14 – TTL256 – sin adicional */
  ('2026-08-20','Jueves','ALPINA','ANDRES QUINTERO','TTL256','23021 23028 20082','9606 9600','FILANDIA','EDWIN MAURICIO GOMEZ GALINDO, QUEBIN LOTERO',2,
   2,0,'-',
   11316937,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1) + 0,
   40,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – LUM993 – sin adicional */
  ('2026-08-20','Jueves','ALPINA','PABLO RAMIREZ','LUM993','23035','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   8021851,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 16 – VZD334 – EXTRA $60.000 */
  ('2026-08-20','Jueves','ALPINA','JULIAN CUELLAR','VZD334','23036','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,60000,'VZD334 EXTRA $60.000',
   11453761,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   56,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-08-20','Jueves','ALPINA','RICARDO LOPEZ','TMZ674','23037','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   7390526,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-08-20','Jueves','ALPINA','CARLOS VELASCO','SPQ814','23038 23022','9456 7002','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   4780402,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   34,NULL,'TYM'),

  /* 19 – WTN748 – sin adicional */
  ('2026-08-20','Jueves','ALPINA','DIEGO RATIVA','WTN748','23039 20095','9457','ARABIA ALTAGRACIA','MANUEL ALEJANDRO RAMIREZ OVALLE',1,
   1,0,'-',
   7811250,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARABIA ALTAGRACIA' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-08-20','Jueves','ALPINA','MIGUEL TABARES','PEK019','23040','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   5326109,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   42,NULL,'TYM'),

  /* 21 – TJX795 – sin adicional */
  ('2026-08-20','Jueves','ALPINA','ANDRES QUINTERO','TJX795','23041','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   12420408,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   48,'AP721983 AP722005 AP722004','TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-08-20','Jueves','ALPINA','JULIAN','WLC133','23042','9460','PEREIRA - DOSQUEBRADAS','JHON FREDY MORENO',1,
   1,0,'-',
   7598141,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   39,NULL,'TYM'),

  /* 23 – TNH494 – EXTRA $60.000 */
  ('2026-08-20','Jueves','ALPINA','ADALBERTO MEJIA','TNH494','23000TSS 23043','9461 SUPERMISCELANEA','CARTAGO','SANTIAGO HENAO MORALES',1,
   1,60000,'TNH494 EXTRA $60.000',
   9363743,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 60000,
   61,'AP722935','TYM'),

  /* 24 – MAT480 – VALOR DE FLETE $330.000 */
  ('2026-08-20','Jueves','ALPINA','ELKIN AGUIRRE','MAT480','23054','7004','MARSELLA','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'VALOR DE FLETE $330.000',
   15390140,
   330000,
   45,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – EST067 – sin adicional */
  ('2026-08-20','Jueves','ALPINA','JORGE RIVILLAS','EST067','23055','7005 MERCAPLAZA','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   8096900,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   51,'AP722936','TYM'),

  /* 26 – ERK303 – sin adicional */
  ('2026-08-20','Jueves','ALPINA','JORGE ALARCON','ERK303','23029 20097','7006','APIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   12578628,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-08-20','Jueves','ALPINA','WILMAR CARDONA','JVM223','23019 23030 20096','7007 9451','VITERBO','LUIS CARLOS CADAVID RESTREPO, VALENTINA GARCIA GOMEZ',2,
   2,0,'-',
   16711098,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1) + 0,
   63,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-08-20','Jueves','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20107 20111','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','JUAN DIEGO FRANCO VERGARA',1,
   1,0,'-',
   14216504,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-08-20'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
