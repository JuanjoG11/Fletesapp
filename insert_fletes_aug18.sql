/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 18 AGOSTO 2026
   Generado: 2026-08-18
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: MAT480 sale dos veces (Calarca + Armenia Super)
         WFR160 sin conductor nombrado → conductor vacío
         JVM223 valor ruta muy pequeño ($315.530) Guatica
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-18'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 18‑Ago‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – SYU652 – sin adicional */
  ('2026-08-18','Martes','ALPINA','JOHAN ECHEVERRY','SYU652','22955','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO, VICTOR ALFONSO PULGARIN MEJIA',2,
   2,0,'-',
   9232953,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   66,NULL,'TYM'),

  /* 02 – EQN953 – VALOR FLETE $400.000 */
  ('2026-08-18','Martes','ALPINA','ORLANDO VASQUEZ','EQN953','22927 22956','9553 9550','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'EQN953 VALOR FLETE $400.000',
   6332381,
   400000,
   30,NULL,'TYM'),

  /* 03 – EYX091 – sin adicional (hoy zona 9554 Manizales) */
  ('2026-08-18','Martes','ALPINA','ANDRES GOMEZ','EYX091','22957','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   7026148,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   50,'20057','TYM'),

  /* 04 – SLI587 – sin adicional */
  ('2026-08-18','Martes','ALPINA','MIGUEL GONZALES','SLI587','22958 22959','9555 9556','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN, MILTON GILMER OSORIO CALLE',2,
   2,0,'-',
   6094876,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   56,'20059 20058','TYM'),

  /* 05 – WGZ876 – EXTRA $300.000 supermercados otra zona */
  ('2026-08-18','Martes','ALPINA','RICARDO PINEDA','WGZ876','22929 22928 22960','9557 9560','SUPIA','JUAN MANUEL DELGADO NARVAEZ, JHONNY LOPEZ',2,
   2,300000,'WGZ876 EXTRA $300.000 SUPERMERCADOS DE OTRA ZONA',
   18641126,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 300000,
   33,'20060','TYM'),

  /* 06 – WEP384 – EXTRA $60.000 */
  ('2026-08-18','Martes','ALPINA','YOFER','WEP384','22962','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'WEP384 EXTRA $60.000',
   8785493,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 60000,
   67,'20062','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 07 – MAT480 (Calarca) – VALOR FLETE $500.000 */
  ('2026-08-18','Martes','ALPINA','ELKIN AGUIRRE','MAT480','22941 22935 22942','7008 7010','CALARCA','ANDRES MATEO VILLALBA DIAZ',1,
   1,0,'MAT480 VALOR FLETE $500.000',
   11260000,
   500000,
   3,NULL,'TYM'),

  /* 08 – MAT480 (Armenia Super) – VALOR FLETE $900.000 */
  ('2026-08-18','Martes','ALPINA','ELKIN AGUIRRE','MAT480','22936 22937 22943 22944','7010 7009','ARMENIA','JHON FREDY MORENO',1,
   1,0,'MAT480 VALOR FLETE $900.000 ARMENIA SUPER',
   21637800,
   900000,
   4,NULL,'TYM'),

  /* 09 – ETM037 – sin adicional */
  ('2026-08-18','Martes','ALPINA','OSCAR MARIN','ETM037','22946 22963','9601 7010','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   5292318,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 10 – WFR160 – VALOR FLETE $400.000 (sin conductor nombrado) */
  ('2026-08-18','Martes','ALPINA','','WFR160','22964','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'WFR160 VALOR DE FLETE $400.000',
   6095856,
   400000,
   53,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional */
  ('2026-08-18','Martes','ALPINA','GOBER CRISTANCHO','EQY944','22930 22965','9603 7008','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   6464053,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   51,'20065 20068 20064','TYM'),

  /* 12 – SXF257 – sin adicional */
  ('2026-08-18','Martes','ALPINA','FABIO RUIZ','SXF257','22931 22939 22966','9604 7010','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   10523621,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   46,'20063','TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-08-18','Martes','ALPINA','HUMBERTO RINCON','WLS478','22940 22967','9605','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   8042542,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   46,'20066','TYM'),

  /* 14 – TTL256 – sin adicional */
  ('2026-08-18','Martes','ALPINA','ANDRES QUINTERO','TTL256','22968','9606','CIRCASIA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   2042184,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   24,'20067','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – ESK522 – sin adicional (placa nueva, TSS Pereira) */
  ('2026-08-18','Martes','ALPINA','CESAR','ESK522','TSS CAMILO PEÑA SABADO','TSS','PEREIRA - DOSQUEBRADAS','DANIELA CASTIBLANCO',1,
   1,0,'-',
   3218649,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   20,'9920053','TYM'),

  /* 16 – WTN748 – sin adicional (hoy zona 9453) */
  ('2026-08-18','Martes','ALPINA','DIEGO RATIVA','WTN748','22945','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   5478004,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   31,NULL,'TYM'),

  /* 17 – VZD334 – EXTRA $60.000 */
  ('2026-08-18','Martes','ALPINA','JULIAN CUELLAR','VZD334','22938','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,60000,'VZD334 EXTRA $60.000',
   12959273,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   56,NULL,'TYM'),

  /* 18 – TMZ674 – sin adicional */
  ('2026-08-18','Martes','ALPINA','RICARDO LOPEZ','TMZ674','22948','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, QUEBIN LOTERO',2,
   2,0,'-',
   9075589,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   39,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional */
  ('2026-08-18','Martes','ALPINA','CARLOS VELASCO','SPQ814','22949','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   4647448,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   37,NULL,'TYM'),

  /* 20 – SPU120 – sin adicional (zona 9457/7004) */
  ('2026-08-18','Martes','ALPINA','OSWALDO','SPU120','22969 22950','9457 7004','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ, BRAHIAN STIVEN VALENCIA IGLESIAS',2,
   2,0,'-',
   7017301,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 21 – WFQ635 – sin adicional (zona 9458 Pereira) */
  ('2026-08-18','Martes','ALPINA','JHENCI LOPEZ','WFQ635','22951','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   5710711,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   36,NULL,'TYM'),

  /* 22 – LUM993 – sin adicional */
  ('2026-08-18','Martes','ALPINA','PABLO RAMIREZ','LUM993','22952','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA, SAMUEL ARIAS',2,
   2,0,'-',
   9208204,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 23 – WLC133 – sin adicional */
  ('2026-08-18','Martes','ALPINA','JULIAN','WLC133','22953','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, CARLOS JIMENEZ',2,
   2,0,'-',
   11929886,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 24 – WFV015 – sin adicional (hoy zona 9461 Cartago TSS) */
  ('2026-08-18','Martes','ALPINA','YONNI VALENCIA','WFV015','22954','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   2026724,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   23,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – WPP948 – sin adicional (Cartago 2T sin auxiliar) */
  ('2026-08-18','Martes','ALPINA','SEBASTIAN OROZCO','WPP948','22934','9450','CARTAGO 2T','',0,
   0,0,'-',
   6624000,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   1,NULL,'TYM'),

  /* 26 – EST067 – sin adicional */
  ('2026-08-18','Martes','ALPINA','JORGE RIVILLAS','EST067','22970','7005','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   4984328,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1) + 0,
   26,'20070','TYM'),

  /* 27 – ERK303 – sin adicional */
  ('2026-08-18','Martes','ALPINA','JORGE ALARCON','ERK303','22925 22971','7006 9450','SANTUARIO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   18362846,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1) + 0,
   41,'20069','TYM'),

  /* 28 – JVM223 – sin adicional (Guatica, valor pequeño) */
  ('2026-08-18','Martes','ALPINA','WILMAR CARDONA','JVM223','','7007','GUATICA','OSCAR MAURICIO RESTREPO MORENO, MANUEL RAMIREZ',2,
   2,0,'-',
   315530,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GUATICA' LIMIT 1) + 0,
   4,'20051 20052','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional */
  ('2026-08-18','Martes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20056','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   4338499,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   42,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-08-18'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
