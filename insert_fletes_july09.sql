/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 9 JULIO 2026
   Generado: 2026-07-09
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: WFVO15 en planilla corregido a WFV015
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-09'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 09‑Jul‑2026
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
  ('2026-07-09','Jueves','ALPINA','JOHAN ECHEVERRY','SYU652','21857','9552','MANIZALES VILLAMARIA','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   6243178,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'19536','TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-07-09','Jueves','ALPINA','CAMILO CASTAÑO','KOL802','21858','9553','MANIZALES VILLAMARIA','ANDRES MATEO VILLALBA DIAZ',1,
   1,0,'-',
   4492003,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   43,'19537','TYM'),

  /* 03 – EYX091 – sin adicional */
  ('2026-07-09','Jueves','ALPINA','CARLOS GOMEZ','EYX091','21870','9554','NEIRA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   10018916,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1) + 0,
   58,'19538','TYM'),

  /* 04 – EYY183 – sin adicional */
  ('2026-07-09','Jueves','ALPINA','JOHN ARENAS','EYY183','21859','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   7120054,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   53,'19539','TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-07-09','Jueves','ALPINA','MIGUEL GONZALES','SLI587','21860 21822TSS','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   6650273,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   58,'19540 19530','TYM'),

  /* 06 – WGZ876 – EXTRA $60.000 */
  ('2026-07-09','Jueves','ALPINA','RICARDO PINEDA','WGZ876','21861','9557','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ',1,
   1,60000,'WGZ876 EXTRA $60.000',
   13380507,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1) + 60000,
   52,'19519','TYM'),

  /* 07 – TRL186 – sin adicional */
  ('2026-07-09','Jueves','ALPINA','WILLIAM','TRL186','21863','9559','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   12024520,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RDA S JOSE BELALCAZAR' LIMIT 1) + 0,
   52,'19542','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 08 – WFV015 – ADICIONAL $80.000 ENTREGA CONDUCTOR */
  ('2026-07-09','Jueves','ALPINA','YONNI VALENCIA','WFV015','21837','7008','CALARCA','',0,
   0,80000,'WFV015 ADICIONAL AL FLETE $80.000 ENTREGA CONDUCTOR',
   7720682,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 80000,
   3,NULL,'TYM'),

  /* 09 – SPU120 – sin adicional */
  ('2026-07-09','Jueves','ALPINA','OSWALDO','SPU120','21864 21838 21825TSS','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   9764408,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   61,'19534','TYM'),

  /* 10 – ETM037 – sin adicional */
  ('2026-07-09','Jueves','ALPINA','OSCAR MARIN','ETM037','21865 21826TSS','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, SEBASTIAN MONTES',2,
   2,0,'-',
   7231996,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   66,NULL,'TYM'),

  /* 11 – VZD334 – con factura AP */
  ('2026-07-09','Jueves','ALPINA','JULIAN CUELLAR','VZD334','21761 21866','9603 9600','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   6684979,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   57,'AP682441','TYM'),

  /* 12 – EQY944 – sin adicional */
  ('2026-07-09','Jueves','ALPINA','GOBER CRISTANCHO','EQY944','21827','9603TSS','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, CAMILO SUAREZ GARCIA',2,
   2,0,'-',
   8716796,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 13 – SXF257 – ADICIONAL $50.000 SOBRECARGO LECHE */
  ('2026-07-09','Jueves','ALPINA','FABIO RUIZ','SXF257','21867','9604','ALCALA ULLOA','CAMILO ANDRES CONTRERAS RIVAS',1,
   1,50000,'SXF257 ADICIONAL AL FLETE $50.000 SOBRECARGO LECHE',
   8252371,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1) + 50000,
   45,'19544','TYM'),

  /* 14 – WLS478 – sin adicional */
  ('2026-07-09','Jueves','ALPINA','HUMBERTO RINCON','WLS478','21841','9605','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, CARLOS JIMENEZ',2,
   2,0,'-',
   12154868,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1) + 0,
   57,'19546','TYM'),

  /* 15 – TTL256 – sin adicional */
  ('2026-07-09','Jueves','ALPINA','ANDRES QUINTERO','TTL256','21842 21836','9606 9600','FILANDIA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   10858950,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1) + 0,
   41,'19548','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 16 – SMO183 – sin adicional */
  ('2026-07-09','Jueves','ALPINA','GABRIEL PEREZ','SMO183','21848','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6176871,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 17 – XVI496 – sin adicional */
  ('2026-07-09','Jueves','ALPINA','PABLO RAMIREZ','XVI496','21849','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   12215547,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   76,'19532','TYM'),

  /* 18 – TMZ674 – sin adicional */
  ('2026-07-09','Jueves','ALPINA','RICARDO LOPEZ','TMZ674','21850','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   6423040,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional */
  ('2026-07-09','Jueves','ALPINA','CARLOS VELASCO','SPQ814','21851 21839','9456 7002','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6473594,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   39,NULL,'TYM'),

  /* 20 – WHM317 – sin adicional */
  ('2026-07-09','Jueves','ALPINA','HUMBERTO PARRA','WHM317','21852','9457','ARABIA ALTAGRACIA','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   6104285,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARABIA ALTAGRACIA' LIMIT 1) + 0,
   49,'19535','TYM'),

  /* 21 – WHM896 – sin adicional (zona 9458 hoy) */
  ('2026-07-09','Jueves','ALPINA','ALEXANDER CUELLAR','WHM896','21853','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   7644204,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 22 – PEK019 – sin adicional (zona 9459 hoy) */
  ('2026-07-09','Jueves','ALPINA','MIGUEL TABARES','PEK019','21854 21815TSS','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   7226609,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 23 – WLC133 – sin adicional */
  ('2026-07-09','Jueves','ALPINA','JULIAN','WLC133','21855','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   6322425,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 24 – TNH494 – con factura AP */
  ('2026-07-09','Jueves','ALPINA','ADALBERTO MEJIA','TNH494','21856','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   8257782,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   55,'AP683722','TYM'),

  /* 25 – WTN748 – con factura FEP */
  ('2026-07-09','Jueves','ALPINA','DIEGO RATIVA','WTN748','21829TSS 21868','7004','MARSELLA','BRAHIAN STIVEN VALENCIA IGLESIAS, JHON FREDY MORENO',2,
   2,0,'-',
   12219003,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARSELLA' LIMIT 1) + 0,
   52,'FEP1189271 19533','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 26 – EST067 – con factura AP */
  ('2026-07-09','Jueves','ALPINA','JORGE RIVILLAS','EST067','21869','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   7015416,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   52,'AP683729','TYM'),

  /* 27 – ERK303 – sin adicional */
  ('2026-07-09','Jueves','ALPINA','JORGE ALARCON','ERK303','21843','7006','APIA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   9739982,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 0,
   50,'19531','TYM'),

  /* 28 – JVM223 – sin adicional */
  ('2026-07-09','Jueves','ALPINA','WILMAR CARDONA','JVM223','21835 21844','7007 9451','VITERBO','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   15573960,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1) + 0,
   66,'19547','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional */
  ('2026-07-09','Jueves','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19543','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   3515228,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   44,NULL,'TYM');

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
WHERE fecha = '2026-07-09'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
