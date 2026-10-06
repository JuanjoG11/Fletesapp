/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 30 SEPTIEMBRE 2026
   Generado: 2026-09-30
   Notas:
     - BCS450   VALOR DE FLETE $100.000 (conductor CRISTIAN ZULUAGA, sin aux)
     - WFR160   ADICIONAL AL FLETE $200.000
     - SPU120   ADICIONAL $100.000 ENTREGA DE SUPER FUERA DE RUTA
     - WGZ876   EXTRA $60.000
     - PEK019   ADICIONAL $100.000 (se debían del 3 y 4 de septiembre)
     - WTN748   ADICIONAL AL FLETE $200.000
     - WFV015   VALOR DE FLETE $500.000 INCLUYE DESCARGUE (conductor YONNI VALENCIA, sin aux)
     - TRF860   VALOR DE FLETE $450.000 (saldos de miércoles pasados)
     - TJX795   T VALOR con #REF! → se usa solo valor AP ($8.970.971)
     - LUM993   aparece dos veces: PABLO RAMIREZ (9459) y ANDRES (7004 FLEISCHMANN)
     - SQB119   tiene pedidos AP (1 × $121.918) y FEP (45 × $3.645.920) → proveedor ALPINA+FLEISCHMANN
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-09-30'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 30‑Sep‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ─────────────────────────────── */

  /* 01 – SYU652 – sin adicional */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24262','9552 PALERMO','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,0,'-',
   9530901,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 9530901) + 0,
   44,'AP762486','TYM'),

  /* 02 – WFR160 – ADICIONAL AL FLETE $200.000 */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24263','9553 FLORIDA','MANIZALES VILLAMARIA','CARLOS JIMENEZ, MARLON MURILLO',2,
   1,200000,'ADICIONAL AL FLETE $200.000',
   25648283,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 25648283) + 200000,
   57,'AP762488 AP762229','TYM'),

  /* 03 – EYX091 – sin adicional (tiene FEP 20610) */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','24264 20610','9554 FLEISCHMANN MERCAPLAZA','MANIZALES VILLAMARIA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   1,0,'-',
   9929467,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 9929467) + 0,
   54,'AP762228','TYM'),

  /* 04 – SPU120 – ADICIONAL $100.000 ENTREGA DE SUPER FUERA DE RUTA */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24265','9555 PRADERA','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,100000,'ADICIONAL $100.000 ENTREGA DE SUPER FUERA DE RUTA',
   7585138,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7585138) + 100000,
   49,'AP762625','TYM'),

  /* 05 – SLI587 – sin adicional (tiene FEP 20611 20609) */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SLI587' AND razon_social='TYM'),
   'SLI587','24266 20611 20609','9556 FLEISCHMANN PARQUE','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   8136132,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 8136132) + 0,
   48,'AP762487','TYM'),

  /* 06 – WEP384 – sin adicional (MARMATO LA MERCED) */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24267','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   1,0,'-',
   13506122,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1), 13506122) + 0,
   24,NULL,'TYM'),

  /* 07 – WFQ635 – sin adicional (PALESTINA ARAUCA, tiene FEP 20608) */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFQ635' AND razon_social='TYM'),
   'WFQ635','24269 20608','9559 FLEISCHMANN','PALESTINA ARAUCA','BRANDON STEVEN GIL BAEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   1,0,'-',
   10073321,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PALESTINA ARAUCA' LIMIT 1), 10073321) + 0,
   48,NULL,'TYM'),

  /* 08 – WGZ876 – EXTRA $60.000 (AGUADAS PACORA, tiene FEP 20607) */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','24235 24268 20607','9558 FLEISCHMANN','AGUADAS PACORA','JOHN EDWAR ZAPATA ACEVEDO, JUAN RICO',2,
   1,60000,'EXTRA $60.000',
   18475967,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1), 18475967) + 60000,
   71,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ──────────────────────────────────── */

  /* 09 – TTL256 – sin adicional */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TTL256' AND razon_social='TYM'),
   'TTL256','24278 24288','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   10007211,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 10007211) + 0,
   55,NULL,'TYM'),

  /* 10 – TJX795 – sin adicional (T VALOR #REF!, se usa valor AP) */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TJX795' AND razon_social='TYM'),
   'TJX795','24260 24289','9602 7008','ARMENIA','YERFREY FLOWER, CRISTIAN GIRALDO',2,
   1,0,'-',
   8970971,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 8970971) + 0,
   56,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24274','9603','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, JHON FREDY MORENO',2,
   1,0,'-',
   8376098,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 8376098) + 0,
   51,NULL,'TYM'),

  /* 12 – SXF257 – sin adicional (QUIMBAYA) */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24261 24218 24291','9604 7010','QUIMBAYA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   9357597,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1), 9357597) + 0,
   36,NULL,'TYM'),

  /* 13 – WLS478 – sin adicional (CORDOBA PIJAO BVISTA, tiene FEP 20602) */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24270 20602','9605 FLEISCHMANN','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   6381369,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1), 6381369) + 0,
   43,NULL,'TYM'),

  /* 14 – TMZ674 – sin adicional (SALENTO, tiene FEP 20600) */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TMZ674' AND razon_social='TYM'),
   'TMZ674','24271 20600','9606 9600 FLEISCHMANN','SALENTO','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   9620080,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1), 9620080) + 0,
   32,'AP762227 AP762485','TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ─────────────────────────────── */

  /* 15 – BCS450 – VALOR DE FLETE $100.000 (texto fijo, sin auxiliar) */
  ('2026-09-30','Miercoles','ALPINA',
   'CRISTIAN ZULUAGA',
   'BCS450','24275','E7001','PEREIRA - DOSQUEBRADAS',NULL,0,
   1,100000,'VALOR DE FLETE $100.000',
   2968186,
   100000,
   1,NULL,'TYM'),

  /* 16 – SMO183 – sin adicional */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24279','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   7413650,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7413650) + 0,
   53,NULL,'TYM'),

  /* 17 – VZD334 – sin adicional (tiene FEP 20604) */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24280 20604','9454 FLEISCHMANN','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   6576102,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6576102) + 0,
   43,NULL,'TYM'),

  /* 18 – MAT480 – sin adicional */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='MAT480' AND razon_social='TYM'),
   'MAT480','24281','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5401876,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5401876) + 0,
   42,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional (SANTA ROSA) */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24282','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   8729201,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 8729201) + 0,
   56,NULL,'TYM'),

  /* 20 – WHM896 – sin adicional */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24283','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   8465384,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8465384) + 0,
   55,NULL,'TYM'),

  /* 21 – PEK019 – ADICIONAL $100.000 (se debían del 3 y 4 sep, trabajó dos mañanas solo) */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24284','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,100000,'100.000 ADICIONALES QUE SE LE DEBIAN DEL 3 Y 4 DE SEPTIEMBRE PORQUE TRABAJO DOS MAÑANAS SOLO',
   4417426,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 4417426) + 100000,
   50,NULL,'TYM'),

  /* 22 – LUM993 (PABLO RAMIREZ) – sin adicional */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='LUM993' AND razon_social='TYM'),
   'LUM993','24285','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO, SAMUEL ARIAS',2,
   1,0,'-',
   8827218,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8827218) + 0,
   61,NULL,'TYM'),

  /* 23 – WLC133 – sin adicional */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24286','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, DUVIER GALVIZ',2,
   1,0,'-',
   7539726,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7539726) + 0,
   69,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional (CARTAGO) */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','24276 24287','9461 9450','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   8839297,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 8839297) + 0,
   51,NULL,'TYM'),

  /* 25 – LUM993 (ANDRES) – sin adicional (7004 FLEISCHMANN, tiene FEP 20605) */
  ('2026-09-30','Miercoles','ALPINA',
   'ANDRES',
   'LUM993','24292 20605','7004 FLEISCHMANN','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   10613491,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 10613491) + 0,
   67,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / 2T ─────────────────────────────────────── */

  /* 26 – WFV015 – VALOR DE FLETE $500.000 INCLUYE DESCARGUE (CARTAGO 2T, sin aux) */
  ('2026-09-30','Miercoles','ALPINA',
   'YONNI VALENCIA',
   'WFV015','24211','9450N','CARTAGO 2T',NULL,0,
   1,500000,'VALOR DE FLETE $500.000 INCLUYE DESCARGUE',
   8116930,
   500000,
   1,NULL,'TYM'),

  /* 27 – WTN748 – ADICIONAL AL FLETE $200.000 (ANSERMA NUEVO 2T, tiene FEP 20597) */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','24277 20597','7005 FLEISCHMANN','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,200000,'ADICIONAL AL FLETE $200.000',
   5931312,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1), 5931312) + 200000,
   36,NULL,'TYM'),

  /* 28 – ERK303 – sin adicional (BALBOA LA CELIA, tiene FEP 20603) */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','24272 20603','7006 FLEISCHMANN','BALBOA LA CELIA','ELKIN GARCIA OCAMPO, JORGE RIVILLAS',2,
   1,0,'-',
   7613567,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1), 7613567) + 0,
   37,NULL,'TYM'),

  /* 29 – JVM223 – sin adicional (ANSERMA, tiene FEP 20598) */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24256 24273 20598','7007 9451 FLEISCHMANN','ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   1,0,'-',
   14690684,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1), 14690684) + 0,
   57,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 30 – SQB119 – AP (1 ped $121.918) + FEP (45 ped $3.645.920) → registro ALPINA con facturas AP */
  ('2026-09-30','Miercoles','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119',NULL,'FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   121918,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 121918) + 0,
   1,'AP762153','TYM'),

  /* 31 – SQB119 – registro FLEISCHMANN (45 pedidos) */
  ('2026-09-30','Miercoles','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','20612','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   3645920,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 3645920) + 0,
   45,NULL,'TYM'),

  /* 32 – TRF860 – VALOR DE FLETE $450.000 (CARTAGO 2T, saldos miércoles pasados) */
  ('2026-09-30','Miercoles','FLEISCHMANN',
   'ALBERTO GONZALO',
   'TRF860','20599 20596','FLEISCHMANN','CARTAGO 2T','JULIAN RODRIGUEZ',1,
   1,450000,'VALOR DE FLETE $450.000 PORQUE SE LE DEBIA SALDOS DE LOS MIERCOLES PASADOS QUE HACIA',
   5347323,
   450000,
   39,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, contratista AS conductor_bd, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-09-30'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
