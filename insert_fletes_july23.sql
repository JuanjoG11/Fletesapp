/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 23 JULIO 2026
   Generado: 2026-07-23
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: WFVO15 corregido a WFV015
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-23'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 23‑Jul‑2026
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
  ('2026-07-23','Jueves','ALPINA','JOHAN ECHEVERRY','SYU652','22245','9552','MANIZALES VILLAMARIA','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   5639168,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   46,'9919719','TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','FREDY','KOL802','22246','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   4592374,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'9919720','TYM'),

  /* 03 – EYX091 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','CARLOS GOMEZ','EYX091','22235','9554','NEIRA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   7437573,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1) + 0,
   56,'9919721','TYM'),

  /* 04 – EYY183 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','JOHN ARENAS','EYY183','22247','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   5880695,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   51,'9919718 9919722','TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','MIGUEL GONZALES','SLI587','22248','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   5499004,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   58,'9919725 9919723','TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','RICARDO PINEDA','WGZ876','22249','9557','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   11802318,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1) + 0,
   60,'9919705','TYM'),

  /* 07 – TRL186 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','WILLIAM','TRL186','22251','9559','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ, JUAN LARGO',2,
   2,0,'-',
   10991118,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RDA S JOSE BELALCAZAR' LIMIT 1) + 0,
   59,'9919726','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 08 – WFV015 – ADICIONAL $150.000 DESCARGUE */
  ('2026-07-23','Jueves','ALPINA','YONNI VALENCIA','WFV015','22229','7008','CALARCA','',0,
   0,150000,'WFV015 ADICIONAL $150.000 DESCARGUE',
   12760099,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 150000,
   3,NULL,'TYM'),

  /* 09 – SPU120 – EXTRA $60.000 */
  ('2026-07-23','Jueves','ALPINA','OSWALDO','SPU120','22230 22252','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,60000,'SPU120 EXTRA $60.000',
   7583337,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 60000,
   59,NULL,'TYM'),

  /* 10 – ETM037 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','OSCAR MARIN','ETM037','22253','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, CARLOS JIMENEZ',2,
   2,0,'-',
   6396413,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 11 – EQY944 – con factura AP */
  ('2026-07-23','Jueves','ALPINA','GOBER CRISTANCHO','EQY944','22254','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   6144631,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   61,'AP695942','TYM'),

  /* 12 – SXF257 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','FABIO RUIZ','SXF257','22255','9604','ALCALA ULLOA','CAMILO ANDRES CONTRERAS RIVAS',1,
   1,0,'-',
   7078415,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1) + 0,
   47,'9919729','TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','HUMBERTO RINCON','WLS478','22231','9605','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, SEBASTIAN MONTES',2,
   2,0,'-',
   10445843,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1) + 0,
   60,'9919730','TYM'),

  /* 14 – TTL256 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','ANDRES QUINTERO','TTL256','22227 22232','9606','FILANDIA','CRISTIAN FABIAN CAMACHO MARTINEZ, CAMILO SUAREZ GARCIA',2,
   2,0,'-',
   7920337,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1) + 0,
   43,'9919733','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','GABRIEL PEREZ','SMO183','22236','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6068346,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','JULIAN CUELLAR','VZD334','22237','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7909041,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   61,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','RICARDO LOPEZ','TMZ674','22238','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5097604,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','CARLOS VELASCO','SPQ814','22228 22239','9456 7002','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5813791,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 19 – WHM317 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','HUMBERTO PARRA','WHM317','22240','9457','ARABIA ALTAGRACIA','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   5027463,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARABIA ALTAGRACIA' LIMIT 1) + 0,
   54,'9919716','TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','MIGUEL TABARES','PEK019','22241','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   4851024,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 21 – XVI496 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','PABLO RAMIREZ','XVI496','22242','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   6881605,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','JULIAN','WLC133','22243','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, JUAN JOSE CONTRERAS HERNANDEZ',2,
   2,0,'-',
   5827117,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   41,NULL,'TYM'),

  /* 23 – TNH494 – con factura AP */
  ('2026-07-23','Jueves','ALPINA','ADALBERTO MEJIA','TNH494','22225 22244','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   8664696,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   51,'AP696411','TYM'),

  /* 24 – WTN748 – EXTRA $60.000 */
  ('2026-07-23','Jueves','ALPINA','DIEGO RATIVA','WTN748','22256','7004','MARSELLA','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,60000,'WTN748 EXTRA $60.000',
   9574913,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARSELLA' LIMIT 1) + 60000,
   51,'9919715','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – EST067 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','JORGE RIVILLAS','EST067','22257','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5929318,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   42,NULL,'TYM'),

  /* 26 – ERK303 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','JORGE ALARCON','ERK303','22233','7006','APIA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   8575191,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 0,
   50,'9919717','TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-07-23','Jueves','ALPINA','WILMAR CARDONA','JVM223','22226 22234','7007 9451','VITERBO','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   13445459,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1) + 0,
   67,'9919732','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-07-23','Jueves','FLEISCHMANN','CARLOS CASTAÑO','SQB119','9919731 9919727','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   7593963,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   41,NULL,'TYM');

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
WHERE fecha = '2026-07-23'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
