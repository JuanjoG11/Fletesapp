/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 9 OCTUBRE 2026
   Generado: 2026-10-09
   ✅ Nombres de auxiliares normalizados según lista oficial

   Notas:
     - MAT480   VALOR DE FLETE $700.000 (N SUPERCENTRO, 1 auxiliar, fac AP772124)
     - SYU652   EXTRA $60.000 (MANIZALES VILLAMARIA, 2 auxiliares, facs FEP1196772-774 AP772123)
     - WFR160   $80.000 EXTRAS (MANIZALES VILLAMARIA, facs AP772122)
     - WEP384   sin adicional (IRRA LA FELISA VER RIOSUCIO, 2 auxiliares, planillas 24569 24579)
     - TUL630   VALOR DE FLETE $600.000 (CHINCHINA 7002, 1 auxiliar, planilla 24571)
     - EQN953   VALOR DE FLETE $400.000 (ARMENIA, planillas 24490 24600)
     - VZD334   EXTRA $60.000 X PEDIDOS DEL DIA ANTERIOR (PEREIRA, planilla 24591)
     - TMZ674   EXTRA $150.000 (PEREIRA, planilla 24592)
     - TUL630   EXTRA $60.000 (PEREIRA 9457, planilla 24594)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-09'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 09‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

  /* 01 – MAT480 – VALOR DE FLETE $700.000 (N SUPERCENTRO, fac AP772124) */
  ('2026-10-09','Viernes','ALPINA',
   'ELKIN AGUIRRE',
   'MAT480','AP772124','N SUPERCENTRO','MANIZALES VILLAMARIA','JHON FREDY MORENO',1,
   1,0,'-',
   22590000,
   700000,
   1,'AP772124','TYM'),

  /* 02 – SYU652 – EXTRA $60.000 (AP 24574 + FEP1196772-774 + AP772123, 2 auxiliares) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24574','9552 SUPERCENTRO','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ, JHON FREDY MORENO',2,
   2,60000,'EXTRA $60.000',
   16015897,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 16015897) + 60000,
   47,'FEP1196772-774 AP772123','TYM'),

  /* 03 – WFR160 – $80.000 EXTRAS (AP 24575 + FEP 20730 + AP772122) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24575','9553 PUNTOMERCO','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,80000,'$80.000 EXTRAS',
   8580663,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 8580663) + 80000,
   50,'AP772122','TYM'),

  /* 04 – EYX091 – sin adicional (AP 24576 + FEP 20734 20731 + AP771695, 2 auxiliares) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','24576','9554 MANA','MANIZALES VILLAMARIA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   10756142,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 10756142) + 0,
   55,'AP771695','TYM'),

  /* 05 – SPU120 – sin adicional (AP 24577 + FEP 20732) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24577','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   7507869,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7507869) + 0,
   64,NULL,'TYM'),

  /* 06 – TTL256 – sin adicional (AP 24578 + FEP 20733 20726 + FEP1196768 + AP771694, 2 auxiliares) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TTL256' AND razon_social='TYM'),
   'TTL256','24578','9556 UNOAC','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE, MARLON MURILLO',2,
   2,0,'-',
   11480847,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 11480847) + 0,
   54,'FEP1196768 AP771694','TYM'),

  /* 07 – WEP384 – sin adicional (AP 24569 24579, 2 auxiliares) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24569 24579','9557 9560','IRRA LA FELISA VER RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   18224652,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='IRRA LA FELISA VER RIOSUCIO' LIMIT 1), 18224652) + 0,
   35,NULL,'TYM'),

  /* 08 – WGZ876 – sin adicional (AP 24537 24580 + FEP 20711, 2 auxiliares) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','24537 24580','9558','PACORA SALAMINA','JOHN EDWAR ZAPATA ACEVEDO, JUAN RICO',2,
   2,0,'-',
   12951618,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1), 12951618) + 0,
   62,NULL,'TYM'),

  /* 09 – MAT480 – sin adicional (AP 24581 + FEP 20738, 2 auxiliares — ruta CHINCHINA) */
  ('2026-10-09','Viernes','ALPINA',
   'ELKIN AGUIRRE',
   'MAT480','24581','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ, CRISTIAN GIRALDO',2,
   2,0,'-',
   6764625,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1), 6764625) + 0,
   70,'AP772124','TYM'),

  /* 10 – TUL630 – VALOR DE FLETE $600.000 (AP 24571, ruta 7002 CHINCHINA) */
  ('2026-10-09','Viernes','ALPINA',
   'JUAN DAVID',
   'TUL630','24571','7002','CHINCHINA','JORGE RIVILLAS',1,
   1,0,'-',
   22235763,
   600000,
   6,NULL,'TYM'),

  /* ── ZONA ARMENIA ─────────────────────────────────────────── */

  /* 11 – WFV015 – sin adicional (AP 24599 24572, 2 auxiliares) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFV015' AND razon_social='TYM'),
   'WFV015','24599 24572','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO, SAMUEL ARIAS',2,
   2,0,'-',
   11866944,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 11866944) + 0,
   58,NULL,'TYM'),

  /* 12 – EQN953 – VALOR DE FLETE $400.000 (AP 24490 24600) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQN953' AND razon_social='TYM'),
   'EQN953','24490 24600','9602 7008','ARMENIA','YERFREY FLOWER',1,
   1,0,'-',
   6855025,
   400000,
   48,NULL,'TYM'),

  /* 13 – EQY944 – sin adicional (AP 24601) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24601','9603','CALARCA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   3664098,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1), 3664098) + 0,
   49,NULL,'TYM'),

  /* 14 – SXF257 – sin adicional (AP 24602 + FEP 20706) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24602','9604','MONTENEGRO PTAPAO','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   7275169,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1), 7275169) + 0,
   48,NULL,'TYM'),

  /* 15 – WLS478 – sin adicional (AP 24582 24573, 2 auxiliares) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24582 24573','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, YESID PATIÑO',2,
   2,0,'-',
   10493832,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1), 10493832) + 0,
   47,NULL,'TYM'),

  /* 16 – WHM896 – sin adicional (AP 24587 24583 + FEP 20737) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24587 24583','9606 9600','CIRCASIA','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   8605903,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1), 8605903) + 0,
   49,NULL,'TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

  /* 17 – SMO183 – sin adicional (AP 24590) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24590','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6827289,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6827289) + 0,
   55,NULL,'TYM'),

  /* 18 – VZD334 – EXTRA $60.000 X PEDIDOS DEL DIA ANTERIOR (AP 24591) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24591','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,60000,'EXTRA $60.000 X PEDIDOS DEL DIA ANTERIOR',
   9532775,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 9532775) + 60000,
   52,NULL,'TYM'),

  /* 19 – TMZ674 – EXTRA $150.000 (AP 24592) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TMZ674' AND razon_social='TYM'),
   'TMZ674','24592','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,150000,'EXTRA $150.000',
   5313901,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5313901) + 150000,
   58,NULL,'TYM'),

  /* 20 – SPQ814 – sin adicional (AP 24593) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24593','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5791222,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 5791222) + 0,
   51,NULL,'TYM'),

  /* 21 – TUL630 – EXTRA $60.000 (AP 24594 — ruta 9457 PEREIRA, conductor texto fijo) */
  ('2026-10-09','Viernes','ALPINA',
   'ANDRES',
   'TUL630','24594','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,60000,'EXTRA $60.000',
   7682506,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7682506) + 60000,
   53,NULL,'TYM'),

  /* 22 – PEK019 – sin adicional (AP 24595) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24595','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,0,'-',
   6415980,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6415980) + 0,
   50,NULL,'TYM'),

  /* 23 – LUM993 – sin adicional (AP 24596, 2 auxiliares — conductor texto fijo) */
  ('2026-10-09','Viernes','ALPINA',
   'ANDRES',
   'LUM993','24596','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO, PABLO RAMIREZ',2,
   2,0,'-',
   6856020,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6856020) + 0,
   51,NULL,'TYM'),

  /* 24 – WLC133 – sin adicional (AP 24597) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24597','9460','PEREIRA - DOSQUEBRADAS','DUVIER GALVIZ',1,
   1,0,'-',
   4668440,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 4668440) + 0,
   31,NULL,'TYM'),

  /* 25 – TDY481 – sin adicional (AP 24605) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TDY481' AND razon_social='TYM'),
   'TDY481','24605','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES',1,
   1,0,'-',
   6813894,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6813894) + 0,
   36,NULL,'TYM'),

  /* 26 – TNH494 – sin adicional (AP 24598) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','24598','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   7423305,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 7423305) + 0,
   56,NULL,'TYM'),

  /* 27 – SXE499 – sin adicional (AP 24603, 2 auxiliares — conductor texto fijo) */
  ('2026-10-09','Viernes','ALPINA',
   'ANDRES',
   'SXE499','24603','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   7268754,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7268754) + 0,
   52,NULL,'TYM'),

  /* ── ZONA CARTAGO / OCCIDENTE ─────────────────────────────── */

  /* 28 – WTN748 – sin adicional (AP 24604 + fac AP771686) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','24604','7005 MERCAMOS','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   6897742,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1), 6897742) + 0,
   37,'AP771686','TYM'),

  /* 29 – ERK303 – sin adicional (AP 24584 + FEP 20727 + AP771684-685-687, 2 auxiliares) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','24584','7006','LA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   11475546,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='LA VIRGINIA' LIMIT 1), 11475546) + 0,
   73,'AP771684-685-687','TYM'),

  /* 30 – JVM223 – sin adicional (AP 24568 24585 + FEP 20728, 2 auxiliares) */
  ('2026-10-09','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24568 24585','7007 9451','MISTRATO','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   15332542,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MISTRATO' LIMIT 1), 15332542) + 0,
   64,NULL,'TYM'),

  /* ── FLEISCHMANN ──────────────────────────────────────────── */

  /* 31 – SQB119 – sin adicional (FEP 20736) */
  ('2026-10-09','Viernes','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','20736','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   3421162,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 3421162) + 0,
   38,NULL,'TYM');

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
WHERE fecha = '2026-10-09'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
