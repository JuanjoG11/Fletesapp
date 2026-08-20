/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 19 AGOSTO 2026
   Generado: 2026-08-19
   ✅ Nombres de población según tabla precios_fletes
   Notas:
     - EYY183 VALOR DE FLETE $450.000
     - SLI587 ADICIONAL $120.000 ENTREGA SUPER Y DOBLE RUTA
     - WGZ876 EXTRA $60.000
     - ETM037 ADICIONAL $80.000 ENTREGA SUPER EXTRARUTA
     - SXF257 30.000 ADICIONAL POR SOBRE CARGUE
     - WTN748 EXTRA $60.000
     - TJX795 VALOR FLETE $450.000
     - TRF860 (FLEISCHMANN) sin pedidos AP, solo FEP
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-19'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 19‑Ago‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – EYY183 – VALOR DE FLETE $450.000 */
  ('2026-08-19','Miercoles','ALPINA','JOHN ARENAS','EYY183','22980 22985 23011 22986','7001','MANIZALES VILLAMARIA','JHON FREDY MORENO',1,
   1,0,'VALOR DE FLETE $450.000',
   17125842,
   450000,
   3,NULL,'TYM'),

  /* 02 – SYU652 – AP721614 */
  ('2026-08-19','Miercoles','ALPINA','JOHAN ECHEVERRY','SYU652','23001','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   12060715,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   32,'AP721614','TYM'),

  /* 03 – KOL802 – sin adicional */
  ('2026-08-19','Miercoles','ALPINA','FREDY','KOL802','23002','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   8844518,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 04 – WFV015 – FEP1192430, AP721613 */
  ('2026-08-19','Miercoles','ALPINA','YONNI VALENCIA','WFV015','22987 20086 20079','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ, JHONNY LOPEZ',2,
   2,0,'-',
   10320323,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   60,'AP721613 FEP1192430','TYM'),

  /* 05 – SPU120 – sin adicional */
  ('2026-08-19','Miercoles','ALPINA','OSWALDO','SPU120','23003 20087 20075','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   8778369,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 06 – SLI587 – ADICIONAL $120.000 ENTREGA SUPER Y DOBLE RUTA */
  ('2026-08-19','Miercoles','ALPINA','MIGUEL GONZALES','SLI587','22979 23004 20088','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,120000,'ADICIONAL $120.000 ENTREGA DE SUPER Y DOBLE RUTA',
   7769073,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 120000,
   43,'FEP1192422','TYM'),

  /* 07 – WGZ876 – EXTRA $60.000 */
  ('2026-08-19','Miercoles','ALPINA','RICARDO PINEDA','WGZ876','23005','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ',1,
   1,60000,'WGZ876 EXTRA $60.000',
   13130116,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1) + 60000,
   28,NULL,'TYM'),

  /* 08 – EYX091 – sin adicional */
  ('2026-08-19','Miercoles','ALPINA','ANDRES GOMEZ','EYX091','22982 22961 20090','9558','AGUADAS PACORA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   16373861,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1) + 0,
   67,NULL,'TYM'),

  /* 09 – WEP384 – FEP1192515-516-517-518 */
  ('2026-08-19','Miercoles','ALPINA','YOFER LOPEZ','WEP384','23006 20090','9559','PALESTINA ARAUCA','BRANDON STEVEN GIL BAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   12647581,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PALESTINA ARAUCA' LIMIT 1) + 0,
   51,'FEP1192515-516-517-518','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 10 – ETM037 – ADICIONAL $80.000 ENTREGA SUPER EXTRARUTA */
  ('2026-08-19','Miercoles','ALPINA','OSCAR MARIN','ETM037','22984 23007','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,80000,'ADICIONAL $80.000 ENTREGA DE SUPER EXTRARUTA',
   10725400,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 80000,
   55,NULL,'TYM'),

  /* 11 – WFQ635 – sin adicional */
  ('2026-08-19','Miercoles','ALPINA','JHENCI LOPEZ','WFQ635','23008','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, SAMUEL ARIAS',2,
   2,0,'-',
   9631067,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 12 – EQY944 – sin adicional */
  ('2026-08-19','Miercoles','ALPINA','GOBER CRISTANCHO','EQY944','22976','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   8668445,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 13 – SXF257 – 30.000 ADICIONAL POR SOBRE CARGUE */
  ('2026-08-19','Miercoles','ALPINA','FABIO RUIZ','SXF257','22981 23009','9604','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,30000,'30.000 ADICIONAL POR SOBRE CARGUE',
   19757657,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 30000,
   42,NULL,'TYM'),

  /* 14 – WLS478 – sin adicional */
  ('2026-08-19','Miercoles','ALPINA','HUMBERTO RINCON','WLS478','22990 20081','9605','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   8168728,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 15 – TTL256 – sin adicional */
  ('2026-08-19','Miercoles','ALPINA','ANDRES QUINTERO','TTL256','22983 23010 20083','9606','SALENTO','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   6672163,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1) + 0,
   32,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 16 – BCS450 – sin adicional */
  ('2026-08-19','Miercoles','ALPINA','CRISTIAN ZULUAGA','BCS450','22992 20071','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6728497,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 17 – VZD334 – sin adicional */
  ('2026-08-19','Miercoles','ALPINA','JULIAN CUELLAR','VZD334','22993 20084','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   9620881,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 18 – MAT480 – sin adicional */
  ('2026-08-19','Miercoles','ALPINA','ELKIN AGUIRRE','MAT480','22994','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   4539305,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional */
  ('2026-08-19','Miercoles','ALPINA','CARLOS VELASCO','SPQ814','22995','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   9783357,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 20 – LUM993 – EXTRA, sin adicional */
  ('2026-08-19','Miercoles','ALPINA','PABLO RAMIREZ','LUM993','22996 23016','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   10464555,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional */
  ('2026-08-19','Miercoles','ALPINA','MIGUEL TABARES','PEK019','22997','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   11906641,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 22 – TMZ674 – sin adicional */
  ('2026-08-19','Miercoles','ALPINA','RICARDO LOPEZ','TMZ674','22998 23017','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA, QUEBIN LOTERO',2,
   2,0,'-',
   13552587,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   61,NULL,'TYM'),

  /* 23 – WLC133 – sin adicional */
  ('2026-08-19','Miercoles','ALPINA','JULIAN','WLC133','22999','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, DANIELA CASTIBLANCO',2,
   2,0,'-',
   11235948,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   68,NULL,'TYM'),

  /* 24 – EST067 – sin adicional */
  ('2026-08-19','Miercoles','ALPINA','JORGE RIVILLAS','EST067','22989 23000','9461','CARTAGO','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   10726290,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 25 – WTN748 – EXTRA $60.000 */
  ('2026-08-19','Miercoles','ALPINA','DIEGO RATIVA','WTN748','23012 20094','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,60000,'EXTRA $60.000',
   14741535,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   65,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 26 – TJX795 – VALOR FLETE $450.000 */
  ('2026-08-19','Miercoles','ALPINA','ANDRES QUINTERO','TJX795','23013','7005','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'VALOR FLETE $450.000',
   16148064,
   450000,
   34,NULL,'TYM'),

  /* 27 – ERK303 – sin adicional */
  ('2026-08-19','Miercoles','ALPINA','JORGE ALARCON','ERK303','23014 20074 20076','7006','BALBOA LA CELIA','ROVINSON TORRES RIVERA',1,
   1,0,'-',
   9557381,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 28 – TNH494 – sin adicional */
  ('2026-08-19','Miercoles','ALPINA','ADALBERTO MEJIA','TNH494','22926 22972','7007','BELEN DE UMBRIA','OSCAR MAURICIO RESTREPO MORENO, VALENTINA GARCIA',2,
   2,0,'-',
   8443027,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 29 – JVM223 – sin adicional */
  ('2026-08-19','Miercoles','ALPINA','WILMAR CARDONA','JVM223','22977 23015 20080','7007','ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   20927279,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 30 – SQB119 – sin adicional */
  ('2026-08-19','Miercoles','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20093 20072','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   3904365,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 31 – TRF860 – FEP1192462 DE DIEGO FRANCO (2T Cartago, sin pedidos AP) */
  ('2026-08-19','Miercoles','FLEISCHMANN','ALBERTO CONTRERAS','TRF860','20094 20085 20078','FLEISCHMANN','CARTAGO 2T','JULIAN RODRIGUEZ',1,
   1,0,'FEP1192462 DE DIEGO FRANCO',
   5336796,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   0,'FEP1192462','TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-08-19'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
