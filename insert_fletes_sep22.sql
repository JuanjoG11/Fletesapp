/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 22 SEPTIEMBRE 2026
   Generado: 2026-09-22
   Notas:
     - SLI587  ADICIONAL AL FLETE $200.000
     - EYX091  EXTRA $60.000
     - MAT480  VALOR DE FLETE $700.000 (ARMENIA SUPER)
     - TUL630  VALOR DE FLETE $650.000 (CALARCA)
     - SQB119  30.000 MIL EXTRAS
     - WLC133  ADICIONAL AL FLETE $26.000
     - WTN748  VALOR DE FLETE $580.000
     - ERK303  ADICIONAL AL FLETE $100.000 ENTREGA DE SUPER
     - WFR160  fac adicionales: FEP1195148-159-161-163 AP754151
     - SYU652  fac adicionales: AP754152
     - WEP384  fac adicionales: AP754154-155-156
     - WGZ876  fac adicionales: FEP1195121
     - WFQ635  fac adicionales: AP754159
     - SXF257  fac adicionales: AP754158
     - JOHN EDWAR ZAPATA ACEVEDO + MILTON GILMER OSORIO CALLE → auxiliares de SLI587
     - CARLOS JIMENEZ          → auxiliar de WFR160
     - DUVIER GALVIZ + ADRIAN FELIPE MARTINEZ ORTEGON → auxiliares de SYU652
     - JUAN ALEJANDRO FRANCO MARIN → auxiliar de SPU120
     - JUAN MANUEL DELGADO NARVAEZ + ANDRES MATEO VILLALBA DIAZ → auxiliares de WGZ876
     - BRANDON STEVEN GIL BAEZ + SAMUEL ARIAS → auxiliares de WEP384
     - JHONNY LOPEZ             → auxiliar de EYX091
     - JHON FREDY MORENO        → auxiliar de MAT480 (ARMENIA)
     - YEISON DAVID RENDON SOTO → auxiliar de WFQ635
     - YERFREY FLOWER + CRISTIAN GIRALDO → auxiliares de WFV015
     - JUAN JOSE CONTRERAS HERNANDEZ → auxiliar de EQY944
     - JOSE ALEXANDER CONSTAIN PERLAZA + AUX NUEVO → auxiliares de SXF257
     - CHRISTIAN DAVID CAICEDO MONTAÑO → auxiliar de WLS478
     - JHON WILSON GIRALDO CARVAJAL → auxiliar de WHM896
     - JUAN DAVID QUINTERO GRAJALES → auxiliar de SMO183
     - CARLOS ANDRES PINEDA CANO → auxiliar de VZD334
     - ANDRES FELIPE RIOS CAICEDO + AUX NUEVO → auxiliares de TMZ674
     - GERMAN GALVEZ CORTES     → auxiliar de SPQ814
     - JUAN ESTEBAN GALLEGO DIEZ → auxiliar de SQB119
     - SEBASTIAN MONTES         → auxiliar de PEK019
     - QUEBIN LOTERO + JORGE RIVILLAS → auxiliares de LUM993
     - SANTIAGO HENAO MORALES + JUAN RICO → auxiliares de WLC133
     - OSCAR MAURICIO RESTREPO MORENO → auxiliar de TNH494
     - BRAHIAN STIVEN VALENCIA IGLESIAS → auxiliar de MAT480 (PEREIRA)
     - ARBEY DE JESUS LARGO LARGO → auxiliar de WTN748
     - CESAR AUGUSTO CASTILLO LONDOÑO + ELKIN GARCIA OCAMPO → auxiliares de ERK303
     - LUIS CARLOS CADAVID RESTREPO + MANUEL RAMIREZ → auxiliares de JVM223
     - DIEGO FRANCO             → auxiliar de WEF511 (FLEISCHMANN)
   ========================================================== */

/* ==========================================================
   0️⃣-A  REGISTRAR WEF511 EN TYM (existe en TAT, se replica en TYM)
   ========================================================== */
