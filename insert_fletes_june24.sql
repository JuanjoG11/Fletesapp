/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 24 JUNIO 2026
   Generado: 2026-06-24
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: SNL038 PENDIENTE $300.000 – no se inserta hoy
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-24'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 24‑Jun‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – SYU652 – con factura FEP */
  ('2026-06-24','Miércoles','ALPINA','JOHAN ECHEVERRY','SYU652','21347 21402','9552 7000','MANIZALES VILLAMARIA','ANDRES MATEO VILLALBA DIAZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   10263122,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   59,'FEP1188013','TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-06-24','Miércoles','ALPINA','CAMILO CASTAÑO','KOL802','21403','9553','MANIZALES VILLAMARIA','LUIS CARLOS CADAVID RESTREPO',1,
   1,0,'-',
   7702356,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 03 – WFV015 – sin adicional */
  ('2026-06-24','Miércoles','ALPINA','YONNI VALENCIA','WFV015','21380 21404','9554 7000','MANIZALES VILLAMARIA','CAMILO SUAREZ GARCIA, CRISTIAN CAMILO OSPINA PARRA',2,
   2,0,'-',
   7550114,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   54,'19330','TYM'),

  /* 04 – EYY183 – con facturas FEP */
  ('2026-06-24','Miércoles','ALPINA','JOHN ARENAS','EYY183','21366TSS 21405','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6803322,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   52,'FEP1187958-963-965','TYM'),

  /* 05 – SLI587 – con factura AP */
  ('2026-06-24','Miércoles','ALPINA','MIGUEL GONZALES','SLI587','21406','9556 9550','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   8205230,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   43,'AP667125 19332 19336','TYM'),

  /* 06 – WGZ876 – EXTRA $60.000 */
  ('2026-06-24','Miércoles','ALPINA','RICARDO PINEDA','WGZ876','21407','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ',1,
   1,60000,'WGZ876 EXTRA $60.000',
   14195876,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1) + 60000,
   29,NULL,'TYM'),

  /* 07 – EYX091 – sin adicional */
  ('2026-06-24','Miércoles','ALPINA','CARLOS GOMEZ','EYX091','21369 21386','9558','AGUADAS PACORA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   17435908,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1) + 0,
   86,'19334','TYM'),

  /* 08 – SMH182 – EXTRA $60.000 */
  ('2026-06-24','Miércoles','ALPINA','JUAN DAVID','SMH182','21408','9559','PALESTINA ARAUCA','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'SMH182 EXTRA $60.000',
   10722774,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PALESTINA ARAUCA' LIMIT 1) + 60000,
   53,'19335','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 09 – SPU120 – sin adicional */
  ('2026-06-24','Miércoles','ALPINA','OSWALDO','SPU120','21382 21409','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   8466102,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 10 – VZD334 – sin adicional */
  ('2026-06-24','Miércoles','ALPINA','JULIAN CUELLAR','VZD334','21410','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   6547477,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional */
  ('2026-06-24','Miércoles','ALPINA','GOBER CRISTANCHO','EQY944','21373TSS 21411','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, JOHAN STIVEN MUÑOZ RUIZ',2,
   2,0,'-',
   7798261,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 12 – SXF257 – sin adicional */
  ('2026-06-24','Miércoles','ALPINA','FABIO RUIZ','SXF257','21383 21412','9604 7010','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS, JUAN JOSE CONTRERAS HERNANDEZ',2,
   2,0,'-',
   8533948,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 0,
   34,NULL,'TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-06-24','Miércoles','ALPINA','HUMBERTO RINCON','WLS478','21387','9605','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   6975836,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1) + 0,
   47,'19342 19343','TYM'),

  /* 14 – TTL256 – con facturas AP */
  ('2026-06-24','Miércoles','ALPINA','YIMERSON GARCIA','TTL256','21388','9606','SALENTO','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   11524424,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1) + 0,
   38,'AP668538-540 19341','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-06-24','Miércoles','ALPINA','GABRIEL PEREZ','SMO183','21392','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   5903520,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 16 – XVI496 – sin adicional */
  ('2026-06-24','Miércoles','ALPINA','PABLO RAMIREZ','XVI496','21355TSS 21393','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   6929090,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   50,'19344','TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-06-24','Miércoles','ALPINA','RICARDO LOPEZ','TMZ674','21394','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, ANDRES CAMILO MUÑOZ CAICEDO',2,
   2,0,'-',
   8133242,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   63,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-06-24','Miércoles','ALPINA','CARLOS VELASCO','SPQ814','21384','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   8262842,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 19 – WHM317 – sin adicional */
  ('2026-06-24','Miércoles','ALPINA','HUMBERTO PARRA','WHM317','21397','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7335230,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-06-24','Miércoles','ALPINA','MIGUEL TABARES','PEK019','21398','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   5214157,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 21 – WHM896 – sin adicional */
  ('2026-06-24','Miércoles','ALPINA','ALEXANDER CUELLAR','WHM896','21360TSS 21399','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   7771378,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-06-24','Miércoles','ALPINA','JULIAN','WLC133','21400','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   6439255,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   64,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-06-24','Miércoles','ALPINA','ADALBERTO MEJIA','TNH494','21391 21401','9461 9450','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   8331459,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 24 – WTN748 – EXTRA $60.000 (se debía de ayer) */
  ('2026-06-24','Miércoles','ALPINA','DIEGO RATIVA','WTN748','21414','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,60000,'WTN748 EXTRA $60.000 SE DEBIA DE AYER',
   7837784,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   61,'19345','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – EST067 – sin adicional */
  ('2026-06-24','Miércoles','ALPINA','JORGE RIVILLAS','EST067','21415','7005','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   6900633,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1) + 0,
   37,'19328','TYM'),

  /* 26 – ERK303 – ADICIONAL $100.000 ENTREGA TTS VIRGINIA Y SUPERMERCADOS */
  ('2026-06-24','Miércoles','ALPINA','JORGE ALARCON','ERK303','21389','7006','BALBOA LA CELIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,100000,'ERK303 ADICIONAL AL FLETE $100.000 ENTREGA DE TTS DE LA VIRGINIA Y SUPERMERCADOS',
   8521746,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1) + 100000,
   43,'19337','TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-06-24','Miércoles','ALPINA','WILMAR CARDONA','JVM223','21390 21378','7007 9451','ANSERMA','OSCAR MAURICIO RESTREPO MORENO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   14161030,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1) + 0,
   55,'19339','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-06-24','Miércoles','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19340','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   6699619,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   62,NULL,'TYM');

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
WHERE fecha = '2026-06-24'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
