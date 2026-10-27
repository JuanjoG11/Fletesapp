/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 21 OCTUBRE 2026
   Generado: 2026-10-21

   Notas:
     - WFR160   ADICIONAL AL FLETE $50.000 (AP 24903 24891)
     - TRK507   EXTRA $60.000 (AP 24894 + FEP 20886, facs FEP1197772 FEP1197770)
     - SXE867   ADICIONAL AL FLETE $50.000 (AP 24847 + FEP 20881)
     - SXF257   ADICIONAL AL FLETE $100.000 (AP 24889 24918)
     - WFV015   EXTRA $60.000 (AP 24913)
     - EYX091   facs FEP1197764-767-768-769 (AP 24902 24892 + FEP)
     - SPU120   facs AP781405 FEP1197765-766 (AP 24893 + FEP)
     - WGZ876   AGUADAS PACORA (AP 24860 24896 + FEP 20880)
     - TRF860   VALOR DE FLETE $350.000 (FEP 20870 20877)
     - SQB119   FLEISCHMANN (FEP 20878, facs AP781793 AP782270)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-21'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 21‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

  /* 01 – SYU652 – sin adicional (AP 24890) */
  ('2026-10-21','Miercoles','ALPINA',
   'JOHAN ECHEVERRY',
   'SYU652','24890','9552','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,0,'-',
   8782023,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 8782023) + 0,
   41,NULL,'TYM'),

  /* 02 – WFR160 – ADICIONAL AL FLETE $50.000 (AP 24903 24891, 2 auxiliares) */
  ('2026-10-21','Miercoles','ALPINA',
   'LEANDRO LOPEZ',
   'WFR160','24903 24891','9553 7001','MANIZALES VILLAMARIA','CARLOS JIMENEZ, PABLO RAMIREZ',2,
   2,50000,'ADICIONAL AL FLETE $50.000',
   9816260,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 9816260) + 50000,
   59,NULL,'TYM'),

  /* 03 – EYX091 – sin adicional (AP 24902 24892 + FEP, 2 auxiliares, facs FEP1197764-767-768-769) */
  ('2026-10-21','Miercoles','ALPINA',
   'ANDRES GOMEZ',
   'EYX091','24902 24892','9554 7000','MANIZALES VILLAMARIA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   9632993,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 9632993) + 0,
   59,'FEP1197764 FEP1197767 FEP1197768 FEP1197769','TYM'),

  /* 04 – SPU120 – sin adicional (AP 24893 + FEP, facs AP781405 FEP1197765-766) */
  ('2026-10-21','Miercoles','ALPINA',
   'OSWALDO',
   'SPU120','24893','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   7129791,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7129791) + 0,
   40,'AP781405 FEP1197765 FEP1197766','TYM'),

  /* 05 – TRK507 – EXTRA $60.000 (AP 24894 + FEP 20886, facs FEP1197772 FEP1197770) */
  ('2026-10-21','Miercoles','ALPINA',
   'MIGUEL GONZALES',
   'TRK507','24894','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,60000,'EXTRA $60.000',
   6533584,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6533584) + 60000,
   47,'20886 FEP1197772 FEP1197770','TYM'),

  /* 06 – WEP384 – sin adicional (AP 24895, 2 auxiliares) */
  ('2026-10-21','Miercoles','ALPINA',
   'YOFER LOPEZ',
   'WEP384','24895','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   14267246,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1), 14267246) + 0,
   33,NULL,'TYM'),

  /* 07 – SXE867 – ADICIONAL AL FLETE $50.000 (AP 24847 + FEP 20881, 2 auxiliares) */
  ('2026-10-21','Miercoles','ALPINA',
   'HERIBERTO GARCIA',
   'SXE867','24847','9559','PALESTINA ARAUCA','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
   2,50000,'ADICIONAL AL FLETE $50.000',
   9531186,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PALESTINA ARAUCA' LIMIT 1), 9531186) + 50000,
   41,'20881','TYM'),

  /* 08 – WGZ876 – sin adicional (AP 24860 24896 + FEP 20880, 2 auxiliares) */
  ('2026-10-21','Miercoles','ALPINA',
   'RICARDO PINEDA',
   'WGZ876','24860 24896','9558','AGUADAS PACORA','JOHN EDWAR ZAPATA ACEVEDO, YESID PATIÑO',2,
   2,0,'-',
   18130419,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1), 18130419) + 0,
   81,'20880','TYM'),

  /* ── ZONA ARMENIA ─────────────────────────────────────────── */

  /* 09 – TTL256 – sin adicional (AP 24888 24916, 2 auxiliares) */
  ('2026-10-21','Miercoles','ALPINA',
   'ANDRES QUINTERO',
   'TTL256','24888 24916','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO, SAMUEL ARIAS',2,
   2,0,'-',
   8936047,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 8936047) + 0,
   53,NULL,'TYM'),

  /* 10 – TJX795 – sin adicional (AP 24917, 2 auxiliares) */
  ('2026-10-21','Miercoles','ALPINA',
   'ANDRES QUINTERO',
   'TJX795','24917','9602','ARMENIA','YERFREY FLOWER, CRISTIAN GIRALDO',2,
   2,0,'-',
   8695443,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 8695443) + 0,
   63,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional (AP 24897, 2 auxiliares) */
  ('2026-10-21','Miercoles','ALPINA',
   'GOBER CRISTANCHO',
   'EQY944','24897','9603','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, JUAN RICO',2,
   2,0,'-',
   9416299,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 9416299) + 0,
   55,NULL,'TYM'),

  /* 12 – SXF257 – ADICIONAL AL FLETE $100.000 (AP 24889 24918, 2 auxiliares) */
  ('2026-10-21','Miercoles','ALPINA',
   'FABIO RUIZ',
   'SXF257','24889 24918','9604 7010','QUIMBAYA','JOSE ALEXANDER CONSTAIN PERLAZA, ELKIN GARCIA OCAMPO',2,
   2,100000,'ADICIONAL AL FLETE $100.000',
   9639652,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1), 9639652) + 100000,
   39,NULL,'TYM'),

  /* 13 – MAT480 – sin adicional (AP 24898 + FEP 20874) */
  ('2026-10-21','Miercoles','ALPINA',
   'ELKIN AGUIRRE',
   'MAT480','24898','9605','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   6768685,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1), 6768685) + 0,
   40,'20874','TYM'),

  /* 14 – WHM896 – sin adicional (AP 24887 24899 + FEP 20872) */
  ('2026-10-21','Miercoles','ALPINA',
   'ALEXANDER CUELLAR',
   'WHM896','24887 24899','9606 9600','SALENTO','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   8322945,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1), 8322945) + 0,
   26,'20872','TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

  /* 15 – SMO183 – sin adicional (AP 24907) */
  ('2026-10-21','Miercoles','ALPINA',
   'GABRIEL PEREZ',
   'SMO183','24907','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   7051507,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7051507) + 0,
   54,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional (AP 24908 + FEP 20875) */
  ('2026-10-21','Miercoles','ALPINA',
   'JULIAN CUELLAR',
   'VZD334','24908','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7285901,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7285901) + 0,
   44,'20875','TYM'),

  /* 17 – TMZ674 – sin adicional (AP 24909) */
  ('2026-10-21','Miercoles','ALPINA',
   'RICARDO LOPEZ',
   'TMZ674','24909','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   7532028,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7532028) + 0,
   54,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional (AP 24910) */
  ('2026-10-21','Miercoles','ALPINA',
   'CARLOS VELASCO',
   'SPQ814','24910','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6253656,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 6253656) + 0,
   47,NULL,'TYM'),

  /* 19 – LUM993 – sin adicional (AP 24911) */
  ('2026-10-21','Miercoles','ALPINA',
   'ANDRES',
   'LUM993','24911','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   8423583,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8423583) + 0,
   57,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional (AP 24912) */
  ('2026-10-21','Miercoles','ALPINA',
   'MIGUEL TABARES',
   'PEK019','24912','9458','PEREIRA - DOSQUEBRADAS','JHON FREDY MORENO',1,
   1,0,'-',
   7375862,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7375862) + 0,
   57,NULL,'TYM'),

  /* 21 – WFV015 – EXTRA $60.000 (AP 24913) */
  ('2026-10-21','Miercoles','ALPINA',
   'YONI VALENCIA',
   'WFV015','24913','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
   1,60000,'EXTRA $60.000',
   7224612,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7224612) + 60000,
   52,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional (AP 24914, 2 auxiliares) */
  ('2026-10-21','Miercoles','ALPINA',
   'GABRIEL PEREZ',
   'WLC133','24914','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, MARLON MURILLO',2,
   2,0,'-',
   7853066,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7853066) + 0,
   70,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional (AP 24915 24906) */
  ('2026-10-21','Miercoles','ALPINA',
   'ADALBERTO MEJIA',
   'TNH494','24915 24906','9461 9450','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   9729983,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 9729983) + 0,
   48,NULL,'TYM'),

  /* 24 – SXE499 – sin adicional (AP 24919 + FEP 20876) */
  ('2026-10-21','Miercoles','ALPINA',
   'ANDRES',
   'SXE499','24919','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   9720516,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 9720516) + 0,
   62,'20876','TYM'),

  /* ── ZONA OCCIDENTE ───────────────────────────────────────── */

  /* 25 – WTN748 – sin adicional (AP 24920 + FEP 20869) */
  ('2026-10-21','Miercoles','ALPINA',
   'DIEGO RATIVA',
   'WTN748','24920','7005','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5718666,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1), 5718666) + 0,
   36,'20869','TYM'),

  /* 26 – ERK303 – sin adicional (AP 24900 + FEP 20868) */
  ('2026-10-21','Miercoles','ALPINA',
   'JORGE ALARCON',
   'ERK303','24900','7006','BALBOA LA CELIA','ROVINSON TORRES RIVERA',1,
   1,0,'-',
   7929883,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1), 7929883) + 0,
   41,'20868','TYM'),

  /* 27 – JVM223 – sin adicional (AP 24886 24901 + FEP 20871, 2 auxiliares) */
  ('2026-10-21','Miercoles','ALPINA',
   'WILMAR CARDONA',
   'JVM223','24886 24901','7007 9451','ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   16015655,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1), 16015655) + 0,
   57,'20871','TYM'),

  /* ── FLEISCHMANN ──────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional (FEP 20878, facs AP781793 AP782270) */
  ('2026-10-21','Miercoles','FLEISCHMANN',
   'CARLOS CASTAÑO',
   'SQB119','20878','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   5344410,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5344410) + 0,
   52,'AP781793 AP782270','TYM'),

  /* 29 – TRF860 – VALOR DE FLETE $350.000 (FEP 20870 20877) */
  ('2026-10-21','Miercoles','FLEISCHMANN',
   'ALBERTO GONZALO',
   'TRF860','20870 20877','FLEISCHMANN','CARTAGO 2T','JULIAN RODRIGUEZ',1,
   1,0,'-',
   5390181,
   350000,
   37,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa,
       contratista     AS conductor,
       zona, poblacion,
       precio          AS precio_flete,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-10-21'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
