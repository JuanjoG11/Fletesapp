/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: SÁBADO 19 SEPTIEMBRE 2026
   Generado: 2026-09-19
   Notas:
     - WFR160  ADICIONAL AL FLETE $50.000 ENTREGA DE TSS
     - WFV015  ADICIONAL AL FLETE $100.000
     - BCS450  ADICIONAL $70.000 POR NEGOCIACION A ULTIMA HORA
     - WEP384  EXTRAS PENDIENTES $180.000
     - EQN953  VALOR DE FLETE $440.000
     - ZMN804  ADICIONAL AL FLETE $66.000 POR NEGOCIACION A ULTIMA HORA
     - WLC133  ADICIONAL AL FLETE $26.000
     - JUAN RICO           → auxiliar de SYU652
     - ADRIAN FELIPE MARTINEZ ORTEGON → auxiliar de SYU652
     - ANDRES MATEO VILLALBA DIAZ → auxiliar de WFQ635
     - SAMUEL ARIAS        → auxiliar de WEP384
     - DUVIER GALVIZ       → auxiliar de BCS450
     - CRISTIAN GIRALDO    → auxiliar de EQY944
     - APOYO VENDEDOR      → auxiliar de EQN953
     - ELKIN GARCIA OCAMPO → auxiliar de ERK303
     - MANUEL RAMIREZ      → auxiliar de JVM223
     - ZMN804 FAMILIA → placa ZMN804
     - SQB119 FLEISCHMANN S/ROSA-D/BRADAS → precio tabla SANTA ROSA
   ========================================================== */

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
    'WGZ876','EYX091','WFR160','SYU652','SPU120','SLI587','WFQ635','WEP384',
    'WFV015','ETM037','BCS450','EQY944','SXF257','WLS478','EQN953',
    'SMO183','VZD334','SPQ814','WHM896','PEK019','LUM993','WLC133','TNH494','MAT480',
    'WTN748','ERK303','JVM223',
    'SQB119'
  ];
BEGIN
  -- Validar placas TYM
  FOREACH v_placa IN ARRAY v_placas_tym LOOP
    IF NOT EXISTS (
      SELECT 1 FROM vehiculos WHERE placa = v_placa AND razon_social = 'TYM'
    ) THEN
      v_missing := COALESCE(v_missing || ', ', '') || v_placa;
    END IF;
  END LOOP;

  IF v_missing IS NOT NULL THEN
    RAISE EXCEPTION
      '🚫 Placas NO registradas en vehiculos (TYM): [%] — registralas antes de continuar.',
      v_missing;
  END IF;

  -- Validar ZMN804 en TAT (placa TAT operando con ALPINA este día)
  IF NOT EXISTS (
    SELECT 1 FROM vehiculos WHERE placa = 'ZMN804' AND razon_social = 'TAT'
  ) THEN
    RAISE EXCEPTION '🚫 Placa ZMN804 NO registrada en vehiculos (TAT) — registrala antes de continuar.';
  END IF;

  RAISE NOTICE '✅ Todas las placas están registradas. Continuando...';
