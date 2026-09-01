/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 27 AGOSTO 2026
   Generado: 2026-08-27
   ✅ Nombres de auxiliares normalizados según lista oficial
   Notas:
     - SLI587  EXTRA $60.000
     - WEP384  EXTRA $60.000
     - WFV015  CALARCA → precio fijo $650.000
     - WTN748  EXTRA $60.000
     - CARLOS JIMENEZ      → CARLOS ALBERTO JIMENEZ JACOME
     - JHONNY LOPEZ        → YHONY ALEXANDER LOPEZ LOPEZ
     - VALENTINA GARCIA    → VALENTINA GARCIA GOMEZ
     - DANIELA CASTIBLANCO → DANIELA CASTIBLANCO RAMIREZ
     - MANUEL RAMIREZ      → MANUEL ALEJANDRO RAMIREZ OVALLE
     - SAMUEL ARIAS        → SAMUEL ANDRES ARIAS ARCILA
     - DIEGO FRANCO        → JUAN DIEGO FRANCO VERGARA
     - QUEBIN LOTERO: no está en lista oficial ALPINA
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-27'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 27‑Ago‑2026
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
  ('2026-08-27','Jueves','ALPINA','JOHAN ECHEVERRY','SYU652','23256','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   6905300,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   46,'AP728629','TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','FREDY','KOL802','23229 23257 20190 20189','9553 9550GALERIA','MANIZALES VILLAMARIA','CARLOS ALBERTO JIMENEZ JACOME, YHONY ALEXANDER LOPEZ LOPEZ',2,
   2,0,'-',
   8974293,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   37,NULL,'TYM'),

  /* 03 – EYX091 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','ANDRES GOMEZ','EYX091','23246 20187','9554','NEIRA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   8867641,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 04 – SPU120 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','OSWALDO','SPU120','23258 20192','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6355846,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 05 – SLI587 – EXTRA $60.000 */
  ('2026-08-27','Jueves','ALPINA','MIGUEL GONZALES','SLI587','23238 23259 20191 20193','9556 E7000CONSUMO','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE, YHONY ALEXANDER LOPEZ LOPEZ',2,
   2,60000,'SLI587 EXTRA $60.000',
   4759670,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   41,NULL,'TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','RICARDO PINEDA','WGZ876','23240','9557','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   11127354,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 07 – WEP384 – EXTRA $60.000 */
  ('2026-08-27','Jueves','ALPINA','YOFER LOPEZ','WEP384','23260 20188','9559','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'WEP384 EXTRA $60.000',
   11859292,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RDA S JOSE BELALCAZAR' LIMIT 1) + 60000,
   56,NULL,'TYM'),

  /* ── WFV015 – CALARCA – PRECIO FIJO $650.000 ────────────────── */

  /* 08 – WFV015 – VALOR DE FLETE $650.000 */
  ('2026-08-27','Jueves','ALPINA','YONNI VALENCIA','WFV015','23231','7008','CALARCA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'VALOR DE FLETE $650.000',
   20028981,
   650000,
   3,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 09 – ETM037 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','OSCAR MARIN','ETM037','23232 23261','9601 7009 P/ESPEJO','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   9930580,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 10 – TJX795 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','ANDRES QUINTERO','TJX795','23192 23262','9602 7009 LA19','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   8895888,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','GOBER CRISTANCHO','EQY944','23263','9603 EXITOLA16','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   6137270,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   60,'AP726954','TYM'),

  /* 12 – SXF257 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','FABIO RUIZ','SXF257','23264 20197','9604','ALCALA ULLOA','CAMILO ANDRES CONTRERAS RIVAS, VALENTINA GARCIA GOMEZ',2,
   2,0,'-',
   9018932,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','HUMBERTO RINCON','WLS478','23233 20183','9605','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   10789925,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 14 – BCS450 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','CRISTIAN ZULUAGA','BCS450','23230 23234 20196 20165','9606 9600','FILANDIA','DANIELA CASTIBLANCO RAMIREZ',1,
   1,0,'-',
   6282526,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1) + 0,
   33,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','GABRIEL PEREZ','SMO183','23248','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   5928309,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','JULIAN CUELLAR','VZD334','23249','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO, SAMUEL ANDRES ARIAS ARCILA',2,
   2,0,'-',
   11188882,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   76,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','RICARDO LOPEZ','TMZ674','23243','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5137378,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','CARLOS VELASCO','SPQ814','23250 23242','9456 7002MERCALOCURA','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5638221,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   34,NULL,'TYM'),

  /* 19 – WTN748 – EXTRA $60.000 */
  ('2026-08-27','Jueves','ALPINA','DIEGO RATIVA','WTN748','23251 20182','9457','ARABIA ALTAGRACIA','JHON FREDY MORENO',1,
   1,60000,'WTN748 EXTRA $60.000',
   5418470,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARABIA ALTAGRACIA' LIMIT 1) + 60000,
   45,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','MIGUEL TABARES','PEK019','23252','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   5672918,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   41,NULL,'TYM'),

  /* 21 – LUM993 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','PABLO RAMIREZ','LUM993','23253','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   7201799,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   48,'AP729252-253','TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','JULIAN','WLC133','23254','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   5360237,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   38,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','ADALBERTO MEJIA','TNH494','23255','9461 SUPERMISCELANEA','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   6357283,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   57,'AP729340 AP729628','TYM'),

  /* 24 – WFQ635 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','JHENCY LOPEZ','WFQ635','23265 20181','7004','MARSELLA','BRAHIAN STIVEN VALENCIA IGLESIAS, QUEBIN LOTERO',2,
   2,0,'-',
   11798029,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARSELLA' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – EST067 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','JORGE RIVILLAS','EST067','23266','7005 MERCAPLAZA','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   7790213,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   48,'AP729629','TYM'),

  /* 26 – ERK303 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','JORGE ALARCON','ERK303','23235 20180','7006','APIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   11649365,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-08-27','Jueves','ALPINA','WILMAR CARDONA','JVM223','23228 23237 20185','7007 9451','VITERBO','LUIS CARLOS CADAVID RESTREPO, MANUEL ALEJANDRO RAMIREZ OVALLE',2,
   2,0,'-',
   12474390,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1) + 0,
   66,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-08-27','Jueves','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20195','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','JUAN DIEGO FRANCO VERGARA',1,
   1,0,'-',
   4797880,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   37,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-08-27'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
