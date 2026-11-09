/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 30 OCTUBRE 2026
   Generado: 2026-10-31

   Notas:
     - WFR160   ADICIONAL AL FLETE $150.000 (AP 25186 25187 25173 + FEP 21011, 2 auxiliares)
     - EYX091   EXTRA $60.000 POR SUPER DE OTRA ZONA (AP 25174 + FEP 21012, fac AP793069)
     - WGZ876   ADICIONAL AL FLETE $180.000 (AP 25142 25178 + FEP 20984 21005, 2 auxiliares)
     - TUL630   VALOR DE FLETE $750.000 (AP 25188, CHINCHINA)
     - MAT480   VALOR DE FLETE $600.000 (AP 25116 25114, TEBAIDA)
     - WTN748   EXTRA $60.000 PENDIENTE DE LA SEMANA PASADA (AP 25203, fac AP791695)
     - SYU652   fac AP791709 (AP 25172 + FEP 21010)
     - ERK303   fac AP791694 AP791696 AP791697 (AP 25184 + FEP 21001)
     - SXF257   fac AP791711 (AP 25201 + FEP 20982)
     - WLS478   fac AP791712 AP791713 (AP 25182)
     - TNH494   fac AP791693 (AP 25197)
     - WHM896   sin fac adicional (AP 25180 25183 + FEP 21000)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-30'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 30‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

  /* 01 – SYU652 – sin adicional (AP 25172 + FEP 21010, fac AP791709) */
  ('2026-10-30','Viernes','ALPINA',
   'JOHAN ECHEVERRY',
   'SYU652','25172','9552 UNOAC F','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,0,'-',
   9773578,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 9773578) + 0,
   47,'21010 AP791709','TYM'),

  /* 02 – WFR160 – ADICIONAL AL FLETE $150.000 (AP 25186 25187 25173 + FEP 21011, 2 auxiliares) */
  ('2026-10-30','Viernes','ALPINA',
   'LEANDRO LOPEZ',
   'WFR160','25186 25187 25173','9553 9550 7001 F','MANIZALES VILLAMARIA','CARLOS JIMENEZ, ANDRES GOMEZ',2,
   2,150000,'ADICIONAL AL FLETE $150.000',
   10801746,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 10801746) + 150000,
   52,'21011','TYM'),

  /* 03 – EYX091 – EXTRA $60.000 POR SUPER DE OTRA ZONA (AP 25174 + FEP 21012, fac AP793069) */
  ('2026-10-30','Viernes','ALPINA',
   'CAMILO COCOMA',
   'EYX091','25174','9554 MANA F','MANIZALES VILLAMARIA','JHONNY LOPEZ',1,
   1,60000,'EXTRA $60.000 POR SUPER DE OTRA ZONA',
   9270172,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 9270172) + 60000,
   46,'21012 AP793069','TYM'),

  /* 04 – SPU120 – sin adicional (AP 25175 + FEP 21013 21004) */
  ('2026-10-30','Viernes','ALPINA',
   'OSWALDO IBARRA',
   'SPU120','25175','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   8648204,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 8648204) + 0,
   68,'21013 21004','TYM'),

  /* 05 – TRK507 – sin adicional (AP 25176 + FEP 21014) */
  ('2026-10-30','Viernes','ALPINA',
   'MIGUEL GONZALES',
   'TRK507','25176','9556 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   5895522,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5895522) + 0,
   51,'21014','TYM'),

  /* 06 – WEP384 – sin adicional (AP 25177 + FEP 21003) */
  ('2026-10-30','Viernes','ALPINA',
   'YOFER LOPEZ',
   'WEP384','25177','9557','IRRA LA FELISA VER RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ',1,
   1,0,'-',
   7755420,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='IRRA LA FELISA VER RIOSUCIO' LIMIT 1), 7755420) + 0,
   23,'21003','TYM'),

  /* 07 – WGZ876 – ADICIONAL AL FLETE $180.000 (AP 25142 25178 + FEP 20984 21005, 2 auxiliares) */
  ('2026-10-30','Viernes','ALPINA',
   'RICARDO PINEDA',
   'WGZ876','25142 25178','9558 F','PACORA SALAMINA','JOHN EDWAR ZAPATA ACEVEDO, YESID PATIÑO',2,
   2,180000,'ADICIONAL AL FLETE $180.000',
   12744437,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1), 12744437) + 180000,
   80,'20984 21005','TYM'),

  /* 08 – SXE867 – sin adicional (AP 25179 + FEP 21009, 2 auxiliares) */
  ('2026-10-30','Viernes','ALPINA',
   'HERIBERTO GARCIA',
   'SXE867','25179','9559 F','CHINCHINA','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
   2,0,'-',
   7316043,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1), 7316043) + 0,
   64,'21009','TYM'),

  /* 09 – WFV015 – precio fijo $625.000 (AP 25181, 2 auxiliares) */
  ('2026-10-30','Viernes','ALPINA',
   'YONI VALENCIA',
   'WFV015','25181','9560','SUPIA RIOSUCIO SUPER','PABLO RAMIREZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   11330961,
   625000,
   8,NULL,'TYM'),

  /* 10 – TUL630 – VALOR DE FLETE $750.000 (AP 25188, CHINCHINA) */
  ('2026-10-30','Viernes','ALPINA',
   'JUAN DAVID',
   'TUL630','25188','7002','CHINCHINA','JHON FREDY MORENO',1,
   1,0,'-',
   12377586,
   750000,
   5,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ───────────────────────────────── */

  /* 11 – MAT480 – VALOR DE FLETE $600.000 (AP 25116 25114, TEBAIDA) */
  ('2026-10-30','Viernes','ALPINA',
   'ELKIN AGUIRRE',
   'MAT480','25116 25114','7010','TEBAIDA','JUAN RICO',1,
   1,0,'-',
   15970780,
   600000,
   2,NULL,'TYM'),

  /* 12 – TTL256 – sin adicional (AP 25198, 2 auxiliares) */
  ('2026-10-30','Viernes','ALPINA',
   'ANDRES QUINTERO',
   'TTL256','25198','9601','ARMENIA','YEISON DAVID RENDON SOTO, SAMUEL ARIAS',2,
   2,0,'-',
   7543082,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 7543082) + 0,
   62,NULL,'TYM'),

  /* 13 – TJX795 – sin adicional (AP 25199 25170) */
  ('2026-10-30','Viernes','ALPINA',
   'ANDRES QUINTERO',
   'TJX795','25199 25170','9602 7009','ARMENIA','YERFREY FLOWER',1,
   1,0,'-',
   6366653,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 6366653) + 0,
   50,NULL,'TYM'),

  /* 14 – EQY944 – sin adicional (AP 25200 + FEP 20999, fac AP790622, 2 auxiliares) */
  ('2026-10-30','Viernes','ALPINA',
   'GOBER CRISTANCHO',
   'EQY944','25200','9603 PROGRESO F','CALARCA','JUAN JOSE CONTRERAS HERNANDEZ, CRISTIAN GIRALDO',2,
   2,0,'-',
   10349221,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1), 10349221) + 0,
   45,'20999 AP790622','TYM'),

  /* 15 – SXF257 – sin adicional (AP 25201 + FEP 20982, fac AP791711) */
  ('2026-10-30','Viernes','ALPINA',
   'FABIO RUIZ',
   'SXF257','25201','9604 MERCAHOGAR F','MONTENEGRO PTAPAO','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   6317594,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1), 6317594) + 0,
   44,'20982 AP791711','TYM'),

  /* 16 – WLS478 – sin adicional (AP 25182, fac AP791712 AP791713, 2 auxiliares) */
  ('2026-10-30','Viernes','ALPINA',
   'HUMBERTO RINCON',
   'WLS478','25182','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, EDWAR GIL',2,
   2,0,'-',
   8951218,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1), 8951218) + 0,
   39,'AP791712 AP791713','TYM'),

  /* 17 – WHM896 – sin adicional (AP 25180 25183 + FEP 21000) */
  ('2026-10-30','Viernes','ALPINA',
   'ALEXANDER CUELLAR',
   'WHM896','25180 25183','9606 9600 F','CIRCASIA','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   6615786,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1), 6615786) + 0,
   40,'21000','TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

  /* 18 – SMO183 – sin adicional (AP 25189) */
  ('2026-10-30','Viernes','ALPINA',
   'GABRIEL PEREZ',
   'SMO183','25189','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6647215,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6647215) + 0,
   62,NULL,'TYM'),

  /* 19 – VZD334 – sin adicional (AP 25190) */
  ('2026-10-30','Viernes','ALPINA',
   'JULIAN CUELLAR',
   'VZD334','25190','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7494124,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7494124) + 0,
   51,NULL,'TYM'),

  /* 20 – TMZ674 – sin adicional (AP 25191) */
  ('2026-10-30','Viernes','ALPINA',
   'RICARDO LOPEZ',
   'TMZ674','25191','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   6128734,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6128734) + 0,
   59,NULL,'TYM'),

  /* 21 – SPQ814 – sin adicional (AP 25192) */
  ('2026-10-30','Viernes','ALPINA',
   'CARLOS VELASCO',
   'SPQ814','25192','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6047236,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 6047236) + 0,
   54,NULL,'TYM'),

  /* 22 – LUM993 – sin adicional (AP 25193) */
  ('2026-10-30','Viernes','ALPINA',
   'ANDRES',
   'LUM993','25193','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   5611951,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5611951) + 0,
   48,NULL,'TYM'),

  /* 23 – PEK019 – sin adicional (AP 25194) */
  ('2026-10-30','Viernes','ALPINA',
   'MIGUEL TABARES',
   'PEK019','25194','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,0,'-',
   5999272,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5999272) + 0,
   52,NULL,'TYM'),

  /* 24 – BCS450 – sin adicional (AP 25195) */
  ('2026-10-30','Viernes','ALPINA',
   'CRISTIAN ZULUAGA',
   'BCS450','25195','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
   1,0,'-',
   5343772,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5343772) + 0,
   47,NULL,'TYM'),

  /* 25 – WHN317 – sin adicional (AP 25196, 2 auxiliares) */
  ('2026-10-30','Viernes','ALPINA',
   'HUMBERTO PARRA',
   'WHN317','25196','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, MARLON MURILLO',2,
   2,0,'-',
   11997818,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 11997818) + 0,
   71,NULL,'TYM'),

  /* 26 – TNH494 – sin adicional (AP 25197, fac AP791693) */
  ('2026-10-30','Viernes','ALPINA',
   'ADALBERTO MEJIA',
   'TNH494','25197','9461 SUPERM','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   7117132,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 7117132) + 0,
   58,'AP791693','TYM'),

  /* 27 – SXE499 – sin adicional (AP 25202) */
  ('2026-10-30','Viernes','ALPINA',
   'HECTOR MARIN',
   'SXE499','25202','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   7989780,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7989780) + 0,
   53,NULL,'TYM'),

  /* ── ZONA OCCIDENTE ───────────────────────────────────────── */

  /* 28 – WTN748 – EXTRA $60.000 PENDIENTE DE LA SEMANA PASADA (AP 25203, fac AP791695) */
  ('2026-10-30','Viernes','ALPINA',
   'DIEGO RATIVA',
   'WTN748','25203','7005 MERCAMOS','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,60000,'EXTRA $60.000 PENDIENTE DE LA SEMANA PASADA',
   8016792,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1), 8016792) + 60000,
   42,'AP791695','TYM'),

  /* 29 – ERK303 – sin adicional (AP 25184 + FEP 21001, fac AP791694 AP791696 AP791697, 2 auxiliares) */
  ('2026-10-30','Viernes','ALPINA',
   'JORGE ALARCON',
   'ERK303','25184','7006 F','LA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   14893434,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='LA VIRGINIA' LIMIT 1), 14893434) + 0,
   61,'21001 AP791694 AP791696 AP791697','TYM'),

  /* 30 – JVM223 – sin adicional (AP 25168 25185 + FEP 21002, 2 auxiliares) */
  ('2026-10-30','Viernes','ALPINA',
   'WILMAR CARDONA',
   'JVM223','25168 25185','7007 9451 F','MISTRATO','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   14729854,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MISTRATO' LIMIT 1), 14729854) + 0,
   62,'21002','TYM'),

  /* ── FLEISCHMANN ──────────────────────────────────────────── */

  /* 31 – SQB119 – sin adicional (FEP 21008 21007, ARMENIA) */
  ('2026-10-30','Viernes','FLEISCHMANN',
   'CARLOS CASTAÑO',
   'SQB119','21008 21007','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   7119771,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 7119771) + 0,
   56,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa,
       contratista     AS conductor,
       zona, poblacion,
       precio          AS precio_flete,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-10-30'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
