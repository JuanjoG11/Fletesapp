/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 7 JULIO 2026
   Generado: 2026-07-07
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-07'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 07‑Jul‑2026
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
  ('2026-07-07','Martes','ALPINA','JOHAN ECHEVERRY','SYU652','21780','9552','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   7025420,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 02 – KOL802 – con factura AP */
  ('2026-07-07','Martes','ALPINA','CAMILO CASTAÑO','KOL802','21781','9553','MANIZALES VILLAMARIA','LUIS CARLOS CADAVID RESTREPO',1,
   1,0,'-',
   7873348,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   51,'AP680797','TYM'),

  /* 03 – WFV015 – EXTRA $60.000 */
  ('2026-07-07','Martes','ALPINA','YONNI VALENCIA','WFV015','21782','9554','MANIZALES VILLAMARIA','JHON FREDY MORENO',1,
   1,60000,'WFV015 EXTRA $60.000',
   8946498,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   58,'19494','TYM'),

  /* 04 – EYY183 – sin adicional */
  ('2026-07-07','Martes','ALPINA','JOHN ARENAS','EYY183','21783 21762','9555 7000','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6340111,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'19493','TYM'),

  /* 05 – SLI587 – con factura AP */
  ('2026-07-07','Martes','ALPINA','MIGUEL GONZALES','SLI587','21784','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   9587133,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   49,'AP680796 19496','TYM'),

  /* 06 – WGZ876 – EXTRA $60.000 */
  ('2026-07-07','Martes','ALPINA','RICARDO PINEDA','WGZ876','21785','9557','SUPIA','ANDRES MATEO VILLALBA DIAZ',1,
   1,60000,'WGZ876 EXTRA $60.000',
   9260377,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 60000,
   44,'19497','TYM'),

  /* 07 – SMH182 – sin adicional */
  ('2026-07-07','Martes','ALPINA','JUAN DAVID','SMH182','21787','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,0,'-',
   8493595,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   68,'19498','TYM'),

  /* 08 – EYX091 – sin adicional (SUPIA RIOSUCIO SUPER) */
  ('2026-07-07','Martes','ALPINA','ANDRES GOMEZ','EYX091','21760','9560','RIOSUCIO-SUPIA SUPERMERCADO','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   14320256,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 0,
   8,NULL,'TYM'),

  /* 09 – TRL186 – VALOR DE FLETE $450.000 */
  ('2026-07-07','Martes','ALPINA','WILLIAM','TRL186','21795','7008','CALARCA','',0,
   0,450000,'TRL186 VALOR DE FLETE $450.000',
   12604525,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 450000,
   1,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 10 – SPU120 – sin adicional */
  ('2026-07-07','Martes','ALPINA','OSWALDO','SPU120','21788 21763','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   8119597,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 11 – ETM037 – con factura AP */
  ('2026-07-07','Martes','ALPINA','OSCAR','ETM037','21789','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'-',
   7969934,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   60,'AP680803','TYM'),

  /* 12 – SXF257 – con facturas AP */
  ('2026-07-07','Martes','ALPINA','FABIO RUIZ','SXF257','21791','9604','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS, SEBASTIAN MONTES',2,
   2,0,'-',
   10008804,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   57,'AP680801-802 19500','TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-07-07','Martes','ALPINA','HUMBERTO RINCON','WLS478','21767','9605','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   6405730,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   45,'19502','TYM'),

  /* 14 – TTL256 – sin adicional */
  ('2026-07-07','Martes','ALPINA','ANDRES QUINTERO','TTL256','21768','9606','CIRCASIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   3051999,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   30,'19504','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-07-07','Martes','ALPINA','GABRIEL PEREZ','SMO183','21771','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   10177105,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   61,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional */
  ('2026-07-07','Martes','ALPINA','JULIAN CUELLAR','VZD334','21772','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   8209447,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-07-07','Martes','ALPINA','RICARDO LOPEZ','TMZ674','21773','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   9060854,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   67,'19506','TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-07-07','Martes','ALPINA','CARLOS VELASCO','SPQ814','21774','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6728963,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 19 – WHM317 – sin adicional */
  ('2026-07-07','Martes','ALPINA','HUMBERTO PARRA','WHM317','21775','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   9657028,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-07-07','Martes','ALPINA','MIGUEL TABARES','PEK019','21776','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   9436873,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 21 – WHM896 – sin adicional */
  ('2026-07-07','Martes','ALPINA','ALEXANDER CUELLAR','WHM896','21777','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   10665713,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   68,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-07-07','Martes','ALPINA','JULIAN','WLC133','21765 21778','9460 E7001','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   18016755,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   70,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-07-07','Martes','ALPINA','ADALBERTO MEJIA','TNH494','21779','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   6160918,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 24 – WTN748 – sin adicional */
  ('2026-07-07','Martes','ALPINA','DIEGO RATIVA','WTN748','21792','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, CAMILO SUAREZ GARCIA',2,
   2,0,'-',
   9996088,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   66,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – EST067 – sin adicional */
  ('2026-07-07','Martes','ALPINA','JORGE RIVILLAS','EST067','21793','7005','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   10604640,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARGELIA EL CAIRO' LIMIT 1) + 0,
   36,NULL,'TYM'),

  /* 26 – ERK303 – ADICIONAL $50.000 ENTREGA SUPER VIRGINIA */
  ('2026-07-07','Martes','ALPINA','JORGE ALARCON','ERK303','21757 21769','7006 9450','SANTUARIO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,50000,'ERK303 ADICIONAL $50.000 ENTREGA DE SUPER VIRGINIA',
   17008184,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1) + 50000,
   56,'19492 19505','TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-07-07','Martes','ALPINA','WILMAR CARDONA','JVM223','21758 21770','7007 9451','BELEN DE UMBRIA','OSCAR MAURICIO RESTREPO MORENO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   9699498,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-07-07','Martes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19499','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   5434630,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   48,NULL,'TYM');

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
WHERE fecha = '2026-07-07'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
