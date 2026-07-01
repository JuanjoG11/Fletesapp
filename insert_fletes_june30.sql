/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 30 JUNIO 2026
   Generado: 2026-06-30
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-30'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 30‑Jun‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – TRL186 – VALOR DE FLETE $400.000 */
  ('2026-06-30','Martes','ALPINA','WILLIAM','TRL186','','FLORIDA PRADERA N','MANIZALES VILLAMARIA','',0,
   0,400000,'TRL186 VALOR DE FLETE $400.000',
   11589840,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 400000,
   2,'AP673926-927','TYM'),

  /* 02 – SYU652 – con facturas FEP+AP */
  ('2026-06-30','Martes','ALPINA','JOHAN ECHEVERRY','SYU652','21581','9552','MANIZALES VILLAMARIA','ANDRES MATEO VILLALBA DIAZ, CAMILO SUAREZ GARCIA',2,
   2,0,'-',
   11458620,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   61,'AP674047 FEP1188432 19401','TYM'),

  /* 03 – KOL802 – sin adicional */
  ('2026-06-30','Martes','ALPINA','CAMILO CASTAÑO','KOL802','21582','9553','MANIZALES VILLAMARIA','LUIS CARLOS CADAVID RESTREPO',1,
   1,0,'-',
   5811728,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   43,'19402','TYM'),

  /* 04 – WFV015 – con factura AP */
  ('2026-06-30','Martes','ALPINA','YONNI VALENCIA','WFV015','21540TSS 21583','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ, CRISTIAN CAMILO OSPINA PARRA',2,
   2,0,'-',
   8827479,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   53,'AP674048 19403','TYM'),

  /* 05 – EYY183 – con factura AP */
  ('2026-06-30','Martes','ALPINA','JOHN ARENAS','EYY183','21584','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   7087199,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'AP674046 19404','TYM'),

  /* 06 – SLI587 – con facturas FEP */
  ('2026-06-30','Martes','ALPINA','MIGUEL GONZALES','SLI587','21562 21585','9556 9550','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   8089620,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'FEP1188431-436','TYM'),

  /* 07 – WGZ876 – EXTRA $60.000 */
  ('2026-06-30','Martes','ALPINA','RICARDO PINEDA','WGZ876','21544TSS 21586','9557','SUPIA','JUAN MANUEL DELGADO NARVAEZ',1,
   1,60000,'WGZ876 EXTRA $60.000',
   7756385,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 60000,
   41,'19407','TYM'),

  /* 08 – SMH182 – sin adicional */
  ('2026-06-30','Martes','ALPINA','JUAN DAVID','SMH182','21588','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,0,'-',
   3874402,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   53,'19406','TYM'),

  /* 09 – EYX091 – sin adicional */
  ('2026-06-30','Martes','ALPINA','CARLOS GOMEZ','EYX091','21563','9560','RIOSUCIO-SUPIA SUPERMERCADO','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   12729928,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 0,
   8,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 10 – TUL630 – VALOR DE FLETE $480.000 INCLUYE DESCARGUE */
  ('2026-06-30','Martes','ALPINA','JUAN DAVID','TUL630','21552','7008','CALARCA','',0,
   0,480000,'TUL630 VALOR DE FLETE $480.000 INCLUYE DESCARGUE',
   7956020,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 480000,
   2,'AP669888','TYM'),

  /* 11 – SXE734 – VALOR DE FLETE $700.000 INCLUYE DESCARGUE */
  ('2026-06-30','Martes','ALPINA','WALTER RAMIREZ','SXE734','','M19 M50 N','ARMENIA','',0,
   0,700000,'SXE734 VALOR DE FLETE $700.000 INCLUYE DESCARGUE',
   21293500,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 700000,
   2,'AP669886-887','TYM'),

  /* 12 – SPU120 – con factura AP */
  ('2026-06-30','Martes','ALPINA','OSWALDO','SPU120','21589','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   5854496,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   42,'AP672666','TYM'),

  /* 13 – VZD334 – con factura AP */
  ('2026-06-30','Martes','ALPINA','JULIAN CUELLAR','VZD334','21590','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'-',
   6011800,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   52,'AP674051','TYM'),

  /* 14 – EQY944 – sin adicional */
  ('2026-06-30','Martes','ALPINA','GOBER CRISTANCHO','EQY944','21591','9603','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   6261351,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   54,'19409 19410','TYM'),

  /* 15 – SXF257 – con factura AP */
  ('2026-06-30','Martes','ALPINA','FABIO RUIZ','SXF257','21592','9604','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS',1,
   1,0,'-',
   6604276,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   54,'AP674050 19408 19409','TYM'),

  /* 16 – WLS478 – sin adicional */
  ('2026-06-30','Martes','ALPINA','HUMBERTO RINCON','WLS478','21568','9605','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   5646276,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   39,'19411','TYM'),

  /* 17 – TTL256 – sin adicional */
  ('2026-06-30','Martes','ALPINA','CRISTIAN','TTL256','21569','9606','CIRCASIA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   4515284,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   53,'19412','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 18 – SMO183 – sin adicional */
  ('2026-06-30','Martes','ALPINA','GABRIEL PEREZ','SMO183','21572','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   4966953,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   37,NULL,'TYM'),

  /* 19 – XVI496 – sin adicional */
  ('2026-06-30','Martes','ALPINA','PABLO RAMIREZ','XVI496','21573','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   6729775,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 20 – TMZ674 – sin adicional */
  ('2026-06-30','Martes','ALPINA','RICARDO LOPEZ','TMZ674','21574','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   3857166,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   39,NULL,'TYM'),

  /* 21 – SPQ814 – sin adicional */
  ('2026-06-30','Martes','ALPINA','CARLOS VELASCO','SPQ814','21575','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   4822163,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   44,'19414','TYM'),

  /* 22 – WHM317 – sin adicional */
  ('2026-06-30','Martes','ALPINA','HUMBERTO PARRA','WHM317','21576','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   5869430,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 23 – PEK019 – sin adicional */
  ('2026-06-30','Martes','ALPINA','MIGUEL TABARES','PEK019','21577','9458','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES',1,
   1,0,'-',
   6962118,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 24 – WHM896 – sin adicional */
  ('2026-06-30','Martes','ALPINA','ALEXANDER CUELLAR','WHM896','21578','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA, JHON FREDY MORENO',2,
   2,0,'-',
   9641985,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* 25 – WLC133 – sin adicional */
  ('2026-06-30','Martes','ALPINA','JULIAN','WLC133','21579','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, SEBASTIAN MONTES',2,
   2,0,'-',
   9947214,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 26 – TNH494 – sin adicional */
  ('2026-06-30','Martes','ALPINA','ADALBERTO MEJIA','TNH494','21580','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   5161721,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 27 – WTN748 – sin adicional */
  ('2026-06-30','Martes','ALPINA','DIEGO RATIVA','WTN748','21593','7004','PEREIRA - DOSQUEBRADAS','ANDRES CAMILO MUÑOZ CAICEDO, JUAN JOSE HIGUITA',2,
   2,0,'-',
   7336731,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 28 – EST067 – sin adicional */
  ('2026-06-30','Martes','ALPINA','JORGE RIVILLAS','EST067','21594','7005','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   8864624,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARGELIA EL CAIRO' LIMIT 1) + 0,
   31,NULL,'TYM'),

  /* 29 – ERK303 – ADICIONAL $50.000 ENTREGA SUPER */
  ('2026-06-30','Martes','ALPINA','JORGE ALARCON','ERK303','21560 21570','7006 9450','SANTUARIO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,50000,'ERK303 ADICIONAL $50.000 ENTREGA DE SUPER',
   19291627,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1) + 50000,
   53,'19413','TYM'),

  /* 30 – JVM223 – ADICIONAL $50.000 SOBRECARGO */
  ('2026-06-30','Martes','ALPINA','WILMAR CARDONA','JVM223','21561 21571','7007 9451','BELEN DE UMBRIA','OSCAR MAURICIO RESTREPO MORENO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,50000,'JVM223 ADICIONAL $50.000 SOBRECARGO',
   14250945,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 50000,
   54,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 31 – SQB119 – sin adicional */
  ('2026-06-30','Martes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19399','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   5236009,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   49,NULL,'TYM');

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
WHERE fecha = '2026-06-30'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
