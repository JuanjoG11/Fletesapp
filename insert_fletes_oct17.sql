/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: SÁBADO 17 OCTUBRE 2026
   Generado: 2026-10-17
   ✅ Nombres de auxiliares normalizados según lista oficial

   Notas:
     - MAT480   VALOR DE FLETE $500.000 (7001 MERCALDAS/P.SOL, planillas 24825 24769, facs AP779985 AP778143 AP778142)
     - TRK507   EXTRA $60.000 (9556 RECREACION, facs AP779828 AP780887)
     - SXF257   aparece DOS VECES:
                  · 9604 M/MONTENEGRO F conductor FABIO RUIZ (QUIMBAYA, fac AP778163)
                  · 9606 M/TEBAIDA conductor HERIBERTO (CAIMO BARCELONA, VALOR FLETE $400.000, fac AP778165, 2 auxiliares)
     - TTL256   hoy cubre 9559 GAMERO CHINCHINA (2 auxiliares, facs AP779829 AP779830)
     - WTN748   VALOR DE FLETE $450.000 (EL AGUILA VILLA NUEVA)
     - EYX091   fac AP779984 (sin costo extra, 2 auxiliares)
     - WFV015   fac AP779548 (sin costo extra)
     - EQY944   fac AP779547 (sin costo extra, 2 auxiliares)
     - SXF257/9604 fac AP778163 (sin costo extra)
     - TRK507   facs AP779828 AP780887
     - SPU120   facs FEP1197481 FEP1197486 FEP1197488
     - SYU652   facs FEP1197500 FEP1197492
     - SQB119   FLEISCHMANN S/ROSA-D/BRADAS → precio tabla SANTA ROSA
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-17'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 17‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

  /* 01 – MAT480 – VALOR DE FLETE $500.000 (AP 24825 24769 + facs AP779985 AP778143 AP778142) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='MAT480' AND razon_social='TYM'),
   'MAT480','24825 24769','7001 MERCALDAS/P.SOL','MANIZALES VILLAMARIA','JORGE RIVILLAS',1,
   1,0,'-',
   6613526,
   500000,
   6,'AP779985 AP778143 AP778142','TYM'),

  /* 02 – SYU652 – sin adicional (AP 24821 24807 + FEP 20841 + facs FEP1197500 FEP1197492) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24821 24807','9552 9550 F','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,0,'-',
   11264504,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 11264504) + 0,
   45,'FEP1197500 FEP1197492','TYM'),

  /* 03 – WFR160 – sin adicional (AP 24808 + FEP 20847 20842) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24808','9553 F','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,0,'-',
   7843278,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7843278) + 0,
   56,NULL,'TYM'),

  /* 04 – EYX091 – sin adicional (AP 24809 + FEP 20843 20835 + fac AP779984, 2 auxiliares) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','24809','9554 MERCA F','MANIZALES VILLAMARIA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   8776441,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 8776441) + 0,
   57,'AP779984','TYM'),

  /* 05 – SPU120 – sin adicional (AP 24810 + FEP 20848 + facs FEP1197481 FEP1197486 FEP1197488) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24810','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   7004795,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7004795) + 0,
   52,'FEP1197481 FEP1197486 FEP1197488','TYM'),

  /* 06 – TRK507 – EXTRA $60.000 (AP 24811 + FEP 20845 + facs AP779828 AP780887 — conductor texto fijo) */
  ('2026-10-17','Sábado','ALPINA',
   'MIGUEL GONZALES',
   'TRK507','24811','9556 RECREACION F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,60000,'EXTRA $60.000',
   8651162,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 8651162) + 60000,
   43,'AP779828 AP780887','TYM'),

  /* 07 – WEP384 – sin adicional (AP 24822 24812 + FEP 20814, 2 auxiliares) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24822 24812','9557 9559 F','QUINCHIA','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   11936762,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUINCHIA' LIMIT 1), 11936762) + 0,
   55,NULL,'TYM'),

  /* 08 – TTL256 – sin adicional (AP 24814 + facs AP779829 AP779830, 2 auxiliares — ruta CHINCHINA) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TTL256' AND razon_social='TYM'),
   'TTL256','24814','9559 GAMERO','CHINCHINA','BRANDON STEVEN GIL BAEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   6944570,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1), 6944570) + 0,
   85,'AP779829 AP779830','TYM'),

  /* ── ZONA ARMENIA ─────────────────────────────────────────── */

  /* 09 – WFV015 – sin adicional (AP 24838 + fac AP779548) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFV015' AND razon_social='TYM'),
   'WFV015','24838','9601 PATRIA','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   6703760,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 6703760) + 0,
   52,'AP779548','TYM'),

  /* 10 – TJX795 – sin adicional (AP 24805 24839 + FEP 20840, 2 auxiliares) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TJX795' AND razon_social='TYM'),
   'TJX795','24805 24839','9602 7009 F','ARMENIA','YERFREY FLOWER, CRISTIAN GIRALDO',2,
   2,0,'-',
   7028194,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 7028194) + 0,
   58,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional (AP 24840 + fac AP779547, 2 auxiliares) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24840','9603 HOREB','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, JHON FREDY MORENO',2,
   2,0,'-',
   8102999,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 8102999) + 0,
   59,'AP779547','TYM'),

  /* 12 – SXF257 – sin adicional (AP 24841 + FEP 20836 + fac AP778163 — ruta 9604 FABIO RUIZ) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24841','9604 M/MONTENEGRO F','QUIMBAYA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   4571916,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1), 4571916) + 0,
   45,'AP778163','TYM'),

  /* 13 – WLS478 – sin adicional (AP 24815) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24815','9605','GENOVA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   4822911,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GENOVA' LIMIT 1), 4822911) + 0,
   32,NULL,'TYM'),

  /* 14 – SXF257 – VALOR DE FLETE $400.000 (AP 24816 + fac AP778165, 2 auxiliares — ruta 9606 HERIBERTO) */
  ('2026-10-17','Sábado','ALPINA',
   'HERIBERTO GARCIA',
   'SXF257','24816','9606 M/TEBAIDA','CAIMO BARCELONA','JHON WILSON GIRALDO CARVAJAL, YESID PATIÑO',2,
   2,0,'-',
   6233514,
   400000,
   38,'AP778165','TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

  /* 15 – SMO183 – sin adicional (AP 24829) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24829','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6149068,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6149068) + 0,
   50,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional (AP 24830) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24830','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   5989261,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5989261) + 0,
   45,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional (AP 24831 + FEP 20834) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TMZ674' AND razon_social='TYM'),
   'TMZ674','24831','9455 F','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   4588500,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 4588500) + 0,
   49,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional (AP 24832) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24832','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5835116,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 5835116) + 0,
   58,NULL,'TYM'),

  /* 19 – WHM896 – sin adicional (AP 24833) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24833','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   6101564,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6101564) + 0,
   54,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional (AP 24834) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24834','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,0,'-',
   5084733,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5084733) + 0,
   49,NULL,'TYM'),

  /* 21 – LUM993 – sin adicional (AP 24835, 2 auxiliares — conductor texto fijo) */
  ('2026-10-17','Sábado','ALPINA',
   'PABLO RAMIREZ',
   'LUM993','24835','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO, PABLO RAMIREZ',2,
   2,0,'-',
   6831244,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6831244) + 0,
   59,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional (AP 24836, 2 auxiliares) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24836','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, MARLON MURILLO',2,
   2,0,'-',
   5202945,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5202945) + 0,
   54,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional (AP 24837 + FEP 20832) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','24837','9461 F','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   5213044,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 5213044) + 0,
   50,NULL,'TYM'),

  /* 24 – SXE499 – sin adicional (AP 24842 + FEP 20830, 2 auxiliares — conductor texto fijo) */
  ('2026-10-17','Sábado','ALPINA',
   'ANDRES',
   'SXE499','24842','7004 F','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, SAMUEL ARIAS',2,
   2,0,'-',
   7348483,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7348483) + 0,
   61,NULL,'TYM'),

  /* ── ZONA CARTAGO / OCCIDENTE ─────────────────────────────── */

  /* 25 – WTN748 – VALOR DE FLETE $450.000 (AP 24843) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','24843','7005','EL AGUILA VILLA NUEVA','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   8287403,
   450000,
   30,NULL,'TYM'),

  /* 26 – ERK303 – sin adicional (AP 24817 + FEP 20837, 2 auxiliares) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','24817','7006 F','SANTA CECILIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   12387641,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA CECILIA' LIMIT 1), 12387641) + 0,
   44,NULL,'TYM'),

  /* 27 – JVM223 – sin adicional (AP 24818 + FEP 20838, 2 auxiliares) */
  ('2026-10-17','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24818','7007 F','GUATICA ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   11622052,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GUATICA ANSERMA' LIMIT 1), 11622052) + 0,
   58,NULL,'TYM'),

  /* ── FLEISCHMANN ──────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional (FEP 20839 — FLEISCHMANN S/ROSA-D/BRADAS) */
  ('2026-10-17','Sábado','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','20839','FLEISCHMANN','SANTA ROSA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   5205247,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 5205247) + 0,
   52,NULL,'TYM');

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
WHERE fecha = '2026-10-17'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
