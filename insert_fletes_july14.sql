/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 14 JULIO 2026
   Generado: 2026-07-14
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: TRL186 sale dos veces (RUBEN - Manizales, WILLIAM - Chinchina)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-14'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 14‑Jul‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – SYU652 – EXTRA $60.000 DEL SABADO */
  ('2026-07-14','Martes','ALPINA','JOHAN ECHEVERRY','SYU652','21934TSS 21973','9552','MANIZALES VILLAMARIA','OSCAR MAURICIO RESTREPO MORENO',1,
   1,60000,'SYU652 EXTRA $60.000 DEL SABADO',
   5606508,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   58,'19585','TYM'),

  /* 02 – TRL186 (RUBEN) – Manizales */
  ('2026-07-14','Martes','ALPINA','RUBEN','TRL186','21974','9553','MANIZALES VILLAMARIA','ANDRES MATEO VILLALBA DIAZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   3940005,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   42,'19586','TYM'),

  /* 03 – WFV015 – con factura AP */
  ('2026-07-14','Martes','ALPINA','YONNI VALENCIA','WFV015','21975','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   8093102,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   54,'AP687888 19587','TYM'),

  /* 04 – EYY183 – con factura AP */
  ('2026-07-14','Martes','ALPINA','JOHN ARENAS','EYY183','21976','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   10685196,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   47,'AP687887 19588','TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-07-14','Martes','ALPINA','MIGUEL GONZALES','SLI587','21953 21977','9556 9550','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   5389922,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   44,'19589','TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-07-14','Martes','ALPINA','RICARDO PINEDA','WGZ876','21949 21978','9557 9559','SUPIA','JUAN MANUEL DELGADO NARVAEZ, CAMILO SUAREZ GARCIA',2,
   2,0,'-',
   6986526,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 0,
   38,NULL,'TYM'),

  /* 07 – TRL186 (WILLIAM) – Chinchina */
  ('2026-07-14','Martes','ALPINA','WILLIAM','TRL186','21880TSS 21956 21991','9559 7002','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,0,'-',
   7035420,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   59,'19590','TYM'),

  /* 08 – EYX091 – sin adicional */
  ('2026-07-14','Martes','ALPINA','ANDRES GOMEZ','EYX091','21954','9560','RIOSUCIO-SUPIA SUPERMERCADO','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   9251266,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 0,
   8,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 09 – SPU120 – con factura AP */
  ('2026-07-14','Martes','ALPINA','OSWALDO','SPU120','21979','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   6720411,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   41,'AP687893','TYM'),

  /* 10 – ETM037 – con factura AP */
  ('2026-07-14','Martes','ALPINA','OSCAR','ETM037','21980','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'-',
   5276174,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   48,'AP687899','TYM'),

  /* 11 – EQY944 – sin adicional */
  ('2026-07-14','Martes','ALPINA','GOBER CRISTANCHO','EQY944','21957 21981','9603 7008','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   7454473,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   50,'19595','TYM'),

  /* 12 – SXF257 – con facturas AP */
  ('2026-07-14','Martes','ALPINA','FABIO RUIZ','SXF257','21982','9604','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS, SEBASTIAN MONTES',2,
   2,0,'-',
   7336995,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   45,'AP687896 AP687901 AP687897 19592','TYM'),

  /* 13 – WLS478 – con factura AP */
  ('2026-07-14','Martes','ALPINA','HUMBERTO RINCON','WLS478','21983','9605','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   6033301,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   31,'AP687898 19593','TYM'),

  /* 14 – SMH182 – sin adicional */
  ('2026-07-14','Martes','ALPINA','ANDRES QUINTERO','SMH182','21984','9606','CIRCASIA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   3259090,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   32,'19594','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-07-14','Martes','ALPINA','GABRIEL PEREZ','SMO183','21964','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   5711309,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional */
  ('2026-07-14','Martes','ALPINA','JULIAN CUELLAR','VZD334','21965','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   6497832,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-07-14','Martes','ALPINA','RICARDO LOPEZ','TMZ674','21966','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, JHON FREDY MORENO',2,
   2,0,'-',
   6064886,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-07-14','Martes','ALPINA','CARLOS VELASCO','SPQ814','21967','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   3684846,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   41,'19598','TYM'),

  /* 19 – WHM317 – sin adicional */
  ('2026-07-14','Martes','ALPINA','HUMBERTO PARRA','WHM317','21968','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   4094442,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-07-14','Martes','ALPINA','MIGUEL TABARES','PEK019','21969','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   5460989,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 21 – XVI496 – sin adicional */
  ('2026-07-14','Martes','ALPINA','PABLO RAMIREZ','XVI496','21970','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   6999756,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-07-14','Martes','ALPINA','JULIAN','WLC133','21971','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, CARLOS JIMENEZ',2,
   2,0,'-',
   12108085,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-07-14','Martes','ALPINA','ADALBERTO MEJIA','TNH494','21972','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   3704697,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 24 – WTN748 – sin adicional */
  ('2026-07-14','Martes','ALPINA','DIEGO RATIVA','WTN748','21985','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, JUAN LARGO',2,
   2,0,'-',
   6832812,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – EST067 – sin adicional */
  ('2026-07-14','Martes','ALPINA','JORGE RIVILLAS','EST067','21986','7005','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   4404253,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1) + 0,
   27,'19597','TYM'),

  /* 26 – ERK303 – sin adicional */
  ('2026-07-14','Martes','ALPINA','JORGE ALARCON','ERK303','21987 21951','7006 9450','SANTUARIO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   11235108,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1) + 0,
   52,'19596 19591','TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-07-14','Martes','ALPINA','WILMAR CARDONA','JVM223','21952 21988','7007 9451','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   9534630,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   61,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-07-14','Martes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19599 19584','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   3123364,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   31,NULL,'TYM');

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
WHERE fecha = '2026-07-14'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
