/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 29 JULIO 2026
   Generado: 2026-07-29
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: Programación dice "28 julio" pero es el miércoles 29
         Flete Armenia sin placa → placa 'SIN_PLACA_29JUL' placeholder
         ZMN804 es Unilever/Pereira VALOR FLETE $300.000
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-29'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 29‑Jul‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – SYU652 – EXTRA $60.000 con factura AP */
  ('2026-07-29','Miércoles','ALPINA','JOHAN ECHEVERRY','SYU652','22416','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,60000,'SYU652 EXTRA $60.000',
   12712510,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   47,'AP702889','TYM'),

  /* 02 – KOL802 – EXTRA $80.000 */
  ('2026-07-29','Miércoles','ALPINA','FREDY','KOL802','22393 22417','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,80000,'KOL802 EXTRA $80.000',
   12921628,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 80000,
   60,NULL,'TYM'),

  /* 03 – WFV015 – EXTRA $100.000 con facturas AP */
  ('2026-07-29','Miércoles','ALPINA','YONNI VALENCIA','WFV015','22418','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,100000,'WFV015 EXTRA $100.000',
   16116006,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 100000,
   56,'AP702888 AP702894 AP702282 AP702283 9919793','TYM'),

  /* 04 – EYY183 – sin adicional */
  ('2026-07-29','Miércoles','ALPINA','JOHN ARENAS','EYY183','22419','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   7255986,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   50,'9919794','TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-07-29','Miércoles','ALPINA','MIGUEL GONZALES','SLI587','22420','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   6803779,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   49,'9919795','TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-07-29','Miércoles','ALPINA','RICARDO PINEDA','WGZ876','22421','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   14033300,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1) + 0,
   33,NULL,'TYM'),

  /* 07 – EYX091 – sin adicional */
  ('2026-07-29','Miércoles','ALPINA','ANDRES GOMEZ','EYX091','22392','9558','AGUADAS PACORA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   6843688,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1) + 0,
   37,NULL,'TYM'),

  /* 08 – TRL186 – sin adicional */
  ('2026-07-29','Miércoles','ALPINA','WILLIAM','TRL186','22422','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ, CAMILO SUAREZ GARCIA',2,
   2,0,'-',
   9246471,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   42,'9919798','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 09 – Flete especial Armenia – VALOR FLETE $950.000 (sin placa registrada) */
  ('2026-07-29','Miércoles','ALPINA','','MAT480','22402','LA19 PESPEJO LA50 LAPATRIA','ARMENIA','JHON FREDY MORENO',1,
   1,0,'VALOR FLETE $950.000 ARMENIA SUPERMERCADOS',
   25316865,
   950000,
   4,'AP702941 AP702885','TYM'),

  /* 10 – ETM037 – sin adicional */
  ('2026-07-29','Miércoles','ALPINA','OSCAR MARIN','ETM037','22390 22423','9601','ARMENIA','YEISON DAVID RENDON SOTO, OSCAR MAURICIO RESTREPO MORENO',2,
   2,0,'-',
   8451007,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 11 – VZD334 – EXTRA $140.000 (pendientes semana pasada + extra hoy) */
  ('2026-07-29','Miércoles','ALPINA','JULIAN CUELLAR','VZD334','22424','9602','ARMENIA','SANTIAGO HENAO MORALES',1,
   1,140000,'VZD334 EXTRA $140.000 PENDIENTES SEMANA PASADA + EXTRA HOY',
   8421905,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 140000,
   63,NULL,'TYM'),

  /* 12 – EQY944 – sin adicional */
  ('2026-07-29','Miércoles','ALPINA','GOBER CRISTANCHO','EQY944','22425','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   8728865,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 13 – SXF257 – con facturas AP */
  ('2026-07-29','Miércoles','ALPINA','FABIO RUIZ','SXF257','22426','9604 7010','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS, SEBASTIAN MONTES',2,
   2,0,'-',
   14182624,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 0,
   46,'AP702891 AP702892','TYM'),

  /* 14 – WLS478 – sin adicional */
  ('2026-07-29','Miércoles','ALPINA','HUMBERTO RINCON','WLS478','22395','9605','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   6769899,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1) + 0,
   47,'9919802 9919801','TYM'),

  /* 15 – TTL256 – con factura AP */
  ('2026-07-29','Miércoles','ALPINA','ANDRES QUINTERO','TTL256','22396','9606 9600','SALENTO','CRISTIAN FABIAN CAMACHO MARTINEZ, JUAN LARGO',2,
   2,0,'-',
   10585782,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1) + 0,
   41,'AP702887 9919800','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 16 – SMO183 – sin adicional */
  ('2026-07-29','Miércoles','ALPINA','GABRIEL PEREZ','SMO183','22407','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6258176,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 17 – ZMN804 – VALOR FLETE $300.000 (Unilever/Pereira) */
  ('2026-07-29','Miércoles','ALPINA','ALEJANDRO VARGAS','ZMN804','22406 22404','UNILEVER','PEREIRA - DOSQUEBRADAS','',0,
   0,0,'ZMN804 VALOR FLETE $300.000 MERCASA-VIOLETAS',
   8504655,
   300000,
   4,NULL,'TYM'),

  /* 18 – SPU120 – sin adicional (zona 9454) */
  ('2026-07-29','Miércoles','ALPINA','OSWALDO','SPU120','22408','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7060407,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   47,'9919804','TYM'),

  /* 19 – TMZ674 – sin adicional */
  ('2026-07-29','Miércoles','ALPINA','RICARDO LOPEZ','TMZ674','22409','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   9774708,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   72,NULL,'TYM'),

  /* 20 – SPQ814 – sin adicional */
  ('2026-07-29','Miércoles','ALPINA','CARLOS VELASCO','SPQ814','22410','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   7668917,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 21 – WEP384 – EXTRA $60.000 */
  ('2026-07-29','Miércoles','ALPINA','YOFER','WEP384','22411','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,60000,'WEP384 EXTRA $60.000',
   7704133,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   59,NULL,'TYM'),

  /* 22 – PEK019 – sin adicional */
  ('2026-07-29','Miércoles','ALPINA','MIGUEL TABARES','PEK019','22412','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   5882545,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 23 – XVI496 – sin adicional */
  ('2026-07-29','Miércoles','ALPINA','PABLO RAMIREZ','XVI496','22413','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   8602658,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 24 – WLC133 – sin adicional */
  ('2026-07-29','Miércoles','ALPINA','JULIAN','WLC133','22414','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   7957354,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   72,NULL,'TYM'),

  /* 25 – TNH494 – sin adicional */
  ('2026-07-29','Miércoles','ALPINA','ADALBERTO MEJIA','TNH494','22405 22415','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   8728198,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 26 – WTN748 – EXTRA $100.000 con facturas AP */
  ('2026-07-29','Miércoles','ALPINA','DIEGO RATIVA','WTN748','22427','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,100000,'WTN748 EXTRA $100.000',
   10236176,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 100000,
   67,'AP702775 AP702781 AP702782 AP702792 9919805','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 27 – EST067 – sin adicional */
  ('2026-07-29','Miércoles','ALPINA','JORGE RIVILLAS','EST067','22428','7005','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   6564261,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1) + 0,
   38,'9919791','TYM'),

  /* 28 – ERK303 – EXTRA $60.000 con factura AP */
  ('2026-07-29','Miércoles','ALPINA','JORGE ALARCON','ERK303','22337','7006','BALBOA LA CELIA','ROVINSON TORRES RIVERA',1,
   1,60000,'ERK303 EXTRA $60.000',
   8569642,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1) + 60000,
   44,'AP701414 9919789','TYM'),

  /* 29 – JVM223 – sin adicional */
  ('2026-07-29','Miércoles','ALPINA','WILMAR CARDONA','JVM223','22386 22398','7007 9451','ANSERMA','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   17556336,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1) + 0,
   55,'9919792','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 30 – SQB119 – sin adicional */
  ('2026-07-29','Miércoles','FLEISCHMANN','CARLOS CASTAÑO','SQB119','9919803','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   4349046,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   49,'FEP1190958','TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
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
WHERE fecha = '2026-07-29'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