INSERT INTO vehiculos (placa, conductor, contratista, modelo, activo, razon_social)
SELECT placa, conductor, contratista, modelo, true, 'TYM'
FROM vehiculos
WHERE placa = 'WEF511' AND razon_social = 'TAT'
ON CONFLICT (placa, razon_social) DO UPDATE SET
    conductor   = EXCLUDED.conductor,
    contratista = EXCLUDED.contratista,
    activo      = true;

/* ==========================================================
   0️⃣  VALIDACIÓN DE PLACAS
   Verifica que cada placa del día esté registrada en
   vehiculos (razon_social = 'TYM'). Si alguna falta, el bloque
   lanza un error descriptivo y ABORTA todo el script.
   ========================================================== */
DO $$
DECLARE
  v_missing TEXT;
  v_placa   TEXT;
  v_placas_tym TEXT[] := ARRAY[
    'SLI587','WFR160','SYU652','SPU120','WGZ876','WEP384','EYX091',
    'WFQ635','WFV015','EQY944','SXF257','WLS478','WHM896',
    'SMO183','VZD334','TMZ674','SPQ814','SQB119','PEK019','LUM993','WLC133','TNH494','MAT480',
    'WTN748','ERK303','JVM223',
    'WEF511',
    'TUL630'
  ];
BEGIN
  FOREACH v_placa IN ARRAY v_placas_tym LOOP
    IF NOT EXISTS (
      SELECT 1 FROM vehiculos WHERE placa = v_placa AND razon_social = 'TYM'
    ) THEN
      v_missing := COALESCE(v_missing || ', ', '') || v_placa;
    END IF;
  END LOOP;

  -- BCS450 opera como MERCASA (proveedor distinto, validación aparte)
  IF NOT EXISTS (
    SELECT 1 FROM vehiculos WHERE placa = 'BCS450' AND razon_social = 'TYM'
  ) THEN
    v_missing := COALESCE(v_missing || ', ', '') || 'BCS450';
  END IF;

  IF v_missing IS NOT NULL THEN
    RAISE EXCEPTION
      '🚫 Placas NO registradas en vehiculos (TYM): [%] — registralas antes de continuar.',
      v_missing;
  END IF;

  RAISE NOTICE '✅ Todas las placas están registradas. Continuando...';
