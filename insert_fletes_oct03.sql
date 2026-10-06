/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: SÁBADO 3 OCTUBRE 2026
   Generado: 2026-10-03
   Notas:
     - WEP384   EXTRA $60.000
     - SXF257   ADICIONAL AL FLETE $150.000
     - EQN953   VALOR DE FLETE $440.000 (conductor texto fijo)
     - WFV015   VALOR DE FLETE $500.000 (conductor texto fijo)
     - LUM993 ANDRES  ADICIONAL AL FLETE $100.000
     - SPU120   tiene FEP solo en facturas (sin planilla FEP), totales combinados
     - SQB119   solo FEP (sin AP) → registro único FLEISCHMANN
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-03'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 03‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ─────────────────────────────── */

  /* 01 – SYU652 – sin adicional (AP 24393 + FEP 20660, fact FEP1196076 FEP1196288 FEP1196287) */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24393 20660','9552 FC','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,0,'-',
   5109493,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5109493) + 0,
   47,'FEP1196076 FEP1196288 FEP1196287','TYM'),

  /* 02 – WFR160 – sin adicional (AP 24390 24394 + FEP 20661, fact FEP1196280) */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24390 24394 20661','9553 7001 FC','MANIZALES VILLAMARIA','CARLOS JIMENEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   1,0,'-',
   11181235,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 11181235) + 0,
   60,'FEP1196280','TYM'),

  /* 03 – EYX091 – sin adicional (AP 24389 24395 + FEP 20662) */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','24389 24395 20662','9554 7000 F','MANIZALES VILLAMARIA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   1,0,'-',
   9587079,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 9587079) + 0,
   55,NULL,'TYM'),

  /* 04 – SPU120 – sin adicional (AP 24396, FEP solo en facturas: FEP1196267-269-274-275 FEP1196270-272) */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24396','9555 FC','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   7510079,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7510079) + 0,
   59,'FEP1196267-269-274-275 FEP1196270-272','TYM'),

  /* 05 – TTL256 – sin adicional (AP 24397 + FEP 20664, fact AP766249) */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TTL256' AND razon_social='TYM'),
   'TTL256','24397 20664','9556 RECREACION FC','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   7160342,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7160342) + 0,
   39,'AP766249','TYM'),

  /* 06 – WEP384 – EXTRA $60.000 (AP 24409 24398 + FEP 20619) */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24409 24398 20619','9557 9559 F','QUINCHIA','ANDRES MATEO VILLALBA DIAZ',1,
   1,60000,'EXTRA $60.000',
   14279632,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUINCHIA' LIMIT 1), 14279632) + 60000,
   53,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ──────────────────────────────────── */

  /* 07 – MAT480 – sin adicional (AP 24419, fact AP766257) */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='MAT480' AND razon_social='TYM'),
   'MAT480','24419','9601 PATRIA','ARMENIA','YEISON DAVID RENDON SOTO, MARLON MURILLO',2,
   1,0,'-',
   7426224,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 7426224) + 0,
   62,'AP766257','TYM'),

  /* 08 – TJX795 – sin adicional (AP 24407 24420) */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TJX795' AND razon_social='TYM'),
   'TJX795','24407 24420','9602 7009','ARMENIA','YERFREY FLOWER, CRISTIAN GIRALDO',2,
   1,0,'-',
   9942757,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 9942757) + 0,
   64,NULL,'TYM'),

  /* 09 – EQY944 – sin adicional (AP 24421, fact AP766256) */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24421','9603 HOREB','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, JHON FREDY MORENO',2,
   1,0,'-',
   8020570,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 8020570) + 0,
   47,'AP766256','TYM'),

  /* 10 – SXF257 – ADICIONAL AL FLETE $150.000 (AP 24391 24422 + FEP 20656) */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24391 24422 20656','9604 7008 F','QUIMBAYA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,150000,'ADICIONAL AL FLETE $150.000',
   5645542,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1), 5645542) + 150000,
   44,NULL,'TYM'),

  /* 11 – WLS478 – sin adicional (AP 24401) */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24401','9605','GENOVA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   5723427,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GENOVA' LIMIT 1), 5723427) + 0,
   33,NULL,'TYM'),

  /* 12 – EQN953 – VALOR DE FLETE $440.000 (conductor texto fijo) */
  ('2026-10-03','Sabado','ALPINA',
   'ORLANDO VASQUEZ',
   'EQN953','24402','9606','CAIMO BARCELONA','JHON WILSON GIRALDO CARVAJAL',1,
   1,440000,'VALOR DE FLETE $440.000',
   5033484,
   440000,
   37,NULL,'TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ─────────────────────────────── */

  /* 13 – SMO183 – sin adicional */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24410','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   8092814,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8092814) + 0,
   51,NULL,'TYM'),

  /* 14 – VZD334 – sin adicional */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24411','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   6850721,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6850721) + 0,
   43,NULL,'TYM'),

  /* 15 – TMZ674 – sin adicional */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TMZ674' AND razon_social='TYM'),
   'TMZ674','24412','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5035990,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5035990) + 0,
   51,NULL,'TYM'),

  /* 16 – SPQ814 – sin adicional (fact AP766236) */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24413','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5531609,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 5531609) + 0,
   48,'AP766236','TYM'),

  /* 17 – WHM896 – sin adicional */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24414','9457','PEREIRA - DOSQUEBRADAS','SAMUEL ARIAS',1,
   1,0,'-',
   7564223,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7564223) + 0,
   54,NULL,'TYM'),

  /* 18 – PEK019 – sin adicional */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24415','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,0,'-',
   6089694,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6089694) + 0,
   52,NULL,'TYM'),

  /* 19 – LUM993 (PABLO RAMIREZ) – sin adicional (fact AP766226) */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='LUM993' AND razon_social='TYM'),
   'LUM993','24416','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
   1,0,'-',
   7552006,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7552006) + 0,
   56,'AP766226','TYM'),

  /* 20 – WLC133 – sin adicional */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24417','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES',1,
   1,0,'-',
   6919379,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6919379) + 0,
   54,NULL,'TYM'),

  /* 21 – TNH494 – sin adicional */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','24418','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   6031782,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 6031782) + 0,
   46,NULL,'TYM'),

  /* 22 – LUM993 (ANDRES) – ADICIONAL AL FLETE $100.000 (AP 24423 + FEP 20657) */
  ('2026-10-03','Sabado','ALPINA',
   'ANDRES',
   'LUM993','24423 20657','7004 F','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, DUVIER GALVIZ',2,
   1,100000,'ADICIONAL AL FLETE $100.000',
   9138635,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 9138635) + 100000,
   65,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / 2T ─────────────────────────────────────── */

  /* 23 – WFV015 – VALOR DE FLETE $500.000 (conductor texto fijo) */
  ('2026-10-03','Sabado','ALPINA',
   'YONNI VALENCIA',
   'WFV015','24424','7005','EL AGUILA VILLA NUEVA','ARBEY DE JESUS LARGO LARGO, JORGE RIVILLAS',2,
   1,500000,'VALOR DE FLETE $500.000',
   9786181,
   500000,
   29,NULL,'TYM'),

  /* 24 – ERK303 – sin adicional (AP 24403 + FEP 20658) */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','24403 20658','7006 F','SANTA CECILIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   1,0,'-',
   14155781,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA CECILIA' LIMIT 1), 14155781) + 0,
   43,NULL,'TYM'),

  /* 25 – JVM223 – sin adicional (AP 24404 + FEP 20659) */
  ('2026-10-03','Sabado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24404 20659','7007 F','GUATICA ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   1,0,'-',
   12865791,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GUATICA ANSERMA' LIMIT 1), 12865791) + 0,
   65,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 26 – SQB119 – solo FEP (sin AP), planilla 20654
     Nota: S/ROSA-D/BRADAS → población 'SANTA ROSA' para precio de tabla correcto */
  ('2026-10-03','Sabado','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','20654','FLEISCHMANN','SANTA ROSA','DIEGO FRANCO',1,
   1,0,'-',
   4129696,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 300000) + 0,
   49,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, contratista AS conductor_bd, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-10-03'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
