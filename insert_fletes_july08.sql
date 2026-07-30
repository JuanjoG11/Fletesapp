/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 8 JULIO 2026
   Generado: 2026-07-08
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-08'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 08‑Jul‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – SYU652 – con facturas FEP */
  ('2026-07-08','Miércoles','ALPINA','JOHAN ECHEVERRY','SYU652','21818','9552','MANIZALES VILLAMARIA','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   7671983,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   49,'FEP1189174 FEP1189066 19495 19514','TYM'),

  /* 02 – KOL802 – ADICIONAL $50.000 ENTREGA TSS Y SUPER */
  ('2026-07-08','Miércoles','ALPINA','CAMILO CASTAÑO','KOL802','21781TSS 21739TSS 21819 21805','9553 7001','MANIZALES VILLAMARIA','ANDRES MATEO VILLALBA DIAZ',1,
   1,50000,'KOL802 ADICIONAL $50.000 ENTREGA TSS Y SUPER',
   10887030,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 50000,
   60,'19515','TYM'),

  /* 03 – WFV015 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','YONNI VALENCIA','WFV015','21782TSS 21798 21820','9554 7000','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   11700600,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   68,'19510 19516','TYM'),

  /* 04 – EYY183 – con facturas FEP */
  ('2026-07-08','Miércoles','ALPINA','JOHN ARENAS','EYY183','21821','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   8267613,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   42,'FEP1189058 FEP1189065','TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','MIGUEL GONZALES','SLI587','21822','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   5704181,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'19518','TYM'),

  /* 06 – WGZ876 – EXTRA $60.000 */
  ('2026-07-08','Miércoles','ALPINA','RICARDO PINEDA','WGZ876','21823','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ',1,
   1,60000,'WGZ876 EXTRA $60.000',
   16477399,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1) + 60000,
   38,NULL,'TYM'),

  /* 07 – EYX091 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','CARLOS GOMEZ','EYX091','21786 21807','9558','AGUADAS PACORA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   20567347,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1) + 0,
   79,'19521','TYM'),

  /* 08 – TRL186 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','WILLIAM','TRL186','21824','9559','PALESTINA ARAUCA','BRANDON STEVEN GIL BAEZ, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   12008802,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PALESTINA ARAUCA' LIMIT 1) + 0,
   47,'19522','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 09 – SPU120 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','OSWALDO','SPU120','21825 21806','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   9353890,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 10 – ETM037 – ADICIONAL $50.000 ENTREGA TSS */
  ('2026-07-08','Miércoles','ALPINA','OSCAR MARIN','ETM037','21826','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, SEBASTIAN MONTES',2,
   2,50000,'ETM037 ADICIONAL $50.000 ENTREGA DE TSS',
   8414764,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 50000,
   65,NULL,'TYM'),

  /* 11 – EQY944 – ADICIONAL $50.000 ENTREGA TSS ARMENIA */
  ('2026-07-08','Miércoles','ALPINA','GOBER CRISTANCHO','EQY944','21748TSS 21790','9603','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA, CAMILO SUAREZ GARCIA',2,
   2,50000,'EQY944 ADICIONAL $50.000 ENTREGA DE TSS ARMENIA',
   9543791,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 50000,
   69,'19501 19503','TYM'),

  /* 12 – SXF257 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','FABIO RUIZ','SXF257','21799 21828','9604 7010','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   13632094,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 0,
   42,NULL,'TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','HUMBERTO RINCON','WLS478','21800','9605','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   8808315,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1) + 0,
   44,'19525 19524','TYM'),

  /* 14 – TTL256 – con facturas AP */
  ('2026-07-08','Miércoles','ALPINA','ANDRES QUINTERO','TTL256','21801','9606','SALENTO','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   11636322,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1) + 0,
   37,'AP682334 AP682440 19523','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','GABRIEL PEREZ','SMO183','21809','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   7476793,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   61,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','JULIAN CUELLAR','VZD334','21772TSS 21810','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   9890393,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,'19527','TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','RICARDO LOPEZ','TMZ674','21811','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, JHON FREDY MORENO',2,
   2,0,'-',
   10267963,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   75,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','CARLOS VELASCO','SPQ814','21812','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   9777070,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 19 – WHM317 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','HUMBERTO PARRA','WHM317','21813','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   8101279,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','MIGUEL TABARES','PEK019','21814','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   7965514,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* 21 – WHM896 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','ALEXANDER CUELLAR','WHM896','21815','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   8650489,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   61,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','JULIAN','WLC133','21816','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, CARLOS JIMENEZ',2,
   2,0,'-',
   8906641,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   82,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','ADALBERTO MEJIA','TNH494','21817 21808','9461 9450','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   9599580,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 24 – WTN748 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','DIEGO RATIVA','WTN748','21829','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   10492180,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   72,'19526','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – EST067 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','JORGE RIVILLAS','EST067','21830','7005','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5851200,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1) + 0,
   37,'19508','TYM'),

  /* 26 – ERK303 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','JORGE ALARCON','ERK303','21802','7006','BALBOA LA CELIA','ROVINSON TORRES RIVERA',1,
   1,0,'-',
   7856433,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1) + 0,
   41,'19507','TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-07-08','Miércoles','ALPINA','WILMAR CARDONA','JVM223','21803 21797','7007 9451','ANSERMA','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   17651069,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1) + 0,
   54,'19512','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-07-08','Miércoles','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19506 19509 19513','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   5627685,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   59,NULL,'TYM');

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
WHERE fecha = '2026-07-08'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
