/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 1 OCTUBRE 2026
   Generado: 2026-10-01
   Notas:
     - TUL630   VALOR DE FLETE $500.000 (conductor texto fijo)
     - MAT480   VALOR DE FLETE $500.000 (conductor texto fijo)
     - WFV015   VALOR DE FLETE $450.000 (conductor texto fijo)
     - LUM993 ANDRES  VALOR DE FLETE $350.000 (conductor texto fijo)
     - VZD334   60.000 extra
     - WLC133   ADICIONAL AL FLETE $26.000
     - EQY944   fact. adicional AP762624 (sin adicional en valor)
     - TNH494   fact. adicional AP763853 (sin adicional en valor)
     - WTN748   fact. adicional AP763854 (sin adicional en valor)
     - SQB119   AP (1 ped $342.577 planilla 24317) + FEP (30 ped $3.554.741 planilla 20633)
                → dos registros: ALPINA y FLEISCHMANN
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-01'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 01‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ─────────────────────────────── */

  /* 01 – SYU652 – sin adicional (AP 24303 + FEP 20621, fact FEP1196085) */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24303 20621','9552 FLEIS C','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,0,'-',
   7049426,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7049426) + 0,
   46,'FEP1196085','TYM'),

  /* 02 – WFR160 – sin adicional (AP 24304, fact FEP1196093 AP762229, FEP sin planilla separada) */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24304','9553 DELCAMPO FLEIS C','MANIZALES VILLAMARIA','CARLOS JIMENEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   1,0,'-',
   12059466,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 12059466) + 0,
   51,'FEP1196093 AP762229','TYM'),

  /* 03 – EYX091 – sin adicional (AP 24305 + FEP 20629) */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','24305 20629','9554 FLEIS','NEIRA','JHONNY LOPEZ',1,
   1,0,'-',
   7325169,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1), 7325169) + 0,
   58,NULL,'TYM'),

  /* 04 – SPU120 – sin adicional (AP 24306 + FEP 20631) */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24306 20631','9555 FLEIS','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6419279,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6419279) + 0,
   50,NULL,'TYM'),

  /* 05 – TTL256 – sin adicional (AP 24319 24307 + FEP 20635 20632) */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TTL256' AND razon_social='TYM'),
   'TTL256','24319 24307 20635 20632','9556 9550 UNOAG FLEIS','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   12590643,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 12590643) + 0,
   61,NULL,'TYM'),

  /* 06 – WEP384 – sin adicional (AP 24308 + FEP 20622 20606) */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24308 20622 20606','9557 FLEIS','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ',1,
   1,0,'-',
   12593231,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1), 12593231) + 0,
   52,NULL,'TYM'),

  /* 07 – TUL630 – VALOR DE FLETE $500.000 (AP 24310 + FEP 20620) */
  ('2026-10-01','Jueves','ALPINA',
   'JUAN DAVID',
   'TUL630','24310 20620','9559 FLEIS','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   1,500000,'VALOR DE FLETE $500.000',
   12096725,
   500000,
   56,NULL,'TYM'),

  /* 08 – WGZ876 – sin adicional (AP 24302, SUPIA RIOSUCIO SUPER)
     Nota: precio = precio de lista de la población = $625.000 */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','24302','9560','SUPIA RIOSUCIO SUPER','JOHN EDWAR ZAPATA ACEVEDO, JUAN RICO',2,
   1,0,'-',
   10189360,
   625000,
   5,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ──────────────────────────────────── */

  /* 09 – MAT480 – VALOR DE FLETE $500.000 (AP 24212 24213 24300) */
  ('2026-10-01','Jueves','ALPINA',
   'ELKIN AGUIRRE',
   'MAT480','24212 24213 24300','7008','CALARCA','JHON FREDY MORENO',1,
   1,500000,'VALOR DE FLETE $500.000',
   13098181,
   500000,
   3,NULL,'TYM'),

  /* 10 – WFV015 – VALOR DE FLETE $450.000 (AP 24301 24330) */
  ('2026-10-01','Jueves','ALPINA',
   'YONNI VALENCIA',
   'WFV015','24301 24330','9601','ARMENIA','YEISON DAVID RENDON SOTO, MARLON MURILLO',2,
   1,450000,'VALOR DE FLETE $450.000',
   7214507,
   450000,
   52,NULL,'TYM'),

  /* 11 – TJX795 – sin adicional (AP 24331 + FEP 20634 20617 20616 20613) */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TJX795' AND razon_social='TYM'),
   'TJX795','24331 20634 20617 20616 20613','9602 FLEISC','ARMENIA','YERFREY FLOWER, SAMUEL ARIAS',2,
   1,0,'-',
   5994872,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 5994872) + 0,
   58,NULL,'TYM'),

  /* 12 – EQY944 – sin adicional (AP 24332, fact AP762624) */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24332','9603 ANDY','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   5641165,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 5641165) + 0,
   54,'AP762624','TYM'),

  /* 13 – SXF257 – sin adicional (AP 24333 + FEP 20624) */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24333 20624','9604 FLEIS','ALCALA ULLOA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   5216156,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1), 5216156) + 0,
   39,NULL,'TYM'),

  /* 14 – WLS478 – sin adicional (AP 24311 + FEP 20623) */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24311 20623','9605 FLEIS','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, CRISTIAN GIRALDO',2,
   1,0,'-',
   9370443,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1), 9370443) + 0,
   51,NULL,'TYM'),

  /* 15 – WFQ635 – sin adicional (AP 24320 24312 + FEP 20625 20601) */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFQ635' AND razon_social='TYM'),
   'WFQ635','24320 24312 20625 20601','9606 9600 FLEIS','FILANDIA','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   8103254,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1), 8103254) + 0,
   39,NULL,'TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ─────────────────────────────── */

  /* 16 – SMO183 – sin adicional */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24321','9453','PEREIRA','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   4963856,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 4963856) + 0,
   42,NULL,'TYM'),

  /* 17 – VZD334 – 60.000 EXTRA */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24322','9454','PEREIRA','CARLOS ANDRES PINEDA CANO',1,
   1,60000,'60.000 EXTRA',
   9117463,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 9117463) + 60000,
   63,NULL,'TYM'),

  /* 18 – TMZ674 – sin adicional */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TMZ674' AND razon_social='TYM'),
   'TMZ674','24323','9455','PEREIRA','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5643294,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 5643294) + 0,
   61,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24324','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   4536078,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 4536078) + 0,
   44,NULL,'TYM'),

  /* 20 – WHM896 – sin adicional (AP 24325 + FEP 20628) */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24325 20628','9457 FLEIS','ARABIA ALTAGRACIA','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   4735431,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARABIA ALTAGRACIA' LIMIT 1), 4735431) + 0,
   46,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24326','9458','PEREIRA','SEBASTIAN MONTES',1,
   1,0,'-',
   4960461,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 4960461) + 0,
   42,NULL,'TYM'),

  /* 22 – LUM993 (PABLO RAMIREZ) – sin adicional */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='LUM993' AND razon_social='TYM'),
   'LUM993','24327','9459','PEREIRA','QUEBIN LOTERO',1,
   1,0,'-',
   7330442,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 7330442) + 0,
   41,NULL,'TYM'),

  /* 23 – WLC133 – ADICIONAL AL FLETE $26.000 */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24328','9460','PEREIRA','SANTIAGO HENAO MORALES, DUVIER GALVIZ',2,
   1,26000,'ADICIONAL AL FLETE $26.000',
   5693661,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 5693661) + 26000,
   42,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional (fact AP763853) */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','24329','9461 SUPERM','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   6880804,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 6880804) + 0,
   55,'AP763853','TYM'),

  /* 25 – LUM993 (ANDRES) – VALOR DE FLETE $350.000 (AP 24334 + FEP 20614) */
  ('2026-10-01','Jueves','ALPINA',
   'ANDRES',
   'LUM993','24334 20614','7004','MARSELLA','BRAHIAN STIVEN VALENCIA IGLESIAS, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   1,350000,'VALOR DE FLETE $350.000',
   13122124,
   350000,
   48,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / 2T ─────────────────────────────────────── */

  /* 26 – WTN748 – sin adicional (fact AP763854) */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','24335','7005 MERCAPLA','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5653231,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1), 5653231) + 0,
   43,'AP763854','TYM'),

  /* 27 – ERK303 – sin adicional (AP 24313 + FEP 20615) */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','24313 20615','7006 FLEIS','APIA','ELKIN GARCIA OCAMPO, JORGE RIVILLAS',2,
   1,0,'-',
   8760930,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA' LIMIT 1), 8760930) + 0,
   48,NULL,'TYM'),

  /* 28 – JVM223 – sin adicional (AP 24297 24314 + FEP 20627) */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24297 24314 20627','7007 9451 FLEIS','VITERBO','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   1,0,'-',
   13783035,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1), 13783035) + 0,
   61,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – registro ALPINA (1 ped $342.577, planilla 24317) */
  ('2026-10-01','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','24317','FLEISCHMANN MERCASA','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   342577,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 342577) + 0,
   1,NULL,'TYM'),

  /* 30 – SQB119 – registro FLEISCHMANN (30 ped $3.554.741, planilla 20633) */
  ('2026-10-01','Jueves','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','20633','FLEISCHMANN MERCASA','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   3554741,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 3554741) + 0,
   30,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, contratista AS conductor_bd, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-10-01'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
