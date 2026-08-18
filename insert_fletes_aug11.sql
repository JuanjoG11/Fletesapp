/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 11 AGOSTO 2026
   Generado: 2026-08-11
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: WFQ635 placa nueva
         Zona 9455 y 9459 sin placa nombrada → TMZ674 y XVI496 por defecto
         ERK303 hoy zona 9453 Pereira
         JVM223 hoy Santa Cecilia zona 7006
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-11'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 11‑Ago‑2026
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
  ('2026-08-11','Martes','ALPINA','JOHAN ECHEVERRY','SYU652','22743','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO, JHONNY LOPEZ',2,
   2,0,'-',
   5567871,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   49,'FEP1191827 9919956','TYM'),

  /* 02 – SLI587 – con facturas FEP (hoy zona 9553) */
  ('2026-08-11','Martes','ALPINA','MIGUEL GONZALES','SLI587','22744','9553','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   7650966,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   58,'FEP1191885 FEP1191890 9919957 9919962','TYM'),

  /* 03 – WFV015 – sin adicional */
  ('2026-08-11','Martes','ALPINA','YONNI VALENCIA','WFV015','22745','9554','MANIZALES VILLAMARIA','JUAN CAMILO COCOMA OROZCO, CRISTIAN CAMILO OSPINA PARRA',2,
   2,0,'-',
   7573657,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   53,'9919958','TYM'),

  /* 04 – EYY183 – con facturas FEP */
  ('2026-08-11','Martes','ALPINA','JOHN ARENAS','EYY183','22746','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN, JUAN MANUEL DELGADO NARVAEZ',2,
   2,0,'-',
   9521989,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   53,'FEP1191828 FEP1191829','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 05 – ETM037 – sin adicional */
  ('2026-08-11','Martes','ALPINA','OSCAR MARIN','ETM037','22725 22748','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO, OSCAR MAURICIO RESTREPO MORENO',2,
   2,0,'-',
   7623272,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 06 – VZD334 – sin adicional */
  ('2026-08-11','Martes','ALPINA','JULIAN CUELLAR','VZD334','22749','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   9007950,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* 07 – WFQ635 – sin adicional (placa nueva) */
  ('2026-08-11','Martes','ALPINA','YENCY','WFQ635','22750','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   8644455,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 08 – SXF257 – sin adicional */
  ('2026-08-11','Martes','ALPINA','FABIO RUIZ','SXF257','22751','9604','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS',1,
   1,0,'-',
   3596488,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 0,
   42,'9919966 9919965','TYM'),

  /* 09 – WLS478 – sin adicional (hoy zona 9606 Caimo Barcelona) */
  ('2026-08-11','Martes','ALPINA','HUMBERTO RINCON','WLS478','22728','9606','CAIMO BARCELONA','VALENTINA GARCIA, CHRISTIAN DAVID CAICEDO MONTAÑO',2,
   2,0,'-',
   6840255,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAIMO BARCELONA' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 10 – WEP384 – sin adicional (Calarca, sin auxiliar) */
  ('2026-08-11','Martes','ALPINA','YOFER','WEP384','22724','7008','CALARCA','',0,
   0,0,'-',
   3388726,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   1,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 11 – ERK303 – sin adicional (hoy zona 9453 Pereira) */
  ('2026-08-11','Martes','ALPINA','JORGE ALARCON','ERK303','22734','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES, JHON FREDY MORENO',2,
   2,0,'-',
   6658463,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 12 – SPU120 – EXTRA $60.000 (zona 9454) */
  ('2026-08-11','Martes','ALPINA','OSWALDO','SPU120','22735','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,60000,'SPU120 EXTRA $60.000',
   7217338,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   48,NULL,'TYM'),

  /* 13 – Zona 9455 sin placa nombrada */
  ('2026-08-11','Martes','ALPINA','','TMZ674','22736','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, VALENTINA GARCIA',2,
   2,0,'-',
   6889177,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 14 – SPQ814 – sin adicional */
  ('2026-08-11','Martes','ALPINA','CARLOS VELASCO','SPQ814','22737','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6664253,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 15 – WHM896 – sin adicional */
  ('2026-08-11','Martes','ALPINA','ALEXANDER CUELLAR','WHM896','22738','9457','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   7442159,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 16 – PEK019 – sin adicional */
  ('2026-08-11','Martes','ALPINA','MIGUEL TABARES','PEK019','22739','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   5002902,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 17 – Zona 9459 sin placa nombrada */
  ('2026-08-11','Martes','ALPINA','','XVI496','22740','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA, SAMUEL ARIAS',2,
   2,0,'-',
   7028952,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   63,NULL,'TYM'),

  /* 18 – WLC133 – sin adicional */
  ('2026-08-11','Martes','ALPINA','JULIAN','WLC133','22741','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   6603887,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   65,NULL,'TYM'),

  /* 19 – WTN748 – sin adicional */
  ('2026-08-11','Martes','ALPINA','DIEGO RATIVA','WTN748','22752','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, BRANDON STEVEN GIL BAEZ',2,
   2,0,'-',
   7538200,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 20 – JVM223 – sin adicional (hoy Santa Cecilia zona 7006) */
  ('2026-08-11','Martes','ALPINA','WILMAR CARDONA','JVM223','22729','7006','SANTA CECILIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   13057196,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA CECILIA' LIMIT 1) + 0,
   43,'9919968','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 21 – SQB119 – sin adicional */
  ('2026-08-11','Martes','FLEISCHMANN','CARLOS ARTURO','SQB119','9919964 19938','FLEISCHMANN','SANTA ROSA','DIEGO FRANCO',1,
   1,0,'-',
   4749956,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   47,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-08-11'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
