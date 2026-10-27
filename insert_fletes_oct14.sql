/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 14 OCTUBRE 2026
   Generado: 2026-10-14
   ✅ Nombres de auxiliares normalizados según lista oficial

   Notas:
     - WFR160   ADICIONAL AL FLETE $250.000 (2 auxiliares, planillas 24704 24688 + FEP 20788 20787)
     - WEP384   ADICIONAL AL FLETE $200.000 (MARMATO LA MERCED, 2 auxiliares)
     - WGZ876   EXTRA $60.000 (AGUADAS PACORA, planillas 24655 24693 + FEP 20784)
     - TMZ674   ADICIONAL AL FLETE $50.000
     - WLC133   ADICIONAL AL FLETE $26.000 (2 auxiliares)
     - SXF257   fac adicional AP774414 (2 auxiliares, planillas 24686 24717)
     - LUM993   aparece DOS VECES:
                  · 9459 conductor PABLO RAMIREZ (2 auxiliares)
                  · 7004 F conductor ANDRES (1 auxiliar, + FEP 20774)
     - TRF860   FLEISCHMANN VALOR DE FLETE $350.000 (CARTAGO 2T, planillas 20776 20778)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-14'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 14‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

  /* 01 – SYU652 – sin adicional (AP 24687) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24687','9552','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,0,'-',
   5414324,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5414324) + 0,
   38,NULL,'TYM'),

  /* 02 – WFR160 – ADICIONAL AL FLETE $250.000 (AP 24704 24688 + FEP 20788 20787, 2 auxiliares) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24704 24688','9553 7001 F','MANIZALES VILLAMARIA','CARLOS JIMENEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,250000,'ADICIONAL AL FLETE $250.000',
   13830944,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 13830944) + 250000,
   62,NULL,'TYM'),

  /* 03 – EYX091 – sin adicional (AP 24703 24689 + FEP 20782, 2 auxiliares) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','24703 24689','9554 7000 F','MANIZALES VILLAMARIA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   8848415,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 8848415) + 0,
   54,NULL,'TYM'),

  /* 04 – SPU120 – sin adicional (AP 24690) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24690','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   5803419,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5803419) + 0,
   44,NULL,'TYM'),

  /* 05 – TTL256 – sin adicional (AP 24691 + FEP 20783 20775) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TTL256' AND razon_social='TYM'),
   'TTL256','24691','9556 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   5649072,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5649072) + 0,
   41,NULL,'TYM'),

  /* 06 – WEP384 – ADICIONAL AL FLETE $200.000 (AP 24692, 2 auxiliares) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24692','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,200000,'ADICIONAL AL FLETE $200.000',
   14053565,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1), 14053565) + 200000,
   23,NULL,'TYM'),

  /* 07 – MAT480 – sin adicional (AP 24694 + FEP 20785, 2 auxiliares) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='MAT480' AND razon_social='TYM'),
   'MAT480','24694','9559 F','PALESTINA ARAUCA','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
   2,0,'-',
   11853034,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PALESTINA ARAUCA' LIMIT 1), 11853034) + 0,
   50,NULL,'TYM'),

  /* 08 – WGZ876 – EXTRA $60.000 (AP 24655 24693 + FEP 20784, 2 auxiliares) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','24655 24693','9558 F','AGUADAS PACORA','JOHN EDWAR ZAPATA ACEVEDO, JUAN RICO',2,
   2,60000,'EXTRA $60.000',
   14825303,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1), 14825303) + 60000,
   82,NULL,'TYM'),

  /* ── ZONA ARMENIA ─────────────────────────────────────────── */

  /* 09 – WFV015 – sin adicional (AP 24685 24714, 2 auxiliares) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFV015' AND razon_social='TYM'),
   'WFV015','24685 24714','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO, SAMUEL ARIAS',2,
   2,0,'-',
   12201022,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 12201022) + 0,
   49,NULL,'TYM'),

  /* 10 – TJX795 – sin adicional (AP 24684 24715, 2 auxiliares) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TJX795' AND razon_social='TYM'),
   'TJX795','24684 24715','9602 7008','ARMENIA','YERFREY FLOWER, CRISTIAN GIRALDO',2,
   2,0,'-',
   12283436,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 12283436) + 0,
   55,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional (AP 24700, 2 auxiliares) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24700','9603','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, JHON FREDY MORENO',2,
   2,0,'-',
   8995303,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 8995303) + 0,
   55,NULL,'TYM'),

  /* 12 – SXF257 – sin adicional (AP 24686 24717 + fac AP774414, 2 auxiliares) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24686 24717','9604 7010','QUIMBAYA','JOSE ALEXANDER CONSTAIN PERLAZA, YESID PATIÑO',2,
   2,0,'-',
   10631972,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1), 10631972) + 0,
   35,'AP774414','TYM'),

  /* 13 – WLS478 – sin adicional (AP 24695 + FEP 20781) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24695','9605 F','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   7162302,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1), 7162302) + 0,
   41,NULL,'TYM'),

  /* 14 – WHM896 – sin adicional (AP 24683 24696 + FEP 20780) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24683 24696','9606 9600 F','SALENTO','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   7889288,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1), 7889288) + 0,
   29,NULL,'TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

  /* 15 – SMO183 – sin adicional (AP 24705) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24705','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   7543170,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7543170) + 0,
   61,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional (AP 24706 + FEP 20773) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24706','9454 F','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7969366,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7969366) + 0,
   46,NULL,'TYM'),

  /* 17 – TMZ674 – ADICIONAL AL FLETE $50.000 (AP 24699) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TMZ674' AND razon_social='TYM'),
   'TMZ674','24699','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,50000,'ADICIONAL AL FLETE $50.000',
   5827083,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5827083) + 50000,
   38,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional (AP 24708) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24708','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   7186804,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 7186804) + 0,
   54,NULL,'TYM'),

  /* 19 – BCS450 – sin adicional (AP 24709) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='BCS450' AND razon_social='TYM'),
   'BCS450','24709','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7821366,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7821366) + 0,
   52,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional (AP 24710) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24710','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,0,'-',
   7947087,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7947087) + 0,
   54,NULL,'TYM'),

  /* 21 – LUM993 – sin adicional (AP 24711, 2 auxiliares — conductor texto fijo, ruta 9459) */
  ('2026-10-14','Miércoles','ALPINA',
   'PABLO RAMIREZ',
   'LUM993','24711','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO, PABLO RAMIREZ',2,
   2,0,'-',
   8218755,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8218755) + 0,
   60,NULL,'TYM'),

  /* 22 – WLC133 – ADICIONAL AL FLETE $26.000 (AP 24712, 2 auxiliares) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24712','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, MARLON MURILLO',2,
   2,26000,'ADICIONAL AL FLETE $26.000',
   7354662,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7354662) + 26000,
   67,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional (AP 24681 24713) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','24681 24713','9461 9450','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   7224048,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 7224048) + 0,
   48,NULL,'TYM'),

  /* 24 – LUM993 – sin adicional (AP 24718 + FEP 20774 — ruta 7004 F, conductor texto fijo ANDRES) */
  ('2026-10-14','Miércoles','ALPINA',
   'ANDRES',
   'LUM993','24718','7004 F','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   8495139,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8495139) + 0,
   60,NULL,'TYM'),

  /* ── ZONA CARTAGO / OCCIDENTE ─────────────────────────────── */

  /* 25 – WTN748 – sin adicional (AP 24719) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','24719','7005 F','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   9211980,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARGELIA EL CAIRO' LIMIT 1), 9211980) + 0,
   29,NULL,'TYM'),

  /* 26 – ERK303 – sin adicional (AP 24697 + FEP 20772 20771, 2 auxiliares) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','24697','7006 F','BALBOA LA CELIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   7705314,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1), 7705314) + 0,
   38,NULL,'TYM'),

  /* 27 – JVM223 – sin adicional (AP 24698 24682 + FEP 20777, 2 auxiliares) */
  ('2026-10-14','Miércoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24698 24682','7007 9451 F','ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   14631308,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1), 14631308) + 0,
   51,NULL,'TYM'),

  /* ── FLEISCHMANN ──────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional (FEP 20789 20791) */
  ('2026-10-14','Miércoles','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','20789 20791','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   5910829,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5910829) + 0,
   55,NULL,'TYM'),

  /* 29 – TRF860 – VALOR DE FLETE $350.000 (FEP 20776 20778, CARTAGO 2T) */
  ('2026-10-14','Miércoles','FLEISCHMANN',
   'ALBERTO GONZALO',
   'TRF860','20776 20778','FLEISCHMANN','CARTAGO 2T','JULIAN RODRIGUEZ',1,
   1,0,'-',
   5405374,
   350000,
   36,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa,
       contratista     AS conductor_bd,
       zona, poblacion,
       precio          AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-10-14'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
