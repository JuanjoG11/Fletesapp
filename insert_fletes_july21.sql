/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 21 JULIO 2026
   Generado: 2026-07-21
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: WLC133 aparece dos veces (9457 sin conductor / 9460 JULIAN)
         WEP384 cubre SUPIA RIOSUCIO SUPER con EXTRA $60.000
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-21'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 21‑Jul‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – SYU652 – con factura FEP */
  ('2026-07-21','Martes','ALPINA','JOHAN ECHEVERRY','SYU652','22164','9552','MANIZALES VILLAMARIA','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   5459266,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   57,'FEP1190202 9919677','TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-07-21','Martes','ALPINA','FREDY','KOL802','22165 22143','9553 9550','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   6307119,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   40,'9919687','TYM'),

  /* 03 – WFV015 – con factura AP */
  ('2026-07-21','Martes','ALPINA','YONNI VALENCIA','WFV015','22166','9554 7000','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   6440410,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   42,'AP694613 9919679','TYM'),

  /* 04 – EYY183 – con factura AP */
  ('2026-07-21','Martes','ALPINA','JOHN ARENAS','EYY183','22167','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   4936313,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'AP694614 9919680','TYM'),

  /* 05 – SLI587 – con facturas FEP */
  ('2026-07-21','Martes','ALPINA','MIGUEL GONZALES','SLI587','22168','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   5592517,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   47,'FEP1190199-1190203','TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-07-21','Martes','ALPINA','RICARDO PINEDA','WGZ876','22169','9557','SUPIA','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   8248879,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 0,
   47,'9919682','TYM'),

  /* 07 – EYX091 – sin adicional */
  ('2026-07-21','Martes','ALPINA','ANDRES GOMEZ','EYX091','22070','9558','ARANZAZU FILADELFIA','VICTOR ALFONSO PULGARIN MEJIA',1,
   1,0,'-',
   6703618,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARANZAZU FILADELFIA' LIMIT 1) + 0,
   37,'9919683','TYM'),

  /* 08 – WEP384 – EXTRA $60.000 (Supia Riosucio Super) */
  ('2026-07-21','Martes','ALPINA','YOFER','WEP384','22144','9560','RIOSUCIO-SUPIA SUPERMERCADO','JUAN CAMILO COCOMA OROZCO',1,
   1,60000,'WEP384 EXTRA CARRO $60.000',
   9875676,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 60000,
   8,NULL,'TYM'),

  /* 09 – TRL186 – sin adicional */
  ('2026-07-21','Martes','ALPINA','WILLIAM','TRL186','22170 22148','9559 7002','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,0,'-',
   3906096,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   48,'9919685','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 10 – SPU120 – con factura AP */
  ('2026-07-21','Martes','ALPINA','OSWALDO','SPU120','22171','9601 7010','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   3625031,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   41,'AP694678','TYM'),

  /* 11 – EQY944 – con facturas AP */
  ('2026-07-21','Martes','ALPINA','GOBER CRISTANCHO','EQY944','22172','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, CARLOS JIMENEZ',2,
   2,0,'-',
   7575823,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   58,'AP694617 AP694291 AP694347','TYM'),

  /* 12 – ETM037 – sin adicional */
  ('2026-07-21','Martes','ALPINA','OSCAR MARIN','ETM037','22173 22151','9603 7008','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA, SEBASTIAN MONTES',2,
   2,0,'-',
   11053903,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   55,'9919687 9919688','TYM'),

  /* 13 – SXF257 – sin adicional */
  ('2026-07-21','Martes','ALPINA','FABIO RUIZ','SXF257','22174','9604','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   7168988,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   54,'AP694676 AP694677 9919686','TYM'),

  /* 14 – WLS478 – sin adicional */
  ('2026-07-21','Martes','ALPINA','HUMBERTO RINCON','WLS478','22145','9605','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   4091440,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   36,'9919689','TYM'),

  /* 15 – TTL256 – sin adicional */
  ('2026-07-21','Martes','ALPINA','ANDRES QUINTERO','TTL256','22146','9606','CIRCASIA','CRISTIAN FABIAN CAMACHO MARTINEZ, JUAN LARGO',2,
   2,0,'-',
   2981889,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   37,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 16 – SMO183 – sin adicional */
  ('2026-07-21','Martes','ALPINA','GABRIEL PEREZ','SMO183','22154','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   3875693,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   41,NULL,'TYM'),

  /* 17 – VZD334 – sin adicional */
  ('2026-07-21','Martes','ALPINA','JULIAN CUELLAR','VZD334','22155','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   6467344,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 18 – TMZ674 – sin adicional */
  ('2026-07-21','Martes','ALPINA','RICARDO LOPEZ','TMZ674','22156','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, CAMILO SUAREZ GARCIA',2,
   2,0,'-',
   4710534,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   66,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional */
  ('2026-07-21','Martes','ALPINA','CARLOS VELASCO','SPQ814','22157','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   4112077,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 20 – WLC133 (zona 9457, sin conductor nombrado) – Pereira */
  ('2026-07-21','Martes','ALPINA','','WLC133','22158','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   5292235,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional */
  ('2026-07-21','Martes','ALPINA','MIGUEL TABARES','PEK019','22159','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   5442444,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 22 – XVI496 – sin adicional */
  ('2026-07-21','Martes','ALPINA','PABLO RAMIREZ','XVI496','22160','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   6476842,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   65,NULL,'TYM'),

  /* 23 – WLC133 (JULIAN, zona 9460) – Pereira */
  ('2026-07-21','Martes','ALPINA','JULIAN','WLC133','22162','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   6970457,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional */
  ('2026-07-21','Martes','ALPINA','ADALBERTO MEJIA','TNH494','22163','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   4783219,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 25 – WTN748 – EXTRA $60.000 */
  ('2026-07-21','Martes','ALPINA','DIEGO RATIVA','WTN748','22175','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,60000,'WTN748 EXTRA $60.000',
   7159539,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   55,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 26 – EST067 – sin adicional */
  ('2026-07-21','Martes','ALPINA','JORGE RIVILLAS','EST067','22176','7005','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   3902397,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1) + 0,
   28,'9919691','TYM'),

  /* 27 – ERK303 – sin adicional */
  ('2026-07-21','Martes','ALPINA','JORGE ALARCON','ERK303','22149 22142','7006 9450','SANTUARIO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   10852443,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1) + 0,
   49,'9919690','TYM'),

  /* 28 – JVM223 – sin adicional */
  ('2026-07-21','Martes','ALPINA','WILMAR CARDONA','JVM223','22150 22153','7007 9451','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   7063309,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional (observación: SE SACÓ FEP1190183) */
  ('2026-07-21','Martes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','9919676','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   3946963,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   44,NULL,'TYM');

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
WHERE fecha = '2026-07-21'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
