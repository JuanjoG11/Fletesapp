/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 29 OCTUBRE 2026
   Generado: 2026-10-29

   Notas:
     - TUL630   VALOR DE FLETE $550.000 (AP 25143 + FEP 20965 20986 20985, 2 auxiliares)
     - MAT480   VALOR DE FLETE $800.000 (AP 25111 25116)
     - SMH182   VALOR DE FLETE $760.000 (AP 25109 25110)
     - EQN953   VALOR DE FLETE $400.000 (AP 25135 25160)
     - WGZ876   VALOR DE FLETE $350.000 (AP 25129TSS 25164 + FEP 20967 20977, 2 auxiliares)
     - VZD334   extra $60.000 por 10 pedidos de otra zona (AP 25152 + FEP 20983)
     - WFV015   adicional $80.000 por extra — cargar una ruta, descargarla, ir por otra (AP 25133 25147 + FEP 20990, 2 auxiliares)
     - EQY944   fac AP788997 (AP 25162)
     - SQB119   ADICIONAL AL FLETE $200.000 (FEP 20978 20992, FLEISCHMANN)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-29'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 29‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

  /* 01 – SYU652 – sin adicional (AP 25136 + FEP 20994) */
  ('2026-10-29','Jueves','ALPINA',
   'JOHAN ECHEVERRY',
   'SYU652','25136','9552 F','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,0,'-',
   5817830,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5817830) + 0,
   42,'20994','TYM'),

  /* 02 – WFR160 – sin adicional (AP 25137 + FEP 20998 20995) */
  ('2026-10-29','Jueves','ALPINA',
   'LEANDRO LOPEZ',
   'WFR160','25137','9553 F','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,0,'-',
   5494488,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5494488) + 0,
   47,'20998 20995','TYM'),

  /* 03 – EYX091 – sin adicional (AP 25138 + FEP 20993, 2 auxiliares, conductor ANDRES GOMEZ) */
  ('2026-10-29','Jueves','ALPINA',
   'ANDRES GOMEZ',
   'EYX091','25138','9554 F','NEIRA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   8609766,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1), 8609766) + 0,
   60,'20993','TYM'),

  /* 04 – SPU120 – sin adicional (AP 25139 + FEP 20996) */
  ('2026-10-29','Jueves','ALPINA',
   'OSWALDO IBARRA',
   'SPU120','25139','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   9043126,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 9043126) + 0,
   57,'20996','TYM'),

  /* 05 – TRK507 – sin adicional (AP 25148 25140 + FEP 20997, 2 auxiliares) */
  ('2026-10-29','Jueves','ALPINA',
   'MIGUEL GONZALES',
   'TRK507','25148 25140','9556 9550 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE, ANDRES GOMEZ',2,
   2,0,'-',
   11273889,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 11273889) + 0,
   59,'20997','TYM'),

  /* 06 – WEP384 – sin adicional (AP 25141 + FEP 20948 20987, 2 auxiliares) */
  ('2026-10-29','Jueves','ALPINA',
   'YOFER LOPEZ',
   'WEP384','25141','9557 F','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   15252131,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1), 15252131) + 0,
   58,'20948 20987','TYM'),

  /* 07 – TUL630 – VALOR DE FLETE $550.000 (AP 25143 + FEP 20965 20986 20985, 2 auxiliares) */
  ('2026-10-29','Jueves','ALPINA',
   'JUAN DAVID',
   'TUL630','25143','9559 F','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
   2,0,'-',
   11569379,
   550000,
   56,'20965 20986 20985','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ───────────────────────────────── */

  /* 08 – MAT480 – VALOR DE FLETE $800.000 (AP 25111 25116) */
  ('2026-10-29','Jueves','ALPINA',
   'ELKIN AGUIRRE',
   'MAT480','25111 25116','7009 7010','ARMENIA','JHON FREDY MORENO',1,
   1,0,'-',
   24186580,
   800000,
   2,NULL,'TYM'),

  /* 09 – SMH182 – VALOR DE FLETE $760.000 (AP 25109 25110) */
  ('2026-10-29','Jueves','ALPINA',
   'ANDRES QUINTERO',
   'SMH182','25109 25110','7008','CALARCA','JUAN RICO',1,
   1,0,'-',
   17415840,
   760000,
   2,NULL,'TYM'),

  /* 10 – EQN953 – VALOR DE FLETE $400.000 (AP 25135 25160) */
  ('2026-10-29','Jueves','ALPINA',
   'ORLANDO VASQUEZ',
   'EQN953','25135 25160','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   8807377,
   400000,
   60,NULL,'TYM'),

  /* 11 – TJX795 – sin adicional (AP 25087 25161) */
  ('2026-10-29','Jueves','ALPINA',
   'ANDRES QUINTERO',
   'TJX795','25087 25161','9602 7008','ARMENIA','YERFREY FLOWER',1,
   1,0,'-',
   7950489,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 7950489) + 0,
   61,NULL,'TYM'),

  /* 12 – EQY944 – sin adicional (AP 25162, fac AP788997) */
  ('2026-10-29','Jueves','ALPINA',
   'GOBER CRISTANCHO',
   'EQY944','25162','9603 ANDY','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   6393232,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 6393232) + 0,
   61,'AP788997','TYM'),

  /* 13 – SXE867 – sin adicional (AP 25163 + FEP 20981) */
  ('2026-10-29','Jueves','ALPINA',
   'HERIBERTO GARCIA',
   'SXE867','25163','9604 F','ALCALA ULLOA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   5518441,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1), 5518441) + 0,
   38,'20981','TYM'),

  /* 14 – WLS478 – sin adicional (AP 25144 + FEP 20980, 2 auxiliares) */
  ('2026-10-29','Jueves','ALPINA',
   'HUMBERTO RINCON',
   'WLS478','25144','9605 F','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, EDWAR GIL',2,
   2,0,'-',
   9244043,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1), 9244043) + 0,
   53,'20980','TYM'),

  /* 15 – WHM896 – sin adicional (AP 25149 25145 + FEP 20960) */
  ('2026-10-29','Jueves','ALPINA',
   'ALEXANDER CUELLAR',
   'WHM896','25149 25145','9606 9600 F','FILANDIA','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   9031334,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1), 9031334) + 0,
   39,'20960','TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

  /* 16 – BCS450 – sin adicional (AP 25131, PEREIRA - DOSQUEBRADAS) */
  ('2026-10-29','Jueves','ALPINA',
   'CRISTIAN ZULUAGA',
   'BCS450','25131','E7001','PEREIRA - DOSQUEBRADAS','-',0,
   0,0,'-',
   3356842,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 3356842) + 0,
   2,NULL,'TYM'),

  /* 17 – SMO183 – sin adicional (AP 25151) */
  ('2026-10-29','Jueves','ALPINA',
   'GABRIEL PEREZ',
   'SMO183','25151','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6001665,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6001665) + 0,
   49,NULL,'TYM'),

  /* 18 – VZD334 – extra $60.000 por 10 pedidos de otra zona (AP 25152 + FEP 20983) */
  ('2026-10-29','Jueves','ALPINA',
   'JULIAN CUELLAR',
   'VZD334','25152','9454 F','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,60000,'EXTRA $60.000 POR 10 PEDIDOS DE OTRA ZONA',
   9649948,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 9649948) + 60000,
   67,'20983','TYM'),

  /* 19 – TMZ674 – sin adicional (AP 25153) */
  ('2026-10-29','Jueves','ALPINA',
   'RICARDO LOPEZ',
   'TMZ674','25153','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5305883,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5305883) + 0,
   54,NULL,'TYM'),

  /* 20 – SXE499 – sin adicional (AP 25086 25154) */
  ('2026-10-29','Jueves','ALPINA',
   'HECTOR MARIN',
   'SXE499','25086 25154','9456 7002','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   7169339,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 7169339) + 0,
   50,NULL,'TYM'),

  /* 21 – WHN317 – sin adicional (AP 25155 + FEP 20989) */
  ('2026-10-29','Jueves','ALPINA',
   'HUMBERTO PARRA',
   'WHN317','25155','9457 F','ARABIA ALTAGRACIA','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   6702736,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARABIA ALTAGRACIA' LIMIT 1), 6702736) + 0,
   55,'20989','TYM'),

  /* 22 – PEK019 – sin adicional (AP 25156) */
  ('2026-10-29','Jueves','ALPINA',
   'MIGUEL TABARES',
   'PEK019','25156','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,0,'-',
   5373375,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5373375) + 0,
   43,NULL,'TYM'),

  /* 23 – LUM993 – sin adicional (AP 25123TSS 25157, 2 auxiliares) */
  ('2026-10-29','Jueves','ALPINA',
   'PABLO RAMIREZ',
   'LUM993','25123TSS 25157','9459 TSS','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO, PABLO RAMIREZ',2,
   2,0,'-',
   6503588,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6503588) + 0,
   45,NULL,'TYM'),

  /* 24 – TTL256 – sin adicional (AP 25124) */
  ('2026-10-29','Jueves','ALPINA',
   'ANDRES QUINTERO',
   'TTL256','25124','9460TSS','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES',1,
   1,0,'-',
   9639795,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 9639795) + 0,
   79,NULL,'TYM'),

  /* 25 – SPQ814 – sin adicional (AP 25158) */
  ('2026-10-29','Jueves','ALPINA',
   'CARLOS VELASCO',
   'SPQ814','25158','9460','PEREIRA','MARLON MURILLO',1,
   1,0,'-',
   6487508,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 6487508) + 0,
   48,NULL,'TYM'),

  /* 26 – TNH494 – sin adicional (AP 25159) */
  ('2026-10-29','Jueves','ALPINA',
   'ADALBERTO MEJIA',
   'TNH494','25159','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   5953284,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 5953284) + 0,
   47,NULL,'TYM'),

  /* 27 – WGZ876 – VALOR DE FLETE $350.000 (AP 25129TSS 25164 + FEP 20967 20977, 2 auxiliares) */
  ('2026-10-29','Jueves','ALPINA',
   'RICARDO PINEDA',
   'WGZ876','25129TSS 25164','7004 F','MARSELLA','BRAHIAN STIVEN VALENCIA IGLESIAS, CRISTIAN GIRALDO',2,
   2,0,'-',
   11440988,
   350000,
   61,'20967 20977','TYM'),

  /* ── ZONA OCCIDENTE ───────────────────────────────────────── */

  /* 28 – WTN748 – sin adicional (AP 25132 25165) */
  ('2026-10-29','Jueves','ALPINA',
   'DIEGO RATIVA',
   'WTN748','25132 25165','7005 9450','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   6959128,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1), 6959128) + 0,
   42,NULL,'TYM'),

  /* 29 – ERK303 – sin adicional (AP 25146 + FEP 20979 20976, 2 auxiliares) */
  ('2026-10-29','Jueves','ALPINA',
   'JORGE ALARCON',
   'ERK303','25146','7006 F','APIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   11009574,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA' LIMIT 1), 11009574) + 0,
   49,'20979 20976','TYM'),

  /* 30 – WFV015 – ADICIONAL $80.000 — cargar ruta, descargar, ir por otra ruta
                   (AP 25133 25147 + FEP 20990, 2 auxiliares) */
  ('2026-10-29','Jueves','ALPINA',
   'YONNI VALENCIA',
   'WFV015','25133 25147','7007 9451 F','VITERBO','MANUEL RAMIREZ, SAMUEL ARIAS',2,
   2,80000,'ADICIONAL $80.000 — CARGAR UNA RUTA, DESCARGARLA PARA IR POR OTRA RUTA',
   11299416,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1), 11299416) + 80000,
   60,'20990','TYM'),

  /* ── FLEISCHMANN ──────────────────────────────────────────── */

  /* 31 – SQB119 – ADICIONAL AL FLETE $200.000 (FEP 20978 20992, PEREIRA - DOSQUEBRADAS) */
  ('2026-10-29','Jueves','FLEISCHMANN',
   'CARLOS CASTAÑO',
   'SQB119','20978 20992','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,200000,'ADICIONAL AL FLETE $200.000',
   11704208,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 11704208) + 200000,
   41,NULL,'TYM');

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
WHERE fecha = '2026-10-29'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
