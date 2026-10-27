/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 23 OCTUBRE 2026
   Generado: 2026-10-23

   Notas:
     - TRK507   EXTRA $60.000 (AP 24986 + FEP 20921 20922, facs FEP1197969-977)
     - WGZ876   EXTRA $60.000 (AP 24932 24972 + FEP 20882 20908, PACORA SALAMINA)
     - SXE867   ADICIONAL AL FLETE $50.000 (AP 24973 + FEP 20914, CHINCHINA)
     - WFV015   ADICIONAL AL FLETE $280.000 ENTREGA LECHE EN CERRITOS
                (AP 24965, SUPIA RIOSUCIO SUPER → precio base $625.000 + $280.000)
     - TUL630   VALOR DE FLETE $900.000 (AP 24975, CHINCHINA)
     - VZD334   EXTRA $60.000 (AP 24988)
     - WLC133   ADICIONAL AL FLETE $26.000 (AP 24994, 2 auxiliares)
     - SYU652   facs AP784904 FEP1197979 (AP 24966 + FEP 20888)
     - EYX091   fac AP785168 (AP 24968 + FEP 20919, 2 auxiliares)
     - BCS450   fac AP784405 (AP 24993, 2 auxiliares)
     - TNH494   fac AP784894 (AP 24995)
     - ERK303   facs AP784893 AP784895 AP784896 (AP 24980 + FEP 20912, 2 auxiliares)
     - SQB119   FLEISCHMANN ARMENIA (FEP 20915 20916)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-23'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 23‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

  /* 01 – SYU652 – sin adicional (AP 24966 + FEP 20888, facs AP784904 FEP1197979) */
  ('2026-10-23','Viernes','ALPINA',
   'JOHAN ECHEVERRY',
   'SYU652','24966','9552 UNOAC F','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,0,'-',
   14506671,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 14506671) + 0,
   44,'20888 AP784904 FEP1197979','TYM'),

  /* 02 – WFR160 – sin adicional (AP 24967 + FEP 20918) */
  ('2026-10-23','Viernes','ALPINA',
   'LEANDRO LOPEZ',
   'WFR160','24967','9553 F','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,0,'-',
   6899067,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6899067) + 0,
   51,'20918','TYM'),

  /* 03 – EYX091 – sin adicional (AP 24968 + FEP 20919, fac AP785168, 2 auxiliares) */
  ('2026-10-23','Viernes','ALPINA',
   'ANDRES GOMEZ',
   'EYX091','24968','9554 MANA F','MANIZALES VILLAMARIA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   10043323,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 10043323) + 0,
   53,'20919 AP785168','TYM'),

  /* 04 – SPU120 – sin adicional (AP 24969 + FEP 20920) */
  ('2026-10-23','Viernes','ALPINA',
   'OSWALDO IBARRA',
   'SPU120','24969','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   4966306,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 4966306) + 0,
   54,'20920','TYM'),

  /* 05 – TRK507 – EXTRA $60.000 (AP 24986 + FEP 20921 20922, facs FEP1197969-977) */
  ('2026-10-23','Viernes','ALPINA',
   'MIGUEL GONZALES',
   'TRK507','24986','9556 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,60000,'EXTRA $60.000',
   5746960,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5746960) + 60000,
   49,'20921 20922 FEP1197969 FEP1197977','TYM'),

  /* 06 – WEP384 – sin adicional (AP 24971) */
  ('2026-10-23','Viernes','ALPINA',
   'YOFER LOPEZ',
   'WEP384','24971','9557','IRRA LA FELISA VER RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ',1,
   1,0,'-',
   9915875,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='IRRA LA FELISA VER RIOSUCIO' LIMIT 1), 9915875) + 0,
   29,NULL,'TYM'),

  /* 07 – WGZ876 – EXTRA $60.000 (AP 24932 24972 + FEP 20882 20908, 2 auxiliares) */
  ('2026-10-23','Viernes','ALPINA',
   'RICARDO PINEDA',
   'WGZ876','24932 24972','9558 F','PACORA SALAMINA','JOHN EDWAR ZAPATA ACEVEDO, YESID PATIÑO',2,
   2,60000,'EXTRA $60.000',
   13354341,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1), 13354341) + 60000,
   78,'20882 20908','TYM'),

  /* 08 – SXE867 – ADICIONAL AL FLETE $50.000 (AP 24973 + FEP 20914, 2 auxiliares) */
  ('2026-10-23','Viernes','ALPINA',
   'HERIBERTO GARCIA',
   'SXE867','24973','9559 F','CHINCHINA','BRANDON STEVEN GIL BAEZ, CRISTIAN GIRALDO',2,
   2,50000,'ADICIONAL AL FLETE $50.000',
   8385801,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1), 8385801) + 50000,
   81,'20914','TYM'),

  /* 09 – WFV015 – ADICIONAL AL FLETE $280.000 ENTREGA LECHE EN CERRITOS
                   (AP 24965, SUPIA RIOSUCIO SUPER, precio base $625.000) */
  ('2026-10-23','Viernes','ALPINA',
   'YONI VALENCIA',
   'WFV015','24965','9560 F','SUPIA RIOSUCIO SUPER','CESAR AUGUSTO CASTILLO LONDOÑO',1,
   1,280000,'ADICIONAL AL FLETE $280.000 ENTREGA LECHE EN CERRITOS',
   7411069,
   625000 + 280000,
   7,NULL,'TYM'),

  /* 10 – TUL630 – VALOR DE FLETE $900.000 (AP 24975, CHINCHINA) */
  ('2026-10-23','Viernes','ALPINA',
   'JUAN DAVID',
   'TUL630','24975','7002','CHINCHINA','JORGE RIVILLAS',1,
   1,0,'-',
   36417315,
   900000,
   7,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ───────────────────────────────── */

  /* 11 – TTL256 – sin adicional (AP 24996, 2 auxiliares) */
  ('2026-10-23','Viernes','ALPINA',
   'ANDRES QUINTERO',
   'TTL256','24996','9601','ARMENIA','YEISON DAVID RENDON SOTO, SAMUEL ARIAS',2,
   2,0,'-',
   6963461,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 6963461) + 0,
   60,NULL,'TYM'),

  /* 12 – TJX795 – sin adicional (AP 24976 24997) */
  ('2026-10-23','Viernes','ALPINA',
   'ANDRES QUINTERO',
   'TJX795','24976 24997','9602 7009','ARMENIA','YERFREY FLOWER',1,
   1,0,'-',
   7327321,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 7327321) + 0,
   47,NULL,'TYM'),

  /* 13 – EQY944 – sin adicional (AP 24983 + FEP 20911) */
  ('2026-10-23','Viernes','ALPINA',
   'GOBER CRISTANCHO',
   'EQY944','24983','9603 F','CALARCA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   3693185,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1), 3693185) + 0,
   53,'20911','TYM'),

  /* 14 – SXF257 – sin adicional (AP 24998 + FEP 20901) */
  ('2026-10-23','Viernes','ALPINA',
   'FABIO RUIZ',
   'SXF257','24998','9604 F','MONTENEGRO PTAPAO','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   7134389,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1), 7134389) + 0,
   50,'20901','TYM'),

  /* 15 – WLS478 – sin adicional (AP 24977 24978, 2 auxiliares) */
  ('2026-10-23','Viernes','ALPINA',
   'HUMBERTO RINCON',
   'WLS478','24977 24978','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, JUAN RICO',2,
   2,0,'-',
   10205351,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1), 10205351) + 0,
   40,NULL,'TYM'),

  /* 16 – WHM896 – sin adicional (AP 24982 24979 + FEP 20910) */
  ('2026-10-23','Viernes','ALPINA',
   'ALEXANDER CUELLAR',
   'WHM896','24982 24979','9606 9600 F','CIRCASIA','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   6686786,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1), 6686786) + 0,
   46,'20910','TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

  /* 17 – SMO183 – sin adicional (AP 24987) */
  ('2026-10-23','Viernes','ALPINA',
   'GABRIEL PEREZ',
   'SMO183','24987','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6752703,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6752703) + 0,
   62,NULL,'TYM'),

  /* 18 – VZD334 – EXTRA $60.000 (AP 24988) */
  ('2026-10-23','Viernes','ALPINA',
   'JULIAN CUELLAR',
   'VZD334','24988','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,60000,'EXTRA $60.000',
   9043125,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 9043125) + 60000,
   53,NULL,'TYM'),

  /* 19 – TMZ674 – sin adicional (AP 24989) */
  ('2026-10-23','Viernes','ALPINA',
   'RICARDO LOPEZ',
   'TMZ674','24989','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5691857,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5691857) + 0,
   56,NULL,'TYM'),

  /* 20 – SPQ814 – sin adicional (AP 24990) */
  ('2026-10-23','Viernes','ALPINA',
   'CARLOS VELASCO',
   'SPQ814','24990','9456 F','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5583414,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 5583414) + 0,
   55,NULL,'TYM'),

  /* 21 – LUM993 – sin adicional (AP 24991) */
  ('2026-10-23','Viernes','ALPINA',
   'ANDRES',
   'LUM993','24991','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   6736680,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6736680) + 0,
   57,NULL,'TYM'),

  /* 22 – PEK019 – sin adicional (AP 24992) */
  ('2026-10-23','Viernes','ALPINA',
   'MIGUEL TABARES',
   'PEK019','24992','9458','PEREIRA - DOSQUEBRADAS','JHON FREDY MORENO',1,
   1,0,'-',
   6499636,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6499636) + 0,
   55,NULL,'TYM'),

  /* 23 – BCS450 – sin adicional (AP 24993, 2 auxiliares, fac AP784405) */
  ('2026-10-23','Viernes','ALPINA',
   'CRISTIAN ZULUAGA',
   'BCS450','24993','9459 TSS','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO, PABLO RAMIREZ',2,
   2,0,'-',
   5727691,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5727691) + 0,
   47,'AP784405','TYM'),

  /* 24 – WLC133 – ADICIONAL AL FLETE $26.000 (AP 24994, 2 auxiliares) */
  ('2026-10-23','Viernes','ALPINA',
   'GABRIEL PEREZ',
   'WLC133','24994','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, MARLON MURILLO',2,
   2,26000,'ADICIONAL AL FLETE $26.000',
   12377972,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 12377972) + 26000,
   70,NULL,'TYM'),

  /* 25 – TNH494 – sin adicional (AP 24995, fac AP784894) */
  ('2026-10-23','Viernes','ALPINA',
   'ADALBERTO MEJIA',
   'TNH494','24995','9461 MERCAMOS','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   8025926,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 8025926) + 0,
   57,'AP784894','TYM'),

  /* 26 – SXE499 – sin adicional (AP 24999) */
  ('2026-10-23','Viernes','ALPINA',
   'ANDRES',
   'SXE499','24999','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   5899055,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5899055) + 0,
   53,NULL,'TYM'),

  /* ── ZONA OCCIDENTE ───────────────────────────────────────── */

  /* 27 – WTN748 – sin adicional (AP 25000) */
  ('2026-10-23','Viernes','ALPINA',
   'DIEGO RATIVA',
   'WTN748','25000','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5126161,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1), 5126161) + 0,
   37,NULL,'TYM'),

  /* 28 – ERK303 – sin adicional (AP 24980 + FEP 20912, facs AP784893 AP784895 AP784896, 2 auxiliares) */
  ('2026-10-23','Viernes','ALPINA',
   'JORGE ALARCON',
   'ERK303','24980','7006 F','LA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   10983933,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='LA VIRGINIA' LIMIT 1), 10983933) + 0,
   70,'20912 AP784893 AP784895 AP784896','TYM'),

  /* 29 – JVM223 – sin adicional (AP 24964 24981 + FEP 20913, 2 auxiliares) */
  ('2026-10-23','Viernes','ALPINA',
   'WILMAR CARDONA',
   'JVM223','24964 24981','7007 9451 F','MISTRATO','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   13129176,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MISTRATO' LIMIT 1), 13129176) + 0,
   65,'20913','TYM'),

  /* ── FLEISCHMANN ──────────────────────────────────────────── */

  /* 30 – SQB119 – sin adicional (FEP 20915 20916, ARMENIA) */
  ('2026-10-23','Viernes','FLEISCHMANN',
   'CARLOS CASTAÑO',
   'SQB119','20915 20916','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   5515004,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 5515004) + 0,
   49,NULL,'TYM');

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
WHERE fecha = '2026-10-23'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
