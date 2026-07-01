/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 26 JUNIO 2026
   Generado: 2026-06-26
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-26'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 26‑Jun‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – EQN953 – VALOR DE FLETE $500.000 */
  ('2026-06-26','Viernes','ALPINA','ORLANDO VASQUEZ','EQN953','21473','7002','CHINCHINA','JHON FREDY MORENO',1,
   1,500000,'EQN953 VALOR DE FLETE $500.000',
   20372743,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 500000,
   7,NULL,'TYM'),

  /* 02 – TRL186 – sin adicional */
  ('2026-06-26','Viernes','ALPINA','WILLIAM','TRL186','21471','9560','SUPIA','ANDRES MATEO VILLALBA DIAZ',1,
   1,0,'-',
   10958717,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 0,
   6,NULL,'TYM'),

  /* 03 – SYU652 – con facturas FEP+AP */
  ('2026-06-26','Viernes','ALPINA','JOHAN ECHEVERRY','SYU652','21493','9552','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   6372612,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'FEP1188216 AP671286','TYM'),

  /* 04 – KOL802 – con factura AP */
  ('2026-06-26','Viernes','ALPINA','CAMILO CASTAÑO','KOL802','21453TSS 21494','9553','MANIZALES VILLAMARIA','LUIS CARLOS CADAVID RESTREPO',1,
   1,0,'-',
   6709897,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   47,'AP671270 19373','TYM'),

  /* 05 – WFV015 – con factura AP */
  ('2026-06-26','Viernes','ALPINA','YONNI VALENCIA','WFV015','21495','9554','MANIZALES VILLAMARIA','CAMILO SUAREZ GARCIA, CRISTIAN CAMILO OSPINA PARRA',2,
   2,0,'-',
   7086794,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   42,'AP671273 19374','TYM'),

  /* 06 – EYY183 – sin adicional */
  ('2026-06-26','Viernes','ALPINA','JOHN ARENAS','EYY183','21496','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6641463,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   59,'19375','TYM'),

  /* 07 – SLI587 – con facturas FEP+AP */
  ('2026-06-26','Viernes','ALPINA','MIGUEL GONZALES','SLI587','21497','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   8971252,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   54,'FEP1188210-214 AP671271 19376','TYM'),

  /* 08 – WGZ876 – EXTRA $60.000 */
  ('2026-06-26','Viernes','ALPINA','RICARDO PINEDA','WGZ876','21498','9557','SUPIA','JUAN MANUEL DELGADO NARVAEZ',1,
   1,60000,'WGZ876 EXTRA $60.000',
   9206195,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 60000,
   28,NULL,'TYM'),

  /* 09 – EYX091 – sin adicional */
  ('2026-06-26','Viernes','ALPINA','CARLOS GOMEZ','EYX091','21482','9558','PACORA SALAMINA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   6109098,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1) + 0,
   40,NULL,'TYM'),

  /* 10 – SMH182 – sin adicional */
  ('2026-06-26','Viernes','ALPINA','JUAN DAVID','SMH182','21499','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,0,'-',
   8785253,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   73,'19378','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 11 – SPU120 – con factura AP */
  ('2026-06-26','Viernes','ALPINA','OSWALDO','SPU120','21500','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   7316712,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   56,'AP671285','TYM'),

  /* 12 – VZD334 – con factura AP */
  ('2026-06-26','Viernes','ALPINA','JULIAN CUELLAR','VZD334','21501','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'-',
   7670673,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   45,'AP671279','TYM'),

  /* 13 – EQY944 – sin adicional */
  ('2026-06-26','Viernes','ALPINA','GOBER CRISTANCHO','EQY944','21502','9603','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   4199521,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 14 – SXF257 – ADICIONAL $150.000 ENTREGA NEGOCIACION */
  ('2026-06-26','Viernes','ALPINA','FABIO RUIZ','SXF257','21503','9604','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS, SANTIAGO HENAO MORALES',2,
   2,150000,'SXF257 ADICIONAL AL FLETE $150.000 ENTREGA DE NEGOCIACION',
   12449467,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 150000,
   64,'AP669891 19361','TYM'),

  /* 15 – WLS478 – ADICIONAL $150.000 ENTREGA NEGOCIACION */
  ('2026-06-26','Viernes','ALPINA','HUMBERTO RINCON','WLS478','21504 21475','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, JUAN JOSE CONTRERAS HERNANDEZ',2,
   2,150000,'WLS478 ADICIONAL AL FLETE $150.000 ENTREGA DE NEGOCIACION',
   13166563,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 150000,
   43,'AP669890','TYM'),

  /* 16 – TTL256 – ADICIONAL $50.000 ENTRADA FILANDIA SUPER */
  ('2026-06-26','Viernes','ALPINA','YIMERSON GARCIA','TTL256','21437TSS 21505','9606','CIRCASIA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,50000,'TTL256 ADICIONAL AL FLETE $50.000 ENTRADA A FILANDIA SUPER',
   7949039,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 50000,
   46,'AP671295-296 19379','TYM'),

  /* 17 – TUL630 – EXTRA $60.000 */
  ('2026-06-26','Viernes','ALPINA','JUAN DAVID','TUL630','21511','7004','PEREIRA - DOSQUEBRADAS','',0,
   0,60000,'TUL630 EXTRA $60.000',
   3680000,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   1,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 18 – SMO183 – sin adicional */
  ('2026-06-26','Viernes','ALPINA','GABRIEL PEREZ','SMO183','21484','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6040727,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 19 – XVI496 – sin adicional */
  ('2026-06-26','Viernes','ALPINA','PABLO RAMIREZ','XVI496','21485','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7284863,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 20 – TMZ674 – sin adicional */
  ('2026-06-26','Viernes','ALPINA','RICARDO LOPEZ','TMZ674','21486','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5105057,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 21 – SPQ814 – sin adicional */
  ('2026-06-26','Viernes','ALPINA','CARLOS VELASCO','SPQ814','21487','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5021536,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 22 – WHM317 – sin adicional */
  ('2026-06-26','Viernes','ALPINA','HUMBERTO PARRA','WHM317','21488','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ, JOHAN STIVEN MUÑOZ RUIZ',2,
   2,0,'-',
   7729203,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   64,NULL,'TYM'),

  /* 23 – PEK019 – sin adicional */
  ('2026-06-26','Viernes','ALPINA','MIGUEL TABARES','PEK019','21489','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   5336570,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 24 – WHM896 – sin adicional */
  ('2026-06-26','Viernes','ALPINA','ALEXANDER CUELLAR','WHM896','21490','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   7144068,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 25 – WLC133 – sin adicional */
  ('2026-06-26','Viernes','ALPINA','JULIAN','WLC133','21491','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   12718410,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   69,NULL,'TYM'),

  /* 26 – TNH494 – ADICIONAL $50.000 ENTREGA PEDIDO ZENU */
  ('2026-06-26','Viernes','ALPINA','ADALBERTO MEJIA','TNH494','21492','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,50000,'TNH494 ADICIONAL $50.000 ENTREGA PEDIDO DE ZENU',
   11652070,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 50000,
   54,'AP671261','TYM'),

  /* 27 – WTN748 – sin adicional */
  ('2026-06-26','Viernes','ALPINA','DIEGO RATIVA','WTN748','21506','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   5819648,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 28 – EST067 – sin adicional */
  ('2026-06-26','Viernes','ALPINA','JORGE RIVILLAS','EST067','21507','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5180022,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 29 – ERK303 – sin adicional */
  ('2026-06-26','Viernes','ALPINA','JORGE ALARCON','ERK303','21508','7006','APIA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   11635452,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 0,
   59,'AP671260-262-263 19380','TYM'),

  /* 30 – JVM223 – sin adicional */
  ('2026-06-26','Viernes','ALPINA','WILMAR CARDONA','JVM223','21469 21509','7007 9451','BELEN DE UMBRIA','OSCAR MAURICIO RESTREPO MORENO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   15435450,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   67,'19381','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 31 – SQB119 – sin adicional */
  ('2026-06-26','Viernes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19371 19382','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   7452233,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   58,NULL,'TYM');

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
WHERE fecha = '2026-06-26'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
