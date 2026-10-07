/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 7 OCTUBRE 2026
   Generado: 2026-10-07
   Notas:
     - WFR160   ADICIONAL AL FLETE $100.000 (AP767747 FEP1196583)
     - WGZ876   EXTRA $60.000 (AP 24466 24497 + FEP 20699)
     - WFV015   EXTRA $60.000 (AP 24518, fact. adicionales AP767644)
     - PEK019   EXTRA $60.000
     - WLC133   ADICIONAL AL FLETE $26.000
     - EQN953   VALOR DE FLETE $300.000 (AP769030 AP769267)
     - TRF860   VALOR FLETE $350.000 PORQUE ES TODO CARTAGO
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-07'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 07‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ─────────────────────────────── */

  /* 01 – SYU652 – sin adicional (AP 24491 + FEP1196582) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24491','9552 F','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,0,'-',
   4864267,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 4864267) + 0,
   35,'FEP1196582','TYM'),

  /* 02 – WFR160 – ADICIONAL AL FLETE $100.000 (AP 24505 24492 + FEP1196583) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24505 24492','9553 7001 FC','MANIZALES VILLAMARIA','CARLOS JIMENEZ, MARLON MURILLO',2,
   1,100000,'ADICIONAL AL FLETE $100.000',
   11228031,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 11228031) + 100000,
   67,'AP767747 FEP1196583','TYM'),

  /* 03 – EYX091 – sin adicional (AP 24507 + FEP 20695) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','24507 20695','9554 F','MANIZALES VILLAMARIA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   1,0,'-',
   8901656,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 8901656) + 0,
   57,NULL,'TYM'),

  /* 04 – SPU120 – sin adicional (AP 24494 + FEP 20696) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24494 20696','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   7878104,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7878104) + 0,
   47,NULL,'TYM'),

  /* 05 – TTL256 – sin adicional (AP 24495 + FEP 20697) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TTL256' AND razon_social='TYM'),
   'TTL256','24495 20697','9556 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   6411821,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6411821) + 0,
   47,NULL,'TYM'),

  /* 06 – WEP384 – sin adicional (AP 24496, MARMATO LA MERCED) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24496','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   1,0,'-',
   12637328,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1), 12637328) + 0,
   34,NULL,'TYM'),

  /* 07 – MAT480 – sin adicional (AP 24498 + FEP 20700, PALESTINA ARAUCA) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='MAT480' AND razon_social='TYM'),
   'MAT480','24498 20700','9559 F','PALESTINA ARAUCA','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
   1,0,'-',
   10941900,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PALESTINA ARAUCA' LIMIT 1), 10941900) + 0,
   44,NULL,'TYM'),

  /* 08 – WGZ876 – EXTRA $60.000 (AP 24466 24497 + FEP 20699, AGUADAS PACORA) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','24466 24497 20699','9558 F','AGUADAS PACORA','JOHN EDWAR ZAPATA ACEVEDO, JUAN RICO',2,
   1,60000,'EXTRA $60.000',
   15558125,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1), 15558125) + 60000,
   67,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ──────────────────────────────────── */

  /* 09 – WFV015 – EXTRA $60.000 (AP 24518, fact. adicionales AP767644, ARMENIA) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFV015' AND razon_social='TYM'),
   'WFV015','24518','9601 LA16','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,60000,'EXTRA $60.000',
   6854970,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 6854970) + 60000,
   51,'AP767644','TYM'),

  /* 10 – TJX795 – sin adicional (AP 24519 + FEP 20698 20702, ARMENIA) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TJX795' AND razon_social='TYM'),
   'TJX795','24519 20698 20702','9602 F','ARMENIA','YERFREY FLOWER, CRISTIAN GIRALDO',2,
   1,0,'-',
   11255990,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 11255990) + 0,
   64,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional (AP 24520, ARMENIA) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24520','9603','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, JHON FREDY MORENO',2,
   1,0,'-',
   10321295,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 10321295) + 0,
   61,NULL,'TYM'),

  /* 12 – SXF257 – sin adicional (AP 24504 24521, QUIMBAYA) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24504 24521','9604 7010','QUIMBAYA','JOSE ALEXANDER CONSTAIN PERLAZA, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   1,0,'-',
   11562205,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1), 11562205) + 0,
   43,NULL,'TYM'),

  /* 13 – WLS478 – sin adicional (AP 24499 + FEP 20686, CORDOBA PIJAO BVISTA) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24499 20686','9605 F','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   7490778,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1), 7490778) + 0,
   37,NULL,'TYM'),

  /* 14 – EQN953 – VALOR DE FLETE $300.000 (AP 24500 + FEP 20684, SALENTO) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQN953' AND razon_social='TYM'),
   'EQN953','24500 20684','9606 F','SALENTO','JHON WILSON GIRALDO CARVAJAL',1,
   1,300000,'VALOR DE FLETE $300.000',
   8844043,
   300000,
   36,'AP769030 AP769267','TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ─────────────────────────────── */

  /* 15 – SMO183 – sin adicional (AP 24509) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24509','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6588739,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6588739) + 0,
   56,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional (AP 24510 + FEP 20689) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24510 20689','9454 F','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7331316,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7331316) + 0,
   39,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional (AP 24511) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TMZ674' AND razon_social='TYM'),
   'TMZ674','24511','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5785756,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5785756) + 0,
   49,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional (AP 24512, SANTA ROSA) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24512','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   7248727,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 7248727) + 0,
   55,NULL,'TYM'),

  /* 19 – WHM896 – sin adicional (AP 24513) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24513','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7395302,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7395302) + 0,
   57,NULL,'TYM'),

  /* 20 – PEK019 – EXTRA $60.000 (AP 24514) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24514','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,60000,'EXTRA $60.000',
   8861452,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8861452) + 60000,
   61,NULL,'TYM'),

  /* 21 – LUM993 – sin adicional (AP 24515) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='LUM993' AND razon_social='TYM'),
   'LUM993','24515','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
   1,0,'-',
   8434497,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8434497) + 0,
   52,NULL,'TYM'),

  /* 22 – WLC133 – ADICIONAL AL FLETE $26.000 (AP 24516) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24516','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, DUVIER GALVIZ',2,
   1,26000,'ADICIONAL AL FLETE $26.000',
   7968875,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7968875) + 26000,
   73,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional (AP 24517 24503, CARTAGO) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','24517 24503','9461 9450','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   10745135,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 10745135) + 0,
   52,NULL,'TYM'),

  /* 24 – TDY481 – sin adicional (AP 24522 + FEP 20690) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TDY481' AND razon_social='TYM'),
   'TDY481','24522 20690','7004 F','PEREIRA - DOSQUEBRADAS','SAMUEL ARIAS',1,
   1,0,'-',
   11083228,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 11083228) + 0,
   67,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / 2T ─────────────────────────────────────── */

  /* 25 – WTN748 – sin adicional (AP 24523 + FEP 20691, ANSERMA NUEVO 2T) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','24523 20691','7005 F','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5520048,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1), 5520048) + 0,
   37,NULL,'TYM'),

  /* 26 – ERK303 – sin adicional (AP 24501 + FEP 20688 20687, BALBOA LA CELIA) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','24501 20688 20687','7006 F','BALBOA LA CELIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   1,0,'-',
   8734195,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1), 8734195) + 0,
   44,NULL,'TYM'),

  /* 27 – JVM223 – sin adicional (AP 24488 24502 + FEP 20692, ANSERMA) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24488 24502 20692','7007 9451 F','ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   1,0,'-',
   18781887,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1), 18781887) + 0,
   52,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – registro ALPINA (AP 24506, 1 ped $466.177) */
  ('2026-10-07','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','24506','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   466177,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 466177) + 0,
   1,NULL,'TYM'),

  /* 29 – SQB119 – registro FLEISCHMANN (FEP 20703, 47 ped $4.584.912) */
  ('2026-10-07','Miercoles','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','20703','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   4584912,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 4584912) + 0,
   47,NULL,'TYM'),

  /* 30 – TRF860 – VALOR FLETE $350.000 PORQUE ES TODO CARTAGO (FEP 20694 20693, CARTAGO 2T) */
  ('2026-10-07','Miercoles','FLEISCHMANN',
   'ALBERTO GONZALO',
   'TRF860','20694 20693','FLEISCHMANN','CARTAGO 2T','JULIAN RODRIGUEZ',1,
   1,350000,'VALOR FLETE $350.000 PORQUE ES TODO CARTAGO',
   6670266,
   350000,
   35,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, contratista AS conductor_bd, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-10-07'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
