/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 1 JULIO 2026
   Generado: 2026-07-01
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-01'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 01‑Jul‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – SXE734 – VALOR DE FLETE $600.000 INCLUYE DESCARGUE */
  ('2026-07-01','Miércoles','ALPINA','WALTER RAMIREZ','SXE734','','9550 SUPERCENTRO N','MANIZALES VILLAMARIA','',0,
   0,600000,'SXE734 VALOR DE FLETE $600.000 INCLUYE DESCARGUE',
   11040000,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 600000,
   1,'AP673922','TYM'),

  /* 02 – SYU652 – sin adicional (cuadra super de ayer) */
  ('2026-07-01','Miércoles','ALPINA','JOHAN ECHEVERRY','SYU652','21618','9552','MANIZALES VILLAMARIA','ANDRES MATEO VILLALBA DIAZ',1,
   1,0,'-',
   6840281,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 03 – KOL802 – sin adicional */
  ('2026-07-01','Miércoles','ALPINA','CAMILO CASTAÑO','KOL802','21619','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   9687223,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   59,'19423','TYM'),

  /* 04 – WFV015 – sin adicional */
  ('2026-07-01','Miércoles','ALPINA','YONNI VALENCIA','WFV015','21620','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ, CRISTIAN CAMILO OSPINA PARRA',2,
   2,0,'-',
   5837183,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   51,'19424','TYM'),

  /* 05 – EYY183 – sin adicional */
  ('2026-07-01','Miércoles','ALPINA','JOHN ARENAS','EYY183','21621','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   5281249,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'19425','TYM'),

  /* 06 – SLI587 – sin adicional */
  ('2026-07-01','Miércoles','ALPINA','MIGUEL GONZALES','SLI587','21622','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   6390745,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'19426 19421','TYM'),

  /* 07 – WGZ876 – EXTRA $60.000 */
  ('2026-07-01','Miércoles','ALPINA','RICARDO PINEDA','WGZ876','21623','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ',1,
   1,60000,'WGZ876 EXTRA $60.000',
   12016001,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1) + 60000,
   25,NULL,'TYM'),

  /* 08 – EYX091 – sin adicional */
  ('2026-07-01','Miércoles','ALPINA','CARLOS GOMEZ','EYX091','21606 21587','9558','AGUADAS PACORA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   18314939,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1) + 0,
   66,'19428','TYM'),

  /* 09 – SMH182 – sin adicional */
  ('2026-07-01','Miércoles','ALPINA','JUAN DAVID','SMH182','21624','9559','PALESTINA ARAUCA','BRANDON STEVEN GIL BAEZ, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   9794350,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PALESTINA ARAUCA' LIMIT 1) + 0,
   43,'19429','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 10 – SPU120 – ADICIONAL $30.000 ENTREGA SUPER FUERA DE RUTA */
  ('2026-07-01','Miércoles','ALPINA','OSWALDO','SPU120','21625 21600','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,30000,'SPU120 ADICIONAL $30.000 ENTREGA DE SUPER FUERA DE RUTA',
   10656443,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 30000,
   50,'AP676649','TYM'),

  /* 11 – VZD334 – sin adicional */
  ('2026-07-01','Miércoles','ALPINA','JULIAN CUELLAR','VZD334','21597 21626','9602 7008','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, SEBASTIAN MONTES',2,
   2,0,'-',
   7911831,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   63,NULL,'TYM'),

  /* 12 – EQY944 – sin adicional */
  ('2026-07-01','Miércoles','ALPINA','GOBER CRISTANCHO','EQY944','21627','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   8084354,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 13 – SXF257 – ADICIONAL $100.000 SOBRECARGO */
  ('2026-07-01','Miércoles','ALPINA','FABIO RUIZ','SXF257','21598 21628','9604 7010','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS, CAMILO SUAREZ GARCIA',2,
   2,100000,'SXF257 ADICIONAL $100.000 SOBRECARGO',
   13272203,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 100000,
   44,'AP676651','TYM'),

  /* 14 – WLS478 – sin adicional */
  ('2026-07-01','Miércoles','ALPINA','HUMBERTO RINCON','WLS478','21601','9605','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   6493041,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1) + 0,
   47,'19431','TYM'),

  /* 15 – TTL256 – con facturas AP */
  ('2026-07-01','Miércoles','ALPINA','YIMERSON GARCIA','TTL256','21602','9606','SALENTO','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   10923406,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1) + 0,
   41,'AP675485-487 19430','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 16 – SMO183 – sin adicional */
  ('2026-07-01','Miércoles','ALPINA','GABRIEL PEREZ','SMO183','21609','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6852250,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 17 – XVI496 – sin adicional */
  ('2026-07-01','Miércoles','ALPINA','PABLO RAMIREZ','XVI496','21610','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   6481394,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   49,'19433','TYM'),

  /* 18 – TMZ674 – EXTRA $60.000 */
  ('2026-07-01','Miércoles','ALPINA','RICARDO LOPEZ','TMZ674','21611','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,60000,'TMZ674 EXTRA $60.000',
   10787110,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   83,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional */
  ('2026-07-01','Miércoles','ALPINA','CARLOS VELASCO','SPQ814','21612','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   7621776,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 20 – WHM317 – sin adicional */
  ('2026-07-01','Miércoles','ALPINA','HUMBERTO PARRA','WHM317','21613','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7795916,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional */
  ('2026-07-01','Miércoles','ALPINA','MIGUEL TABARES','PEK019','21614','9458','PEREIRA - DOSQUEBRADAS','ANDRES CAMILO MUÑOZ CAICEDO',1,
   1,0,'-',
   6619251,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 22 – WHM896 – sin adicional */
  ('2026-07-01','Miércoles','ALPINA','ALEXANDER CUELLAR','WHM896','21615','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   8453338,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 23 – WLC133 – sin adicional */
  ('2026-07-01','Miércoles','ALPINA','JULIAN','WLC133','21616','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   7994812,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   69,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional */
  ('2026-07-01','Miércoles','ALPINA','ADALBERTO MEJIA','TNH494','21617 21608','9461 9450','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   9175200,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 25 – WTN748 – EXTRA $60.000 */
  ('2026-07-01','Miércoles','ALPINA','DIEGO RATIVA','WTN748','21629','7004','PEREIRA - DOSQUEBRADAS','JHON FREDY MORENO',1,
   1,60000,'WTN748 EXTRA $60.000',
   8962951,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   65,'19435','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 26 – MAT480 – VALOR DE FLETE $650.000 */
  ('2026-07-01','Miércoles','ALPINA','ELKIN AGUIRRE','MAT480','21433','9450','CARTAGO 2T','',0,
   0,650000,'MAT480 VALOR DE FLETE $650.000',
   14669500,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 650000,
   1,NULL,'TYM'),

  /* 27 – EST067 – ADICIONAL $50.000 ENTREGA SUPER CARTAGO */
  ('2026-07-01','Miércoles','ALPINA','JORGE RIVILLAS','EST067','21630 21632','7005','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,50000,'EST067 ADICIONAL $50.000 ENTREGA DE SUPER CARTAGO',
   7761408,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1) + 50000,
   35,'19418','TYM'),

  /* 28 – ERK303 – sin adicional */
  ('2026-07-01','Miércoles','ALPINA','JORGE ALARCON','ERK303','21603','7006','BALBOA LA CELIA','ROVINSON TORRES RIVERA',1,
   1,0,'-',
   7990607,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1) + 0,
   45,'19416','TYM'),

  /* 29 – JVM223 – sin adicional */
  ('2026-07-01','Miércoles','ALPINA','WILMAR CARDONA','JVM223','21604 21596','7007 9451','ANSERMA','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   16410179,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1) + 0,
   55,'19420','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 30 – SQB119 – sin adicional */
  ('2026-07-01','Miércoles','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19417 19434','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   5400861,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM');

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
WHERE fecha = '2026-07-01'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
