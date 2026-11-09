/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: SÁBADO 31 OCTUBRE 2026
   Generado: 2026-10-31

   Notas:
     - SYU652   ADICIONAL AL FLETE $120.000 (AP 25209 + FEP 21022, fac FEP1198673)
     - WFR160   ADICIONAL AL FLETE $100.000 (AP 25222 25210 + FEP 21017 21026, 2 auxiliares)
     - EYX091   ADICIONAL AL FLETE $100.000 (AP 25221 25211 + FEP 21023, fac FEP1198744, 2 auxiliares, conductor ANDRES GOMEZ)
     - WEP384   ADICIONAL AL FLETE $200.000 (AP 25223 25214 + FEP 21006 20988, 2 auxiliares)
     - WFV015   ADICIONAL $120.000 — pago de extras pendientes no puestos esta quincena (viernes 23) (AP 25233, fac AP793077)
     - WHM896   VALOR DE FLETE $400.000 (AP 25218, CAIMO BARCELONA)
     - SMH182   VALOR DE FLETE $560.000 (AP 25108, CARTAGO 2T)
     - WTN748   VALOR DE FLETE $480.000 (AP 25238, EL AGUILA VILLA NUEVA)
     - ERK303   ADICIONAL AL FLETE $100.000 (AP 25219 + FEP 21019, 2 auxiliares)
     - TRK507   fac AP793073 AP793384 (AP 25213 + FEP 21025)
     - SXE867   fac AP793074 AP793383 (AP 25216)
     - SXF257   fac AP790619 AP790620 (AP 25236 + FEP 21018, 2 auxiliares)
     - EQY944   fac AP793076 (AP 25235, 2 auxiliares)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-31'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 31‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

  /* 01 – SYU652 – ADICIONAL AL FLETE $120.000 (AP 25209 + FEP 21022, fac FEP1198673) */
  ('2026-10-31','Sábado','ALPINA',
   'JOHAN ECHEVERRY',
   'SYU652','25209','9552 F','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,120000,'ADICIONAL AL FLETE $120.000',
   7241332,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7241332) + 120000,
   52,'21022 FEP1198673','TYM'),

  /* 02 – WFR160 – ADICIONAL AL FLETE $100.000 (AP 25222 25210 + FEP 21017 21026, 2 auxiliares) */
  ('2026-10-31','Sábado','ALPINA',
   'LEANDRO LOPEZ',
   'WFR160','25222 25210','9553 7001 F','MANIZALES VILLAMARIA','CARLOS JIMENEZ, PABLO RAMIREZ',2,
   2,100000,'ADICIONAL AL FLETE $100.000',
   13904086,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 13904086) + 100000,
   65,'21017 21026','TYM'),

  /* 03 – EYX091 – ADICIONAL AL FLETE $100.000 (AP 25221 25211 + FEP 21023, fac FEP1198744, 2 auxiliares) */
  ('2026-10-31','Sábado','ALPINA',
   'ANDRES GOMEZ',
   'EYX091','25221 25211','9554 7000 F','MANIZALES VILLAMARIA','JHONNY LOPEZ, ANDRES GOMEZ',2,
   2,100000,'ADICIONAL AL FLETE $100.000',
   12088381,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 12088381) + 100000,
   57,'21023 FEP1198744','TYM'),

  /* 04 – SPU120 – sin adicional (AP 25212 + FEP 21029, fac FEP1198748 FEP1198752 FEP1198751 FEP1198754) */
  ('2026-10-31','Sábado','ALPINA',
   'OSWALDO IBARRA',
   'SPU120','25212','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   8386210,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 8386210) + 0,
   55,'21029 FEP1198748 FEP1198752 FEP1198751 FEP1198754','TYM'),

  /* 05 – TRK507 – sin adicional (AP 25213 + FEP 21025, fac AP793073 AP793384) */
  ('2026-10-31','Sábado','ALPINA',
   'MIGUEL GONZALES',
   'TRK507','25213','9556 RECREACION F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   9146107,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 9146107) + 0,
   46,'21025 AP793073 AP793384','TYM'),

  /* 06 – WEP384 – ADICIONAL AL FLETE $200.000 (AP 25223 25214 + FEP 21006 20988, 2 auxiliares) */
  ('2026-10-31','Sábado','ALPINA',
   'YOFER LOPEZ',
   'WEP384','25223 25214','9557 9559 F','QUINCHIA','JUAN MANUEL DELGADO NARVAEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,200000,'ADICIONAL AL FLETE $200.000',
   11980707,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUINCHIA' LIMIT 1), 11980707) + 200000,
   50,'21006 20988','TYM'),

  /* 07 – SXE867 – sin adicional (AP 25216, fac AP793074 AP793383, 2 auxiliares) */
  ('2026-10-31','Sábado','ALPINA',
   'HERIBERTO GARCIA',
   'SXE867','25216','9559 GAMERO','CHINCHINA','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
   2,0,'-',
   7394954,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1), 7394954) + 0,
   85,'AP793074 AP793383','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ───────────────────────────────── */

  /* 08 – WFV015 – ADICIONAL $120.000 — extras pendientes no puestos esta quincena (viernes 23) (AP 25233, fac AP793077) */
  ('2026-10-31','Sábado','ALPINA',
   'YONNI VALENCIA',
   'WFV015','25233','9601 PATRIA','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,120000,'ADICIONAL $120.000 — PAGO DE EXTRAS PENDIENTES NO PUESTOS ESTA QUINCENA (VIERNES 23)',
   6647849,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 6647849) + 120000,
   58,'AP793077','TYM'),

  /* 09 – TJX795 – sin adicional (AP 25207, 2 auxiliares) */
  ('2026-10-31','Sábado','ALPINA',
   'ANDRES QUINTERO',
   'TJX795','25207','9602 F','ARMENIA','YERFREY FLOWER, SAMUEL ARIAS',2,
   2,0,'-',
   7847896,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 7847896) + 0,
   62,NULL,'TYM'),

  /* 10 – EQY944 – sin adicional (AP 25235, fac AP793076, 2 auxiliares) */
  ('2026-10-31','Sábado','ALPINA',
   'GOBER CRISTANCHO',
   'EQY944','25235','9603 HOREB','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, JHON FREDY MORENO',2,
   2,0,'-',
   7986568,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 7986568) + 0,
   57,'AP793076','TYM'),

  /* 11 – SXF257 – sin adicional (AP 25236 + FEP 21018, fac AP790619 AP790620, 2 auxiliares) */
  ('2026-10-31','Sábado','ALPINA',
   'FABIO RUIZ',
   'SXF257','25236','9604 CALARCA F','QUIMBAYA','JOSE ALEXANDER CONSTAIN PERLAZA, EDWAR GIL',2,
   2,0,'-',
   9510312,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1), 9510312) + 0,
   48,'21018 AP790619 AP790620','TYM'),

  /* 12 – WLS478 – sin adicional (AP 25217) */
  ('2026-10-31','Sábado','ALPINA',
   'HUMBERTO RINCON',
   'WLS478','25217','9605','GENOVA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   4617079,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GENOVA' LIMIT 1), 4617079) + 0,
   32,NULL,'TYM'),

  /* 13 – WHM896 – VALOR DE FLETE $400.000 (AP 25218, CAIMO BARCELONA) */
  ('2026-10-31','Sábado','ALPINA',
   'ALEXANDER CUELLAR',
   'WHM896','25218','9606','CAIMO BARCELONA','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   5438690,
   400000,
   47,NULL,'TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

  /* 14 – SMO183 – sin adicional (AP 25224) */
  ('2026-10-31','Sábado','ALPINA',
   'GABRIEL PEREZ',
   'SMO183','25224','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   8270238,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8270238) + 0,
   57,NULL,'TYM'),

  /* 15 – VZD334 – sin adicional (AP 25225) */
  ('2026-10-31','Sábado','ALPINA',
   'JULIAN CUELLAR',
   'VZD334','25225','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7853460,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7853460) + 0,
   45,NULL,'TYM'),

  /* 16 – TMZ674 – sin adicional (AP 25226) */
  ('2026-10-31','Sábado','ALPINA',
   'RICARDO LOPEZ',
   'TMZ674','25226','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   4443158,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 4443158) + 0,
   46,NULL,'TYM'),

  /* 17 – SPQ814 – sin adicional (AP 25227) */
  ('2026-10-31','Sábado','ALPINA',
   'CARLOS VELASCO',
   'SPQ814','25227','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6165039,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 6165039) + 0,
   56,NULL,'TYM'),

  /* 18 – WHN317 – sin adicional (AP 25228) */
  ('2026-10-31','Sábado','ALPINA',
   'HUMBERTO PARRA',
   'WHN317','25228','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   6237825,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6237825) + 0,
   54,NULL,'TYM'),

  /* 19 – PEK019 – sin adicional (AP 25229) */
  ('2026-10-31','Sábado','ALPINA',
   'MIGUEL TABARES',
   'PEK019','25229','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,0,'-',
   4488159,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 4488159) + 0,
   47,NULL,'TYM'),

  /* 20 – LUM993 – sin adicional (AP 25230, 2 auxiliares) */
  ('2026-10-31','Sábado','ALPINA',
   'ANDRES',
   'LUM993','25230','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO, JUAN RICO',2,
   2,0,'-',
   6740753,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6740753) + 0,
   59,NULL,'TYM'),

  /* 21 – TTL256 – sin adicional (AP 25231, 2 auxiliares) */
  ('2026-10-31','Sábado','ALPINA',
   'ANDRES QUINTERO',
   'TTL256','25231','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, MARLON MURILLO',2,
   2,0,'-',
   6340507,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6340507) + 0,
   58,NULL,'TYM'),

  /* 22 – TNH494 – sin adicional (AP 25232) */
  ('2026-10-31','Sábado','ALPINA',
   'ADALBERTO MEJIA',
   'TNH494','25232','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   5792004,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 5792004) + 0,
   44,NULL,'TYM'),

  /* 23 – SXE499 – sin adicional (AP 25237, 2 auxiliares) */
  ('2026-10-31','Sábado','ALPINA',
   'HECTOR MARIN',
   'SXE499','25237','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, CRISTIAN GIRALDO',2,
   2,0,'-',
   8698314,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8698314) + 0,
   64,NULL,'TYM'),

  /* ── ZONA OCCIDENTE ───────────────────────────────────────── */

  /* 24 – SMH182 – VALOR DE FLETE $560.000 (AP 25108, CARTAGO 2T) */
  ('2026-10-31','Sábado','ALPINA',
   'ANDRES QUINTERO',
   'SMH182','25108','9450 N','CARTAGO 2T','-',0,
   0,0,'-',
   12872800,
   560000,
   1,NULL,'TYM'),

  /* 25 – WTN748 – VALOR DE FLETE $480.000 (AP 25238, EL AGUILA VILLA NUEVA) */
  ('2026-10-31','Sábado','ALPINA',
   'DIEGO RATIVA',
   'WTN748','25238','7005','EL AGUILA VILLA NUEVA','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   9551004,
   480000,
   31,NULL,'TYM'),

  /* 26 – ERK303 – ADICIONAL AL FLETE $100.000 (AP 25219 + FEP 21019, 2 auxiliares) */
  ('2026-10-31','Sábado','ALPINA',
   'JORGE ALARCON',
   'ERK303','25219','7006 F','SANTA CECILIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,100000,'ADICIONAL AL FLETE $100.000',
   12929016,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA CECILIA' LIMIT 1), 12929016) + 100000,
   48,'21019','TYM'),

  /* 27 – JVM223 – sin adicional (AP 25220 + FEP 21020, 2 auxiliares) */
  ('2026-10-31','Sábado','ALPINA',
   'WILMAR CARDONA',
   'JVM223','25220','7007 F','GUATICA ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   9507904,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GUATICA ANSERMA' LIMIT 1), 9507904) + 0,
   61,'21020','TYM'),

  /* ── FLEISCHMANN ──────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional (FEP 21028, FLEISCHMANN S/ROSA-D/BRADAS) */
  ('2026-10-31','Sábado','FLEISCHMANN',
   'CARLOS CASTAÑO',
   'SQB119','21028','FLEISCHMANN','FLEISCHMANN S/ROSA-D/BRADAS','DIEGO FRANCO',1,
   1,0,'-',
   6245283,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='FLEISCHMANN S/ROSA-D/BRADAS' LIMIT 1), 6245283) + 0,
   57,NULL,'TYM');

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
WHERE fecha = '2026-10-31'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
