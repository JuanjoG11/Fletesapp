/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 17 JUNIO 2026
   Generado: 2026-06-18
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-17'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 17‑Jun‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – SYU652 – con facturas adicionales FEP+AP */
  ('2026-06-17','Miércoles','ALPINA','JOHAN ECHEVERRY','SYU652','21199','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   8400250,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   48,'FEP1187378 AP661618','TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','CAMILO CASTAÑO','KOL802','21177 21200','9553 7001','MANIZALES VILLAMARIA','LUIS CARLOS CADAVID RESTREPO',1,
   1,0,'-',
   10466389,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   57,'AP660928 AP660930 19241','TYM'),

  /* 03 – WFV015 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','YONNI VALENCIA','WFV015','21201','9554','MANIZALES VILLAMARIA','CAMILO SUAREZ GARCIA, CRISTIAN CAMILO OSPINA PARRA',2,
   2,0,'-',
   8803490,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   60,'AP661619 AP661526 AP661002 19242 19239','TYM'),

  /* 04 – EYY183 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','JOHN ARENAS','EYY183','21202','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   7383564,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   52,'FEP1187387 19243','TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','MIGUEL GONZALES','SLI587','21203','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   5366592,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'19244','TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','RICARDO PINEDA','WGZ876','21204','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   12826168,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1) + 0,
   30,NULL,'TYM'),

  /* 07 – EYX091 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','CARLOS GOMEZ','EYX091','21181','9558','AGUADAS PACORA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   19254326,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1) + 0,
   66,'19233','TYM'),

  /* 08 – SMH182 – EXTRA $60.000 */
  ('2026-06-17','Miércoles','ALPINA','JUAN DAVID','SMH182','21205','9559','PALESTINA ARAUCA','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'SMH182 EXTRA $60.000',
   9829181,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PALESTINA ARAUCA' LIMIT 1) + 60000,
   48,'19246','TYM'),

  /* 09 – TJX795 – VALOR DE FLETE $700.000 */
  ('2026-06-17','Miércoles','ALPINA','ANDRES QUINTERO','TJX795','','7010','QUIMBAYA','',0,
   0,700000,'QUIMBAYA/MONTENEGRO/TEBAIDA VALOR DE FLETE $700.000 INCLUYE DESCARGUE',
   17109840,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 700000,
   3,'AP662997 AP662998 AP662999','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 10 – SPU120 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','OSWALDO','SPU120','21180 21206','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   7264262,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 11 – VZD334 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','JULIAN CUELLAR','VZD334','21207','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, JOHAN STIVEN MUÑOZ RUIZ',2,
   2,0,'-',
   8725457,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   63,NULL,'TYM'),

  /* 12 – EQY944 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','GOBER CRISTANCHO','EQY944','21208','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   8160115,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   55,'AP660294','TYM'),

  /* 13 – SXF257 – ADICIONAL $100.000 SOBRECARGO */
  ('2026-06-17','Miércoles','ALPINA','FABIO RUIZ','SXF257','21178 21209','9604 7010','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,100000,'SXF257 ADICIONAL AL FLETE $100.000 SOBRECARGO',
   13429082,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 100000,
   51,NULL,'TYM'),

  /* 14 – WLS478 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','HUMBERTO RINCON','WLS478','21184','9605','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   6703120,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1) + 0,
   45,'19248 19249','TYM'),

  /* 15 – TTL256 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','YIMERSON GARCIA','TTL256','21185','9606','SALENTO','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   9098783,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1) + 0,
   37,'AP661623 AP661625 19247 19255','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 16 – SMO183 – VALOR DE FLETE $300.000 */
  ('2026-06-17','Miércoles','ALPINA','GABRIEL PEREZ','SMO183','21190','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,300000,'SMO183 VALOR DE FLETE $300.000 ENTREGA LECHE EN LAS VIOLETAS',
   7606141,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 300000,
   59,NULL,'TYM'),

  /* 17 – XVI496 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','PABLO RAMIREZ','XVI496','21191','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   8418647,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   50,'19252','TYM'),

  /* 18 – TMZ674 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','RICARDO LOPEZ','TMZ674','21192','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, ANDRES CAMILO MUÑOZ CAICEDO',2,
   2,0,'-',
   8676576,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   63,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','CARLOS VELASCO','SPQ814','21193','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6402879,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 20 – WHM317 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','HUMBERTO PARRA','WHM317','21194','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7012375,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','MIGUEL TABARES','PEK019','21195','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   5934562,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 22 – WHM896 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','ALEXANDER CUELLAR','WHM896','21196','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   6769857,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 23 – WLC133 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','JULIAN','WLC133','21197','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, JUAN JOSE CONTRERAS HERNANDEZ',2,
   2,0,'-',
   6820547,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   68,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','ADALBERTO MEJIA','TNH494','21182 21198','9461 9450','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   7168376,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 25 – WTN748 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','DIEGO RATIVA','WTN748','21210','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   9053214,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   63,'19253','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 26 – EST067 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','JORGE RIVILLAS','EST067','21211','7005','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   11028453,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARGELIA EL CAIRO' LIMIT 1) + 0,
   36,'19236','TYM'),

  /* 27 – ERK303 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','JORGE ALARCON','ERK303','21186','7006','BALBOA LA CELIA','ROVINSON TORRES RIVERA',1,
   1,0,'-',
   8007571,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1) + 0,
   43,'19234','TYM'),

  /* 28 – JVM223 – sin adicional */
  ('2026-06-17','Miércoles','ALPINA','WILMAR CARDONA','JVM223','21187 21175','7007 9451','ANSERMA','OSCAR MAURICIO RESTREPO MORENO, JHON FREDY MORENO',2,
   2,0,'-',
   16702133,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1) + 0,
   56,'19238','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional */
  ('2026-06-17','Miércoles','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19227 19235 19251','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   5593512,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM');

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
WHERE fecha = '2026-06-17'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
