/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 22 JULIO 2026
   Generado: 2026-07-22
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-22'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 22‑Jul‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – SYU652 – con facturas FEP */
  ('2026-07-22','Miércoles','ALPINA','JOHAN ECHEVERRY','SYU652','22207','9552','MANIZALES VILLAMARIA','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   6474803,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   46,'FEP1190325 FEP1190322 9919695','TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-07-22','Miércoles','ALPINA','FREDY','KOL802','22190 22208','9553','MANIZALES VILLAMARIA','ANDRES MATEO VILLALBA DIAZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   12859110,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   62,'9919701','TYM'),

  /* 03 – WFV015 – con facturas AP */
  ('2026-07-22','Miércoles','ALPINA','YONNI VALENCIA','WFV015','22209TSS','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   10265919,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   58,'AP694613 AP695359 AP695373 9919702','TYM'),

  /* 04 – EYY183 – con factura AP */
  ('2026-07-22','Miércoles','ALPINA','JOHN ARENAS','EYY183','22210TSS','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6753850,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'AP695412 9919703','TYM'),

  /* 05 – SLI587 – con factura FEP */
  ('2026-07-22','Miércoles','ALPINA','MIGUEL GONZALES','SLI587','22182 22211','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   7938455,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   48,'FEP1190289 9919694 9919704','TYM'),

  /* 06 – WGZ876 – EXTRA $60.000 */
  ('2026-07-22','Miércoles','ALPINA','RICARDO PINEDA','WGZ876','22212','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ',1,
   1,60000,'WGZ876 EXTRA $60.000',
   14021975,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1) + 60000,
   26,NULL,'TYM'),

  /* 07 – EYX091 – sin adicional */
  ('2026-07-22','Miércoles','ALPINA','ANDRES GOMEZ','EYX091','22191','9558','AGUADAS PACORA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   13483471,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1) + 0,
   75,'9919706','TYM'),

  /* 08 – TRL186 – sin adicional */
  ('2026-07-22','Miércoles','ALPINA','WILLIAM','TRL186','22213','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ, CAMILO SUAREZ GARCIA',2,
   2,0,'-',
   9661851,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   46,'9919707','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 09 – SPU120 – sin adicional */
  ('2026-07-22','Miércoles','ALPINA','OSWALDO','SPU120','22184 22214','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   9756771,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 10 – ETM037 – con factura AP */
  ('2026-07-22','Miércoles','ALPINA','OSCAR MARIN','ETM037','22215TSS','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, CARLOS JIMENEZ',2,
   2,0,'-',
   6779799,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   59,'AP695665','TYM'),

  /* 11 – EQY944 – sin adicional */
  ('2026-07-22','Miércoles','ALPINA','GOBER CRISTANCHO','EQY944','22216','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   9498644,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 12 – SXF257 – sin adicional */
  ('2026-07-22','Miércoles','ALPINA','FABIO RUIZ','SXF257','22185 22217','9604 7010','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS, JUAN LARGO',2,
   2,0,'-',
   10740222,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 0,
   36,NULL,'TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-07-22','Miércoles','ALPINA','HUMBERTO RINCON','WLS478','22186','9605','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   7173376,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1) + 0,
   41,'9919711 9919710','TYM'),

  /* 14 – TTL256 – con facturas AP */
  ('2026-07-22','Miércoles','ALPINA','ANDRES QUINTERO','TTL256','22187','9606 9600','SALENTO','CRISTIAN FABIAN CAMACHO MARTINEZ, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   9187578,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1) + 0,
   36,'AP695943 AP696015 9919709','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-07-22','Miércoles','ALPINA','GABRIEL PEREZ','SMO183','22198','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6154702,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional */
  ('2026-07-22','Miércoles','ALPINA','JULIAN CUELLAR','VZD334','22199','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7493849,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,'9919712','TYM'),

  /* 17 – TMZ674 – con facturas AP */
  ('2026-07-22','Miércoles','ALPINA','RICARDO LOPEZ','TMZ674','22200TSS','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, SEBASTIAN MONTES',2,
   2,0,'-',
   8735550,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   73,'AP694913 AP694927','TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-07-22','Miércoles','ALPINA','CARLOS VELASCO','SPQ814','22201','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   8138205,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 19 – WHM317 – sin adicional */
  ('2026-07-22','Miércoles','ALPINA','HUMBERTO PARRA','WHM317','22202','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7935740,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-07-22','Miércoles','ALPINA','MIGUEL TABARES','PEK019','22203','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   6553948,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 21 – XVI496 – con factura AP */
  ('2026-07-22','Miércoles','ALPINA','PABLO RAMIREZ','XVI496','22204TSS','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   7327202,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   52,'AP695133','TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-07-22','Miércoles','ALPINA','JULIAN','WLC133','22205','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   6760809,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   68,NULL,'TYM'),

  /* 23 – TNH494 – con factura AP */
  ('2026-07-22','Miércoles','ALPINA','ADALBERTO MEJIA','TNH494','22206','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   10302566,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   49,'AP696014','TYM'),

  /* 24 – WTN748 – sin adicional */
  ('2026-07-22','Miércoles','ALPINA','DIEGO RATIVA','WTN748','22218','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   9132723,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   66,'9919713','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – EST067 – sin adicional */
  ('2026-07-22','Miércoles','ALPINA','JORGE RIVILLAS','EST067','22219','7005','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   8653407,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARGELIA EL CAIRO' LIMIT 1) + 0,
   27,NULL,'TYM'),

  /* 26 – ERK303 – ADICIONAL $50.000 PEDIDO DE LA VIRGINIA */
  ('2026-07-22','Miércoles','ALPINA','JORGE ALARCON','ERK303','22188','7006 9450','BALBOA LA CELIA','ROVINSON TORRES RIVERA',1,
   1,50000,'ERK303 ADICIONAL $50.000 PEDIDO DE LA VIRGINIA',
   10795011,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1) + 50000,
   47,'AP695937 9919696','TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-07-22','Miércoles','ALPINA','WILMAR CARDONA','JVM223','22181 22189','7007','ANSERMA','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   17897513,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1) + 0,
   57,'9919699 9919673','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-07-22','Miércoles','FLEISCHMANN','CARLOS CASTAÑO','SQB119','9919708 9919697','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   4514685,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   52,NULL,'TYM');

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
WHERE fecha = '2026-07-22'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
