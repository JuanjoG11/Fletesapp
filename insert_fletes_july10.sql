/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 10 JULIO 2026
   Generado: 2026-07-14
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: TRL186 sale dos veces con conductores distintos
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-10'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 10‑Jul‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – TUL630 – VALOR DE FLETE $450.000 INCLUYE DESCARGUE */
  ('2026-07-10','Viernes','ALPINA','JUAN DAVID','TUL630','21880','7002','CHINCHINA','JHON FREDY MORENO',1,
   1,0,'TUL630 VALOR DE FLETE $450.000 INCLUYE DESCARGUE',
   31895187,
   450000,
   7,NULL,'TYM'),

  /* 02 – TDY481 – VALOR DE FLETE $360.000 INCLUYE DESCARGUE (sin pedidos registrados) */
  ('2026-07-10','Viernes','ALPINA','SANDRO ZULUAGA','TDY481','','CHINCHINA','CHINCHINA','JHON FREDY MORENO',1,
   1,0,'TDY481 VALOR DE FLETE $360.000 INCLUYE DESCARGUE',
   0,
   360000,
   0,NULL,'TYM'),

  /* 03 – SYU652 – con facturas FEP+AP */
  ('2026-07-10','Viernes','ALPINA','JOHAN ECHEVERRY','SYU652','21899','9552','MANIZALES VILLAMARIA','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   10165863,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'FEP1189346 AP685049','TYM'),

  /* 04 – KOL802 – con factura AP */
  ('2026-07-10','Viernes','ALPINA','CAMILO CASTAÑO','KOL802','21900','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   6583979,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'AP685044 19556','TYM'),

  /* 05 – WFV015 – con factura AP */
  ('2026-07-10','Viernes','ALPINA','YONNI VALENCIA','WFV015','21901','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   8836214,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'AP685050 19557','TYM'),

  /* 06 – EYY183 – sin adicional */
  ('2026-07-10','Viernes','ALPINA','JOHN ARENAS','EYY183','21902','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   9275118,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   64,'19558','TYM'),

  /* 07 – SLI587 – con facturas FEP+AP */
  ('2026-07-10','Viernes','ALPINA','MIGUEL GONZALES','SLI587','21903','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   13531405,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   51,'FEP1189348-350 AP685043 19561 19559','TYM'),

  /* 08 – WGZ876 – EXTRA $60.000 */
  ('2026-07-10','Viernes','ALPINA','RICARDO PINEDA','WGZ876','21861TSS 21904','9557','SUPIA','JUAN MANUEL DELGADO NARVAEZ',1,
   1,60000,'WGZ876 EXTRA $60.000',
   10645640,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 60000,
   37,NULL,'TYM'),

  /* 09 – EYX091 – sin adicional */
  ('2026-07-10','Viernes','ALPINA','ANDRES GOMEZ','EYX091','21862 21883','9558','PACORA SALAMINA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   12489369,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1) + 0,
   75,'19541','TYM'),

  /* 10 – TRL186 (RUBEN) – Chinchina */
  ('2026-07-10','Viernes','ALPINA','RUBEN','TRL186','21905','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,0,'-',
   9517013,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   75,'19562','TYM'),

  /* 11 – TRL186 (WILLIAM) – Supia Riosucio Super */
  ('2026-07-10','Viernes','ALPINA','WILLIAM','TRL186','21878','9560','RIOSUCIO-SUPIA SUPERMERCADO','ANDRES MATEO VILLALBA DIAZ',1,
   1,0,'-',
   7737317,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 0,
   7,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 12 – SPU120 – sin adicional */
  ('2026-07-10','Viernes','ALPINA','OSWALDO','SPU120','21906','9601','ARMENIA','YEISON DAVID RENDON SOTO, CAMILO SUAREZ GARCIA',2,
   2,0,'-',
   8237105,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   61,NULL,'TYM'),

  /* 13 – ETM037 – con factura AP */
  ('2026-07-10','Viernes','ALPINA','OSCAR MARIN','ETM037','21865TSS 21885','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'-',
   7791721,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   47,'AP685056','TYM'),

  /* 14 – EQY944 – sin adicional */
  ('2026-07-10','Viernes','ALPINA','GOBER CRISTANCHO','EQY944','21907','9603','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   3599833,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   45,'19551','TYM'),

  /* 15 – SXF257 – sin adicional */
  ('2026-07-10','Viernes','ALPINA','FABIO RUIZ','SXF257','21908 21911','9604','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS',1,
   1,0,'-',
   8738878,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   49,'19545','TYM'),

  /* 16 – WLS478 – sin adicional */
  ('2026-07-10','Viernes','ALPINA','HUMBERTO RINCON','WLS478','21882 21887','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   12617507,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 17 – XVI496 – ADICIONAL $40.000 */
  ('2026-07-10','Viernes','ALPINA','PABLO RAMIREZ','XVI496','21884 21886','9606 9600','CIRCASIA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,40000,'XVI496 ADICIONAL AL FLETE $40.000',
   6669124,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 40000,
   48,'19550','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 18 – SMO183 – con factura FEP */
  ('2026-07-10','Viernes','ALPINA','GABRIEL PEREZ','SMO183','21890','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6100243,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,'FEP1189419','TYM'),

  /* 19 – VZD334 – ADICIONAL $50.000 TSS */
  ('2026-07-10','Viernes','ALPINA','JULIAN CUELLAR','VZD334','21891','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO, SEBASTIAN MONTES',2,
   2,50000,'VZD334 ADICIONAL AL FLETE $50.000 TSS',
   8511678,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 50000,
   59,NULL,'TYM'),

  /* 20 – TMZ674 – sin adicional */
  ('2026-07-10','Viernes','ALPINA','RICARDO LOPEZ','TMZ674','21892','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5254879,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 21 – SPQ814 – sin adicional */
  ('2026-07-10','Viernes','ALPINA','CARLOS VELASCO','SPQ814','21893','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6048554,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 22 – WHM317 – sin adicional */
  ('2026-07-10','Viernes','ALPINA','HUMBERTO PARRA','WHM317','21894','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7115129,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   61,NULL,'TYM'),

  /* 23 – PEK019 – sin adicional */
  ('2026-07-10','Viernes','ALPINA','MIGUEL TABARES','PEK019','21895','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   8516533,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 24 – WHM896 – con factura FEP */
  ('2026-07-10','Viernes','ALPINA','ALEXANDER CUELLAR','WHM896','21896','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   7152932,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,'FEP1189436','TYM'),

  /* 25 – WLC133 – sin adicional */
  ('2026-07-10','Viernes','ALPINA','JULIAN','WLC133','21897','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, CARLOS JIMENEZ',2,
   2,0,'-',
   12617571,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   69,NULL,'TYM'),

  /* 26 – TNH494 – con factura AP */
  ('2026-07-10','Viernes','ALPINA','ADALBERTO MEJIA','TNH494','21898','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   10626913,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   61,'AP685035','TYM'),

  /* 27 – WTN748 – ADICIONAL $80.000 ENTREGA TSS */
  ('2026-07-10','Viernes','ALPINA','DIEGO RATIVA','WTN748','21909','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,80000,'WTN748 ADICIONAL AL FLETE $80.000 ENTREGA DE TSS',
   7261390,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 80000,
   55,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 28 – EST067 – sin adicional */
  ('2026-07-10','Viernes','ALPINA','JORGE RIVILLAS','EST067','21910','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5659562,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 29 – ERK303 – sin adicional */
  ('2026-07-10','Viernes','ALPINA','JORGE ALARCON','ERK303','21889','7006','APIA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   9720767,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 0,
   66,'AP685033-034-036 19552','TYM'),

  /* 30 – JVM223 – sin adicional */
  ('2026-07-10','Viernes','ALPINA','WILMAR CARDONA','JVM223','21876 21888','7007 9451','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   17065722,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   69,'19553','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 31 – SQB119 – sin adicional */
  ('2026-07-10','Viernes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19549','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   5733149,
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
WHERE fecha = '2026-07-10'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
