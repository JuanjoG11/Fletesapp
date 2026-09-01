/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: SÁBADO 29 AGOSTO 2026
   Generado: 2026-08-29
   ✅ Nombres de auxiliares normalizados según lista oficial
   Notas:
     - MAT480  VALOR DE FLETE $400.000 (precio fijo)
     - WFV015  EXTRA $60.000
     - WEP384  EXTRA $60.000
     - EQN953  ARMENIA SUPER → precio fijo $500.000
     - ETM037  ADICIONAL $100.000
     - EQY944  EXTRA $60.000
     - PEK019  EXTRA $60.000
     - JVM223  GUATICA ANSERMA → precio tabla GUATICA
     - SQB119  FLEISCHMANN S/ROSA-D/BRADAS → SANTA ROSA
     - CARLOS JIMENEZ      → CARLOS ALBERTO JIMENEZ JACOME
     - JHONNY LOPEZ        → YHONY ALEXANDER LOPEZ LOPEZ
     - SAMUEL ARIAS        → SAMUEL ANDRES ARIAS ARCILA
     - VALENTINA GARCIA    → VALENTINA GARCIA GOMEZ
     - DANIELA CASTIBLANCO → DANIELA CASTIBLANCO RAMIREZ
     - MANUEL RAMIREZ      → MANUEL ALEJANDRO RAMIREZ OVALLE
     - DIEGO FRANCO        → JUAN DIEGO FRANCO VERGARA
     - QUEBIN LOTERO: no está en lista oficial ALPINA
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-29'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 29‑Ago‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – MAT480 – VALOR DE FLETE $400.000 */
  ('2026-08-29','Sabado','ALPINA','ELKIN AGUIRRE','MAT480','23324 23332','7001 7000 PRADERA/PARQUE/PALERMO','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'VALOR DE FLETE $400.000',
   12413114,
   400000,
   3,NULL,'TYM'),

  /* 02 – SYU652 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','JOHAN ECHEVERRY','SYU652','23348 20228 20221','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   6521224,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   52,'FEP1193408','TYM'),

  /* 03 – KOL802 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','FREDY','KOL802','23349 20222','9553','MANIZALES VILLAMARIA','CARLOS ALBERTO JIMENEZ JACOME, YHONY ALEXANDER LOPEZ LOPEZ',2,
   2,0,'-',
   6423610,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 04 – WFV015 – EXTRA $60.000 */
  ('2026-08-29','Sabado','ALPINA','YONNI VALENCIA','WFV015','23350 20223','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,60000,'WFV015 EXTRA $60.000',
   8446994,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   56,'FEP1193380','TYM'),

  /* 05 – SPU120 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','OSWALDO','SPU120','23351','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   7073040,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   56,'FEP1193382-386 FEP1193392-393','TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','RICARDO PINEDA','WGZ876','23352 23322 20225','9556 E7000 RECREACION','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   9294579,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   36,NULL,'TYM'),

  /* 07 – WFQ635 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','JHENCI LOPEZ','WFQ635','23328 23358 20226','9557 9559 MANUELA','QUINCHIA','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   13168658,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUINCHIA' LIMIT 1) + 0,
   52,'AP730976','TYM'),

  /* 08 – WEP384 – EXTRA $60.000 */
  ('2026-08-29','Sabado','ALPINA','YOFER LOPEZ','WEP384','23338 23321 20229','9559 E7000 GAMERO','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'WEP384 EXTRA $60.000',
   7428914,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 60000,
   82,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 09 – EQN953 – VALOR DE FLETE $500.000 */
  ('2026-08-29','Sabado','ALPINA','ORLANDO VASQUEZ','EQN953','23326 23276 23325','7008 7009 RINDEMAX/LA19/LA50','ARMENIA','JHON FREDY MORENO',1,
   1,0,'VALOR DE FLETE $500.000',
   13825166,
   500000,
   3,NULL,'TYM'),

  /* 10 – ETM037 – ADICIONAL $100.000 */
  ('2026-08-29','Sabado','ALPINA','OSCAR MARIN','ETM037','23353 23279','9601 7010 LAPATRIA','ARMENIA','YEISON DAVID RENDON SOTO, SAMUEL ANDRES ARIAS ARCILA',2,
   2,100000,'ETM037 ADICIONAL $100.000',
   9971438,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 100000,
   56,'AP732311','TYM'),

  /* 11 – TJX795 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','ANDRES QUINTERO','TJX795','23354 20220 20217','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   8373491,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 12 – TTL256 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','ANDRES QUINTERO','TTL256','23355','9603 HOREB','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, VALENTINA GARCIA GOMEZ',2,
   2,0,'-',
   10585917,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   58,'AP732310','TYM'),

  /* 13 – SXF257 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','FABIO RUIZ','SXF257','23356 23281 20230','9604 7010 MERCAMOS','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS',1,
   1,0,'-',
   5112502,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 0,
   39,NULL,'TYM'),

  /* 14 – WLS478 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','HUMBERTO RINCON','WLS478','23330','9605','GENOVA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   5190989,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GENOVA' LIMIT 1) + 0,
   31,NULL,'TYM'),

  /* 15 – EQY944 – EXTRA $60.000 */
  ('2026-08-29','Sabado','ALPINA','GOBER CRISTANCHO','EQY944','23331','9606','CAIMO BARCELONA','DANIELA CASTIBLANCO RAMIREZ',1,
   1,60000,'EQY944 EXTRA $60.000',
   8430154,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAIMO BARCELONA' LIMIT 1) + 60000,
   52,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 16 – SMO183 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','GABRIEL PEREZ','SMO183','23339','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   8297810,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 17 – VZD334 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','JULIAN CUELLAR','VZD334','23340','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   6545542,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   39,NULL,'TYM'),

  /* 18 – TMZ674 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','RICARDO LOPEZ','TMZ674','23341','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   3083274,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   30,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','CARLOS VELASCO','SPQ814','23342','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6106270,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 20 – WHM896 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','ALEXANDER CUELLAR','WHM896','23343','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7316246,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 21 – PEK019 – EXTRA $60.000 */
  ('2026-08-29','Sabado','ALPINA','MIGUEL TABARES','PEK019','23344','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,60000,'PEK019 EXTRA $60.000',
   4993893,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   39,NULL,'TYM'),

  /* 22 – LUM993 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','PABLO RAMIREZ','LUM993','23345','9459','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, CAMILO LEANDRO GUECHE PEÑA',2,
   2,0,'-',
   7739661,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* 23 – WLC133 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','JULIAN','WLC133','23346','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   6403883,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','ADALBERTO MEJIA','TNH494','23347','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   5821752,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 25 – WTN748 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','DIEGO RATIVA','WTN748','23357','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, QUEBIN LOTERO',2,
   2,0,'-',
   7002368,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 26 – EST067 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','JORGE RIVILLAS','EST067','23336','7005','EL AGUILA','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5912865,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='EL AGUILA' LIMIT 1) + 0,
   18,NULL,'TYM'),

  /* 27 – ERK303 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','JORGE ALARCON','ERK303','23334 20231','7006','PUEBLO RICO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   9704409,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PUEBLO RICO' LIMIT 1) + 0,
   34,NULL,'TYM'),

  /* 28 – JVM223 – sin adicional */
  ('2026-08-29','Sabado','ALPINA','WILMAR CARDONA','JVM223','23335 20232','7007','GUATICA ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL ALEJANDRO RAMIREZ OVALLE',2,
   2,0,'-',
   11383326,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GUATICA' LIMIT 1) + 0,
   65,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional */
  ('2026-08-29','Sabado','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20233','FLEISCHMANN','SANTA ROSA','JUAN DIEGO FRANCO VERGARA',1,
   1,0,'-',
   5523413,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   56,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-08-29'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
