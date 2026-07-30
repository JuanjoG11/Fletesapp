/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: SÁBADO 18 JULIO 2026
   Generado: 2026-07-21
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-18'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 18‑Jul‑2026
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
  ('2026-07-18','Sábado','ALPINA','JOHAN ECHEVERRY','SYU652','22125','9552','MANIZALES VILLAMARIA','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   7624299,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   55,'FEP1190138 FEP1190057 19662','TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-07-18','Sábado','ALPINA','FREDY','KOL802','22111 22126','9553 7001','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   9773413,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   54,'19663 19668','TYM'),

  /* 03 – WFV015 – EXTRA $60.000 con factura FEP */
  ('2026-07-18','Sábado','ALPINA','YONNI VALENCIA','WFV015','22127','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,60000,'WFV015 EXTRA $60.000',
   6305575,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   52,'FEP1190051 19664','TYM'),

  /* 04 – EYY183 – con facturas FEP */
  ('2026-07-18','Sábado','ALPINA','JOHN ARENAS','EYY183','22128','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6630456,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   47,'FEP1190053-056','TYM'),

  /* 05 – SLI587 – EXTRA $60.000 con facturas AP */
  ('2026-07-18','Sábado','ALPINA','MIGUEL GONZALES','SLI587','22129','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,60000,'SLI587 EXTRA $60.000',
   10785365,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   54,'AP693244 AP693246 19666','TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-07-18','Sábado','ALPINA','RICARDO PINEDA','WGZ876','22092TSS 22113 22130','9557 9559','QUINCHIA','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   13488486,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUINCHIA' LIMIT 1) + 0,
   57,'19653','TYM'),

  /* 07 – TRL186 – con facturas AP */
  ('2026-07-18','Sábado','ALPINA','WILLIAM','TRL186','22093TSS 22132','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   7457250,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   87,'AP693245 AP693247','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 08 – WEP384 – VALOR DE FLETE $420.000 */
  ('2026-07-18','Sábado','ALPINA','YOFER','WEP384','22104 22105','7008 7010','ARMENIA','',0,
   0,0,'WEP384 VALOR DE FLETE $420.000',
   6223633,
   420000,
   5,'AP691807','TYM'),

  /* 09 – SPU120 – sin adicional */
  ('2026-07-18','Sábado','ALPINA','OSWALDO','SPU120','22133','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   5900862,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 10 – ETM037 – sin adicional */
  ('2026-07-18','Sábado','ALPINA','OSCAR MARIN','ETM037','22134','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, CARLOS JIMENEZ',2,
   2,0,'-',
   10463165,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   57,'19661','TYM'),

  /* 11 – EQY944 – sin adicional */
  ('2026-07-18','Sábado','ALPINA','GOBER CRISTANCHO','EQY944','22135','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, SEBASTIAN MONTES',2,
   2,0,'-',
   8957816,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 12 – SXF257 – ADICIONAL $100.000 ENTREGA NEGOCIACION */
  ('2026-07-18','Sábado','ALPINA','FABIO RUIZ','SXF257','22136','9604','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS',1,
   1,100000,'SXF257 ADICIONAL AL FLETE $100.000 ENTREGA DE NEGOCIACION',
   7410576,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 100000,
   62,'19669 19670','TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-07-18','Sábado','ALPINA','HUMBERTO RINCON','WLS478','22106','9605','GENOVA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   6972295,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GENOVA' LIMIT 1) + 0,
   34,NULL,'TYM'),

  /* 14 – TTL256 – ADICIONAL $50.000 ENTREGA SUPER EN FILANDIA */
  ('2026-07-18','Sábado','ALPINA','ANDRES QUINTERO','TTL256','22107','9606','CAIMO BARCELONA','CRISTIAN FABIAN CAMACHO MARTINEZ, JUAN LARGO',2,
   2,50000,'TTL256 ADICIONAL AL FLETE $50.000 ENTREGA DE SUPER EN FILANDIA',
   6913722,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAIMO BARCELONA' LIMIT 1) + 50000,
   54,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-07-18','Sábado','ALPINA','GABRIEL PEREZ','SMO183','22116','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   7663222,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional */
  ('2026-07-18','Sábado','ALPINA','JULIAN CUELLAR','VZD334','22117','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7716300,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-07-18','Sábado','ALPINA','RICARDO LOPEZ','TMZ674','22080TSS 22118','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, CAMILO SUAREZ GARCIA',2,
   2,0,'-',
   7139494,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   61,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-07-18','Sábado','ALPINA','CARLOS VELASCO','SPQ814','22119','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6019257,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 19 – WHM317 – sin adicional */
  ('2026-07-18','Sábado','ALPINA','HUMBERTO PARRA','WHM317','22120','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7387476,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-07-18','Sábado','ALPINA','MIGUEL TABARES','PEK019','22121','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   4797808,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 21 – XVI496 – sin adicional */
  ('2026-07-18','Sábado','ALPINA','PABLO RAMIREZ','XVI496','22122','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   8624391,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-07-18','Sábado','ALPINA','JULIAN','WLC133','22123','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   6802765,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   65,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-07-18','Sábado','ALPINA','ADALBERTO MEJIA','TNH494','22124','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   5850500,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 24 – WTN748 – sin adicional */
  ('2026-07-18','Sábado','ALPINA','DIEGO RATIVA','WTN748','22025TSS 22137','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   8097229,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   58,'19660','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – EST067 – sin adicional */
  ('2026-07-18','Sábado','ALPINA','JORGE RIVILLAS','EST067','22138','7005','EL AGUILA','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   9234605,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='EL AGUILA' LIMIT 1) + 0,
   33,NULL,'TYM'),

  /* 26 – ERK303 – sin adicional */
  ('2026-07-18','Sábado','ALPINA','JORGE ALARCON','ERK303','22108','7006','PUEBLO RICO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   9616305,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PUEBLO RICO' LIMIT 1) + 0,
   37,'19671','TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-07-18','Sábado','ALPINA','WILMAR CARDONA','JVM223','22109','7007','GUATICA','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   11325465,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GUATICA' LIMIT 1) + 0,
   61,'19673 19672','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-07-18','Sábado','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19659 19674','FLEISCHMANN','SANTA ROSA','DIEGO FRANCO',1,
   1,0,'-',
   4177267,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   47,NULL,'TYM');

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
WHERE fecha = '2026-07-18'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
