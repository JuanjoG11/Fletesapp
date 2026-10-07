/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 2 OCTUBRE 2026
   Generado: 2026-10-02
   Notas:
     - WFR160   ADICIONAL AL FLETE $100.000 (AP 24341 24348 + FEP 20650)
     - WEP384   EXTRA $60.000 (AP 24308TSS 24352 24342)
     - WGZ876   EXTRA $60.000 (AP 24309 24353 + FEP 20648 20618)
     - TUL630   VALOR DE FLETE $500.000 (placa nueva, conductor texto fijo)
                SE LE SACO FAC 765158
     - SPQ814   FEP 20645, fact. adicionales: 765158 FAC MERCALOCURA
     - SXF257   fact. adicionales: AP764848 (FEP 20626)
     - WLS478   fact. adicionales: AP764849-850 AP765162 (sin FEP propio)
     - TNH494   fact. adicionales: AP764834
     - ERK303   fact. adicionales: AP764832-833-835 (FEP 20641)
     - SQB119   solo FLEISCHMANN (FEP 20643, fact. FEP1196190 FEP1196206)
     - LUM993 (ANDRES) placa repetida conductor texto fijo, planilla 24334TTS 24381
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-02'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 02‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ─────────────────────────────── */

  /* 01 – SYU652 – sin adicional (AP 24347 + FEP1196167) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24347','9552','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,0,'-',
   5594925,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5594925) + 0,
   46,'FEP1196167','TYM'),

  /* 02 – WFR160 – ADICIONAL AL FLETE $100.000 (AP 24341 24348 + FEP 20650) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24341 24348 20650','9553 9550','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,100000,'ADICIONAL AL FLETE $100.000',
   9532027,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 9532027) + 100000,
   52,NULL,'TYM'),

  /* 03 – EYX091 – sin adicional (AP 24298 24349 + FEP 20651) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','24298 24349 20651','9554 7000','MANIZALES VILLAMARIA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   1,0,'-',
   9035315,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 9035315) + 0,
   51,NULL,'TYM'),

  /* 04 – SPU120 – sin adicional (AP 24350) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24350','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   7387675,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7387675) + 0,
   63,NULL,'TYM'),

  /* 05 – TTL256 – sin adicional (AP 24351 + FEP 20652 20639 + FEP1196159) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TTL256' AND razon_social='TYM'),
   'TTL256','24351 20652 20639','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   6456022,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6456022) + 0,
   51,'FEP1196159','TYM'),

  /* 06 – WEP384 – EXTRA $60.000 (AP 24308TSS 24352 24342, IRRA LA FELISA VER RIOSUCIO) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24308TSS 24352 24342','9557 9560','IRRA LA FELISA VER RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ',1,
   1,60000,'EXTRA $60.000',
   12541923,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='IRRA LA FELISA VER RIOSUCIO' LIMIT 1), 12541923) + 60000,
   28,NULL,'TYM'),

  /* 07 – WGZ876 – EXTRA $60.000 (AP 24309 24353 + FEP 20648 20618, PACORA SALAMINA) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','24309 24353 20648 20618','9558','PACORA SALAMINA','JOHN EDWAR ZAPATA ACEVEDO, JUAN RICO',2,
   1,60000,'EXTRA $60.000',
   13726718,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1), 13726718) + 60000,
   78,NULL,'TYM'),

  /* 08 – MAT480 – sin adicional (AP 24354 + FEP 20646, CHINCHINA) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='MAT480' AND razon_social='TYM'),
   'MAT480','24354 20646','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   1,0,'-',
   8712019,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1), 8712019) + 0,
   77,NULL,'TYM'),

  /* 09 – TUL630 – VALOR DE FLETE $500.000 (placa nueva, conductor texto fijo, SE LE SACO FAC 765158) */
  ('2026-10-02','Viernes','ALPINA',
   'JUAN DAVID',
   'TUL630','24299 24343','7002','CHINCHINA','JORGE RIVILLAS',1,
   1,500000,'VALOR DE FLETE $500.000',
   22418205,
   500000,
   8,'765158','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ──────────────────────────────────── */

  /* 10 – WFV015 – sin adicional (AP 24377, ARMENIA) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFV015' AND razon_social='TYM'),
   'WFV015','24377','9601','ARMENIA','YEISON DAVID RENDON SOTO, JHON FREDY MORENO',2,
   1,0,'-',
   8312676,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 8312676) + 0,
   64,NULL,'TYM'),

  /* 11 – TJX795 – sin adicional (AP 24344 24378, ARMENIA) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TJX795' AND razon_social='TYM'),
   'TJX795','24344 24378','9602 7009','ARMENIA','YERFREY FLOWER',1,
   1,0,'-',
   6643086,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 6643086) + 0,
   46,NULL,'TYM'),

  /* 12 – EQY944 – sin adicional (AP 24379, CALARCA) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24379','9603','CALARCA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   3150945,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1), 3150945) + 0,
   41,NULL,'TYM'),

  /* 13 – SXF257 – sin adicional (AP 24380 + FEP 20626, MONTENEGRO PTAPAO, fact. AP764848) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24380 20626','9604','MONTENEGRO PTAPAO','JOSE ALEXANDER CONSTAIN PERLAZA, MARLON MURILLO',2,
   1,0,'-',
   8502749,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1), 8502749) + 0,
   60,'AP764848','TYM'),

  /* 14 – WLS478 – sin adicional (AP 24355, TEBAIDA, fact. AP764849-850 AP765162) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24355','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, CRISTIAN GIRALDO',2,
   1,0,'-',
   10096977,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1), 10096977) + 0,
   45,'AP764849-850 AP765162','TYM'),

  /* 15 – WHM896 – sin adicional (AP 24376 24356 + FEP 20640, CIRCASIA) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24376 24356 20640','9606 9600','CIRCASIA','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   7145308,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1), 7145308) + 0,
   35,NULL,'TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ─────────────────────────────── */

  /* 16 – SMO183 – sin adicional (AP 24361) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24361','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   5652383,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5652383) + 0,
   55,NULL,'TYM'),

  /* 17 – VZD334 – sin adicional (AP 24362) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24362','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   9611523,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 9611523) + 0,
   57,NULL,'TYM'),

  /* 18 – TMZ674 – sin adicional (AP 24363) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TMZ674' AND razon_social='TYM'),
   'TMZ674','24363','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   7481633,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7481633) + 0,
   66,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional (AP 24364 + FEP 20645, SANTA ROSA, fact. 765158 FAC MERCALOCURA) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24364 20645','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6289125,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 6289125) + 0,
   53,'765158 FAC MERCALOCURA','TYM'),

  /* 20 – WFQ635 – sin adicional (AP 24365) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFQ635' AND razon_social='TYM'),
   'WFQ635','24365','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7645927,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7645927) + 0,
   56,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional (AP 24366) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24366','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,0,'-',
   7497425,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7497425) + 0,
   62,NULL,'TYM'),

  /* 22 – LUM993 (PABLO RAMIREZ) – sin adicional (AP 24367) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='LUM993' AND razon_social='TYM'),
   'LUM993','24367','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
   1,0,'-',
   5342888,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5342888) + 0,
   50,NULL,'TYM'),

  /* 23 – WLC133 – sin adicional (AP 24360) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24360','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, DUVIER GALVIZ',2,
   1,0,'-',
   12638963,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 12638963) + 0,
   77,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional (AP 24346, CARTAGO, fact. AP764834) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','24346','9461 MERCAMOS','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   9548692,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 9548692) + 0,
   56,'AP764834','TYM'),

  /* 25 – LUM993 (ANDRES) – conductor texto fijo, placa repetida (AP 24334TTS 24381) */
  ('2026-10-02','Viernes','ALPINA',
   'ANDRES',
   'LUM993','24334TTS 24381','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   1,0,'-',
   9371252,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 9371252) + 0,
   55,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / 2T ─────────────────────────────────────── */

  /* 26 – WTN748 – sin adicional (AP 24382, CARTAGO 2T) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','24382','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5439657,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1), 5439657) + 0,
   43,NULL,'TYM'),

  /* 27 – ERK303 – sin adicional (AP 24357 + FEP 20641, LA VIRGINIA, fact. AP764832-833-835) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','24357 20641','7006','LA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   1,0,'-',
   9874259,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='LA VIRGINIA' LIMIT 1), 9874259) + 0,
   57,'AP764832-833-835','TYM'),

  /* 28 – JVM223 – sin adicional (AP 24340 24358 + FEP 20642, MISTRATO) */
  ('2026-10-02','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24340 24358 20642','7007 9451','MISTRATO','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   1,0,'-',
   16076315,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MISTRATO' LIMIT 1), 16076315) + 0,
   69,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – solo FLEISCHMANN (FEP 20643, ARMENIA, fact. FEP1196190 FEP1196206) */
  ('2026-10-02','Viernes','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','20643','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   8155299,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 8155299) + 0,
   54,'FEP1196190 FEP1196206','TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, contratista AS conductor_bd, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-10-02'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
