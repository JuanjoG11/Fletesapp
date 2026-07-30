/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 16 JULIO 2026
   Generado: 2026-07-16
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: WFVO15 corregido a WFV015
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-16'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 16‑Jul‑2026
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
  ('2026-07-16','Jueves','ALPINA','JOHAN ECHEVERRY','SYU652','22048','9552','MANIZALES VILLAMARIA','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   6113255,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   40,'19627','TYM'),

  /* 02 – KOL802 – con factura AP */
  ('2026-07-16','Jueves','ALPINA','FREDY','KOL802','22049','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   8074012,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   44,'AP690482 19632 19628 19635','TYM'),

  /* 03 – EYX091 – sin adicional */
  ('2026-07-16','Jueves','ALPINA','CARLOS GOMEZ','EYX091','22038','9554','NEIRA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   7221686,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1) + 0,
   48,'19629','TYM'),

  /* 04 – EYY183 – sin adicional */
  ('2026-07-16','Jueves','ALPINA','JOHN ARENAS','EYY183','22051','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6928114,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   54,'19630','TYM'),

  /* 05 – SLI587 – con factura AP */
  ('2026-07-16','Jueves','ALPINA','MIGUEL GONZALES','SLI587','22052','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   8364234,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   56,'AP690481 19631 19626','TYM'),

  /* 06 – WGZ876 – EXTRA $60.000 */
  ('2026-07-16','Jueves','ALPINA','RICARDO PINEDA','WGZ876','22053','9557','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,60000,'WGZ876 EXTRA $60.000',
   12211741,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1) + 60000,
   49,'19611','TYM'),

  /* 07 – TRL186 – sin adicional */
  ('2026-07-16','Jueves','ALPINA','WILLIAM','TRL186','22055','9559','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   10913471,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RDA S JOSE BELALCAZAR' LIMIT 1) + 0,
   54,'19634','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 08 – WFV015 – ADICIONAL $100.000 */
  ('2026-07-16','Jueves','ALPINA','YONNI VALENCIA','WFV015','22032','7008','CALARCA','',0,
   0,100000,'WFV015 ADICIONAL AL FLETE $100.000',
   7868721,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 100000,
   3,NULL,'TYM'),

  /* 09 – SPU120 – sin adicional */
  ('2026-07-16','Jueves','ALPINA','OSWALDO','SPU120','22033 22056','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   8694451,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* 10 – ETM037 – sin adicional */
  ('2026-07-16','Jueves','ALPINA','OSCAR MARIN','ETM037','22057','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, CARLOS JIMENEZ',2,
   2,0,'-',
   5760781,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 11 – EQY944 – con factura AP */
  ('2026-07-16','Jueves','ALPINA','GOBER CRISTANCHO','EQY944','22058','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   6363384,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   57,'AP689115','TYM'),

  /* 12 – SXF257 – sin adicional */
  ('2026-07-16','Jueves','ALPINA','FABIO RUIZ','SXF257','22059','9604','ALCALA ULLOA','CAMILO ANDRES CONTRERAS RIVAS',1,
   1,0,'-',
   6241829,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1) + 0,
   43,'19637 19639','TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-07-16','Jueves','ALPINA','HUMBERTO RINCON','WLS478','22034','9605','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, SEBASTIAN MONTES',2,
   2,0,'-',
   11229933,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1) + 0,
   57,'19641','TYM'),

  /* 14 – TTL256 – sin adicional */
  ('2026-07-16','Jueves','ALPINA','ANDRES QUINTERO','TTL256','22035 22030','9606 9600','FILANDIA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   8621025,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1) + 0,
   42,'19644','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-07-16','Jueves','ALPINA','GABRIEL PEREZ','SMO183','22039','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   4543961,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 16 – VZD334 – EXTRA $60.000 */
  ('2026-07-16','Jueves','ALPINA','JULIAN CUELLAR','VZD334','22040','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,60000,'VZD334 EXTRA $60.000',
   8730015,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   67,'19623 19618TSS','TYM'),

  /* 17 – TMZ674 – EXTRA $60.000 */
  ('2026-07-16','Jueves','ALPINA','RICARDO LOPEZ','TMZ674','22041','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,60000,'TMZ674 EXTRA $60.000',
   5342530,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   56,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-07-16','Jueves','ALPINA','CARLOS VELASCO','SPQ814','22031 22042','9456 7002','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6125242,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 19 – WHM317 – sin adicional */
  ('2026-07-16','Jueves','ALPINA','HUMBERTO PARRA','WHM317','22043','9457','ARABIA ALTAGRACIA','JUAN ESTEBAN GALLEGO DIEZ, JUAN JOSE CONTRERAS HERNANDEZ',2,
   2,0,'-',
   6186338,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARABIA ALTAGRACIA' LIMIT 1) + 0,
   54,'19624','TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-07-16','Jueves','ALPINA','MIGUEL TABARES','PEK019','22044','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   4932484,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 21 – XVI496 – sin adicional */
  ('2026-07-16','Jueves','ALPINA','PABLO RAMIREZ','XVI496','22045','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   8121141,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-07-16','Jueves','ALPINA','JULIAN','WLC133','22046','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, JHON FREDY MORENO',2,
   2,0,'-',
   5676364,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   41,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-07-16','Jueves','ALPINA','ADALBERTO MEJIA','TNH494','22047','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   6106686,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 24 – WTN748 – sin adicional */
  ('2026-07-16','Jueves','ALPINA','DIEGO RATIVA','WTN748','22025TSS 22060','7004','MARSELLA','BRAHIAN STIVEN VALENCIA IGLESIAS, JUAN LARGO',2,
   2,0,'-',
   11909085,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARSELLA' LIMIT 1) + 0,
   55,'19622','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – WEP384 – VALOR DE FLETE $350.000 */
  ('2026-07-16','Jueves','ALPINA','YOFER','WEP384','21963 22027','9450','CARTAGO 2T','',0,
   0,0,'WEP384 VALOR DE FLETE $350.000',
   8118796,
   350000,
   4,NULL,'TYM'),

  /* 26 – EST067 – sin adicional */
  ('2026-07-16','Jueves','ALPINA','JORGE RIVILLAS','EST067','22061','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5773822,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   38,NULL,'TYM'),

  /* 27 – ERK303 – sin adicional */
  ('2026-07-16','Jueves','ALPINA','JORGE ALARCON','ERK303','22036','7006','APIA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   8870836,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 0,
   49,'19642','TYM'),

  /* 28 – JVM223 – sin adicional */
  ('2026-07-16','Jueves','ALPINA','WILMAR CARDONA','JVM223','22028 22037','7007 9451','VITERBO','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   11800222,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1) + 0,
   62,'19625','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional */
  ('2026-07-16','Jueves','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19643 19636','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   3683965,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   38,NULL,'TYM');

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
WHERE fecha = '2026-07-16'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
