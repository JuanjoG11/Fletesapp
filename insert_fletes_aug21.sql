/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 21 AGOSTO 2026
   Generado: 2026-08-21
   ✅ Nombres de auxiliares normalizados según lista oficial
   Notas:
     - MAT480  VALOR DE FLETE $500.000 (precio fijo)
     - WFV015  EXTRA $60.000
     - WGZ876  ADICIONAL $500.000 POR ENTREGA DE TAT Y SUPER RIOSUCIO Y SUPIA EL VIERNES 14
     - WEP384  EXTRA $60.000
     - TJX795  EXTRA $60.000
     - TTL256  ADICIONAL $100.000 POR LLEVAR SUPER A OTRA CIUDAD
     - WTN748  EXTRA $60.000
     - JHONNY LOPEZ      → YHONY ALEXANDER LOPEZ LOPEZ
     - SAMUEL ARIAS      → SAMUEL ANDRES ARIAS ARCILA
     - DANIELA CASTIBLANCO → DANIELA CASTIBLANCO RAMIREZ
     - VALENTINA GARCIA  → VALENTINA GARCIA GOMEZ
     - MANUEL RAMIREZ    → MANUEL ALEJANDRO RAMIREZ OVALLE
     - DIEGO FRANCO      → JUAN DIEGO FRANCO VERGARA
     - QUEBIN LOTERO: no está en lista oficial ALPINA
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-21'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 21‑Ago‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – MAT480 – VALOR DE FLETE $500.000 */
  ('2026-08-21','Viernes','ALPINA','ELKIN AGUIRRE','MAT480','23069','7002','CHINCHINA','JHON FREDY MORENO',1,
   1,0,'VALOR DE FLETE $500.000',
   18974743,
   500000,
   8,NULL,'TYM'),

  /* 02 – SYU652 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','JOHAN ECHEVERRY','SYU652','23088 20115','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   5492750,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 03 – KOL802 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','FREDY','KOL802','23064 23089 20116','9553 9550 PUNTOMERCO','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   8827083,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 04 – WFV015 – EXTRA $60.000 */
  ('2026-08-21','Viernes','ALPINA','YONNI VALENCIA','WFV015','23068 23090 20117','9554 7000 MANA','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,60000,'WFV015 EXTRA $60.000',
   9722291,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   50,NULL,'TYM'),

  /* 05 – SPU120 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','OSWALDO','SPU120','23091 20118 20128','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   9388731,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   63,NULL,'TYM'),

  /* 06 – SLI587 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','MIGUEL GONZALES','SLI587','23092 20120 20119 20114','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE, YHONY ALEXANDER LOPEZ LOPEZ',2,
   2,0,'-',
   5925201,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   42,NULL,'TYM'),

  /* 07 – WGZ876 – ADICIONAL $500.000 */
  ('2026-08-21','Viernes','ALPINA','RICARDO PINEDA','WGZ876','23093','9557','IRRA LA FELISA VER RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ',1,
   1,500000,'ADICIONAL $500.000 POR ENTREGA DE TAT Y SUPER RIOSUCIO Y SUPIA EL VIERNES 14',
   9784795,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='IRRA LA FELISA VER RIOSUCIO' LIMIT 1) + 500000,
   31,NULL,'TYM'),

  /* 08 – EYX091 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','ANDRES GOMEZ','EYX091','23048 23077 20105','9558','PACORA SALAMINA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   13042144,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1) + 0,
   73,NULL,'TYM'),

  /* 09 – WEP384 – EXTRA $60.000 */
  ('2026-08-21','Viernes','ALPINA','YOFER LOPEZ','WEP384','23094 20121','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'WEP384 EXTRA $60.000',
   8624024,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 60000,
   64,NULL,'TYM'),

  /* 10 – EYY183 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','JOHN ARENAS','EYY183','23066 23065','9560','RIOSUCIO-SUPIA SUPERMERCADO','ANDRES MATEO VILLALBA DIAZ',1,
   1,0,'-',
   11146943,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 0,
   9,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 11 – ETM037 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','OSCAR MARIN','ETM037','23095','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   8351263,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   64,NULL,'TYM'),

  /* 12 – TJX795 – EXTRA $60.000 */
  ('2026-08-21','Viernes','ALPINA','ANDRES QUINTERO','TJX795','23070 23096','9602 7009 LA50','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,60000,'TJX795 EXTRA $60.000',
   9987111,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 60000,
   48,NULL,'TYM'),

  /* 13 – EQY944 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','GOBER CRISTANCHO','EQY944','23097 20123','9603','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   5223353,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 14 – SXF257 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','FABIO RUIZ','SXF257','23098 20108','9604','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   8356696,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 15 – WLS478 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','HUMBERTO RINCON','WLS478','23071 23073 20124','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, SAMUEL ANDRES ARIAS ARCILA',2,
   2,0,'-',
   11722170,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   41,NULL,'TYM'),

  /* 16 – TTL256 – ADICIONAL $100.000 POR LLEVAR SUPER A OTRA CIUDAD */
  ('2026-08-21','Viernes','ALPINA','ANDRES QUINTERO','TTL256','23067 23074 20125','9606 9600','CIRCASIA','DANIELA CASTIBLANCO RAMIREZ, VALENTINA GARCIA GOMEZ',2,
   2,100000,'ADICIONAL $100.000 POR LLEVAR SUPER A OTRA CIUDAD',
   8809931,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 100000,
   56,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 17 – SMO183 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','GABRIEL PEREZ','SMO183','23079','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   7676613,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 18 – VZD334 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','JULIAN CUELLAR','VZD334','23080','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   12489554,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 19 – TMZ674 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','RICARDO LOPEZ','TMZ674','23081','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   6086341,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 20 – SPQ814 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','CARLOS VELASCO','SPQ814','23082','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6047787,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 21 – LUM993 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','PABLO RAMIREZ','LUM993','23083','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   9238887,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 22 – PEK019 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','MIGUEL TABARES','PEK019','23040TSS 23084','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   7148535,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 23 – EST590 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','FREDY GALLEGO','EST590','23085','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   8434348,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 24 – WLC133 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','JULIAN','WLC133','23086','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, QUEBIN LOTERO',2,
   2,0,'-',
   14789977,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   73,NULL,'TYM'),

  /* 25 – TNH494 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','ADALBERTO MEJIA','TNH494','23043TSS 23087 23062','9461 9450 MERCAMOS','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   11031806,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 26 – WTN748 – EXTRA $60.000 */
  ('2026-08-21','Viernes','ALPINA','DIEGO RATIVA','WTN748','23054TSS 23099','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,60000,'WTN748 EXTRA $60.000',
   7864095,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   50,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 27 – EST067 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','JORGE RIVILLAS','EST067','23100','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5805397,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   40,NULL,'TYM'),

  /* 28 – WFQ635 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','JHENCI LOPEZ','WFQ635','23075 23061 20126','7006 9450','LA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   12706265,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='LA VIRGINIA' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* 29 – JVM223 – sin adicional */
  ('2026-08-21','Viernes','ALPINA','WILMAR CARDONA','JVM223','23076 23063 20127','7007 9451','MISTRATO','LUIS CARLOS CADAVID RESTREPO, MANUEL ALEJANDRO RAMIREZ OVALLE',2,
   2,0,'-',
   14357248,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MISTRATO' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 30 – SQB119 – sin adicional */
  ('2026-08-21','Viernes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20129 20113','FLEISCHMANN','ARMENIA','JUAN DIEGO FRANCO VERGARA',1,
   1,0,'-',
   4719546,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   52,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-08-21'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
