/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 6 OCTUBRE 2026
   Generado: 2026-10-06
   Notas:
     - EYX091   EXTRA $60.000
     - SPU120   ADICIONAL AL FLETE $100.000
     - WGZ876   AUX EXTRA $60.000 (solo AP 24431, sin FEP)
     - WHM896   VALOR DE FLETE $250.000 (precio fijo)
     - PEK019   EXTRA $60.000
     - WLC133   ADICIONAL AL FLETE $86.000
     - WTN748   VALOR DE FLETE $480.000 (precio fijo)
     - ERK303   ADICIONAL AL FLETE $100.000
     - SMO183   T PEDIDOS y T VALOR con #REF! → se usa solo valor AP (51 ped, $6.665.376)
     - TJX795   fact. adicional AP767323TSS (sin adicional en valor)
     - SXF257   fact. adicional AP767642-643 (sin adicional en valor)
     - SQB119   solo FEP (sin AP) → registro único FLEISCHMANN
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-06'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 06‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ─────────────────────────────── */

  /* 01 – SYU652 – sin adicional (AP 24460 + FEP 20676) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24460 20676','9552 F','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,0,'-',
   7420211,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7420211) + 0,
   66,NULL,'TYM'),

  /* 02 – WFR160 – sin adicional (AP 24461 + FEP 20677 20682 20681) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24461 20677 20682 20681','9553 F','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,0,'-',
   6222675,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6222675) + 0,
   53,NULL,'TYM'),

  /* 03 – EYX091 – EXTRA $60.000 (AP 24462 + FEP 20678) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','24462 20678','9554 F','MANIZALES VILLAMARIA','JHONNY LOPEZ',1,
   1,60000,'EXTRA $60.000',
   8537487,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 8537487) + 60000,
   58,NULL,'TYM'),

  /* 04 – SPU120 – ADICIONAL AL FLETE $100.000 (AP 24456 24463 + FEP 20679) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24456 24463 20679','9555 7000 UNOAC F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   1,100000,'ADICIONAL AL FLETE $100.000',
   14526017,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 14526017) + 100000,
   58,NULL,'TYM'),

  /* 05 – TTL256 – sin adicional (AP 24450 24454 24464 + FEP 20680 20669) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TTL256' AND razon_social='TYM'),
   'TTL256','24450 24454 24464 20680 20669','9556 9550 E7000 FUNDACION UNOAG F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE, ANDRES MATEO VILLALBA DIAZ',2,
   1,0,'-',
   10788749,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 10788749) + 0,
   51,NULL,'TYM'),

  /* 06 – WEP384 – sin adicional (AP 24441 + FEP 20675) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24441 20675','9557 F','SUPIA','JUAN MANUEL DELGADO NARVAEZ, JUAN RICO',2,
   1,0,'-',
   10020480,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1), 10020480) + 0,
   46,NULL,'TYM'),

  /* 07 – MAT480 – sin adicional (AP 24467 24458 + FEP 20674) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='MAT480' AND razon_social='TYM'),
   'MAT480','24467 24458 20674','9559 7002 F','CHINCHINA','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
   1,0,'-',
   8748187,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1), 8748187) + 0,
   65,NULL,'TYM'),

  /* 08 – WGZ876 – AUX EXTRA $60.000 (solo AP 24431, sin FEP)
     Nota: precio = precio de lista ($625.000) + adicional ($60.000) = $685.000 */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','24431','9560','SUPIA RIOSUCIO SUPER','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,60000,'AUX EXTRA $60.000',
   15620606,
   685000,
   9,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ──────────────────────────────────── */

  /* 09 – WFV015 – sin adicional (AP 24457 24481) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFV015' AND razon_social='TYM'),
   'WFV015','24457 24481','9601 7009LA50','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   7083655,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 7083655) + 0,
   53,NULL,'TYM'),

  /* 10 – TJX795 – sin adicional (AP 24407 24482, fact AP767323TSS) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TJX795' AND razon_social='TYM'),
   'TJX795','24407 24482','9602 7009LA19','ARMENIA','YERFREY FLOWER, CRISTIAN GIRALDO',2,
   1,0,'-',
   8545259,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 8545259) + 0,
   64,'AP767323TSS','TYM'),

  /* 11 – EQY944 – sin adicional (AP 24483 + FEP 20672) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24483 20672','9603 F','CALARCA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   5942376,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1), 5942376) + 0,
   53,NULL,'TYM'),

  /* 12 – SXF257 – sin adicional (AP 24484 + FEP 20670, fact AP767642-643) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24484 20670','9604 F','MONTENEGRO PTAPAO','JOSE ALEXANDER CONSTAIN PERLAZA, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   1,0,'-',
   10933856,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1), 10933856) + 0,
   64,'AP767642-643','TYM'),

  /* 13 – WLS478 – sin adicional (AP 24468 + FEP 20671) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24468 20671','9605 F','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   6847714,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1), 6847714) + 0,
   48,NULL,'TYM'),

  /* 14 – EQN953 – sin adicional (AP 24469) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQN953' AND razon_social='TYM'),
   'EQN953','24469','9606','CIRCASIA','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   3222764,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1), 3222764) + 0,
   32,NULL,'TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ─────────────────────────────── */

  /* 15 – SMO183 – sin adicional (T VALOR con #REF! → se usa solo valor AP: 51 ped $6.665.376) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24472','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6665376,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6665376) + 0,
   51,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24473','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   8508927,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8508927) + 0,
   47,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional (2 auxiliares) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TMZ674' AND razon_social='TYM'),
   'TMZ674','24474','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, JHON FREDY MORENO',2,
   1,0,'-',
   8335453,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8335453) + 0,
   73,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24475','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5542228,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 5542228) + 0,
   50,NULL,'TYM'),

  /* 19 – WHM896 – VALOR DE FLETE $250.000 (precio fijo) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24476','9457','PEREIRA - DOSQUEBRADAS','SAMUEL ARIAS',1,
   1,250000,'VALOR DE FLETE $250.000',
   7863249,
   250000,
   51,NULL,'TYM'),

  /* 20 – PEK019 – EXTRA $60.000 */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24477','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,60000,'EXTRA $60.000',
   9778433,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 9778433) + 60000,
   65,NULL,'TYM'),

  /* 21 – LUM993 (PABLO RAMIREZ) – sin adicional (2 auxiliares) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='LUM993' AND razon_social='TYM'),
   'LUM993','24478','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO, MARLON MURILLO',2,
   1,0,'-',
   9849980,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 9849980) + 0,
   66,NULL,'TYM'),

  /* 22 – WLC133 – ADICIONAL AL FLETE $86.000 */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24479','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES',1,
   1,86000,'ADICIONAL AL FLETE $86.000',
   13159415,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 13159415) + 86000,
   66,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','24480','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   5073215,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 5073215) + 0,
   55,NULL,'TYM'),

  /* 24 – LUM993 (ANDRES) – sin adicional */
  ('2026-10-06','Martes','ALPINA',
   'ANDRES',
   'LUM993','24485','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   7364515,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7364515) + 0,
   48,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / 2T ─────────────────────────────────────── */

  /* 25 – WTN748 – VALOR DE FLETE $480.000 (precio fijo) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','24486','7005','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO',1,
   1,480000,'VALOR DE FLETE $480.000',
   9572782,
   480000,
   33,NULL,'TYM'),

  /* 26 – ERK303 – ADICIONAL AL FLETE $100.000 (AP 24470 24452 + FEP 20667 20668) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','24470 24452 20667 20668','7006 9450 F','SANTUARIO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   1,100000,'ADICIONAL AL FLETE $100.000',
   14309574,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1), 14309574) + 100000,
   55,NULL,'TYM'),

  /* 27 – JVM223 – sin adicional (AP 24471 24453) */
  ('2026-10-06','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24471 24453','7007 9451','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   1,0,'-',
   11636695,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1), 11636695) + 0,
   63,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – solo FEP (sin AP), planilla 20673 */
  ('2026-10-06','Martes','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','20673','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   4679547,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 4679547) + 0,
   44,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, contratista AS conductor_bd, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-10-06'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
