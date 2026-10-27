/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 22 OCTUBRE 2026
   Generado: 2026-10-22

   Notas:
     - WFR160   ADICIONAL AL FLETE $100.000 (AP 24939 24928 + FEP 20906 20905, 2 auxiliares)
     - WFV015   VALOR DE FLETE $900.000 (CALARCA, sin auxiliar, AP 24926)
     - VZD334   EXTRA $60.000 (AP 24947 + FEP 20893)
     - EQN953   VALOR DE FLETE $250.000 (9457TSS, AP 24911)
     - WHM896   ARABIA ALTAGRACIA (planilla FAMILIA 4672 ALPINA24950 + FEP 20899)
     - PEK019   ADICIONAL $90.000 (AP 24951)
     - LUM993   facs AP783077 AP783096 (AP 24952, 2 auxiliares)
     - SXE499   VALOR DE FLETE $350.000 (MARSELLA, AP 24959 + FEP 20892, 2 auxiliares)
     - WGZ876   VALOR DE FLETE $550.000 (7004 COMBIA, AP 24944, fac FEP1197864)
     - TNH494   fac AP783873 (AP 24954)
     - WTN748   fac AP783637 (AP 24960)
     - EQY944   fac AP784086 (AP 24957)
     - SPU120   fac AP784059 (AP 24935 + FEP 20873)
     - SQB119   FLEISCHMANN solo FEP 20903
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-22'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 22‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

  /* 01 – SYU652 – sin adicional (AP 24925) */
  ('2026-10-22','Jueves','ALPINA',
   'JOHAN ECHEVERRY',
   'SYU652','24925','9552 F','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,0,'-',
   5585308,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5585308) + 0,
   43,NULL,'TYM'),

  /* 02 – WFR160 – ADICIONAL AL FLETE $100.000 (AP 24939 24928 + FEP 20906 20905, 2 auxiliares) */
  ('2026-10-22','Jueves','ALPINA',
   'LEANDRO LOPEZ',
   'WFR160','24939 24928','9553 9555 F','MANIZALES VILLAMARIA','CARLOS JIMENEZ, JUAN ALEJANDRO FRANCO MARIN',2,
   2,100000,'ADICIONAL AL FLETE $100.000',
   5892283,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5892283) + 100000,
   56,'20906 20905','TYM'),

  /* 03 – EYX091 – sin adicional (AP 24929 + FEP 20904, 2 auxiliares) */
  ('2026-10-22','Jueves','ALPINA',
   'ANDRES GOMEZ',
   'EYX091','24929','9554 F','NEIRA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   8364464,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1), 8364464) + 0,
   60,'20904','TYM'),

  /* 04 – TRK507 – sin adicional (AP 24930 24938 + FEP 20907, 2 auxiliares) */
  ('2026-10-22','Jueves','ALPINA',
   'MIGUEL GONZALES',
   'TRK507','24930 24938','9556 9550 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE, MARLON MURILLO',2,
   2,0,'-',
   7565986,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7565986) + 0,
   45,'20907','TYM'),

  /* 05 – WEP384 – sin adicional (AP 24931 + FEP 20883, 2 auxiliares) */
  ('2026-10-22','Jueves','ALPINA',
   'YOFER LOPEZ',
   'WEP384','24931','9557 F','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   12990532,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1), 12990532) + 0,
   65,'20883','TYM'),

  /* 06 – SXE867 – sin adicional (AP 24933 + FEP 20890 20889, 2 auxiliares) */
  ('2026-10-22','Jueves','ALPINA',
   'HERIBERTO GARCIA',
   'SXE867','24933','9559 F','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
   2,0,'-',
   10706000,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RDA S JOSE BELALCAZAR' LIMIT 1), 10706000) + 0,
   58,'20890 20889','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ───────────────────────────────── */

  /* 07 – WFV015 – VALOR DE FLETE $900.000 (AP 24926, sin auxiliar) */
  ('2026-10-22','Jueves','ALPINA',
   'YONNI VALENCIA',
   'WFV015','24926','7008','CALARCA',NULL,0,
   0,0,'-',
   17845686,
   900000,
   3,NULL,'TYM'),

  /* 08 – TTL256 – sin adicional (AP 24916TSS 24927 24955 + FEP 20896, 2 auxiliares) */
  ('2026-10-22','Jueves','ALPINA',
   'ANDRES QUINTERO',
   'TTL256','24916TSS 24927 24955','9601 TSS 7009 F','ARMENIA','YEISON DAVID RENDON SOTO, SAMUEL ARIAS',2,
   2,0,'-',
   8280774,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 8280774) + 0,
   56,'20896','TYM'),

  /* 09 – TJX795 – sin adicional (AP 24956) */
  ('2026-10-22','Jueves','ALPINA',
   'ANDRES QUINTERO',
   'TJX795','24956','9602','ARMENIA','YERFREY FLOWER',1,
   1,0,'-',
   5425615,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 5425615) + 0,
   56,NULL,'TYM'),

  /* 10 – EQY944 – sin adicional (AP 24957, fac AP784086) */
  ('2026-10-22','Jueves','ALPINA',
   'GOBER CRISTANCHO',
   'EQY944','24957','9603 ANDY','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   5472671,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 5472671) + 0,
   55,'AP784086','TYM'),

  /* 11 – SXF257 – sin adicional (AP 24958 + FEP 20900) */
  ('2026-10-22','Jueves','ALPINA',
   'FABIO RUIZ',
   'SXF257','24958','9604 F','ALCALA ULLOA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   7443649,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1), 7443649) + 0,
   47,'20900','TYM'),

  /* 12 – WLS478 – sin adicional (AP 24934 + FEP 20902 20897, 2 auxiliares) */
  ('2026-10-22','Jueves','ALPINA',
   'HUMBERTO RINCON',
   'WLS478','24934','9605 F','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, JUAN RICO',2,
   2,0,'-',
   13862893,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1), 13862893) + 0,
   55,'20902 20897','TYM'),

  /* 13 – SPU120 – sin adicional (AP 24935 + FEP 20873, fac AP784059) */
  ('2026-10-22','Jueves','ALPINA',
   'OSWALDO',
   'SPU120','24935','9606 MERCA F','FILANDIA','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   8247002,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1), 8247002) + 0,
   35,'20873 AP784059','TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

  /* 14 – SMO183 – sin adicional (AP 24946) */
  ('2026-10-22','Jueves','ALPINA',
   'GABRIEL PEREZ',
   'SMO183','24946','9453','PEREIRA','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   4563375,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 4563375) + 0,
   39,NULL,'TYM'),

  /* 15 – VZD334 – EXTRA $60.000 (AP 24947 + FEP 20893) */
  ('2026-10-22','Jueves','ALPINA',
   'JULIAN CUELLAR',
   'VZD334','24947','9454 F','PEREIRA','CARLOS ANDRES PINEDA CANO',1,
   1,60000,'EXTRA $60.000',
   8155033,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 8155033) + 60000,
   61,'20893','TYM'),

  /* 16 – TMZ674 – sin adicional (AP 24948) */
  ('2026-10-22','Jueves','ALPINA',
   'RICARDO LOPEZ',
   'TMZ674','24948','9455','PEREIRA','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5460395,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 5460395) + 0,
   51,NULL,'TYM'),

  /* 17 – SPQ814 – sin adicional (AP 24949 24924 + FEP 20895) */
  ('2026-10-22','Jueves','ALPINA',
   'CARLOS VELASCO',
   'SPQ814','24949 24924','9456 7002 F','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6667671,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 6667671) + 0,
   37,'20895','TYM'),

  /* 18 – EQN953 – VALOR DE FLETE $250.000 (AP 24911, 9457TSS) */
  ('2026-10-22','Jueves','ALPINA',
   'ORLANDO VASQUEZ',
   'EQN953','24911','9457 TSS','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   8423583,
   250000,
   57,NULL,'TYM'),

  /* 19 – WHM896 – sin adicional (planilla FAMILIA 4672 ALPINA24950 + FEP 20899) */
  ('2026-10-22','Jueves','ALPINA',
   'ALEXANDER CUELLAR',
   'WHM896','FAMILIA 4672 ALPINA24950','9457 F','ARABIA ALTAGRACIA','JHON FREDY MORENO',1,
   1,0,'-',
   5671445,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARABIA ALTAGRACIA' LIMIT 1), 5671445) + 0,
   54,'20899','TYM'),

  /* 20 – PEK019 – ADICIONAL $90.000 (AP 24951) */
  ('2026-10-22','Jueves','ALPINA',
   'MIGUEL TABARES',
   'PEK019','24951','9458','PEREIRA','',0,
   0,90000,'ADICIONAL $90.000',
   5518944,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 5518944) + 90000,
   44,NULL,'TYM'),

  /* 21 – LUM993 – sin adicional (AP 24952, 2 auxiliares, facs AP783077 AP783096) */
  ('2026-10-22','Jueves','ALPINA',
   'PABLO RAMIREZ',
   'LUM993','24952','9459 TSS','PEREIRA','QUEBIN LOTERO, PABLO RAMIREZ',2,
   2,0,'-',
   6928174,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 6928174) + 0,
   48,'AP783077 AP783096','TYM'),

  /* 22 – WLC133 – sin adicional (AP 24953) */
  ('2026-10-22','Jueves','ALPINA',
   'GABRIEL PEREZ',
   'WLC133','24953','9460','PEREIRA','SANTIAGO HENAO MORALES',1,
   1,0,'-',
   6246786,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 6246786) + 0,
   45,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional (AP 24954, fac AP783873) */
  ('2026-10-22','Jueves','ALPINA',
   'ADALBERTO MEJIA',
   'TNH494','24954','9461 SUPERM','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   7721820,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 7721820) + 0,
   53,'AP783873','TYM'),

  /* 24 – SXE499 – VALOR DE FLETE $350.000 (AP 24959 + FEP 20892, 2 auxiliares) */
  ('2026-10-22','Jueves','ALPINA',
   'ANDRES',
   'SXE499','24959','7004 F','MARSELLA','BRAHIAN STIVEN VALENCIA IGLESIAS, CRISTIAN GIRALDO',2,
   2,0,'-',
   12363124,
   350000,
   56,'20892','TYM'),

  /* 25 – WGZ876 – VALOR DE FLETE $550.000 (AP 24944, 7004 COMBIA, fac FEP1197864) */
  ('2026-10-22','Jueves','ALPINA',
   'RICARDO PINEDA',
   'WGZ876','24944','7004 COMBIA','PEREIRA - DOSQUEBRADAS','YESID PATIÑO',1,
   1,0,'-',
   7530000,
   550000,
   1,'FEP1197864','TYM'),

  /* ── ZONA OCCIDENTE ───────────────────────────────────────── */

  /* 26 – WTN748 – sin adicional (AP 24960, fac AP783637) */
  ('2026-10-22','Jueves','ALPINA',
   'DIEGO RATIVA',
   'WTN748','24960','7005 MERCAP','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5525523,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1), 5525523) + 0,
   36,'AP783637','TYM'),

  /* 27 – ERK303 – sin adicional (AP 24936 + FEP 20894 20891, 2 auxiliares) */
  ('2026-10-22','Jueves','ALPINA',
   'JORGE ALARCON',
   'ERK303','24936','7006 F','APIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   10709743,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA' LIMIT 1), 10709743) + 0,
   47,'20894 20891','TYM'),

  /* 28 – JVM223 – sin adicional (AP 24937 24923 + FEP 20898, 2 auxiliares) */
  ('2026-10-22','Jueves','ALPINA',
   'WILMAR CARDONA',
   'JVM223','24937 24923','7007 9451 F','VITERBO','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   12424328,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1), 12424328) + 0,
   70,'20898','TYM'),

  /* ── FLEISCHMANN ──────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional (FEP 20903) */
  ('2026-10-22','Jueves','FLEISCHMANN',
   'CARLOS CASTAÑO',
   'SQB119','20903','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   4543996,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 4543996) + 0,
   47,NULL,'TYM');

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
WHERE fecha = '2026-10-22'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
