/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 25 SEPTIEMBRE 2026
   Generado: 2026-09-25
   Notas:
     - WGZ876  EXTRA $60.000
     - EYX091  ADICIONAL AL FLETE $100.000
     - TUL630  VALOR DE FLETE $560.000 (placa nueva, conductor texto fijo)
     - EQN953  VALOR DE FLETE $350.000
     - VZD334  PENDIENTES EXTRAS $120.000
     - WLC133  ADICIONAL AL FLETE $26.000
     - SQB119  solo FEP (sin planilla AP)
     - precio usa COALESCE: si la población no está en precios_fletes
       se toma el valor_ruta como precio (evita NULL en columna NOT NULL)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-09-25'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 25‑Sep‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ─────────────────────────────── */

  /* 01 – WFV015 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFV015' AND razon_social='TYM'),
   'WFV015','24156','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   6469761,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6469761) + 0,
   49,'FEP1195645-646-650','TYM'),

  /* 02 – WFR160 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24133 24151 20562','9553 9550','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,0,'-',
   7531162,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7531162) + 0,
   46,NULL,'TYM'),

  /* 03 – SYU652 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24155 20563','9554 MANA','MANIZALES VILLAMARIA','DUVIER GALVIZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   1,0,'-',
   9212785,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 9212785) + 0,
   51,'AP758213','TYM'),

  /* 04 – SPU120 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24152 20564','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   8479292,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 8479292) + 0,
   62,NULL,'TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SLI587' AND razon_social='TYM'),
   'SLI587','24141 20558 20565','9556 UNOACENTRO','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   11361647,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 11361647) + 0,
   54,'FEP1195636-640 AP758212','TYM'),

  /* 06 – WGZ876 – EXTRA $60.000 */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','24142','9557','IRRA LA FELISA VER RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ',1,
   1,60000,'EXTRA $60.000',
   9616546,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='IRRA LA FELISA VER RIOSUCIO' LIMIT 1), 9616546) + 60000,
   24,NULL,'TYM'),

  /* 07 – EYX091 – ADICIONAL AL FLETE $100.000 */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','24101 24143 20545 20559','9558','PACORA SALAMINA','JHONNY LOPEZ',1,
   1,100000,'ADICIONAL AL FLETE $100.000',
   12069695,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1), 12069695) + 100000,
   70,NULL,'TYM'),

  /* 08 – WEP384 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24144 20568','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ, SAMUEL ARIAS',2,
   1,0,'-',
   9701600,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1), 9701600) + 0,
   71,NULL,'TYM'),

  /* 09 – WFQ635 – sin adicional */
  /* Nota: "SUPIA RIOSUCIO SUPER" en planilla → RIOSUCIO-SUPIA SUPERMERCADO en tabla */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFQ635' AND razon_social='TYM'),
   'WFQ635','24134','9560','RIOSUCIO-SUPIA SUPERMERCADO','ANDRES MATEO VILLALBA DIAZ',1,
   1,0,'-',
   8453080,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 0,
   6,NULL,'TYM'),

  /* 10 – TUL630 – VALOR DE FLETE $560.000 (placa nueva) */
  ('2026-09-25','Viernes','ALPINA',
   'JUAN DAVID',
   'TUL630','24147','7002','CHINCHINA','JORGE RIVILLAS',1,
   1,560000,'VALOR DE FLETE $560.000',
   28013314,
   560000,
   7,'AP754153','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ──────────────────────────────────── */

  /* 11 – TTL256 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TTL256' AND razon_social='TYM'),
   'TTL256','24166','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   7897914,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 7897914) + 0,
   62,NULL,'TYM'),

  /* 12 – TJX795 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TJX795' AND razon_social='TYM'),
   'TJX795','24139 24167','9602 7009','ARMENIA','YERFREY FLOWER, APOYO VENDEDOR',2,
   1,0,'-',
   7287895,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 7287895) + 0,
   48,NULL,'TYM'),

  /* 13 – EQY944 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24171 20556','9603','CALARCA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   3292197,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1), 3292197) + 0,
   40,NULL,'TYM'),

  /* 14 – SXF257 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24168 20535','9604','MONTENEGRO PTAPAO','JOSE ALEXANDER CONSTAIN PERLAZA, MARLON MURILLO',2,
   1,0,'-',
   7293230,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1), 7293230) + 0,
   53,NULL,'TYM'),

  /* 15 – WLS478 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24140 24145','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, CRISTIAN GIRALDO',2,
   1,0,'-',
   11847544,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1), 11847544) + 0,
   40,NULL,'TYM'),

  /* 16 – EQN953 – VALOR DE FLETE $350.000 */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQN953' AND razon_social='TYM'),
   'EQN953','24135 24146 20557','9606 9600','CIRCASIA','JHON WILSON GIRALDO CARVAJAL',1,
   1,350000,'VALOR DE FLETE $350.000',
   6995438,
   350000,
   50,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ─────────────────────────────── */

  /* 17 – SMO183 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24157','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   5849337,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5849337) + 0,
   58,NULL,'TYM'),

  /* 18 – VZD334 – PENDIENTES EXTRAS $120.000 */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24158','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,120000,'PENDIENTES EXTRAS $120.000',
   8326964,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8326964) + 120000,
   49,NULL,'TYM'),

  /* 19 – TMZ674 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TMZ674' AND razon_social='TYM'),
   'TMZ674','24159','9455','PEREIRA - DOSQUEBRADAS','JHON FREDY MORENO',1,
   1,0,'-',
   5654614,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5654614) + 0,
   58,NULL,'TYM'),

  /* 20 – SPQ814 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24160','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5788896,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 5788896) + 0,
   58,NULL,'TYM'),

  /* 21 – WHM896 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24161','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   6588760,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6588760) + 0,
   48,NULL,'TYM'),

  /* 22 – PEK019 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24162','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,0,'-',
   6743262,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6743262) + 0,
   54,NULL,'TYM'),

  /* 23 – LUM993 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='LUM993' AND razon_social='TYM'),
   'LUM993','24163','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
   1,0,'-',
   6191765,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6191765) + 0,
   51,NULL,'TYM'),

  /* 24 – WLC133 – ADICIONAL AL FLETE $26.000 */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24164','9460','PEREIRA - DOSQUEBRADAS','JUAN RICO, ANDRES FELIPE RIOS CAICEDO',2,
   1,26000,'ADICIONAL AL FLETE $26.000',
   11827044,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 11827044) + 26000,
   68,NULL,'TYM'),

  /* 25 – TNH494 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','24165','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   10279113,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 10279113) + 0,
   56,'AP758200','TYM'),

  /* 26 – MAT480 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='MAT480' AND razon_social='TYM'),
   'MAT480','24169','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   5920876,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5920876) + 0,
   46,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ──────────────────────────────── */

  /* 27 – WTN748 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','24170','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5008266,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1), 5008266) + 0,
   39,NULL,'TYM'),

  /* 28 – ERK303 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','24148 20554','7006','LA VIRGINIA','ELKIN GARCIA OCAMPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   1,0,'-',
   10933902,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='LA VIRGINIA' LIMIT 1), 10933902) + 0,
   64,'AP758199 AP758201 AP758371','TYM'),

  /* 29 – JVM223 – sin adicional */
  ('2026-09-25','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24132 24149 20555','7007 9451','MISTRATO','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   1,0,'-',
   16196547,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MISTRATO' LIMIT 1), 16196547) + 0,
   55,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 30 – SQB119 – sin adicional (solo FEP) */
  ('2026-09-25','Viernes','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','20566 20567','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   4967262,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 4967262) + 0,
   53,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, contratista AS conductor_bd, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-09-25'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
