/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: SÁBADO 1 AGOSTO 2026
   (Programación dice "SABADO 31 JULIO" pero es sábado 1 agosto)
   Generado: 2026-08-01
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-01'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 01‑Ago‑2026
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
  ('2026-08-01','Sábado','ALPINA','JOHAN ECHEVERRY','SYU652','22531','9552','MANIZALES VILLAMARIA','EDWAR ZAPATA',1,
   1,0,'-',
   5219876,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   52,'9919859','TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-08-01','Sábado','ALPINA','FREDY','KOL802','22532','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   6171020,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   56,'9919860','TYM'),

  /* 03 – WGZ876 – sin adicional (hoy zona 9554 Manizales) */
  ('2026-08-01','Sábado','ALPINA','RICARDO PINEDA','WGZ876','22534','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS',1,
   1,0,'-',
   7078731,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   54,'9919866 9919861','TYM'),

  /* 04 – TRL186 – sin adicional */
  ('2026-08-01','Sábado','ALPINA','WILLIAM','TRL186','22544','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6091021,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   50,'9919862','TYM'),

  /* 05 – SLI587 – EXTRA $60.000 */
  ('2026-08-01','Sábado','ALPINA','MIGUEL GONZALES','SLI587','22522 22545','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,60000,'SLI587 EXTRA $60.000',
   10480466,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   56,'9919863','TYM'),

  /* 06 – EYY183 – sin adicional (hoy zona 9557 Quinchia) */
  ('2026-08-01','Sábado','ALPINA','JOHN ARENAS','EYY183','22530 22546 22506','9557','QUINCHIA','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   13812383,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUINCHIA' LIMIT 1) + 0,
   55,'9919840','TYM'),

  /* 07 – MAT480 – VALOR FLETE $450.000 (Chinchina) */
  ('2026-08-01','Sábado','ALPINA','ELKIN AGUIRRE','MAT480','','MISPAS CHINCHINA','CHINCHINA','JHON MORENO',1,
   1,0,'MAT480 VALOR FLETE $450.000',
   16537250,
   450000,
   2,'AP705686 AP705676','TYM'),

  /* 08 – WEP384 – EXTRA $60.000 */
  ('2026-08-01','Sábado','ALPINA','YOFER','WEP384','22521 22548','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'WEP384 EXTRA $60.000',
   6601197,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 60000,
   85,'9919865','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 09 – ETM037 – sin adicional */
  ('2026-08-01','Sábado','ALPINA','OSCAR MARIN','ETM037','22525 22549','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   6040566,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 10 – VZD334 – EXTRA $40.000 con factura AP */
  ('2026-08-01','Sábado','ALPINA','JULIAN CUELLAR','VZD334','22524 22550','9602','ARMENIA','SEBASTIAN VILLADA',1,
   1,40000,'VZD334 EXTRA $40.000',
   9321156,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 40000,
   58,'AP705688','TYM'),

  /* 11 – EQY944 – sin adicional */
  ('2026-08-01','Sábado','ALPINA','GOBER CRISTANCHO','EQY944','22551','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, SEBASTIAN MONTES',2,
   2,0,'-',
   8578539,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   55,'9919857','TYM'),

  /* 12 – SXF257 – sin adicional */
  ('2026-08-01','Sábado','ALPINA','FABIO RUIZ','SXF257','22552','9604','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS',1,
   1,0,'-',
   4377793,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 0,
   47,'9919851','TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-08-01','Sábado','ALPINA','HUMBERTO RINCON','WLS478','22526','9605','GENOVA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   4968030,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GENOVA' LIMIT 1) + 0,
   35,'9919852','TYM'),

  /* 14 – TTL256 – sin adicional */
  ('2026-08-01','Sábado','ALPINA','ANDRES QUINTERO','TTL256','22527','9606','CAIMO BARCELONA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   6677995,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAIMO BARCELONA' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-08-01','Sábado','ALPINA','GABRIEL PEREZ','SMO183','22535','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6707867,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 16 – SPU120 – sin adicional (zona 9454) */
  ('2026-08-01','Sábado','ALPINA','OSWALDO','SPU120','22536','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   6886920,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-08-01','Sábado','ALPINA','RICARDO LOPEZ','TMZ674','22537','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   6418802,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-08-01','Sábado','ALPINA','CARLOS VELASCO','SPQ814','22538','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6683234,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   61,NULL,'TYM'),

  /* 19 – WHM896 – sin adicional (zona 9457) */
  ('2026-08-01','Sábado','ALPINA','ALEXANDER CUELLAR','WHM896','22539','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN',1,
   1,0,'-',
   7643042,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-08-01','Sábado','ALPINA','MIGUEL TABARES','PEK019','22540','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   4228745,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 21 – XVI496 – sin adicional */
  ('2026-08-01','Sábado','ALPINA','PABLO RAMIREZ','XVI496','22541','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   7214111,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-08-01','Sábado','ALPINA','JULIAN','WLC133','22542','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, JUAN LARGO',2,
   2,0,'-',
   6231643,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-08-01','Sábado','ALPINA','ADALBERTO MEJIA','TNH494','22543','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   5978620,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 24 – TUL630 – VALOR FLETE $400.000 (Cartago) */
  ('2026-08-01','Sábado','ALPINA','JUAN PINEDA','TUL630','','MARCAMOS CARTAGO','CARTAGO 2T','CESAR',1,
   1,0,'TUL630 VALOR FLETE $400.000',
   10437033,
   400000,
   1,'AP702934 AP705661','TYM'),

  /* 25 – WTN748 – sin adicional */
  ('2026-08-01','Sábado','ALPINA','DIEGO RATIVA','WTN748','22553','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   6363884,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 26 – EST067 – sin adicional */
  ('2026-08-01','Sábado','ALPINA','JORGE RIVILLAS','EST067','22554','7005','EL AGUILA VILLA NUEVA','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   6596650,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='EL AGUILA VILLA NUEVA' LIMIT 1) + 0,
   26,NULL,'TYM'),

  /* 27 – ERK303 – sin adicional */
  ('2026-08-01','Sábado','ALPINA','JORGE ALARCON','ERK303','22528','7006','PUEBLO RICO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   7388719,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PUEBLO RICO' LIMIT 1) + 0,
   33,'9919853 9919849','TYM'),

  /* 28 – JVM223 – sin adicional */
  ('2026-08-01','Sábado','ALPINA','WILMAR CARDONA','JVM223','22529','7007','GUATICA','LUIS CARLOS CADAVID RESTREPO, OSCAR',2,
   2,0,'-',
   9423101,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GUATICA' LIMIT 1) + 0,
   60,'9919855 9919854','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional */
  ('2026-08-01','Sábado','FLEISCHMANN','CARLOS CASTAÑO','SQB119','9919848 9919858','FLEISCHMANN','SANTA ROSA','DIEGO FRANCO',1,
   1,0,'-',
   41804824,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   46,NULL,'TYM');

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
WHERE fecha = '2026-08-01'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
