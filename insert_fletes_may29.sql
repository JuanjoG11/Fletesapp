/* ==============================================================
   PROGRAMACION VIERNES 29 MAYO 2026
   Generado: 2026-05-29T19:18:24.079Z
   ============================================================== */

/* 1. Limpiar registros del día para evitar duplicados */
DELETE FROM fletes
WHERE fecha = '2026-05-29'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* 2. Insertar fletes */
INSERT INTO fletes (
  fecha, dia, proveedor, contratista, placa,
  no_planilla, zona, poblacion,
  auxiliares, no_auxiliares,
  adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
  valor_ruta, precio,
  no_pedidos, facturas_adicionales, razon_social
)
VALUES
  /* 01 – SNL038 */
  ('2026-05-29','Viernes','ALPINA','MIGUEL','SNL038',
   '-','7002','CHINCHINA NEGOCIACION',
   'NO APLICA',0,
   0,0,'VALOR DE FLETE $650.000 INCLUYE DESCARGUE',
   20263700,
   650000,
   1,'AP643677','TYM'),

  /* 02 – SYU652 */
  ('2026-05-29','Viernes','ALPINA','JOHAN ECHEVERRY','SYU652',
   '20675','9552','MANIZALES',
   'EDWAR ZAPATA',1,
   1,0,'-',
   10454818,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
   48,'FEP1185774 FEP1185779 AP643733','TYM'),

  /* 03 – KOL802 */
  ('2026-05-29','Viernes','ALPINA','CAMILO CASTAÑO','KOL802',
   '20654 20658 20676 18991','9553 9550 7001','VILLAMARIA',
   'GERMAN GALVEZ, CRISTIAN OSPINA',2,
   2,0,'-',
   10916199,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VILLAMARIA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 04 – WFV015 */
  ('2026-05-29','Viernes','ALPINA','YONNI VALENCIA','WFV015',
   '20677 18989 18992','9554','MANIZALES',
   'YEISON TABARES',1,
   1,0,'-',
   9626264,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
   53,'AP643734','TYM'),

  /* 05 – EYY183 */
  ('2026-05-29','Viernes','ALPINA','RUBEN','EYY183',
   '20678 18993','9555','MANIZALES',
   'JUAN ALEJANDRO',1,
   1,0,'-',
   6890882,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 06 – SLI587 */
  ('2026-05-29','Viernes','ALPINA','MIGUEL GONZALES','SLI587',
   '20679 18995 18994','9556','MANIZALES',
   'ADRIAN MARTINEZ',1,
   1,0,'-',
   6614079,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
   49,'FEP1185776','TYM'),

  /* 07 – WGZ876 */
  ('2026-05-29','Viernes','ALPINA','RICARDO PINEDA','WGZ876',
   '20655 20680','9557 9560','KM41 IRRA FELISA SUPIA RIOSUCIO',
   'JUAN DELGADO, MATEO VILLALBA',2,
   2,150000,'WGZ876 ADICIONAL AL FLETE $150.000 ENTREGA DE SUPERMERCADOS',
   15032867,
   15032867,
   37,NULL,'TYM'),

  /* 08 – EYX091 */
  ('2026-05-29','Viernes','ALPINA','CARLOS GOMEZ','EYX091',
   '20662 20642 18973','9558','PACORA SALAMINA',
   'VICTOR PULGARIN, JUAN COCOMA',2,
   2,0,'-',
   11139211,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1) + 0,
   67,NULL,'TYM'),

  /* 09 – TRL186 */
  ('2026-05-29','Viernes','ALPINA','RUBEN','TRL186',
   '20659','7002','CHINCHINA',
   'MILTON OSORIO',1,
   1,0,'-',
   17462374,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   5,'AP636699TSS','TYM'),

  /* 10 – SMH182 */
  ('2026-05-29','Viernes','ALPINA','JUAN DAVID','SMH182',
   '20681 18998','9559','CHINCHINA',
   'BRANDON BAEZ',1,
   1,60000,'SMH182 EXTRA $60.000',
   9865365,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 60000,
   78,NULL,'TYM'),

  /* 11 – SPU120 */
  ('2026-05-29','Viernes','ALPINA','OSWALDO','SPU120',
   '20682','9601','ARMENIA',
   'YEISON RENDON',1,
   1,0,'-',
   7732968,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   59,'AP643742','TYM'),

  /* 12 – VZD334 */
  ('2026-05-29','Viernes','ALPINA','JULIAN CUELLAR','VZD334',
   '20683','9602','ARMENIA',
   'JOHAN MUÑOZ',1,
   1,0,'-',
   7253750,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   49,'AP643741','TYM'),

  /* 13 – EQY944 */
  ('2026-05-29','Viernes','ALPINA','GOBER CRISTANCHO','EQY944',
   '20684 19001 19000','9603','CALARCA',
   'ALEXANDER COSTAIN',1,
   1,0,'-',
   5299728,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 14 – SXF257 */
  ('2026-05-29','Viernes','ALPINA','FABIO RUIZ','SXF257',
   '20685 18977','9604','MONTENEGRO P/TAPAO',
   'CAMILO CONTRERAS',1,
   1,0,'-',
   7927756,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO P/TAPAO' LIMIT 1) + 0,
   65,'AP643746','TYM'),

  /* 15 – WLS478 */
  ('2026-05-29','Viernes','ALPINA','HUMBERTO RINCON','WLS478',
   '20686 19002','9605','TEBAIDA',
   'CRISTIAN CAICEDO, CAMILO SUAREZ',2,
   2,0,'-',
   14379657,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   44,'AP643743-744-745','TYM'),

  /* 16 – TTL256 */
  ('2026-05-29','Viernes','ALPINA','YIMERSON GARCIA','TTL256',
   '20687 20656 19003','9606 9600','CIRCASIA',
   'CRISTIAN CAMACHO',1,
   1,0,'-',
   7802440,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 17 – SMO183 */
  ('2026-05-29','Viernes','ALPINA','GABRIEL PEREZ','SMO183',
   '20666','9453','PEREIRA',
   'JUAN QUINTERO',1,
   1,0,'-',
   5833174,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 18 – LUM993 */
  ('2026-05-29','Viernes','ALPINA','PABLO RAMIIREZ','LUM993',
   '20667','9454','PEREIRA',
   'ANDRES PINEDA',1,
   1,0,'-',
   5777842,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 19 – TMZ674 */
  ('2026-05-29','Viernes','ALPINA','RICARDO LOPEZ','TMZ674',
   '20668','9455','PEREIRA',
   'ANDRES RIOS',1,
   1,60000,'TMZ674 EXTRA $60.000',
   6235143,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 60000,
   50,NULL,'TYM'),

  /* 20 – SPQ814 */
  ('2026-05-29','Viernes','ALPINA','CARLOS VELASCO','SPQ814',
   '20669','9456','SANTA ROSA',
   'SANTIAGO HENAO',1,
   1,0,'-',
   5361192,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 21 – WHM317 */
  ('2026-05-29','Viernes','ALPINA','HUMBERTO PARRA','WHM317',
   '20670','9457','PEREIRA',
   'ESTEBAN GALLEGO',1,
   1,0,'-',
   6796766,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 22 – PEK019 */
  ('2026-05-29','Viernes','ALPINA','MIGUEL TABARES','PEK019',
   '20671','9458','PEREIRA',
   'JHON GIRALDO',1,
   1,0,'-',
   4748044,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 23 – WHM896 */
  ('2026-05-29','Viernes','ALPINA','ALEXANDER CUELLAR','WHM896',
   '20672','9459','PEREIRA',
   'CAMILO PEÑA',1,
   1,0,'-',
   7767215,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   64,NULL,'TYM'),

  /* 24 – WLC133 */
  ('2026-05-29','Viernes','ALPINA','JULIAN','WLC133',
   '20673','9460','PEREIRA',
   'EDWIN GOMEZ, JUAN CONTRERAS',2,
   2,0,'-',
   10625814,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   66,NULL,'TYM'),

  /* 25 – JVM223 */
  ('2026-05-29','Viernes','ALPINA','WILMAR CARDONA','JVM223',
   '20674','9461','CARTAGO',
   'DIORLAN FLOREZ',1,
   1,0,'-',
   7489958,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 26 – WTN748 */
  ('2026-05-29','Viernes','ALPINA','DIEGO RATIVA','WTN748',
   '20688','7004','PEREIRA',
   'BRAHIAN VALENCIA',1,
   1,60000,'WTN748 EXTRA $60.000',
   6931156,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 60000,
   50,NULL,'TYM'),

  /* 27 – EST067 */
  ('2026-05-29','Viernes','ALPINA','JORGE RIVILLAS','EST067',
   '20689','7005','CARTAGO',
   'CESAR CASTILLO',1,
   1,0,'-',
   4583099,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   40,NULL,'TYM'),

  /* 28 – ERK303 */
  ('2026-05-29','Viernes','ALPINA','JORGE ALARCON','ERK303',
   '20690 20652 19005 19004','7006 9450','VIRGINIA',
   'ROBINSON TORRES',1,
   1,60000,'ERK303 EXTRA $60.000',
   10544342,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VIRGINIA' LIMIT 1) + 60000,
   69,NULL,'TYM'),

  /* 29 – TNH494 */
  ('2026-05-29','Viernes','ALPINA','ADALBERTO MEJIA','TNH494',
   '20653 20691 19006','7007 9451','BELEN MISTRATO',
   'CAMILO MUÑOZ, EXTRA MORENO',2,
   2,0,'-',
   16178786,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN MISTRATO' LIMIT 1) + 0,
   67,NULL,'TYM'),

  /* 30 – SQB119 */
  ('2026-05-29','Viernes','FLEISCHMANN','CARLOS CASTAÑO','SQB119',
   '18999','FLEISCHMANN','ARMENIA',
   'DIEGO FRANCO',1,
   1,0,'-',
   8140889,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   47,'FEP1185843 FEP1185852','TYM');

/* 3. Verificación */
SELECT placa, proveedor, precio, valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo, no_pedidos
FROM fletes
WHERE fecha = '2026-05-29'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
