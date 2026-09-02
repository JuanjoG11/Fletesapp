/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 1 SEPTIEMBRE 2026
   Generado: 2026-09-01
   Notas:
     - WFV015  EXTRA $60.000
     - WGZ876  EXTRA $60.000
     - WEP384  EXTRA $120.000 (pasados)
     - WFQ635  ADICIONAL $150.000 NEGOCIACION
     - SXF257  ADICIONAL $50.000 POR PESO
     - MAT480  VALOR DE FLETE $550.000 (precio fijo)
     - EYX091  RIOSUCIO-SUPIA SUPERMERCADO (sin FEP)
     - JHONNY LOPEZ         → YHONY ALEXANDER LOPEZ LOPEZ
     - SAMUEL ARIAS         → SAMUEL ANDRES ARIAS ARCILA
     - DANIELA CASTIBLANCO  → DANIELA CASTIBLANCO RAMIREZ
     - VALENTINA GARCIA     → VALENTINA GARCIA GOMEZ
     - MANUEL RAMIREZ       → MANUEL ALEJANDRO RAMIREZ OVALLE
     - DIEGO FRANCO         → JUAN DIEGO FRANCO VERGARA
     - QUEBIN LOTERO: no está en lista oficial ALPINA
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-09-01'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 01‑Sep‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ─────────────────────────────── */

  /* 01 – SYU652 – sin adicional */
  ('2026-09-01','Martes','ALPINA','JOHAN ECHEVERRY','SYU652','23402 20245 20249','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   8220261,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   69,NULL,'TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-09-01','Martes','ALPINA','FREDY','KOL802','23369 23403 20246','9553 7001 FLORIDA/DELCAMPO','MANIZALES VILLAMARIA','CARLOS JIMENEZ, YHONY ALEXANDER LOPEZ LOPEZ',2,
   2,0,'-',
   10613829,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 03 – WFV015 – EXTRA $60.000 */
  ('2026-09-01','Martes','ALPINA','YONNI VALENCIA','WFV015','23404 20247','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,60000,'WFV015 EXTRA $60.000',
   8421198,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   60,NULL,'TYM'),

  /* 04 – SPU120 – sin adicional */
  ('2026-09-01','Martes','ALPINA','OSWALDO','SPU120','23405 23368 20248','9555 7000 UNOAC','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   12528487,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-09-01','Martes','ALPINA','MIGUEL GONZALES','SLI587','23382 23364 20241','9556 9550 UNOAG','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   11407401,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 06 – WGZ876 – EXTRA $60.000 */
  ('2026-09-01','Martes','ALPINA','RICARDO PINEDA','WGZ876','23373 20243','9557','SUPIA','ANDRES MATEO VILLALBA DIAZ',1,
   1,60000,'WGZ876 EXTRA $60.000',
   8279673,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 60000,
   38,NULL,'TYM'),

  /* 07 – WEP384 – EXTRA $120.000 PASADOS */
  ('2026-09-01','Martes','ALPINA','YOFER LOPEZ','WEP384','23370 23375 20244','9559 7002','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,120000,'WEP384 EXTRA $120.000 PASADOS',
   6906543,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 120000,
   59,NULL,'TYM'),

  /* 08 – EYX091 – sin adicional, sin FEP */
  ('2026-09-01','Martes','ALPINA','ANDRES GOMEZ','EYX091','23365 23366','9560','RIOSUCIO-SUPIA SUPERMERCADO','JUAN CAMILO COCOMA OROZCO, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   10139077,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 0,
   7,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ──────────────────────────────────── */

  /* 09 – ETM037 – sin adicional */
  ('2026-09-01','Martes','ALPINA','OSCAR MARIN','ETM037','23372 23406','9601 7010 EXITO16','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   6480410,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 10 – TJX795 – sin adicional */
  ('2026-09-01','Martes','ALPINA','ANDRES QUINTERO','TJX795','23407','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'-',
   6970464,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 11 – WFQ635 – ADICIONAL $150.000 NEGOCIACION */
  ('2026-09-01','Martes','ALPINA','JHENCI LOPEZ','WFQ635','23384 23385 23408 20239','9603','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA, VALENTINA GARCIA GOMEZ',2,
   2,150000,'ADICIONAL $150.000 NEGOCIACION',
   13783534,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 150000,
   62,NULL,'TYM'),

  /* 12 – SXF257 – ADICIONAL $50.000 POR PESO */
  ('2026-09-01','Martes','ALPINA','FABIO RUIZ','SXF257','23371 23389 23409 20237','9604 7010','MONTENEGRO','CAMILO ANDRES CONTRERAS RIVAS, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,50000,'ADICIONAL $50.000 POR PESO',
   10767355,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO' LIMIT 1) + 50000,
   57,NULL,'TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-09-01','Martes','ALPINA','HUMBERTO RINCON','WLS478','23390 23376 20238','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, SAMUEL ANDRES ARIAS ARCILA',2,
   2,0,'-',
   8414137,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   40,NULL,'TYM'),

  /* 14 – TTL256 – sin adicional */
  ('2026-09-01','Martes','ALPINA','ANDRES QUINTERO','TTL256','23377','9606','CIRCASIA','DANIELA CASTIBLANCO RAMIREZ',1,
   1,0,'-',
   3583304,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   33,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ─────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-09-01','Martes','ALPINA','GABRIEL PEREZ','SMO183','23393','9453','PEREIRA','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   5558085,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional */
  ('2026-09-01','Martes','ALPINA','JULIAN CUELLAR','VZD334','23394','9454','PEREIRA','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   8165477,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-09-01','Martes','ALPINA','RICARDO LOPEZ','TMZ674','23395','9455','PEREIRA','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   7812191,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   69,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-09-01','Martes','ALPINA','CARLOS VELASCO','SPQ814','23396','9456','SANTA ROSA','QUEBIN LOTERO',1,
   1,0,'-',
   7855125,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   69,NULL,'TYM'),

  /* 19 – EQY944 – sin adicional */
  ('2026-09-01','Martes','ALPINA','GOBER CRISTANCHO','EQY944','23397','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7761051,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-09-01','Martes','ALPINA','MIGUEL TABARES','PEK019','23398','9458','PEREIRA','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   7290835,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 21 – LUM993 – sin adicional */
  ('2026-09-01','Martes','ALPINA','PABLO RAMIREZ','LUM993','23399','9459','PEREIRA','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   11941880,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   64,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-09-01','Martes','ALPINA','JULIAN MALUMA','WLC133','23400','9460','PEREIRA','JUAN MANUEL DELGADO NARVAEZ',1,
   1,0,'-',
   11069497,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   70,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-09-01','Martes','ALPINA','ADALBERTO MEJIA','TNH494','23401','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   6467803,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 24 – WTN748 – sin adicional */
  ('2026-09-01','Martes','ALPINA','DIEGO RATIVA','WTN748','23410','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   7139551,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ──────────────────────────────── */

  /* 25 – MAT480 – VALOR DE FLETE $550.000 (precio fijo) */
  ('2026-09-01','Martes','ALPINA','ELKIN AGUIRRE','MAT480','23383','9450','CARTAGO 2T','NO APLICA',0,
   0,0,'VALOR DE FLETE $550.000',
   9936000,
   550000,
   1,NULL,'TYM'),

  /* 26 – EST067 – sin adicional */
  ('2026-09-01','Martes','ALPINA','JORGE RIVILLAS','EST067','23411','7005','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   9488137,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARGELIA EL CAIRO' LIMIT 1) + 0,
   32,NULL,'TYM'),

  /* 27 – ERK303 – sin adicional */
  ('2026-09-01','Martes','ALPINA','JORGE ALARCON','ERK303','23362 23378 20240 20236','7006 9450','SANTUARIO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   12098041,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 28 – JVM223 – sin adicional */
  ('2026-09-01','Martes','ALPINA','WILMAR CARDONA','JVM223','23363 23379','7007 9451','BELEN DE UMBRIA','MANUEL ALEJANDRO RAMIREZ OVALLE, JHON FREDY MORENO',2,
   2,0,'-',
   10187749,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional */
  ('2026-09-01','Martes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20242','FLEISCHMANN','ARMENIA','JUAN DIEGO FRANCO VERGARA',1,
   1,0,'-',
   4255186,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   41,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-09-01'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
