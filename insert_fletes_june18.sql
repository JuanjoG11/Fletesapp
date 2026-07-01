/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 18 JUNIO 2026
   Generado: 2026-06-18
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-18'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 18‑Jun‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – TRL186 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','WILLIAM','TRL186','21217 21224 21225','7001 7000 9550','MANIZALES VILLAMARIA','CRISTIAN CAMILO OSPINA PARRA, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   18417344,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   5,NULL,'TYM'),

  /* 02 – SYU652 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','JOHAN ECHEVERRY','SYU652','21241','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   5095518,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   42,'19265','TYM'),

  /* 03 – KOL802 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','CAMILO CASTAÑO','KOL802','21242','9553','MANIZALES VILLAMARIA','LUIS CARLOS CADAVID RESTREPO',1,
   1,0,'-',
   3784515,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   42,'19266','TYM'),

  /* 04 – EYX091 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','CARLOS GOMEZ','EYX091','21243','9554','NEIRA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   8777099,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1) + 0,
   56,'19256','TYM'),

  /* 05 – EYY183 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','JOHN ARENAS','EYY183','21244','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6144354,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   54,'19267','TYM'),

  /* 06 – SLI587 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','MIGUEL GONZALES','SLI587','21245','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   4997012,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   49,'19268','TYM'),

  /* 07 – WGZ876 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','RICARDO PINEDA','WGZ876','21218 21246','9557 9560','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   12807134,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1) + 0,
   56,'19245 19269','TYM'),

  /* 08 – SMH182 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','JUAN DAVID','SMH182','21248','9559','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   11755709,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RDA S JOSE BELALCAZAR' LIMIT 1) + 0,
   52,'19271','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 09 – WFV015 – EXTRA $60.000 */
  ('2026-06-18','Jueves','ALPINA','YONNI VALENCIA','WFV015','21220','7008','CALARCA','JOHAN STIVEN MUÑOZ RUIZ',1,
   1,60000,'WFV015 EXTRA $60.000',
   10881711,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 60000,
   3,NULL,'TYM'),

  /* 10 – SPU120 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','OSWALDO','SPU120','21221 21249','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO, CAMILO SUAREZ GARCIA',2,
   2,0,'-',
   8111409,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   64,NULL,'TYM'),

  /* 11 – VZD334 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','JULIAN CUELLAR','VZD334','21250','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'-',
   7003325,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   63,'19261 19260','TYM'),

  /* 12 – EQY944 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','GOBER CRISTANCHO','EQY944','21251','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   6029819,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   64,'AP661624','TYM'),

  /* 13 – SXF257 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','FABIO RUIZ','SXF257','21252','9604','ALCALA ULLOA','CAMILO ANDRES CONTRERAS RIVAS',1,
   1,0,'-',
   7536519,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1) + 0,
   49,'19275','TYM'),

  /* 14 – WLS478 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','HUMBERTO RINCON','WLS478','21228','9605','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, JUAN JOSE CONTRERAS HERNANDEZ',2,
   2,0,'-',
   9540337,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1) + 0,
   57,'19276','TYM'),

  /* 15 – TTL256 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','YIMERSON GARCIA','TTL256','21219 21229','9606 9600','FILANDIA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   11913404,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1) + 0,
   44,'19278','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 16 – SMO183 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','GABRIEL PEREZ','SMO183','21232','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   4426336,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   42,NULL,'TYM'),

  /* 17 – XVI496 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','PABLO RAMIREZ','XVI496','21233','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   9479774,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,'AP661905-907 19257','TYM'),

  /* 18 – TMZ674 – EXTRA $60.000 */
  ('2026-06-18','Jueves','ALPINA','RICARDO LOPEZ','TMZ674','21234','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,60000,'TMZ674 EXTRA $60.000',
   3819645,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   40,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','CARLOS VELASCO','SPQ814','21226 21235','9456 7002','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5302623,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   42,NULL,'TYM'),

  /* 20 – WHM317 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','HUMBERTO PARRA','WHM317','21236','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   4861135,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   45,'19263','TYM'),

  /* 21 – PEK019 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','MIGUEL TABARES','PEK019','21237','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   5397440,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 22 – WHM896 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','ALEXANDER CUELLAR','WHM896','21238','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   6115794,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   48,'AP662903','TYM'),

  /* 23 – WLC133 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','JULIAN','WLC133','21239','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   5424132,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   38,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','ADALBERTO MEJIA','TNH494','21240','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   9653856,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   59,'AP663013','TYM'),

  /* 25 – WTN748 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','DIEGO RATIVA','WTN748','21253','7004','MARSELLA','BRAHIAN STIVEN VALENCIA IGLESIAS, ANDRES CAMILO MUÑOZ CAICEDO',2,
   2,0,'-',
   9532708,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARSELLA' LIMIT 1) + 0,
   51,'AP662787 19258','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 26 – EST067 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','JORGE RIVILLAS','EST067','21254','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   6656577,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   43,'AP663014','TYM'),

  /* 27 – ERK303 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','JORGE ALARCON','ERK303','21230','7006','APIA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   8225012,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 0,
   48,'19259','TYM'),

  /* 28 – JVM223 – sin adicional */
  ('2026-06-18','Jueves','ALPINA','WILMAR CARDONA','JVM223','21231 21216','7007 9451','VITERBO','OSCAR MAURICIO RESTREPO MORENO, JHON FREDY MORENO',2,
   2,0,'-',
   10313310,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1) + 0,
   57,'19277','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional */
  ('2026-06-18','Jueves','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19264','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   4300887,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   47,NULL,'TYM');

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
WHERE fecha = '2026-06-18'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
