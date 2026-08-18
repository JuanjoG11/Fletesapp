/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 12 AGOSTO 2026
   Generado: 2026-08-12
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-12'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 12‑Ago‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – SPU120 – sin adicional (hoy zona 7001 Manizales) */
  ('2026-08-12','Miércoles','ALPINA','OSWALDO','SPU120','22763','7001','MANIZALES VILLAMARIA','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   9656365,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   2,NULL,'TYM'),

  /* 02 – SXF257 – sin adicional (hoy zona 7001 Manizales) */
  ('2026-08-12','Miércoles','ALPINA','FABIO RUIZ','SXF257','22761','7001','MANIZALES VILLAMARIA','JHON FREDY MORENO',1,
   1,0,'-',
   10689289,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   2,NULL,'TYM'),

  /* 03 – SYU652 – sin adicional */
  ('2026-08-12','Miércoles','ALPINA','JOHAN ECHEVERRY','SYU652','22762 22781','9552 7001','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   9532512,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   22,NULL,'TYM'),

  /* 04 – KOL802 – sin adicional */
  ('2026-08-12','Miércoles','ALPINA','JUAN','KOL802','22782','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON, JHON WILSON GIRALDO CARVAJAL',2,
   2,0,'-',
   9202560,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   67,NULL,'TYM'),

  /* 05 – WFV015 – sin adicional */
  ('2026-08-12','Miércoles','ALPINA','YONNI VALENCIA','WFV015','22783','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   5897999,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'19982','TYM'),

  /* 06 – EYY183 – sin adicional */
  ('2026-08-12','Miércoles','ALPINA','JOHN ARENAS','EYY183','22784','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   7274202,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   43,'19983','TYM'),

  /* 07 – SLI587 – sin adicional */
  ('2026-08-12','Miércoles','ALPINA','MIGUEL GONZALES','SLI587','22785','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   6242679,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   40,'19984','TYM'),

  /* 08 – WGZ876 – EXTRA $60.000 */
  ('2026-08-12','Miércoles','ALPINA','RICARDO PINEDA','WGZ876','22754 22731','9557','SUPIA','JUAN MANUEL DELGADO NARVAEZ',1,
   1,60000,'WGZ876 EXTRA $60.000',
   6959557,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 60000,
   34,NULL,'TYM'),

  /* 09 – EYX091 – sin adicional */
  ('2026-08-12','Miércoles','ALPINA','ANDRES GOMEZ','EYX091','22771 22755','9558','AGUADAS PACORA','JUAN CAMILO COCOMA OROZCO, JHONNY LOPEZ',2,
   2,0,'-',
   15595100,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1) + 0,
   69,NULL,'TYM'),

  /* 10 – WEP384 – sin adicional */
  ('2026-08-12','Miércoles','ALPINA','YOFER','WEP384','22756','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,0,'-',
   6363754,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   56,'19980','TYM'),

  /* 11 – WFQ635 – sin adicional (Supia Riosucio Super) */
  ('2026-08-12','Miércoles','ALPINA','JHENCI LOPEZ','WFQ635','22767 22766','9560','RIOSUCIO-SUPIA SUPERMERCADO','ANDRES MATEO VILLALBA DIAZ',1,
   1,0,'-',
   12014402,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 0,
   7,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 12 – ETM037 – sin adicional */
  ('2026-08-12','Miércoles','ALPINA','OSCAR MARIN','ETM037','22770 22786','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   9650106,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 13 – WFR160 – sin adicional (placa nueva) */
  ('2026-08-12','Miércoles','ALPINA','LEANDRO LOPEZ','WFR160','22787','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'-',
   5713472,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   38,NULL,'TYM'),

  /* 14 – EQY944 – EXTRA $60.000 */
  ('2026-08-12','Miércoles','ALPINA','GOBER CRISTANCHO','EQY944','22788','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,60000,'EQY944 EXTRA $60.000',
   9292481,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 60000,
   37,NULL,'TYM'),

  /* 15 – WTN748 – sin adicional (hoy zona 9604 Quimbaya) */
  ('2026-08-12','Miércoles','ALPINA','DIEGO RATIVA','WTN748','22789 22726','9604 7010','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS',1,
   1,0,'-',
   3010560,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 0,
   9,NULL,'TYM'),

  /* 16 – WLS478 – sin adicional */
  ('2026-08-12','Miércoles','ALPINA','HUMBERTO RINCON','WLS478','22790','9605','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   8419189,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1) + 0,
   46,'19985 19986','TYM'),

  /* 17 – TTL256 – sin adicional */
  ('2026-08-12','Miércoles','ALPINA','ANDRES QUINTERO','TTL256','22760 22791','9606 9600','SALENTO','DANIELA CASTIBLANCO, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   11269164,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1) + 0,
   30,'19977','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 18 – TMZ674 – sin adicional (cubre zonas 9453/9455/9458) */
  ('2026-08-12','Miércoles','ALPINA','RICARDO LOPEZ','TMZ674','22772 22774 22777','9453 9455 9458','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES, ANDRES FELIPE RIOS CAICEDO',2,
   2,0,'-',
   7471734,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 19 – VZD334 – sin adicional */
  ('2026-08-12','Miércoles','ALPINA','JULIAN CUELLAR','VZD334','22773','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   9915830,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   46,'19990','TYM'),

  /* 20 – SPQ814 – sin adicional */
  ('2026-08-12','Miércoles','ALPINA','CARLOS VELASCO','SPQ814','22775','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6481515,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   40,NULL,'TYM'),

  /* 21 – WHM896 – sin adicional */
  ('2026-08-12','Miércoles','ALPINA','ALEXANDER CUELLAR','WHM896','22792 22776','9457 7004','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ, BRAHIAN STIVEN VALENCIA IGLESIAS',2,
   2,0,'-',
   8413563,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   37,'19989','TYM'),

  /* 22 – LUM993 – sin adicional (placa nueva zona 9459) */
  ('2026-08-12','Miércoles','ALPINA','PABLO RAMIREZ','LUM993','22778','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   5711920,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   27,NULL,'TYM'),

  /* 23 – WLC133 – sin adicional */
  ('2026-08-12','Miércoles','ALPINA','JULIAN','WLC133','22779','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   4959531,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   41,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional */
  ('2026-08-12','Miércoles','ALPINA','ADALBERTO MEJIA','TNH494','22780','9461','CARTAGO 2T','CARLOS JIMENEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   9641194,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – EST067 – ADICIONAL $50.000 entrega en Cartago */
  ('2026-08-12','Miércoles','ALPINA','JORGE RIVILLAS','EST067','22758 22793','7005 9450','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,50000,'EST067 ADICIONAL $50.000 ENTREGA EN CARTAGO',
   5899761,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1) + 50000,
   28,'19974','TYM'),

  /* 26 – ERK303 – sin adicional */
  ('2026-08-12','Miércoles','ALPINA','JORGE ALARCON','ERK303','22723 22794','7006 9450','BALBOA LA CELIA','ROVINSON TORRES RIVERA',1,
   1,0,'-',
   8267996,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1) + 0,
   41,'19987 19988','TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-08-12','Miércoles','ALPINA','WILMAR CARDONA','JVM223','22765 22757','7007 9451','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   9598816,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-08-12','Miércoles','FLEISCHMANN','CARLOS ARTURO','SQB119','22764','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   6535896,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   22,'19972 19991','TYM'),

  /* 29 – TRF860 – VALOR FLETE $350.000 */
  ('2026-08-12','Miércoles','FLEISCHMANN','ALBERTO','TRF860','19973 19976','FLEISCHMANN','CARTAGO 2T','SAMUEL ARIAS',1,
   1,0,'TRF860 VALOR FLETE $350.000',
   6935753,
   350000,
   44,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-08-12'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
