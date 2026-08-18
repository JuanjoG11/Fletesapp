/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 3 AGOSTO 2026
   Generado: 2026-08-04
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: EYX091 lunes sin pedidos → omitido
         EYX092 placa nueva (Supia Riosucio Super martes)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-03'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 03‑Ago‑2026
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
  ('2026-08-03','Martes','ALPINA','JOHAN ECHEVERRY','SYU652','22580','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   7722246,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   67,NULL,'TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-08-03','Martes','ALPINA','FREDY','KOL802','22599 22581','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   7920130,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   54,'9919874','TYM'),

  /* 03 – WFV015 – sin adicional */
  ('2026-08-03','Martes','ALPINA','YONNI VALENCIA','WFV015','22582','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   8209038,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   50,'9919875','TYM'),

  /* 04 – EYY183 – con factura FEP */
  ('2026-08-03','Martes','ALPINA','JOHN ARENAS','EYY183','22569 22583','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   9293939,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   62,'FEP1191252 9919876','TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-08-03','Martes','ALPINA','MIGUEL GONZALES','SLI587','22561 22584','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE, JHONNY LOPEZ',2,
   2,0,'-',
   9507322,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   50,'9919877 9919871 9919872','TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-08-03','Martes','ALPINA','RICARDO PINEDA','WGZ876','22585','9557','SUPIA','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   11262724,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 0,
   48,'9919878','TYM'),

  /* 07 – EYX092 – Supia Riosucio Super (martes) */
  ('2026-08-03','Martes','ALPINA','ANDRES GOMEZ','EYX092','22562','9560','RIOSUCIO-SUPIA SUPERMERCADO','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   16047255,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 0,
   10,NULL,'TYM'),

  /* 08 – WEP384 – sin adicional */
  ('2026-08-03','Martes','ALPINA','YOFER','WEP384','22587','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,0,'-',
   8363938,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   64,'9919879','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 09 – ETM037 – sin adicional */
  ('2026-08-03','Martes','ALPINA','OSCAR MARIN','ETM037','22523 22588','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   7826280,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 10 – VZD334 – EXTRA $40.000 */
  ('2026-08-03','Martes','ALPINA','JULIAN CUELLAR','VZD334','22564 22567 22589','9602','ARMENIA','SANTIAGO HENAO MORALES, CARLOS JIMENEZ',2,
   2,40000,'VZD334 EXTRA $40.000',
   8783813,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 40000,
   65,NULL,'TYM'),

  /* 11 – WPP948 – sin adicional (Calarca, valor fijo de ruta) */
  ('2026-08-03','Martes','ALPINA','SEBASTIAN OROZCO','WPP948','22563','EL PROGRESO','CALARCA','',0,
   0,0,'-',
   10744931,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   1,NULL,'TYM'),

  /* 12 – EQY944 – sin adicional */
  ('2026-08-03','Martes','ALPINA','GOBER CRISTANCHO','EQY944','22590','9603','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA, JHON FREDY MORENO',2,
   2,0,'-',
   7889064,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   56,'9919885 9919884 9919883','TYM'),

  /* 13 – SXF257 – sin adicional */
  ('2026-08-03','Martes','ALPINA','FABIO RUIZ','SXF257','22565 22591','9604','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   6581102,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   38,'9919881','TYM'),

  /* 14 – WLS478 – sin adicional */
  ('2026-08-03','Martes','ALPINA','HUMBERTO RINCON','WLS478','22592','9605','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   5699117,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   41,'9919882','TYM'),

  /* 15 – TTL256 – sin adicional */
  ('2026-08-03','Martes','ALPINA','ANDRES QUINTERO','TTL256','22593','9606','CIRCASIA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   4203441,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   27,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 16 – SMO183 – sin adicional */
  ('2026-08-03','Martes','ALPINA','GABRIEL PEREZ','SMO183','22571','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   8519638,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 17 – SPU120 – sin adicional (zona 9454) */
  ('2026-08-03','Martes','ALPINA','OSWALDO','SPU120','22572','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   6382737,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   37,NULL,'TYM'),

  /* 18 – TMZ674 – sin adicional */
  ('2026-08-03','Martes','ALPINA','RICARDO LOPEZ','TMZ674','22573','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, SAMUEL ANDRES ARIAS',2,
   2,0,'-',
   7756715,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   67,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional */
  ('2026-08-03','Martes','ALPINA','CARLOS VELASCO','SPQ814','22574','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   8258823,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   56,'9919888','TYM'),

  /* 20 – WHM896 – sin adicional */
  ('2026-08-03','Martes','ALPINA','ALEXANDER CUELLAR','WHM896','22575','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   9258441,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional */
  ('2026-08-03','Martes','ALPINA','MIGUEL TABARES','PEK019','22576','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   8798197,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 22 – XVI496 – sin adicional */
  ('2026-08-03','Martes','ALPINA','PABLO RAMIREZ','XVI496','22577','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   9818047,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   67,NULL,'TYM'),

  /* 23 – WLC133 – sin adicional */
  ('2026-08-03','Martes','ALPINA','JULIAN','WLC133','22578','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, VALENTINA GARCIA GOMEZ',2,
   2,0,'-',
   13891162,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   66,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional */
  ('2026-08-03','Martes','ALPINA','ADALBERTO MEJIA','TNH494','22579','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   6072496,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 25 – WTN748 – sin adicional */
  ('2026-08-03','Martes','ALPINA','DIEGO RATIVA','WTN748','22594','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   9147556,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   65,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 26 – EST067 – sin adicional */
  ('2026-08-03','Martes','ALPINA','JORGE RIVILLAS','EST067','22595','7005','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   9884273,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1) + 0,
   34,NULL,'TYM'),

  /* 27 – ERK303 – sin adicional */
  ('2026-08-03','Martes','ALPINA','JORGE ALARCON','ERK303','22559 22596','7006 9450','SANTUARIO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   13745581,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1) + 0,
   53,'9919873 9919887','TYM'),

  /* 28 – JVM223 – sin adicional */
  ('2026-08-03','Martes','ALPINA','WILMAR CARDONA','JVM223','22560 22597','7007 9451','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   14485820,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional */
  ('2026-08-03','Martes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','9919880','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   4410337,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   42,NULL,'TYM');

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
WHERE fecha = '2026-08-03'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
