/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: SÁBADO 8 AGOSTO 2026
   (Programación dice "VIERNES-SABADO ENTREGA 2026")
   Generado: 2026-08-08
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: WGZ876 hoy zona 9555 Manizales (rotación sábado)
         EYY183 hoy zona 9557 Quinchia
         BCS450 placa nueva zona 9453 Pereira
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-08'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 08‑Ago‑2026
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
  ('2026-08-08','Sábado','ALPINA','JOHAN ECHEVERRY','SYU652','22709','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   4590633,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-08-08','Sábado','ALPINA','FREDY','KOL802','22710','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   6601234,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   55,'9919940','TYM'),

  /* 03 – WFV015 – sin adicional */
  ('2026-08-08','Sábado','ALPINA','YONNI VALENCIA','WFV015','22711','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   5443077,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   39,'9919941','TYM'),

  /* 04 – WGZ876 – sin adicional (hoy zona 9555 Manizales) */
  ('2026-08-08','Sábado','ALPINA','RICARDO PINEDA','WGZ876','22712','9555','MANIZALES VILLAMARIA','JHONNY LOPEZ',1,
   1,0,'-',
   6128114,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   58,'9919942','TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-08-08','Sábado','ALPINA','MIGUEL GONZALES','SLI587','22713','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   6850659,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   48,'9919944 9919943 9919939','TYM'),

  /* 06 – EYY183 – con factura FEP (hoy zona 9557 Quinchia) */
  ('2026-08-08','Sábado','ALPINA','JOHN ARENAS','EYY183','22714','9557','QUINCHIA','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   10495067,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUINCHIA' LIMIT 1) + 0,
   49,'FEP1191182 9919945','TYM'),

  /* 07 – EYX091 – EXTRA $80.000 (Aranzazu Filadelfia) */
  ('2026-08-08','Sábado','ALPINA','ANDRES GOMEZ','EYX091','22697','9558','ARANZAZU FILADELFIA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,80000,'EYX091 EXTRA $80.000',
   5963293,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARANZAZU FILADELFIA' LIMIT 1) + 80000,
   41,NULL,'TYM'),

  /* 08 – MAT480 – VALOR FLETE $650.000 */
  ('2026-08-08','Sábado','ALPINA','ELKIN AGUIRRE','MAT480','22686 22681 22687','UNO A SUPER DEL CENTRO','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'MAT480 VALOR FLETE $650.000',
   28281354,
   650000,
   4,NULL,'TYM'),

  /* 09 – WEP384 – EXTRA $60.000 */
  ('2026-08-08','Sábado','ALPINA','YOFER','WEP384','22715','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'WEP384 EXTRA $60.000',
   9202285,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 60000,
   78,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 10 – ETM037 – sin adicional */
  ('2026-08-08','Sábado','ALPINA','OSCAR MARIN','ETM037','22682 22716','9601','ARMENIA','YEISON DAVID RENDON SOTO, OSCAR MAURICIO RESTREPO MORENO',2,
   2,0,'-',
   9907575,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   67,NULL,'TYM'),

  /* 11 – VZD334 – EXTRA $40.000 */
  ('2026-08-08','Sábado','ALPINA','JULIAN CUELLAR','VZD334','22721 22717','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, CARLOS JIMENEZ',2,
   2,40000,'VZD334 EXTRA $40.000',
   6286244,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 40000,
   50,NULL,'TYM'),

  /* 12 – EQY944 – sin adicional */
  ('2026-08-08','Sábado','ALPINA','GOBER CRISTANCHO','EQY944','22718','9603','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   3010915,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 13 – SXF257 – sin adicional */
  ('2026-08-08','Sábado','ALPINA','FABIO RUIZ','SXF257','22689','9604','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   8833564,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   54,'9919928 9919929','TYM'),

  /* 14 – WLS478 – sin adicional */
  ('2026-08-08','Sábado','ALPINA','HUMBERTO RINCON','WLS478','22688 22692','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, VALENTINA GARCIA',2,
   2,0,'-',
   12969327,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 15 – TTL256 – sin adicional */
  ('2026-08-08','Sábado','ALPINA','ANDRES QUINTERO','TTL256','22691 22693','9606 9600','CIRCASIA','CRISTIAN FABIAN CAMACHO MARTINEZ, JHON FREDY MORENO',2,
   2,0,'-',
   6436188,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   55,'9919947','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 16 – BCS450 – sin adicional (placa nueva zona 9453) */
  ('2026-08-08','Sábado','ALPINA','CRISTIAN ZULUAGA','BCS450','22700','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   5680413,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 17 – SPU120 – sin adicional (zona 9454) */
  ('2026-08-08','Sábado','ALPINA','OSWALDO','SPU120','22701','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   6853653,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 18 – TMZ674 – sin adicional */
  ('2026-08-08','Sábado','ALPINA','RICARDO LOPEZ','TMZ674','22702','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   6672457,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 19 – SPQ814 – con factura FEP */
  ('2026-08-08','Sábado','ALPINA','CARLOS VELASCO','SPQ814','22703','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6379665,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   63,'FEP1191811','TYM'),

  /* 20 – WHM896 – sin adicional */
  ('2026-08-08','Sábado','ALPINA','ALEXANDER CUELLAR','WHM896','22704','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   6450160,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional */
  ('2026-08-08','Sábado','ALPINA','MIGUEL TABARES','PEK019','22705','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   7519902,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   64,NULL,'TYM'),

  /* 22 – XVI496 – sin adicional */
  ('2026-08-08','Sábado','ALPINA','PABLO RAMIREZ','XVI496','22706','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   6540338,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 23 – WLC133 – sin adicional */
  ('2026-08-08','Sábado','ALPINA','JULIAN','WLC133','22707','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, DANIELA CASTIBLANCO',2,
   2,0,'-',
   10674120,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   71,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional */
  ('2026-08-08','Sábado','ALPINA','ADALBERTO MEJIA','TNH494','22708','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   8123712,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 25 – WTN748 – sin adicional */
  ('2026-08-08','Sábado','ALPINA','DIEGO RATIVA','WTN748','22719','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   6844154,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 26 – EST067 – sin adicional */
  ('2026-08-08','Sábado','ALPINA','JORGE RIVILLAS','EST067','22694','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   7626296,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   27,NULL,'TYM'),

  /* 27 – ERK303 – sin adicional */
  ('2026-08-08','Sábado','ALPINA','JORGE ALARCON','ERK303','22679 22695','7006 9450','LA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   9226777,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='LA VIRGINIA' LIMIT 1) + 0,
   70,'9919949 9919950','TYM'),

  /* 28 – JVM223 – sin adicional */
  ('2026-08-08','Sábado','ALPINA','WILMAR CARDONA','JVM223','22680 22696','7007 9451','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   11164258,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   58,'9919952 9919951','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional */
  ('2026-08-08','Sábado','FLEISCHMANN','CARLOS CASTAÑO','SQB119','9919946 9919948 9919953 9919954','FLEISCHMANN','ARMENIA','SAMUEL ANDRES ARIAS',1,
   1,0,'-',
   4930841,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   79,NULL,'TYM');

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
WHERE fecha = '2026-08-08'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
