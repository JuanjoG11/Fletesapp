/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 23 JUNIO 2026
   Generado: 2026-06-23
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-23'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 23‑Jun‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – SLI587 – SUPERCENTRO, con factura AP */
  ('2026-06-23','Martes','ALPINA','MIGUEL GONZALES','SLI587','','SUPERCENTRO D','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   8084096,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   1,'AP667124','TYM'),

  /* 02 – SXG787 – SUPERCENTRO, VALOR DE FLETE $550.000 */
  ('2026-06-23','Martes','ALPINA','ANDRES QUINTERO','SXG787','','SUPERCENTRO N','MANIZALES VILLAMARIA','',0,
   0,550000,'SXG787 VALOR DE FLETE $550.000',
   11040000,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 550000,
   1,'AP667123','TYM'),

  /* 03 – SYU652 – con facturas FEP */
  ('2026-06-23','Martes','ALPINA','JOHAN ECHEVERRY','SYU652','21363','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   4924079,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   49,'FEP1187853 FEP1187861','TYM'),

  /* 04 – KOL802 – sin adicional */
  ('2026-06-23','Martes','ALPINA','CAMILO CASTAÑO','KOL802','21364','9553','MANIZALES VILLAMARIA','LUIS CARLOS CADAVID RESTREPO',1,
   1,0,'-',
   5226835,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'19314','TYM'),

  /* 05 – WFV015 – sin adicional */
  ('2026-06-23','Martes','ALPINA','YONNI VALENCIA','WFV015','21365','9554','MANIZALES VILLAMARIA','CAMILO SUAREZ GARCIA, CRISTIAN CAMILO OSPINA PARRA',2,
   2,0,'-',
   7873873,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   53,'19315','TYM'),

  /* 06 – EYY183 – con factura FEP */
  ('2026-06-23','Martes','ALPINA','JOHN ARENAS','EYY183','21366','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6583618,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   60,'FEP1187791 19316','TYM'),

  /* 07 – TJX795 – con facturas FEP */
  ('2026-06-23','Martes','ALPINA','ANDRES QUINTERO','TJX795','21367','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   6458349,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   50,'FEP1187788-855-859','TYM'),

  /* 08 – WGZ876 – con factura AP */
  ('2026-06-23','Martes','ALPINA','RICARDO PINEDA','WGZ876','21368','9557','SUPIA','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   14150119,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 0,
   44,'AP664308 19318','TYM'),

  /* 09 – SMH182 – EXTRA $60.000 */
  ('2026-06-23','Martes','ALPINA','JUAN DAVID','SMH182','21370 21349','9559 7002','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'SMH182 EXTRA $60.000',
   7275264,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 60000,
   54,'19319','TYM'),

  /* 10 – EYX091 – SUPERMERCADOS SUPIA RIOSUCIO */
  ('2026-06-23','Martes','ALPINA','CARLOS GOMEZ','EYX091','21346','9560','RIOSUCIO-SUPIA SUPERMERCADO','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   13974082,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 0,
   6,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 11 – SPU120 – sin adicional */
  ('2026-06-23','Martes','ALPINA','OSWALDO','SPU120','21371','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   5995018,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 12 – VZD334 – sin adicional */
  ('2026-06-23','Martes','ALPINA','JULIAN CUELLAR','VZD334','21372','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'-',
   6642815,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 13 – EQY944 – sin adicional */
  ('2026-06-23','Martes','ALPINA','GOBER CRISTANCHO','EQY944','21373','9603','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   8922131,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   66,'19321 19322 19324 19325','TYM'),

  /* 14 – SXF257 – sin adicional */
  ('2026-06-23','Martes','ALPINA','FABIO RUIZ','SXF257','21374 21348','9604 7010','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS, JUAN JOSE CONTRERAS HERNANDEZ',2,
   2,0,'-',
   10317009,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   60,'19320','TYM'),

  /* 15 – WLS478 – sin adicional */
  ('2026-06-23','Martes','ALPINA','HUMBERTO RINCON','WLS478','21350','9605','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   5141741,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   39,'19323','TYM'),

  /* 16 – MAT480 – sin adicional */
  ('2026-06-23','Martes','ALPINA','ELKIN AGUIRRE','MAT480','21351','9606','CIRCASIA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   3422538,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   39,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 17 – SMO183 – sin adicional */
  ('2026-06-23','Martes','ALPINA','GABRIEL PEREZ','SMO183','21354','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   8019912,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 18 – XVI496 – sin adicional */
  ('2026-06-23','Martes','ALPINA','PABLO RAMIREZ','XVI496','21355','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7106521,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 19 – TMZ674 – sin adicional */
  ('2026-06-23','Martes','ALPINA','RICARDO LOPEZ','TMZ674','21356','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, ANDRES CAMILO MUÑOZ CAICEDO',2,
   2,0,'-',
   7085574,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   68,NULL,'TYM'),

  /* 20 – SPQ814 – sin adicional */
  ('2026-06-23','Martes','ALPINA','CARLOS VELASCO','SPQ814','21357','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5432598,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   50,'19329','TYM'),

  /* 21 – WHM317 – sin adicional */
  ('2026-06-23','Martes','ALPINA','HUMBERTO PARRA','WHM317','21358','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7258898,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 22 – PEK019 – sin adicional */
  ('2026-06-23','Martes','ALPINA','MIGUEL TABARES','PEK019','21359','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   6658303,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 23 – WHM896 – sin adicional */
  ('2026-06-23','Martes','ALPINA','ALEXANDER CUELLAR','WHM896','21360','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA, JHON FREDY MORENO',2,
   2,0,'-',
   9438252,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   67,NULL,'TYM'),

  /* 24 – WLC133 – sin adicional */
  ('2026-06-23','Martes','ALPINA','JULIAN','WLC133','21361','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, JOHAN STIVEN MUÑOZ RUIZ',2,
   2,0,'-',
   10878595,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   66,NULL,'TYM'),

  /* 25 – TNH494 – sin adicional */
  ('2026-06-23','Martes','ALPINA','ADALBERTO MEJIA','TNH494','21362','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   11350472,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   56,'19327','TYM'),

  /* 26 – WTN748 – ADICIONAL $26.000 FLEISCHMANN */
  ('2026-06-23','Martes','ALPINA','DIEGO RATIVA','WTN748','21375','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,26000,'WTN748 ADICIONAL $26.000 FLEISCHMANN',
   8557697,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 26000,
   64,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 27 – EST067 – sin adicional */
  ('2026-06-23','Martes','ALPINA','JORGE RIVILLAS','EST067','21376','7005','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   10396525,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARGELIA EL CAIRO' LIMIT 1) + 0,
   35,NULL,'TYM'),

  /* 28 – DQA454 – sin adicional */
  ('2026-06-23','Martes','ALPINA','LUIS MONTOYA','DQA454','21352 21343','7006 9450','SANTUARIO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   15793825,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1) + 0,
   53,'19326','TYM'),

  /* 29 – JVM223 – sin adicional */
  ('2026-06-23','Martes','ALPINA','WILMAR CARDONA','JVM223','21353 21344','7007 9451','BELEN DE UMBRIA','OSCAR MAURICIO RESTREPO MORENO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   11287032,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 30 – SQB119 – sin adicional */
  ('2026-06-23','Martes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19312','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   4726508,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   43,NULL,'TYM');

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
WHERE fecha = '2026-06-23'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