END;
$$;

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-09-19'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 19‑Sep‑2026
   contratista = conductor registrado en vehiculos (TYM)
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ─────────────────────────────── */

  /* 01 – WGZ876 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','23917 23956 23971 23972 23973','9550 7000 7001 E7000','MANIZALES VILLAMARIA',NULL,0,
   1,0,'-',
   9722905,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   5,NULL,'TYM'),

  /* 02 – EYX091 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','23977 20494','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   6177492,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   51,'FEP1195153-150-157 FEP1195149-146-156-147-160-145','TYM'),

  /* 03 – WFR160 – ADICIONAL AL FLETE $50.000 ENTREGA DE TSS */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','23948TSS 23978 20488','9553','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,50000,'ADICIONAL AL FLETE $50.000 ENTREGA DE TSS',
   8717178,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 50000,
   66,'FEP1195105 FEP1195151','TYM'),

  /* 04 – SYU652 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','23979 20489','9554','MANIZALES VILLAMARIA','JUAN RICO, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   1,0,'-',
   8338049,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   57,'FEP1195222','TYM'),

  /* 05 – SPU120 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','23980','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   7928286,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   57,'FEP1195227 FEP1195220-223-228','TYM'),

  /* 06 – SLI587 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SLI587' AND razon_social='TYM'),
   'SLI587','23961 20491','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   10091172,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 07 – WFQ635 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFQ635' AND razon_social='TYM'),
   'WFQ635','23962 23983 20472 20492','9557 9559','QUINCHIA','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   1,0,'-',
   11999743,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUINCHIA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 08 – WEP384 – EXTRAS PENDIENTES $180.000 */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','23964 23955','9559 E7000 GAMERO','CHINCHINA','BRANDON STEVEN GIL BAEZ, SAMUEL ARIAS',2,
   1,180000,'EXTRAS PENDIENTES $180.000',
   7223652,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 180000,
   82,'AP751570 AP751628','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ──────────────────────────────────── */

  /* 09 – WFV015 – ADICIONAL AL FLETE $100.000 */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFV015' AND razon_social='TYM'),
   'WFV015','23958 23959 23960','7008 7009 7010','ARMENIA',NULL,0,
   1,100000,'ADICIONAL AL FLETE $100.000',
   7125299,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 100000,
   4,NULL,'TYM'),

  /* 10 – ETM037 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ETM037' AND razon_social='TYM'),
   'ETM037','23993','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   5620311,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 11 – BCS450 – ADICIONAL $70.000 POR NEGOCIACION A ULTIMA HORA */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='BCS450' AND razon_social='TYM'),
   'BCS450','23965','9602','ARMENIA','CESAR AUGUSTO CASTILLO LONDOÑO, DUVIER GALVIZ',2,
   1,70000,'ADICIONAL $70.000 POR NEGOCIACION A ULTIMA HORA YA QUE EL CARRO DE ESA RUTA SE VARO AL MOMENTO DE CARGAR',
   8341010,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 70000,
   63,NULL,'TYM'),

  /* 12 – EQY944 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','23966','9603','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, CRISTIAN GIRALDO',2,
   1,0,'-',
   7968129,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   53,'AP751426','TYM'),

  /* 13 – SXF257 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','23994 20482','9604','QUIMBAYA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   4026811,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 0,
   39,NULL,'TYM'),

  /* 14 – WLS478 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','23967','9605','GENOVA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   5062404,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GENOVA' LIMIT 1) + 0,
   33,NULL,'TYM'),

  /* 15 – EQN953 – VALOR DE FLETE $440.000 */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQN953' AND razon_social='TYM'),
   'EQN953','23968','9606','CAIMO BARCELONA','JHON WILSON GIRALDO CARVAJAL, APOYO VENDEDOR',2,
   1,440000,'VALOR DE FLETE $440.000',
   6453464,
   440000,
   50,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ─────────────────────────────── */

  /* 16 – SMO183 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','23984','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6353772,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 17 – VZD334 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','23985','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   6423017,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 18 – ZMN804 – ADICIONAL AL FLETE $66.000 POR NEGOCIACION A ULTIMA HORA */
  /* Nota: placa TAT operando con ALPINA este día — conductor tomado de planilla */
  ('2026-09-19','Sábado','ALPINA',
   'ALEJANDRO VARGAS',
   'ZMN804','23986','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,66000,'ADICIONAL AL FLETE $66.000 POR NEGOCIACION A ULTIMA HORA',
   4175476,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 66000,
   51,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','23987','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   7658456,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   64,NULL,'TYM'),

  /* 20 – WHM896 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','23988','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7009169,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','23989','9458','PEREIRA - DOSQUEBRADAS','JHON FREDY MORENO',1,
   1,0,'-',
   5442741,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 22 – LUM993 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='LUM993' AND razon_social='TYM'),
   'LUM993','23990','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
   1,0,'-',
   7792126,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 23 – WLC133 – ADICIONAL AL FLETE $26.000 */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','23991','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES',1,
   1,26000,'ADICIONAL AL FLETE $26.000',
   6386646,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 26000,
   55,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','23992','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   5293435,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 25 – MAT480 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='MAT480' AND razon_social='TYM'),
   'MAT480','23995','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   7781047,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ──────────────────────────────── */

  /* 26 – WTN748 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','23974','7005','EL AGUILA VILLA NUEVA','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   7567312,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='EL AGUILA VILLA NUEVA' LIMIT 1) + 0,
   29,NULL,'TYM'),

  /* 27 – ERK303 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','23969 20483','7006','SANTA CECILIA','YERFREY FLOWER, ELKIN GARCIA OCAMPO',2,
   1,0,'-',
   12128193,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA CECILIA' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 28 – JVM223 – sin adicional */
  ('2026-09-19','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','23970 20485','7007','GUATICA ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   1,0,'-',
   11875079,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GUATICA ANSERMA' LIMIT 1) + 0,
   65,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional */
  /* Nota: programación dice "FLEISCHMANN S/ROSA-D/BRADAS" → precio tabla SANTA ROSA */
  ('2026-09-19','Sábado','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','20484','FLEISCHMANN','SANTA ROSA','DIEGO FRANCO',1,
   1,0,'-',
   5117173,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
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
WHERE fecha = '2026-09-19'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
