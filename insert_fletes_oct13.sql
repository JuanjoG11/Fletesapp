/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 13 OCTUBRE 2026
   Generado: 2026-10-13
   ✅ Nombres de auxiliares normalizados según lista oficial

   Notas:
     - WLC133   ADICIONAL AL FLETE $26.000 (2 auxiliares)
     - ERK303   ADICIONAL AL FLETE $100.000 SUPER (2 auxiliares, planillas 26641 24659)
     - SXF257   facturas adicionales AP774414 AP774415 (2 auxiliares)
     - WFV015   factura adicional AP774416
     - LUM993   planilla TSS 24633TSS 24671 (2 auxiliares, conductor texto fijo)
     - TNH494   planilla TSS E7001TSS 24606
     - WEP384   planillas 24569TSS 24644 24654 (2 auxiliares)
     - SPU120   2 auxiliares (planillas 24645 24652)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-13'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 13‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

  /* 01 – SYU652 – sin adicional (AP 24649 + FEP 20766 + FEP1196957) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24649','9552 F','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,0,'-',
   5209809,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5209809) + 0,
   55,'FEP1196957','TYM'),

  /* 02 – WFR160 – sin adicional (AP 24650) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24650','9553','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,0,'-',
   4941249,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 4941249) + 0,
   41,NULL,'TYM'),

  /* 03 – EYX091 – sin adicional (AP 24651 + FEP 20767, 2 auxiliares) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','24651','9554 F','MANIZALES VILLAMARIA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   5820255,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5820255) + 0,
   50,NULL,'TYM'),

  /* 04 – SPU120 – sin adicional (AP 24645 24652 + FEP 20768, 2 auxiliares) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24645 24652','9555 7000UNOAC F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN, YESID PATIÑO',2,
   2,0,'-',
   6801075,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6801075) + 0,
   43,NULL,'TYM'),

  /* 05 – TTL256 – sin adicional (AP 24643 24653 + FEP1196958) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TTL256' AND razon_social='TYM'),
   'TTL256','24643 24653','9556 9550UNOAG F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   6383287,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6383287) + 0,
   33,'FEP1196958','TYM'),

  /* 06 – WEP384 – sin adicional (AP 24569TSS 24644 24654 + FEP 20765, 2 auxiliares) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24569TSS 24644 24654','9557 9560 F','SUPIA','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   15522562,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1), 15522562) + 0,
   51,NULL,'TYM'),

  /* 07 – MAT480 – sin adicional (AP 24646 24656 + FEP 20764, 2 auxiliares) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='MAT480' AND razon_social='TYM'),
   'MAT480','24646 24656','9559 7002 F','CHINCHINA','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
   2,0,'-',
   7308382,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1), 7308382) + 0,
   54,NULL,'TYM'),

  /* 08 – WGZ876 – sin adicional (AP 24614 + FEP 20742, 2 auxiliares) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','24614','9558 F','ARANZAZU FILADELFIA','JOHN EDWAR ZAPATA ACEVEDO, JUAN RICO',2,
   2,0,'-',
   6422189,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARANZAZU FILADELFIA' LIMIT 1), 6422189) + 0,
   27,NULL,'TYM'),

  /* ── ZONA ARMENIA ─────────────────────────────────────────── */

  /* 09 – WFV015 – sin adicional (AP 24675 + fac AP774416) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFV015' AND razon_social='TYM'),
   'WFV015','24675','9601 EXITOLA16','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   4598720,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 4598720) + 0,
   36,'AP774416','TYM'),

  /* 10 – TJX795 – sin adicional (AP 24676) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TJX795' AND razon_social='TYM'),
   'TJX795','24676','9602','ARMENIA','YERFREY FLOWER',1,
   1,0,'-',
   4344854,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 4344854) + 0,
   40,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional (AP 24647 24677 + FEP 20760, 2 auxiliares) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24647 24677','9603 7008PROGRESO F','CALARCA','JUAN JOSE CONTRERAS HERNANDEZ, CRISTIAN GIRALDO',2,
   2,0,'-',
   7007030,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1), 7007030) + 0,
   53,NULL,'TYM'),

  /* 12 – SXF257 – sin adicional (AP 24678 + FEP 20755 + facs AP774414 AP774415, 2 auxiliares) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24678','9604 F','MONTENEGRO PTAPAO','JOSE ALEXANDER CONSTAIN PERLAZA, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   7662804,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1), 7662804) + 0,
   55,'AP774414 AP774415','TYM'),

  /* 13 – WLS478 – sin adicional (AP 24657 + FEP 20761) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24657','9605 F','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   4871764,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1), 4871764) + 0,
   38,NULL,'TYM'),

  /* 14 – WHM896 – sin adicional (AP 24658) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24658','9606','CIRCASIA','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   4358343,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1), 4358343) + 0,
   33,NULL,'TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

  /* 15 – SMO183 – sin adicional (AP 24665 + FEP 20757) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24665','9453 F','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6551068,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6551068) + 0,
   32,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional (AP 24666) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24666','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7736382,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7736382) + 0,
   56,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional (AP 24667, 2 auxiliares) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TMZ674' AND razon_social='TYM'),
   'TMZ674','24667','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, JHON FREDY MORENO',2,
   2,0,'-',
   6833227,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6833227) + 0,
   58,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional (AP 24668 + FEP 20763) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24668','9456 F','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   3654490,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 3654490) + 0,
   37,NULL,'TYM'),

  /* 19 – TUL630 – sin adicional (AP 24669 — conductor texto fijo) */
  ('2026-10-13','Martes','ALPINA',
   'JUAN DAVID',
   'TUL630','24669','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   5084323,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5084323) + 0,
   43,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional (AP 24670) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24670','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,0,'-',
   5064201,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5064201) + 0,
   56,NULL,'TYM'),

  /* 21 – LUM993 – sin adicional (AP 24633TSS 24671, 2 auxiliares — conductor texto fijo) */
  ('2026-10-13','Martes','ALPINA',
   'PABLO RAMIREZ',
   'LUM993','24633TSS 24671','9459 TSS','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO, PABLO RAMIREZ',2,
   2,0,'-',
   4365583,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 4365583) + 0,
   33,NULL,'TYM'),

  /* 22 – WLC133 – ADICIONAL AL FLETE $26.000 (AP 24672, 2 auxiliares) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24672','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, MARLON MURILLO',2,
   2,26000,'ADICIONAL AL FLETE $26.000',
   7573271,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7573271) + 26000,
   50,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional (AP 24606 24674 — planilla TSS E7001TSS) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','E7001TSS 24606 24674','9461 E7001TSS','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   4991102,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 4991102) + 0,
   51,NULL,'TYM'),

  /* 24 – SXE499 – sin adicional (AP 24679, 2 auxiliares — conductor texto fijo) */
  ('2026-10-13','Martes','ALPINA',
   'ANDRES',
   'SXE499','24679','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, SAMUEL ARIAS',2,
   2,0,'-',
   6744782,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6744782) + 0,
   41,NULL,'TYM'),

  /* ── ZONA CARTAGO / OCCIDENTE ─────────────────────────────── */

  /* 25 – WTN748 – sin adicional (AP 24664 + FEP 20759) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','24664','7005 F','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   4411338,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1), 4411338) + 0,
   28,NULL,'TYM'),

  /* 26 – ERK303 – ADICIONAL AL FLETE $100.000 SUPER (AP 26641 24659 + FEP 20756 20758, 2 auxiliares) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','26641 24659','7006 9450 F','SANTUARIO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,100000,'ADICIONAL AL FLETE $100.000 SUPER',
   14120194,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1), 14120194) + 100000,
   46,NULL,'TYM'),

  /* 27 – JVM223 – sin adicional (AP 24642 24660, 2 auxiliares) */
  ('2026-10-13','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24642 24660','7007 9451','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   8612299,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1), 8612299) + 0,
   53,NULL,'TYM'),

  /* ── FLEISCHMANN ──────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional (FEP 20762) */
  ('2026-10-13','Martes','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','20762','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   3554646,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 3554646) + 0,
   33,NULL,'TYM');

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
WHERE fecha = '2026-10-13'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
