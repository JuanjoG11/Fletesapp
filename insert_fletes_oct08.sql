/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 8 OCTUBRE 2026
   Generado: 2026-10-08
   ✅ Nombres de auxiliares normalizados según lista oficial

   Notas:
     - WEP384   EXTRA $60.000 (RIOSUCIO, 2 auxiliares)
     - TUL630   VALOR DE FLETE $550.000 (RDA S JOSE BELALCAZAR, 2 auxiliares)
     - MAT480   VALOR DE FLETE $400.000 (CALARCA, sin auxiliar — conductor texto fijo)
     - WGZ876   VALOR DE FLETE $600.000 (CALARCA, 1 auxiliar)
     - WFV015   EXTRA $70.000 (ARMENIA, 2 auxiliares, planillas 24529 24556)
     - EQY944   ADICIONAL $30.000 (ARMENIA, 2 auxiliares, planillas 24520TSS 24545, fac AP769029)
     - SXF257   ADICIONAL AL FLETE $300.000 (ALCALA ULLOA)
     - EQN953   VALOR DE FLETE $350.000 (FILANDIA, planillas 24527 24540)
     - BCS450   VALOR DEL FLETE $300.000 (PEREIRA)
     - WLC133   ADICIONAL AL FLETE $26.000 (PEREIRA, 2 auxiliares)
     - SXE499   VALOR DE FLETE $350.000 (MARSELLA, 2 auxiliares, fac AP770220)
     - WTN748   EXTRA $60.000 (CARTAGO 2T, fac AP770374)
     - SQB119   FLEISCHMANN — ADICIONAL AL FLETE $200.000 (fac AP768939-932-938-948TSS)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-08'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 08‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

  /* 01 – SYU652 – sin adicional (AP 24531 + FEP1196634) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24531','9552 FC','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,0,'-',
   6326923,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6326923) + 0,
   45,'FEP1196634','TYM'),

  /* 02 – WFR160 – sin adicional (AP 24532 + FEP 20725 20722) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24532','9553 F','MANIZALES VILLAMARIA','CARLOS ALBERTO JIMENEZ JACOME',1,
   1,0,'-',
   5537872,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5537872) + 0,
   43,NULL,'TYM'),

  /* 03 – EYX091 – sin adicional (AP 24533 + FEP 20704, 2 auxiliares) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','24533','9554 F','NEIRA','YHONY ALEXANDER LOPEZ LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   1,0,'-',
   9394512,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1), 9394512) + 0,
   63,NULL,'TYM'),

  /* 04 – SPU120 – sin adicional (AP 24534 + FEP 20723, fac FEP1196620) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24534','9555 FC','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   7354431,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7354431) + 0,
   59,'FEP1196620','TYM'),

  /* 05 – TTL256 – sin adicional (AP 24544 24535 + FEP 20724 20719 20715 20713) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TTL256' AND razon_social='TYM'),
   'TTL256','24544 24535','9556 9550 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   10510693,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 10510693) + 0,
   50,NULL,'TYM'),

  /* 06 – WEP384 – EXTRA $60.000 (AP 24536 + FEP 20712, 2 auxiliares) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24536','9557 F','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,60000,'EXTRA $60.000',
   12357643,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1), 12357643) + 60000,
   52,NULL,'TYM'),

  /* 07 – TUL630 – VALOR DE FLETE $550.000 (AP 24538 + FEP 20714, 2 auxiliares) */
  ('2026-10-08','Jueves','ALPINA',
   'JUAN DAVID',
   'TUL630','24538','9559 F','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
   2,0,'-',
   11424751,
   550000,
   55,NULL,'TYM'),

  /* ── ZONA CALARCA / ARMENIA ───────────────────────────────── */

  /* 08 – MAT480 – VALOR DE FLETE $400.000 (sin planilla AP/FEP, sin auxiliar) */
  ('2026-10-08','Jueves','ALPINA',
   'ELKIN AGUIRRE',
   'MAT480','-','7008','CALARCA','NO APLICA',0,
   0,0,'-',
   400000,
   400000,
   0,NULL,'TYM'),

  /* 09 – WGZ876 – VALOR DE FLETE $600.000 (AP 24528, 1 auxiliar) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','24528','','CALARCA','JUAN RICO',1,
   1,0,'-',
   22798118,
   600000,
   3,NULL,'TYM'),

  /* 10 – WFV015 – EXTRA $70.000 (AP 24529 24556, 2 auxiliares) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFV015' AND razon_social='TYM'),
   'WFV015','24529 24556','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO, SAMUEL ARIAS',2,
   2,70000,'EXTRA $70.000',
   8912610,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 8912610) + 70000,
   60,NULL,'TYM'),

  /* 11 – TJX795 – sin adicional (AP 24519TSS 24557, 2 auxiliares) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TJX795' AND razon_social='TYM'),
   'TJX795','24519TSS 24557','9602','ARMENIA','YERFREY FLORES ARROYAVE, CRISTIAN GIRALDO',2,
   0,0,'-',
   7449100,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 7449100) + 0,
   90,NULL,'TYM'),

  /* 12 – EQY944 – ADICIONAL $30.000 (AP 24520TSS 24545, 2 auxiliares, fac AP769029) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24520TSS 24545','9603 ANDY','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, JHON FREDY MORENO',2,
   2,30000,'ADICIONAL $30.000',
   7194418,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 7194418) + 30000,
   61,'AP769029','TYM'),

  /* 13 – SXF257 – ADICIONAL AL FLETE $300.000 (AP 24558 + FEP 20705) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24558','9604 F','ALCALA ULLOA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,300000,'ADICIONAL AL FLETE $300.000',
   10729911,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1), 10729911) + 300000,
   52,NULL,'TYM'),

  /* 14 – WLS478 – sin adicional (AP 24539 + FEP 20716, 2 auxiliares) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24539','9605 F','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, MARLON MURILLO',2,
   2,0,'-',
   11016729,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1), 11016729) + 0,
   49,NULL,'TYM'),

  /* 15 – EQN953 – VALOR DE FLETE $350.000 (AP 24527 24540 + FEP 20685) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQN953' AND razon_social='TYM'),
   'EQN953','24527 24540','9606 9600 F','FILANDIA','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   8490838,
   350000,
   40,NULL,'TYM'),

  /* ── ZONA PEREIRA ─────────────────────────────────────────── */

  /* 16 – SMO183 – sin adicional (AP 24547) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24547','9453','PEREIRA','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   4850106,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 4850106) + 0,
   38,NULL,'TYM'),

  /* 17 – VZD334 – EXTRA $60.000 (AP 24548 + FEP 20708) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24548','9454 F','PEREIRA','CARLOS ANDRES PINEDA CANO',1,
   1,60000,'EXTRA $60.000',
   9831585,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 9831585) + 60000,
   64,NULL,'TYM'),

  /* 18 – PEK019 – sin adicional (AP 24549) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24549','9455','PEREIRA','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   6789146,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 6789146) + 0,
   55,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional (AP 24550 24530) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24550 24530','9456 7002','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6121790,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 6121790) + 0,
   41,NULL,'TYM'),

  /* 20 – WHM896 – sin adicional (AP 24551 + FEP 20718) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24551','9457 F','ARABIA ALTAGRACIA','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   6174218,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARABIA ALTAGRACIA' LIMIT 1), 6174218) + 0,
   50,NULL,'TYM'),

  /* 21 – BCS450 – VALOR DEL FLETE $300.000 (AP 24552) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='BCS450' AND razon_social='TYM'),
   'BCS450','24552','9458','PEREIRA','SEBASTIAN MONTES',1,
   1,0,'-',
   7270478,
   300000,
   50,NULL,'TYM'),

  /* 22 – LUM993 – sin adicional (AP 24553, 2 auxiliares — conductor texto fijo) */
  ('2026-10-08','Jueves','ALPINA',
   'PABLO RAMIREZ',
   'LUM993','24553','9459','PEREIRA','QUEBIN ANDRES LOTERO ZAPATA, PABLO RAMIREZ',2,
   2,0,'-',
   7554012,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 7554012) + 0,
   50,NULL,'TYM'),

  /* 23 – WLC133 – ADICIONAL AL FLETE $26.000 (AP 24554, 2 auxiliares) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24554','9460','PEREIRA','SANTIAGO HENAO MORALES, DUVIER GALVIZ',2,
   2,26000,'ADICIONAL AL FLETE $26.000',
   6699140,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 6699140) + 26000,
   45,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional (AP 24503TSS 24555, fac AP771626) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','24503TSS 24555','9461 S','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   0,0,'-',
   7642127,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 7642127) + 0,
   56,'AP771626','TYM'),

  /* 25 – SXE499 – VALOR DE FLETE $350.000 (AP 24559 + FEP 20709, 2 auxiliares, fac AP770220) */
  ('2026-10-08','Jueves','ALPINA',
   'ANDRES',
   'SXE499','24559','7004 F','MARSELLA','BRAHIAN STIVEN VALENCIA IGLESIAS, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   10409813,
   350000,
   53,'AP770220','TYM'),

  /* ── ZONA CARTAGO / OCCIDENTE ─────────────────────────────── */

  /* 26 – WTN748 – EXTRA $60.000 (AP 24560, fac AP770374) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','24560','7005 S','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,60000,'EXTRA $60.000',
   7312228,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1), 7312228) + 60000,
   47,'AP770374','TYM'),

  /* 27 – ERK303 – sin adicional (AP 24541 + FEP 20710 20707, 2 auxiliares) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','24541','7006 F','APIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   9297810,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA' LIMIT 1), 9297810) + 0,
   43,NULL,'TYM'),

  /* 28 – JVM223 – sin adicional (AP 24526 24542 + FEP 20717, 2 auxiliares) */
  ('2026-10-08','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24526 24542','7007 9451 F','VITERBO','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   14880270,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1), 14880270) + 0,
   65,NULL,'TYM'),

  /* ── FLEISCHMANN ──────────────────────────────────────────── */

  /* 29 – SQB119 – ADICIONAL AL FLETE $200.000 (AP 24515TSS + FEP 20720, fac AP768939-932-938-948TSS) */
  ('2026-10-08','Jueves','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','24515TSS 20720','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,200000,'ADICIONAL AL FLETE $200.000',
   5618940,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5618940) + 200000,
   52,'AP768939-932-938-948TSS','TYM');

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
WHERE fecha = '2026-10-08'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
