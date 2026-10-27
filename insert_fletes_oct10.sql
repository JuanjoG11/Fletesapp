/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: SÁBADO 10 OCTUBRE 2026
   Generado: 2026-10-10
   ✅ Nombres de auxiliares normalizados según lista oficial

   Notas:
     - WGZ876   VALOR DE FLETE $500.000 (MANIZALES VILLAMARIA, facs AP773334 AP773545 AP773549 AP773671 AP773543)
     - SMH182   VALOR DE FLETE $700.000 (MANIZALES VILLAMARIA, sin auxiliar, facs AP773544 AP773546 AP773547 AP773548)
     - SYU652   EXTRA $120.000 (facs FEP1196909-916-914-912-906 FEP1196910)
     - WFR160   ADICIONAL AL FLETE $50.000
     - TTL256   sin adicional en precio (facs FEP1196897 FEP1196894 AP773539 AP773697, 2 auxiliares)
     - MAT480   sin adicional (facs AP773540 AP773541, 2 auxiliares)
     - WFV015   sin adicional (fac AP773076)
     - EQY944   sin adicional (fac AP773696, 2 auxiliares)
     - EQN953   VALOR DE FLETE $440.000 (2 auxiliares)
     - WLC133   ADICIONAL AL FLETE $26.000 (2 auxiliares)
     - WTN748   VALOR DE FLETE $480.000
     - SQB119   FLEISCHMANN S/ROSA-D/BRADAS → precio tabla SANTA ROSA
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-10'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 10‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

  /* 01 – WGZ876 – VALOR DE FLETE $500.000 (facs AP773334 AP773545 AP773549 AP773671 AP773543) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','-','7000 70001','MANIZALES VILLAMARIA','JORGE RIVILLAS',1,
   1,0,'-',
   12325722,
   500000,
   5,'AP773334 AP773545 AP773549 AP773671 AP773543','TYM'),

  /* 02 – SMH182 – VALOR DE FLETE $700.000 (sin auxiliar, facs AP773544 AP773546 AP773547 AP773548) */
  ('2026-10-10','Sábado','ALPINA',
   'ANDRES QUINTERO',
   'SMH182','-','7000 7001N','MANIZALES VILLAMARIA','NO APLICA',0,
   0,0,'-',
   18297900,
   700000,
   4,'AP773544 AP773546 AP773547 AP773548','TYM'),

  /* 03 – SYU652 – EXTRA $120.000 (AP 24608 + FEP 20753 + facs FEP1196909-916-914-912-906 FEP1196910) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24608','9552','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,120000,'EXTRA $120.000',
   6753943,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6753943) + 120000,
   51,'FEP1196909-916-914-912-906 FEP1196910','TYM'),

  /* 04 – WFR160 – ADICIONAL AL FLETE $50.000 (AP 24609 + FEP 20749) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24609','9553','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,50000,'ADICIONAL AL FLETE $50.000',
   6218137,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6218137) + 50000,
   54,NULL,'TYM'),

  /* 05 – EYX091 – sin adicional (AP 24610 + FEP 20750 + fac AP773542, 2 auxiliares) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','24610','9554 MERCA','MANIZALES VILLAMARIA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   9549641,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 9549641) + 0,
   56,'AP773542','TYM'),

  /* 06 – SPU120 – sin adicional (AP 24611 + FEP 20754) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24611','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   5677086,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5677086) + 0,
   42,NULL,'TYM'),

  /* 07 – TTL256 – sin adicional en precio (AP 24612 + FEP 20752 + facs FEP1196897 FEP1196894 AP773539 AP773697, 2 auxiliares) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TTL256' AND razon_social='TYM'),
   'TTL256','24612','9556 RECREACION','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE, MARLON MURILLO',2,
   2,0,'-',
   11016080,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 11016080) + 0,
   53,'FEP1196897 FEP1196894 AP773539 AP773697','TYM'),

  /* 08 – WEP384 – sin adicional (AP 24613 24640 + FEP 20735, 2 auxiliares) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24613 24640','9557 9559','QUINCHIA','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   12697469,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUINCHIA' LIMIT 1), 12697469) + 0,
   51,NULL,'TYM'),

  /* 09 – MAT480 – sin adicional (AP 24615 + facs AP773540 AP773541, 2 auxiliares) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='MAT480' AND razon_social='TYM'),
   'MAT480','24615','9559 GAMERO','CHINCHINA','BRANDON STEVEN GIL BAEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   6439750,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1), 6439750) + 0,
   85,'AP773540 AP773541','TYM'),

  /* ── ZONA ARMENIA ─────────────────────────────────────────── */

  /* 10 – WFV015 – sin adicional (AP 24636 + fac AP773076) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFV015' AND razon_social='TYM'),
   'WFV015','24636','9601 PATRIA','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   5330025,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 5330025) + 0,
   48,'AP773076','TYM'),

  /* 11 – TJX795 – sin adicional (AP 24616, 2 auxiliares) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TJX795' AND razon_social='TYM'),
   'TJX795','24616','9602','ARMENIA','YERFREY FLOWER, CRISTIAN GIRALDO',2,
   2,0,'-',
   8502462,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 8502462) + 0,
   58,NULL,'TYM'),

  /* 12 – EQY944 – sin adicional (AP 24617 + fac AP773696, 2 auxiliares) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24617','9603 HOREB','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, JHON FREDY MORENO',2,
   2,0,'-',
   9492511,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 9492511) + 0,
   45,'AP773696','TYM'),

  /* 13 – SXF257 – sin adicional (AP 24572 24637 + FEP 20739) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24572 24637','9604 7009 50','QUIMBAYA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   9300098,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1), 9300098) + 0,
   44,NULL,'TYM'),

  /* 14 – WLS478 – sin adicional (AP 24618) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24618','9605','GENOVA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   4340334,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GENOVA' LIMIT 1), 4340334) + 0,
   33,NULL,'TYM'),

  /* 15 – EQN953 – VALOR DE FLETE $440.000 (AP 24619, 2 auxiliares) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQN953' AND razon_social='TYM'),
   'EQN953','24619','9606','CAIMO BARCELONA','JHON WILSON GIRALDO CARVAJAL, YESID PATIÑO',2,
   2,0,'-',
   7340161,
   440000,
   51,NULL,'TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

  /* 16 – SMO183 – sin adicional (AP 24627) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24627','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6194345,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6194345) + 0,
   42,NULL,'TYM'),

  /* 17 – VZD334 – sin adicional (AP 24628) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24628','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   6635122,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6635122) + 0,
   45,NULL,'TYM'),

  /* 18 – TMZ674 – sin adicional (AP 24629) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TMZ674' AND razon_social='TYM'),
   'TMZ674','24629','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   6110109,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6110109) + 0,
   54,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional (AP 24630) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24630','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5974021,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 5974021) + 0,
   56,NULL,'TYM'),

  /* 20 – WHM896 – sin adicional (AP 24631) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24631','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7700237,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7700237) + 0,
   51,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional (AP 24632) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24632','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,0,'-',
   5692010,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5692010) + 0,
   53,NULL,'TYM'),

  /* 22 – LUM993 – sin adicional (AP 24633, 2 auxiliares — conductor texto fijo) */
  ('2026-10-10','Sábado','ALPINA',
   'PABLO RAMIREZ',
   'LUM993','24633','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO, PABLO RAMIREZ',2,
   2,0,'-',
   7241073,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7241073) + 0,
   60,NULL,'TYM'),

  /* 23 – WLC133 – ADICIONAL AL FLETE $26.000 (AP 24634, 2 auxiliares) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24634','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, DUVIER GALVIZ',2,
   2,26000,'ADICIONAL AL FLETE $26.000',
   7234390,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7234390) + 26000,
   63,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional (AP 24635) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','24635','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   7094584,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 7094584) + 0,
   49,NULL,'TYM'),

  /* 25 – SXE499 – sin adicional (AP 24638, 2 auxiliares — conductor texto fijo) */
  ('2026-10-10','Sábado','ALPINA',
   'ANDRES',
   'SXE499','24638','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, SAMUEL ARIAS',2,
   2,0,'-',
   7714105,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7714105) + 0,
   52,NULL,'TYM'),

  /* ── ZONA CARTAGO / OCCIDENTE ─────────────────────────────── */

  /* 26 – WTN748 – VALOR DE FLETE $480.000 (AP 24639) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','24639','7005','EL AGUILA','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5508741,
   480000,
   19,NULL,'TYM'),

  /* 27 – ERK303 – sin adicional (AP 24621 + FEP 20740, 2 auxiliares) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','24621','7006','PUEBLO RICO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   10153546,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PUEBLO RICO' LIMIT 1), 10153546) + 0,
   37,NULL,'TYM'),

  /* 28 – JVM223 – sin adicional (AP 24622 + FEP 20743, 2 auxiliares) */
  ('2026-10-10','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24622','7007','GUATICA ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   11149571,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GUATICA ANSERMA' LIMIT 1), 11149571) + 0,
   66,NULL,'TYM'),

  /* ── FLEISCHMANN ──────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional (FEP 20747 — FLEISCHMANN S/ROSA-D/BRADAS) */
  ('2026-10-10','Sábado','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','20747','FLEISCHMANN','SANTA ROSA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   6161618,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 6161618) + 0,
   58,NULL,'TYM');

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
WHERE fecha = '2026-10-10'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
