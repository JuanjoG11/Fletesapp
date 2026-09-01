/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 25 AGOSTO 2026
   Generado: 2026-08-25
   ✅ Nombres de auxiliares normalizados según lista oficial
   Notas:
     - SYU652  EXTRA $60.000
     - WEP384  ADICIONAL $100.000
     - EYX091  zona 9560 → RIOSUCIO-SUPIA SUPERMERCADO
     - WFV015  TEBAIDA sin auxiliares, ADICIONAL $100.000
     - TTL256  CIRCASIA (población en tabla)
     - JHONNY LOPEZ        → YHONY ALEXANDER LOPEZ LOPEZ
     - SAMUEL ARIAS        → SAMUEL ANDRES ARIAS ARCILA
     - VALENTINA GARCIA    → VALENTINA GARCIA GOMEZ
     - DANIELA CASTIBLANCO → DANIELA CASTIBLANCO RAMIREZ
     - MANUEL RAMIREZ      → MANUEL ALEJANDRO RAMIREZ OVALLE
     - DIEGO FRANCO        → JUAN DIEGO FRANCO VERGARA
     - QUEBIN LOTERO: no está en lista oficial ALPINA
     - PEREIRA (Excel) → PEREIRA - DOSQUEBRADAS (tabla)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-25'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 25‑Ago‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – SYU652 – EXTRA $60.000 */
  ('2026-08-25','Martes','ALPINA','JOHAN ECHEVERRY','SYU652','23175 20149','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,60000,'SYU652 EXTRA $60.000',
   6701601,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   69,NULL,'TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-08-25','Martes','ALPINA','FREDY','KOL802','23176','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   7447760,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 03 – WLS478 – sin adicional */
  ('2026-08-25','Martes','ALPINA','HUMBERTO RINCON','WLS478','23177 20150','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   7883452,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 04 – SPU120 – sin adicional */
  ('2026-08-25','Martes','ALPINA','OSWALDO','SPU120','23154 23178 20151','9555 7000 CENTRO','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN, YHONY ALEXANDER LOPEZ LOPEZ',2,
   2,0,'-',
   9279425,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-08-25','Martes','ALPINA','MIGUEL GONZALES','SLI587','23152 23179 20152 20146 20145','9556 9550 GALERIA','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   8528144,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-08-25','Martes','ALPINA','RICARDO PINEDA','WGZ876','23164 20153','9557','SUPIA','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   11480799,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 07 – WEP384 – ADICIONAL $100.000 */
  ('2026-08-25','Martes','ALPINA','YOFER','WEP384','23149 23158 23180 20154','9559 7002 E7000','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,100000,'WEP384 ADICIONAL $100.000',
   8918636,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 100000,
   68,NULL,'TYM'),

  /* 08 – EYX091 – sin adicional */
  ('2026-08-25','Martes','ALPINA','ANDRES GOMEZ','EYX091','23153 23157','9560','RIOSUCIO-SUPIA SUPERMERCADO','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   11847799,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 0,
   9,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 09 – ETM037 – sin adicional */
  ('2026-08-25','Martes','ALPINA','OSCAR MARIN','ETM037','23181','9601 LAPATRIA','ARMENIA','YEISON DAVID RENDON SOTO, JHON FREDY MORENO',2,
   2,0,'-',
   7494621,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   51,'AP726955','TYM'),

  /* 10 – TJX795 – sin adicional */
  ('2026-08-25','Martes','ALPINA','ANDRES QUINTERO','TJX795','23182','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'-',
   6570605,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional */
  ('2026-08-25','Martes','ALPINA','GOBER CRISTANCHO','EQY944','23183 20156','9603','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   7769552,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 12 – SXF257 – sin adicional */
  ('2026-08-25','Martes','ALPINA','FABIO RUIZ','SXF257','23156 23184 20155','9604 7010','MONTENEGRO','CAMILO ANDRES CONTRERAS RIVAS, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   9406804,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 13 – WFV015 – ADICIONAL $100.000 (sin auxiliares) */
  ('2026-08-25','Martes','ALPINA','YONNI VALENCIA','WFV015','23159 20158','9605','TEBAIDA','NO APLICA',0,
   0,100000,'WFV015 ADICIONAL $100.000',
   5433300,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 100000,
   45,NULL,'TYM'),

  /* 14 – TTL256 – sin adicional */
  ('2026-08-25','Martes','ALPINA','ANDRES QUINTERO','TTL256','23160 20157','9606','CIRCASIA','DANIELA CASTIBLANCO RAMIREZ',1,
   1,0,'-',
   3388271,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   38,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-08-25','Martes','ALPINA','GABRIEL PEREZ','SMO183','23166','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   7334062,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional */
  ('2026-08-25','Martes','ALPINA','JULIAN CUELLAR','VZD334','23167','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO, SAMUEL ANDRES ARIAS ARCILA',2,
   2,0,'-',
   11901730,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-08-25','Martes','ALPINA','RICARDO LOPEZ','TMZ674','23168','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, QUEBIN LOTERO',2,
   2,0,'-',
   6590788,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   64,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-08-25','Martes','ALPINA','CARLOS VELASCO','SPQ814','23169','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6569472,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 19 – WFQ635 – sin adicional */
  ('2026-08-25','Martes','ALPINA','JHENCI LOPEZ','WFQ635','23170','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   8787433,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 20 – EST590 – sin adicional */
  ('2026-08-25','Martes','ALPINA','FREDY GALLEGO','EST590','23171','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL, VALENTINA GARCIA GOMEZ',2,
   2,0,'-',
   13108861,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 21 – LUM993 – sin adicional */
  ('2026-08-25','Martes','ALPINA','PABLO RAMIREZ','LUM993','23172','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   8689339,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-08-25','Martes','ALPINA','JULIAN','WLC133','23173','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   12565792,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   61,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-08-25','Martes','ALPINA','ADALBERTO MEJIA','TNH494','23174','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   6372959,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 24 – WTN748 – sin adicional */
  ('2026-08-25','Martes','ALPINA','DIEGO RATIVA','WTN748','23185','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   6822132,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – EST067 – sin adicional */
  ('2026-08-25','Martes','ALPINA','JORGE RIVILLAS','EST067','23186','7005','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   8886347,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARGELIA EL CAIRO' LIMIT 1) + 0,
   33,NULL,'TYM'),

  /* 26 – ERK303 – sin adicional */
  ('2026-08-25','Martes','ALPINA','JORGE ALARCON','ERK303','23161 23150 20159','7006 9450','SANTUARIO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   15257865,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-08-25','Martes','ALPINA','WILMAR CARDONA','JVM223','23162 23151 20147','7007 9451','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, MANUEL ALEJANDRO RAMIREZ OVALLE',2,
   2,0,'-',
   11291809,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-08-25','Martes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20148','FLEISCHMANN','ARMENIA','JUAN DIEGO FRANCO VERGARA',1,
   1,0,'-',
   5583833,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   45,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-08-25'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
