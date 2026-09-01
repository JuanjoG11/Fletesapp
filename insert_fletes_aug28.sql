/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 28 AGOSTO 2026
   Generado: 2026-08-28
   ✅ Nombres de auxiliares normalizados según lista oficial
   Notas:
     - WLS478  ADICIONAL $100.000 ENTREGA NEGOCIACION
     - SLI587  zona 9560 → RIOSUCIO-SUPIA SUPERMERCADO
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
WHERE fecha = '2026-08-28'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 28‑Ago‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – EQN953 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','ORLANDO VASQUEZ','EQN953','23287 23286','7001 7000','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   21196855,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   4,NULL,'TYM'),

  /* 02 – MAT480 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','ELKIN AGUIRRE','MAT480','23288','7002','CHINCHINA','JHON FREDY MORENO',1,
   1,0,'-',
   19297532,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   6,NULL,'TYM'),

  /* 03 – SYU652 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','JOHAN ECHEVERRY','SYU652','23310 23314 20212 20210 20215','9552 9556','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO, MILTON GILMER OSORIO CALLE',2,
   2,0,'-',
   11242069,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   87,'FEP1193293-296','TYM'),

  /* 04 – KOL802 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','FREDY','KOL802','23284 23311 20198 20211','9553 9550 PUNTO MERCO','MANIZALES VILLAMARIA','CARLOS ALBERTO JIMENEZ JACOME, YHONY ALEXANDER LOPEZ LOPEZ',2,
   2,0,'-',
   7925533,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 05 – WFV015 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','YONNI VALENCIA','WFV015','23312 20213','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   7588874,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   49,'FEP1193292-294','TYM'),

  /* 06 – SPU120 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','OSWALDO','SPU120','23313 20213','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   8040183,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 07 – WGZ876 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','RICARDO PINEDA','WGZ876','23297','9557','IRRA LA FELISA VER RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ',1,
   1,0,'-',
   11462163,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='IRRA LA FELISA VER RIOSUCIO' LIMIT 1) + 0,
   30,NULL,'TYM'),

  /* 08 – EYX091 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','ANDRES GOMEZ','EYX091','23241 23292 20178 20186','9558','PACORA SALAMINA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   13137710,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1) + 0,
   80,NULL,'TYM'),

  /* 09 – WEP384 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','YOFER LOPEZ','WEP384','23315 20208','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,0,'-',
   10679852,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   69,NULL,'TYM'),

  /* 10 – SLI587 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','MIGUEL GONZALES','SLI587','23285','9560','RIOSUCIO-SUPIA SUPERMERCADO','ANDRES MATEO VILLALBA DIAZ',1,
   1,0,'-',
   10370155,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 0,
   10,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 11 – ETM037 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','OSCAR MARIN','ETM037','23274 23316','9601 7009 P/ESPEJO','ARMENIA','YEISON DAVID RENDON SOTO, SAMUEL ANDRES ARIAS ARCILA',2,
   2,0,'-',
   9489405,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* 12 – TJX795 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','ANDRES QUINTERO','TJX795','23275 23291','9602 7009 LA50','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'-',
   8705022,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 13 – WFQ635 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','JHENCY LOPEZ','WFQ635','23273 23272 23289 20184 20201','9603 7008 MERCAMOS','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA, VALENTINA GARCIA GOMEZ',2,
   2,0,'-',
   11304036,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 14 – SXF257 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','FABIO RUIZ','SXF257','23320 23317 20194','9604 7010 MERCAMOS','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   7878617,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 15 – WLS478 – ADICIONAL $100.000 ENTREGA NEGOCIACION */
  ('2026-08-28','Viernes','ALPINA','HUMBERTO RINCON','WLS478','23319 23278 23280 23299 23293','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, SANTIAGO HENAO MORALES',2,
   2,100000,'WLS478 ADICIONAL $100.000 ENTREGA NEGOCIACION',
   12214504,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 100000,
   43,NULL,'TYM'),

  /* 16 – EQY944 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','GOBER CRISTANCHO','EQY944','23298 23294 20202','9606 9600','CIRCASIA','DANIELA CASTIBLANCO RAMIREZ',1,
   1,0,'-',
   7642948,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 17 – SMO183 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','GABRIEL PEREZ','SMO183','23301','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   7268378,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 18 – VZD334 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','JULIAN CUELLAR','VZD334','23302','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7747568,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 19 – TMZ674 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','RICARDO LOPEZ','TMZ674','23303','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   6534943,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 20 – SPQ814 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','CARLOS VELASCO','SPQ814','23304 20205','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   4916766,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 21 – WHM896 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','ALEXANDER CUELLAR','WHM896','23305','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7936021,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 22 – PEK019 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','MIGUEL TABARES','PEK019','23306','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   6789666,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 23 – LUM993 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','PABLO RAMIREZ','LUM993','23307','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   6232748,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 24 – WLC133 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','JULIAN','WLC133','23308','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, QUEBIN LOTERO',2,
   2,0,'-',
   13162585,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   65,NULL,'TYM'),

  /* 25 – TNH494 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','ADALBERTO MEJIA','TNH494','23309 20199','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   8667886,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   63,NULL,'TYM'),

  /* 26 – WTN748 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','DIEGO RATIVA','WTN748','23318','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   6928933,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 27 – EST067 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','JORGE RIVILLAS','EST067','23271 23300','7005 9450 MERCAMOS','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   9282298,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   38,NULL,'TYM'),

  /* 28 – ERK303 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','JORGE ALARCON','ERK303','23282 23295 20203','7006 9450','LA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   16708847,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='LA VIRGINIA' LIMIT 1) + 0,
   71,NULL,'TYM'),

  /* 29 – JVM223 – sin adicional */
  ('2026-08-28','Viernes','ALPINA','WILMAR CARDONA','JVM223','23283 23296 20204','7007 9451','MISTRATO','LUIS CARLOS CADAVID RESTREPO, MANUEL ALEJANDRO RAMIREZ OVALLE',2,
   2,0,'-',
   15693217,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MISTRATO' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 30 – SQB119 – sin adicional */
  ('2026-08-28','Viernes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20200 20214 20206','FLEISCHMANN','ARMENIA','JUAN DIEGO FRANCO VERGARA',1,
   1,0,'-',
   7953688,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   55,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-08-28'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
