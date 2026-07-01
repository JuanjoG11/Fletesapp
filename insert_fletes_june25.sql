/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 25 JUNIO 2026
   Generado: 2026-06-25
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-25'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 25‑Jun‑2026
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
  ('2026-06-25','Jueves','ALPINA','JOHAN ECHEVERRY','SYU652','21452','9552','MANIZALES VILLAMARIA','ANDRES MATEO VILLALBA DIAZ',1,
   1,0,'-',
   5232091,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'19362','TYM'),

  /* 02 – KOL802 – ADICIONAL $100.000 ENTREGA SUPERMERCADO */
  ('2026-06-25','Jueves','ALPINA','CAMILO CASTAÑO','KOL802','21453','9553','MANIZALES VILLAMARIA','LUIS CARLOS CADAVID RESTREPO, CRISTIAN CAMILO OSPINA PARRA',2,
   2,100000,'KOL802 ADICIONAL $100.000 ENTREGA DE SUPERMERCADO',
   14957681,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 100000,
   43,'AP668542','TYM'),

  /* 03 – EYX091 – sin adicional */
  ('2026-06-25','Jueves','ALPINA','CARLOS GOMEZ','EYX091','21442','9554','NEIRA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   8026394,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 04 – EYY183 – con factura AP */
  ('2026-06-25','Jueves','ALPINA','JOHN ARENAS','EYY183','21454','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   7139977,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   58,'AP668543 19364','TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-06-25','Jueves','ALPINA','MIGUEL GONZALES','SLI587','21455','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   5174474,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   55,'19365','TYM'),

  /* 06 – WGZ876 – EXTRA $60.000 */
  ('2026-06-25','Jueves','ALPINA','RICARDO PINEDA','WGZ876','21429 21456','9557 9560','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ',1,
   1,60000,'WGZ876 EXTRA $60.000',
   12985682,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1) + 60000,
   56,'19333','TYM'),

  /* 07 – SMH182 – sin adicional */
  ('2026-06-25','Jueves','ALPINA','JUAN DAVID','SMH182','21458','9559','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   10119837,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RDA S JOSE BELALCAZAR' LIMIT 1) + 0,
   53,'19367','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 08 – WFV015 – EXTRA $60.000 */
  ('2026-06-25','Jueves','ALPINA','YONNI VALENCIA','WFV015','21432 21424','7008','CALARCA','CAMILO SUAREZ GARCIA',1,
   1,60000,'WFV015 EXTRA $60.000',
   13138790,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 60000,
   3,NULL,'TYM'),

  /* 09 – SPU120 – con factura AP */
  ('2026-06-25','Jueves','ALPINA','OSWALDO','SPU120','21459','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   7933092,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   57,'AP669885','TYM'),

  /* 10 – VZD334 – sin adicional */
  ('2026-06-25','Jueves','ALPINA','JULIAN CUELLAR','VZD334','21460','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'-',
   7031080,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   65,'19360 19354 19353','TYM'),

  /* 11 – EQY944 – con factura AP */
  ('2026-06-25','Jueves','ALPINA','GOBER CRISTANCHO','EQY944','21461','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   5116481,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   59,'AP668539','TYM'),

  /* 12 – SXF257 – ADICIONAL $100.000 ENTREGA NEGOCIACION QUIMBAYA */
  ('2026-06-25','Jueves','ALPINA','FABIO RUIZ','SXF257','21434 21462','9604 7010','ALCALA ULLOA','CAMILO ANDRES CONTRERAS RIVAS, JOHAN STIVEN MUÑOZ RUIZ',2,
   2,100000,'SXF257 ADICIONAL $100.000 ENTREGA DE NEGOCIACION EN QUIMBAYA',
   11268604,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1) + 100000,
   49,'AP669889 19359','TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-06-25','Jueves','ALPINA','HUMBERTO RINCON','WLS478','21436','9605','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, JUAN JOSE CONTRERAS HERNANDEZ',2,
   2,0,'-',
   14322849,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1) + 0,
   55,'19356 19369 19355','TYM'),

  /* 14 – TTL256 – sin adicional */
  ('2026-06-25','Jueves','ALPINA','ANDRES QUINTERO','TTL256','21430 21437','9606 9600','FILANDIA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   8492098,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1) + 0,
   38,'19358','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-06-25','Jueves','ALPINA','GABRIEL PEREZ','SMO183','21443','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   5472739,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 16 – XVI496 – con factura FEP */
  ('2026-06-25','Jueves','ALPINA','PABLO RAMIREZ','XVI496','21444','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   9384882,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   64,'FEP1188031 19351','TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-06-25','Jueves','ALPINA','RICARDO LOPEZ','TMZ674','21445','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5055096,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-06-25','Jueves','ALPINA','CARLOS VELASCO','SPQ814','21431 21446','9456 7002','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   7443682,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 19 – WHM317 – sin adicional */
  ('2026-06-25','Jueves','ALPINA','HUMBERTO PARRA','WHM317','21447','9457','ARABIA ALTAGRACIA','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   5414091,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARABIA ALTAGRACIA' LIMIT 1) + 0,
   52,'19349','TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-06-25','Jueves','ALPINA','MIGUEL TABARES','PEK019','21448','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   4403834,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 21 – WHM896 – sin adicional */
  ('2026-06-25','Jueves','ALPINA','ALEXANDER CUELLAR','WHM896','21449','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   6431630,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   40,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-06-25','Jueves','ALPINA','JULIAN','WLC133','21450','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   5436737,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 23 – TNH494 – ADICIONAL $50.000 ENTREGA MAYORISTA FLEISCHMANN */
  ('2026-06-25','Jueves','ALPINA','ADALBERTO MEJIA','TNH494','21451','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,50000,'TNH494 ADICIONAL $50.000 ENTREGA DE MAYORISTA FLEISCHMANN',
   6953459,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 50000,
   57,'AP669596 AP669892','TYM'),

  /* 24 – WTN748 – sin adicional */
  ('2026-06-25','Jueves','ALPINA','DIEGO RATIVA','WTN748','21463','7004','MARSELLA','BRAHIAN STIVEN VALENCIA IGLESIAS, ANDRES CAMILO MUÑOZ CAICEDO',2,
   2,0,'-',
   10819356,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARSELLA' LIMIT 1) + 0,
   50,'19350','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – EST067 – con factura AP */
  ('2026-06-25','Jueves','ALPINA','JORGE RIVILLAS','EST067','21464','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   7560660,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   50,'AP669894','TYM'),

  /* 26 – ERK303 – sin adicional */
  ('2026-06-25','Jueves','ALPINA','JORGE ALARCON','ERK303','21438','7006','APIA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   8538046,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 0,
   46,'19352','TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-06-25','Jueves','ALPINA','WILMAR CARDONA','JVM223','21428 21439','7007 9451','VITERBO','OSCAR MAURICIO RESTREPO MORENO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   13328485,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1) + 0,
   66,'19348','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-06-25','Jueves','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19357','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   3679847,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   40,NULL,'TYM');

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
WHERE fecha = '2026-06-25'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
