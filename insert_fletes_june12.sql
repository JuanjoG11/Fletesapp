/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 12 JUNIO 2026
   Generado: 2026-06-13
   ✅ Nombres de población corregidos según tabla precios_fletes
   ==========================================================

   Mapeo de poblaciones:
     MANIZALES / VILLAMARIA    → MANIZALES VILLAMARIA
     KM41 IRRA FELISA          → SUPIA
     PACORA SALAMINA           → PACORA SALAMINA
     SUPIA RIOSUCIO            → RIOSUCIO-SUPIA SUPERMERCADO
     CHINCHINA                 → CHINCHINA
     ARMENIA                   → ARMENIA
     CALARCA                   → CALARCA
     MONTENEGRO P/TAPAO        → MONTENEGRO PTAPAO
     TEBAIDA                   → TEBAIDA
     CIRCASIA                  → CIRCASIA
     PEREIRA                   → PEREIRA - DOSQUEBRADAS
     SANTA ROSA                → SANTA ROSA
     CARTAGO                   → CARTAGO 2T
     CARTAGO N                 → CARTAGO 2T
     VIRGINIA                  → APIA VIRGINIA
     BELEN MISTRATO            → BELEN DE UMBRIA
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-12'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 12‑Jun‑2026
   -------------------------------------------------
   - T PEDIDOS  = suma de pedidos (columna de T PEDIDOS en la planilla)
   - T VALOR    = suma de valor_ruta + valor adicional de ambas planillas
   - valor_ruta = T VALOR de la programación (total combinado)
   - precio     = precio base de tabla + adicional negociación
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – SYU652 – con factura adicional FEP+AP */
  ('2026-06-12','Viernes','ALPINA','JOHAN ECHEVERRY','SYU652','21079','9552','MANIZALES VILLAMARIA','EDWAR ZAPATA',1,
   1,0,'-',
   5207994,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'FEP1186988 AP657582','TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','CAMILO CASTAÑO','KOL802','21065 21080','9553 9550','MANIZALES VILLAMARIA','LUIS CADAVID',1,
   1,0,'-',
   6731930,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 03 – WFV015 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','YONNI VALENCIA','WFV015','21011 21081','9554 7000','MANIZALES VILLAMARIA','CAMILO MUÑOZ, CRISTIAN OSPINA',2,
   2,0,'-',
   9876619,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   50,'19184','TYM'),

  /* 04 – EYY183 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','JOHN ARENAS','EYY183','21082','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO',1,
   1,0,'-',
   7195722,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   64,'19185','TYM'),

  /* 05 – SLI587 – con facturas adicionales FEP+AP */
  ('2026-06-12','Viernes','ALPINA','MIGUEL GONZALES','SLI587','21083','9556','MANIZALES VILLAMARIA','ADRIAN MARTINEZ',1,
   1,0,'-',
   10706049,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   52,'FEP1186992-996 AP657486 19186','TYM'),

  /* 06 – WGZ876 – EXTRA $60.000 */
  ('2026-06-12','Viernes','ALPINA','RICARDO PINEDA','WGZ876','21084','9557','SUPIA','JUAN DELGADO',1,
   1,60000,'WGZ876 EXTRA $60.000',
   7117609,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 60000,
   29,'19149','TYM'),

  /* 07 – EYX091 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','CARLOS GOMEZ','EYX091','21037 21068','9558','PACORA SALAMINA','VICTOR PULGARIN, JUAN COCOMA',2,
   2,0,'-',
   8955532,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1) + 0,
   57,'19170','TYM'),

  /* 08 – TRL186 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','RUBEN','TRL186','21009 21054','9560','RIOSUCIO-SUPIA SUPERMERCADO','MATEO VILLALBA',1,
   1,0,'-',
   14852007,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 0,
   11,NULL,'TYM'),

  /* 09 – EQN953 – VALOR DE FLETE $500.000 */
  ('2026-06-12','Viernes','ALPINA','ORLANDO VASQUEZ','EQN953','21057','7002','CHINCHINA','MILTON OSORIO, CAMILO SUAREZ',2,
   2,500000,'EQN953 VALOR DE FLETE $500.000',
   32529675,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 500000,
   7,NULL,'TYM'),

  /* 10 – SMH182 – EXTRA $60.000 */
  ('2026-06-12','Viernes','ALPINA','JUAN DAVID','SMH182','21085','9559','CHINCHINA','BRANDON BAEZ',1,
   1,60000,'SMH182 EXTRA $60.000',
   10741398,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 60000,
   82,'19187','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 11 – SPU120 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','OSWALDO','SPU120','21050 21086','9601 7009','ARMENIA','YEISON RENDON, JOHAN MUÑOZ',2,
   2,0,'-',
   8961432,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   63,NULL,'TYM'),

  /* 12 – VZD334 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','JULIAN CUELLAR','VZD334','21040','9602','ARMENIA','SEBASTIAN VILLADA',1,
   1,0,'-',
   6835885,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   59,'AP657491','TYM'),

  /* 13 – EQY944 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','GOBER CRISTANCHO','EQY944','21087','9603','CALARCA','ALEXANDER COSTAIN',1,
   1,0,'-',
   3935939,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 14 – SXF257 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','FABIO RUIZ','SXF257','21088','9604','MONTENEGRO PTAPAO','CAMILO CONTRERAS',1,
   1,0,'-',
   5900496,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   43,'19173','TYM'),

  /* 15 – WLS478 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','HUMBERTO RINCON','WLS478','21059 21060','9605 7010','TEBAIDA','CRISTIAN CAICEDO, JUAN CONTRERAS',2,
   2,0,'-',
   8545893,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 16 – TTL256 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','ANDRES QUINTERO','TTL256','21061','9606','CIRCASIA','CRISTIAN CAMACHO',1,
   1,0,'-',
   5930118,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   57,'AP657587 19189','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 17 – SMO183 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','GABRIEL PEREZ','SMO183','21070','9453','PEREIRA - DOSQUEBRADAS','JUAN QUINTERO',1,
   1,0,'-',
   4881418,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 18 – XVI496 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','PABLO RAMIIREZ','XVI496','21071','9454','PEREIRA - DOSQUEBRADAS','ANDRES PINEDA',1,
   1,0,'-',
   8120948,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 19 – TUL630 – EXTRA $60.000 */
  ('2026-06-12','Viernes','ALPINA','JUAN DAVID','TUL630','21072','9455','PEREIRA - DOSQUEBRADAS','ANDRES RIOS',1,
   1,60000,'TUL630 EXTRA $60.000',
   6297853,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   53,NULL,'TYM'),

  /* 20 – SPQ814 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','CARLOS VELASCO','SPQ814','21073','9456','SANTA ROSA','GERMAN GALVEZ',1,
   1,0,'-',
   5061083,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 21 – WHM317 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','HUMBERTO PARRA','WHM317','21074','9457','PEREIRA - DOSQUEBRADAS','ESTEBAN GALLEGO',1,
   1,0,'-',
   8054315,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   63,NULL,'TYM'),

  /* 22 – PEK019 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','MIGUEL TABARES','PEK019','21075','9458','PEREIRA - DOSQUEBRADAS','JHON GIRALDO',1,
   1,0,'-',
   6640389,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 23 – WHM896 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','ALEXANDER CUELLAR','WHM896','21076','9459','PEREIRA - DOSQUEBRADAS','CAMILO PEÑA',1,
   1,0,'-',
   8214898,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* 24 – WLC133 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','JULIAN','WLC133','21077','9460','PEREIRA - DOSQUEBRADAS','EDWIN GOMEZ, SANTIAGO HENAO',2,
   2,0,'-',
   13649215,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   69,NULL,'TYM'),

  /* 25 – WPP948 – EXTRA $60.000 */
  ('2026-06-12','Viernes','ALPINA','SEBASTIAN OROZCO','WPP948','21078','9461','CARTAGO 2T','DIORLAN FLOREZ',1,
   1,60000,'WPP948 EXTRA $60.000',
   6116056,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 60000,
   52,NULL,'TYM'),

  /* 26 – WTN748 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','DIEGO RATIVA','WTN748','21089','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN VALENCIA',1,
   1,0,'-',
   5891760,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 27 – SNL038 – VALOR DE FLETE $900.000 */
  ('2026-06-12','Viernes','ALPINA','MIGUEL','SNL038','','9450','CARTAGO 2T','MIGUEL',1,
   1,900000,'SNL038 VALOR DE FLETE $900.000',
   27411000,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 900000,
   1,'AP657346 AP658879','TYM'),

  /* 28 – EST067 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','JORGE RIVILLAS','EST067','21090','7005','CARTAGO 2T','CESAR CASTILLO',1,
   1,0,'-',
   5130676,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 29 – ERK303 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','JORGE ALARCON','ERK303','21062','7006','APIA VIRGINIA','ROBINSON TORRES',1,
   1,0,'-',
   13049994,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 0,
   68,'AP657477 AP658878-889 19190','TYM'),

  /* 30 – JVM223 – sin adicional */
  ('2026-06-12','Viernes','ALPINA','WILMAR CARDONA','JVM223','21053 21063','7007 9451','BELEN DE UMBRIA','OSCAR RESTREPO, JOHN MORENO',2,
   2,0,'-',
   14651832,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   61,'19191','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 31 – SQB119 – sin adicional */
  ('2026-06-12','Viernes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19181 19192','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   5808053,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   57,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida (opcional)
   ------------------------------------------------- */
SELECT fecha,
       placa,
       zona,
       poblacion,
       precio                      AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos,
       facturas_adicionales,
       proveedor
FROM fletes
WHERE fecha = '2026-06-12'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