END;
$$;

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-09-22'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 22‑Sep‑2026
   contratista = conductor registrado en vehiculos (TYM)
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ══════════════════════════════════════════════════════════════
     ZONA MANIZALES / VILLAMARIA
     ══════════════════════════════════════════════════════════════ */

  /* 01 – SLI587 – MIGUEL GONZALES – ADICIONAL AL FLETE $200.000 */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SLI587' AND razon_social='TYM'),
   'SLI587','24040 24019 20499 20510','9552 9556','MANIZALES VILLAMARIA',
   'JOHN EDWAR ZAPATA ACEVEDO, MILTON GILMER OSORIO CALLE',2,
   1,200000,'ADICIONAL AL FLETE $200.000',
   12833779,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 200000,
   81,NULL,'TYM'),

  /* 02 – WFR160 – LEANDRO LOPEZ – fac adicionales FEP+AP */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24041 20507 20511','9553 UNOAC','MANIZALES VILLAMARIA',
   'CARLOS JIMENEZ',1,
   1,0,'-',
   4656089,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   39,'FEP1195148-159-161-163 AP754151','TYM'),

  /* 03 – SYU652 – JOHAN ECHEVERRY – fac adicional AP */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24042 20508','9554 MANA','MANIZALES VILLAMARIA',
   'DUVIER GALVIZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   1,0,'-',
   9544774,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   57,'AP754152','TYM'),

  /* 04 – SPU120 – OSWALDO – sin adicional */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24030 24043 20509','9555 E7000','MANIZALES VILLAMARIA',
   'JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6993904,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* 05 – WGZ876 – RICARDO PINEDA – fac adicional FEP */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','23932TSS 24020 20506','9557','SUPIA',
   'JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   1,0,'-',
   10931666,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 0,
   53,'FEP1195121','TYM'),

  /* 06 – WEP384 – YOFER LOPEZ – fac adicionales AP */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24022 20505','9559 7002','CHINCHINA',
   'BRANDON STEVEN GIL BAEZ, SAMUEL ARIAS',2,
   1,0,'-',
   9038443,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   62,'AP754154-155-156','TYM'),

  /* 07 – EYX091 – ANDRES GOMEZ – EXTRA $60.000 */
  /* Nota: programación dice "SUPIA RIOSUCIO SUPER" → precio tabla RIOSUCIO-SUPIA SUPERMERCADO */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','24023','9560','RIOSUCIO-SUPIA SUPERMERCADO',
   'JHONNY LOPEZ',1,
   1,60000,'EXTRA $60.000',
   14116821,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 60000,
   9,NULL,'TYM'),

  /* ══════════════════════════════════════════════════════════════
     ZONA ARMENIA / QUINDÍO
     ══════════════════════════════════════════════════════════════ */

  /* 08 – MAT480 – ELKIN AGUIRRE – ARMENIA SUPER – VALOR DE FLETE $700.000 */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='MAT480' AND razon_social='TYM'),
   'MAT480','24005 24007','7009 19/PESPEJO','ARMENIA SUPER',
   'JHON FREDY MORENO',1,
   1,700000,'VALOR DE FLETE $700.000',
   20135380,
   700000,
   2,NULL,'TYM'),

  /* 09 – TUL630 – JUAN DAVID – CALARCA – VALOR DE FLETE $650.000 */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TUL630' AND razon_social='TYM'),
   'TUL630','24017 24003 24004','7008','CALARCA',
   NULL,0,
   1,650000,'VALOR DE FLETE $650.000',
   17686774,
   650000,
   3,NULL,'TYM'),

  /* 10 – WFQ635 – JHENCY LOPEZ – fac adicional AP */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFQ635' AND razon_social='TYM'),
   'WFQ635','24044','9601 EXITO16','ARMENIA',
   'YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   5954572,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   45,'AP754159','TYM'),

  /* 11 – WFV015 – YONI VALENCIA – sin adicional */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFV015' AND razon_social='TYM'),
   'WFV015','23965TSS 24045','9602','ARMENIA',
   'YERFREY FLOWER, CRISTIAN GIRALDO',2,
   1,0,'-',
   8756724,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   81,NULL,'TYM'),

  /* 12 – EQY944 – GOBER CRISTANCHO – sin adicional */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24046 20501','9603','CALARCA',
   'JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   7867944,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 13 – SXF257 – FABIO RUIZ – fac adicional AP */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24012 24047 20497','9604 7010','MONTENEGRO PTAPAO',
   'JOSE ALEXANDER CONSTAIN PERLAZA, AUX NUEVO',2,
   1,0,'-',
   10687096,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   54,'AP754158','TYM'),

  /* 14 – WLS478 – HUMBERTO RINCON – sin adicional */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24008 24024 20500','9605 7010','TEBAIDA',
   'CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   8915129,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 15 – WHM896 – ALEXANDER CUELLAR – sin adicional */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24025','9606','CIRCASIA',
   'JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   4385718,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   40,NULL,'TYM'),

  /* ══════════════════════════════════════════════════════════════
     ZONA PEREIRA / EJE CAFETERO
     ══════════════════════════════════════════════════════════════ */

  /* 16 – BCS450 – CRISTIAN ZULUAGA – MERCASA PEREIRA */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='BCS450' AND razon_social='TYM'),
   'BCS450','24028','MERCASA','PEREIRA',
   NULL,0,
   1,0,'-',
   6317504,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   2,NULL,'TYM'),

  /* 17 – SMO183 – GABRIEL PEREZ – sin adicional */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24031','9453','PEREIRA',
   'JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   7190377,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 18 – VZD334 – JULIAN CUELLAR – sin adicional */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24032','9454','PEREIRA',
   'CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   9144897,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 19 – TMZ674 – RICARDO LOPEZ – sin adicional */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TMZ674' AND razon_social='TYM'),
   'TMZ674','24033','9455','PEREIRA',
   'ANDRES FELIPE RIOS CAICEDO, AUX NUEVO',2,
   1,0,'-',
   8267666,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   68,NULL,'TYM'),

  /* 20 – SPQ814 – CARLOS VELASCO – sin adicional */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24034 20504','9456','SANTA ROSA',
   'GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6890088,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   67,NULL,'TYM'),

  /* 21 – SQB119 – CARLOS CASTAÑO – 30.000 MIL EXTRAS */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','24035','9457','PEREIRA - DOSQUEBRADAS',
   'JUAN ESTEBAN GALLEGO DIEZ',1,
   1,30000,'30.000 MIL EXTRAS',
   8302300,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 30000,
   55,NULL,'TYM'),

  /* 22 – PEK019 – MIGUEL TABARES – sin adicional */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24036','9458','PEREIRA',
   'SEBASTIAN MONTES',1,
   1,0,'-',
   7960552,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 23 – LUM993 – PABLO RAMIREZ – sin adicional */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='LUM993' AND razon_social='TYM'),
   'LUM993','24037','9459','PEREIRA',
   'QUEBIN LOTERO, JORGE RIVILLAS',2,
   1,0,'-',
   8309543,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   63,NULL,'TYM'),

  /* 24 – WLC133 – GABRIEL PEREZ – ADICIONAL AL FLETE $26.000 */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24038','9460','PEREIRA',
   'SANTIAGO HENAO MORALES, JUAN RICO',2,
   1,26000,'ADICIONAL AL FLETE $26.000',
   10711727,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 26000,
   58,NULL,'TYM'),

  /* 25 – TNH494 – ADALBERTO MEJIA – sin adicional */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','24039','9461','CARTAGO',
   'OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   6438797,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 26 – MAT480 – ELKIN AGUIRRE – PEREIRA/DOSQUEBRADAS (segunda ruta del día) */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='MAT480' AND razon_social='TYM'),
   'MAT480','24048','7004','PEREIRA - DOSQUEBRADAS',
   'BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   6229621,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* ══════════════════════════════════════════════════════════════
     ZONA OCCIDENTE / RISARALDA
     ══════════════════════════════════════════════════════════════ */

  /* 27 – WTN748 – DIEGO RATIVA – VALOR DE FLETE $580.000 */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','24049','7005','ARGELIA EL CAIRO',
   'ARBEY DE JESUS LARGO LARGO',1,
   1,580000,'VALOR DE FLETE $580.000',
   10289172,
   580000,
   30,NULL,'TYM'),

  /* 28 – ERK303 – JORGE ALARCON – ADICIONAL AL FLETE $100.000 ENTREGA DE SUPER */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','24013 24026 20498 20502','7006 9450','SANTUARIO',
   'CESAR AUGUSTO CASTILLO LONDOÑO, ELKIN GARCIA OCAMPO',2,
   1,100000,'ADICIONAL AL FLETE $100.000 ENTREGA DE SUPER',
   14108377,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1) + 100000,
   56,NULL,'TYM'),

  /* 29 – JVM223 – WILMAR CARDONA – sin adicional */
  ('2026-09-22','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24014 24027','7007 9451','BELEN DE UMBRIA',
   'LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   1,0,'-',
   9136615,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* ══════════════════════════════════════════════════════════════
     FLEISCHMANN
     ══════════════════════════════════════════════════════════════ */

  /* 30 – WEF511 – RICARDO FAMILIA – FLEISCHMANN ARMENIA */
  ('2026-09-22','Martes','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='WEF511' AND razon_social='TYM'),
   'WEF511','20503','FLEISCHMANN','ARMENIA',
   'DIEGO FRANCO',1,
   1,0,'-',
   3681525,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   36,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, contratista AS conductor_bd, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-09-22'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
