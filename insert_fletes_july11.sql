/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: SÁBADO 11 JULIO 2026
   Generado: 2026-07-14
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-11'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 11‑Jul‑2026
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
  ('2026-07-11','Sábado','ALPINA','JOHAN ECHEVERRY','SYU652','21915 21934','9552 9550','MANIZALES VILLAMARIA','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   12251916,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   60,'19565','TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','CAMILO CASTAÑO','KOL802','21917 21935','9553 7001','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   7512945,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   58,'19570 19566','TYM'),

  /* 03 – WFV015 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','YONNI VALENCIA','WFV015','21936','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   7192620,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   51,'19567','TYM'),

  /* 04 – EYY183 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','JOHN ARENAS','EYY183','21937','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6969157,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   57,'19571 19568','TYM'),

  /* 05 – SLI587 – EXTRA $60.000 con facturas AP */
  ('2026-07-11','Sábado','ALPINA','MIGUEL GONZALES','SLI587','21938','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,60000,'SLI587 EXTRA $60.000',
   8236747,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   53,'AP686579-580 AP687869 19569','TYM'),

  /* 06 – WGZ876 – EXTRA $60.000 */
  ('2026-07-11','Sábado','ALPINA','RICARDO PINEDA','WGZ876','21939','9557','QUINCHIA','JUAN MANUEL DELGADO NARVAEZ',1,
   1,60000,'WGZ876 EXTRA $60.000',
   10749600,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUINCHIA' LIMIT 1) + 60000,
   49,'19560','TYM'),

  /* 07 – TRL186 – con facturas AP */
  ('2026-07-11','Sábado','ALPINA','WILLIAM','TRL186','21905TSS 21941','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ, SEBASTIAN MONTES',2,
   2,0,'-',
   6972471,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   84,'AP686581 AP686582','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 08 – EQN953 – VALOR DE FLETE $450.000 */
  ('2026-07-11','Sábado','ALPINA','ORLANDO VASQUEZ','EQN953','21916 21918 21923','7008 7009 7010','ARMENIA','ANDRES MATEO VILLALBA DIAZ',1,
   1,0,'EQN953 VALOR DE FLETE $450.000',
   9616437,
   450000,
   5,'AP685057','TYM'),

  /* 09 – SPU120 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','OSWALDO','SPU120','21942','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   4830713,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 10 – ETM037 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','OSCAR MARIN','ETM037','21943','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, CARLOS JIMENEZ',2,
   2,0,'-',
   11729469,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   59,'19581','TYM'),

  /* 11 – EQY944 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','GOBER CRISTANCHO','EQY944','21944','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, CAMILO SUAREZ GARCIA',2,
   2,0,'-',
   7761583,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 12 – SXF257 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','FABIO RUIZ','SXF257','21945','9604','QUIMBAYA','SANTIAGO HENAO MORALES',1,
   1,0,'-',
   5352014,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 0,
   49,'19573 19574 19575','TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','HUMBERTO RINCON','WLS478','21919','9605','GENOVA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   6060553,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GENOVA' LIMIT 1) + 0,
   33,NULL,'TYM'),

  /* 14 – TTL256 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','YIMERSON GARCIA','TTL256','21920','9606','CAIMO BARCELONA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   6900247,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAIMO BARCELONA' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','GABRIEL PEREZ','SMO183','21925','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6256972,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 16 – VZD334 – EXTRA $60.000 */
  ('2026-07-11','Sábado','ALPINA','JULIAN CUELLAR','VZD334','21926','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,60000,'VZD334 EXTRA $60.000',
   7360011,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   49,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','RICARDO LOPEZ','TMZ674','21927','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, JHON FREDY MORENO',2,
   2,0,'-',
   6854724,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   62,'19582','TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','CARLOS VELASCO','SPQ814','21928','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5391664,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 19 – WHM317 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','HUMBERTO PARRA','WHM317','21929','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   5809752,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','MIGUEL TABARES','PEK019','21930','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   5297971,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 21 – XVI496 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','PABLO RAMIREZ','XVI496','21931','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   6882296,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','JULIAN','WLC133','21932','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   5706181,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','ADALBERTO MEJIA','TNH494','21933','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   7205315,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 24 – WTN748 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','DIEGO RATIVA','WTN748','21946','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   7322014,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   63,'19576','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – EST067 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','JORGE RIVILLAS','EST067','21947','7005','EL AGUILA','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5278392,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='EL AGUILA' LIMIT 1) + 0,
   25,NULL,'TYM'),

  /* 26 – DQA454 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','LUIS MONTOYA','DQA454','21921','7006','SANTA CECILIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   11494597,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA CECILIA' LIMIT 1) + 0,
   44,'19578 19577','TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-07-11','Sábado','ALPINA','WILMAR CARDONA','JVM223','21922','7007','GUATICA','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   10664467,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GUATICA' LIMIT 1) + 0,
   68,'19580 19579','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-07-11','Sábado','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19572 19582','FLEISCHMANN','SANTA ROSA','DIEGO FRANCO',1,
   1,0,'-',
   5639176,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   63,NULL,'TYM');

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
WHERE fecha = '2026-07-11'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
