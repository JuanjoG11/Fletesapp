/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: SÁBADO 25 JULIO 2026
   Generado: 2026-07-25
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: SQB119 tiene #VALOR! en Excel - valor_ruta = 0
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-25'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 25‑Jul‑2026
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
  ('2026-07-25','Sábado','ALPINA','JOHAN ECHEVERRY','SYU652','22326','9552','MANIZALES VILLAMARIA','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   5429900,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   56,'9919756','TYM'),

  /* 02 – KOL802 – con facturas AP */
  ('2026-07-25','Sábado','ALPINA','FREDY','KOL802','22305 22327','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   9240076,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   53,'AP695338 AP695340 9919757 9919761','TYM'),

  /* 03 – WFV015 – EXTRA $60.000 */
  ('2026-07-25','Sábado','ALPINA','YONNI VALENCIA','WFV015','22304 22328','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,60000,'WFV015 EXTRA $60.000',
   7298333,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   54,'9919758','TYM'),

  /* 04 – EYY183 – sin adicional */
  ('2026-07-25','Sábado','ALPINA','JOHN ARENAS','EYY183','22329','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6151499,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   55,'FEP9919753 9919762 9919754 9919759','TYM'),

  /* 05 – SLI587 – EXTRA $60.000 con factura AP */
  ('2026-07-25','Sábado','ALPINA','MIGUEL GONZALES','SLI587','22330','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,60000,'SLI587 EXTRA $60.000',
   9378658,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   56,'AP700171 9919760','TYM'),

  /* 06 – WGZ876 – sin adicional con facturas AP */
  ('2026-07-25','Sábado','ALPINA','RICARDO PINEDA','WGZ876','22331 22332','9557','QUINCHIA','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   10345226,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUINCHIA' LIMIT 1) + 0,
   51,'AP699580 AP699581 9919741','TYM'),

  /* 07 – WEP384 – con facturas AP */
  ('2026-07-25','Sábado','ALPINA','YOFER','WEP384','22333','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,0,'-',
   6986763,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   84,'AP700169 AP700170 AP699628 AP699676 AP699664 9919763','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 08 – WPP948 – VALOR FLETE $500.000 */
  ('2026-07-25','Sábado','ALPINA','SEBASTIAN OROZCO','WPP948','22316','7004','ARMENIA','',0,
   0,0,'WPP948 VALOR FLETE $500.000',
   12234405,
   500000,
   2,NULL,'TYM'),

  /* 09 – ETM037 – sin adicional */
  ('2026-07-25','Sábado','ALPINA','OSCAR MARIN','ETM037','22307 22334','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   5830933,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 10 – VZD334 – ADICIONAL $150.000 con factura AP */
  ('2026-07-25','Sábado','ALPINA','JULIAN CUELLAR','VZD334','22306 22335','9602','ARMENIA','SANTIAGO HENAO MORALES, CARLOS JIMENEZ',2,
   2,150000,'VZD334 ADICIONAL $150.000',
   13393395,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 150000,
   59,'AP700055','TYM'),

  /* 11 – EQY944 – sin adicional */
  ('2026-07-25','Sábado','ALPINA','GOBER CRISTANCHO','EQY944','22336','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, SEBASTIAN MONTES',2,
   2,0,'-',
   8383453,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 12 – SXF257 – sin adicional */
  ('2026-07-25','Sábado','ALPINA','FABIO RUIZ','SXF257','22337','9604','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS',1,
   1,0,'-',
   3746206,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 0,
   48,'9919765 9919764','TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-07-25','Sábado','ALPINA','HUMBERTO RINCON','WLS478','22309','9605','GENOVA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   5069784,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GENOVA' LIMIT 1) + 0,
   32,'9919766','TYM'),

  /* 14 – TTL256 – sin adicional */
  ('2026-07-25','Sábado','ALPINA','ANDRES QUINTERO','TTL256','22310','9606','CAIMO BARCELONA','CRISTIAN FABIAN CAMACHO MARTINEZ, CAMILO SUAREZ GARCIA',2,
   2,0,'-',
   6262766,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAIMO BARCELONA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-07-25','Sábado','ALPINA','GABRIEL PEREZ','SMO183','22317','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6270110,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 16 – SPU120 – EXTRA $40.000 (zona 9454 hoy) */
  ('2026-07-25','Sábado','ALPINA','OSWALDO','SPU120','22318','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,40000,'SPU120 EXTRA $40.000',
   7105111,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 40000,
   46,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-07-25','Sábado','ALPINA','RICARDO LOPEZ','TMZ674','22319','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5796678,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-07-25','Sábado','ALPINA','CARLOS VELASCO','SPQ814','22320','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   4523443,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 19 – WHM317 – sin adicional */
  ('2026-07-25','Sábado','ALPINA','HUMBERTO PARRA','WHM317','22321','9457','PEREIRA - DOSQUEBRADAS','JHON FREDY MORENO',1,
   1,0,'-',
   5526692,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-07-25','Sábado','ALPINA','MIGUEL TABARES','PEK019','22322','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   5172195,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 21 – XVI496 – sin adicional */
  ('2026-07-25','Sábado','ALPINA','PABLO RAMIREZ','XVI496','22323','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   6425577,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-07-25','Sábado','ALPINA','JULIAN','WLC133','22324','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, JUAN LARGO',2,
   2,0,'-',
   6367579,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-07-25','Sábado','ALPINA','ADALBERTO MEJIA','TNH494','22325','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   6277884,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 24 – WTN748 – sin adicional */
  ('2026-07-25','Sábado','ALPINA','DIEGO RATIVA','WTN748','22338','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   7677988,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,'9919755','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – EST067 – sin adicional */
  ('2026-07-25','Sábado','ALPINA','JORGE RIVILLAS','EST067','22339','7005','EL AGUILA','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5951864,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='EL AGUILA' LIMIT 1) + 0,
   23,NULL,'TYM'),

  /* 26 – ERK303 – sin adicional */
  ('2026-07-25','Sábado','ALPINA','JORGE ALARCON','ERK303','22311','7006','PUEBLO RICO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   15250751,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PUEBLO RICO' LIMIT 1) + 0,
   47,'9919767','TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-07-25','Sábado','ALPINA','WILMAR CARDONA','JVM223','22312','7007','GUATICA','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   10653809,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GUATICA' LIMIT 1) + 0,
   62,'9919769 9919768','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – valor_ruta 0 por #VALOR! en Excel */
  ('2026-07-25','Sábado','FLEISCHMANN','CARLOS CASTAÑO','SQB119','9919770 9919752','FLEISCHMANN','SANTA ROSA','DIEGO FRANCO',1,
   1,0,'-',
   0,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   57,NULL,'TYM');

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
WHERE fecha = '2026-07-25'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
