/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 2 SEPTIEMBRE 2026
   Generado: 2026-09-02
   Notas:
     - KOL802  ADICIONAL AL FLETE $100.000 ENTREGA DE SUPER
     - WGZ876  ADICIONAL AL FLETE $360.000
     - WEP384  EXTRA $60.000
     - MAT480  (Armenia Super) VALOR DE FLETE $500.000 (precio fijo)
     - ETM037  ADICIONAL AL FLETE $50.000
     - WFQ635  ADICIONAL AL FLETE $40.000
     - SXF257  ADICIONAL AL FLETE $200.000 ENTREGA DE NEGOCIACION
     - WLS478  ADICIONAL $100.000 ENTREGA NEGOCIACION
     - SMO183  VALOR DE FLETE $300.000 (precio fijo)
     - JVM223  ADICIONAL AL FLETE $100.000
     - TRF860  VALOR FLETE 300.000 (precio fijo, sin pedidos registrados)
     - JHONNY LOPEZ         → JHONNY LOPEZ (sin apellido completo disponible)
     - VALENTINA GARCIA     → VALENTINA GARCIA
     - SAMUEL ARIAS         → SAMUEL ARIAS
     - DANIELA CASTIBLANCO  → DANIELA CASTIBLANCO
     - MANUEL RAMIREZ       → MANUEL RAMIREZ
     - QUEBIN LOTERO        → QUEBIN LOTERO
     - DIEGO FRANCO         → DIEGO FRANCO
     - JULIAN RODRIGUEZ     → JULIAN RODRIGUEZ
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-09-02'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 02‑Sep‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ─────────────────────────────── */

  /* 01 – SYU652 – sin adicional | AP: 23433 | 42 ped | $6.783.503 */
  ('2026-09-02','Miércoles','ALPINA','JOHAN ECHEVERRY','SYU652','23433','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   6783503,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   42,NULL,'TYM'),

  /* 02 – KOL802 – ADICIONAL $100.000 ENTREGA DE SUPER | AP: 23434 | 60 ped | $9.120.260 */
  ('2026-09-02','Miércoles','ALPINA','FREDY GALLEGO','KOL802','23434','9553','MANIZALES VILLAMARIA','CARLOS JIMENEZ, JHONNY LOPEZ',2,
   2,100000,'ADICIONAL AL FLETE $100.000 ENTREGA DE SUPER',
   9220260,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 100000,
   60,NULL,'TYM'),

  /* 03 – WFV015 – sin adicional | AP: 23435 FEP: 20271 | 58 ped | $8.334.434 */
  ('2026-09-02','Miércoles','ALPINA','YONNI VALENCIA','WFV015','23435 20271','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   8334434,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 04 – SPU120 – sin adicional | AP: 23436 FEP: 20272 | 52 ped | $8.237.025 */
  ('2026-09-02','Miércoles','ALPINA','OSWALDO','SPU120','23436 20272','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   8237025,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 05 – SLI587 – sin adicional | AP: 23429 FEP: 20261 20273 | 45 ped | $6.786.670 */
  ('2026-09-02','Miércoles','ALPINA','MIGUEL GONZALES','SLI587','23429 20261 20273','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   6786670,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 06 – WGZ876 – ADICIONAL $360.000 | AP: 23414 23373TSS | 43 ped | $16.316.404 */
  ('2026-09-02','Miércoles','ALPINA','RICARDO PINEDA','WGZ876','23414 23373TSS','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ',1,
   1,360000,'ADICIONAL AL FLETE $360.000',
   16676404,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1) + 360000,
   43,NULL,'TYM'),

  /* 07 – WEP384 – EXTRA $60.000 | AP: 23418 FEP: 20262 | 50 ped | $10.684.767 */
  ('2026-09-02','Miércoles','ALPINA','YOFER LOPEZ','WEP384','23418 20262','9559','PALESTINA ARAUCA','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'EXTRA $60.000',
   10744767,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PALESTINA ARAUCA' LIMIT 1) + 60000,
   50,NULL,'TYM'),

  /* 08 – EYX091 – sin adicional | AP: 23417 23374 | 68 ped | $15.800.385 */
  ('2026-09-02','Miércoles','ALPINA','ANDRES GOMEZ','EYX091','23417 23374','9558','AGUADAS PACORA','JUAN CAMILO COCOMA OROZCO, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   15800385,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1) + 0,
   68,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ──────────────────────────────────── */

  /* 09 – MAT480 – Armenia Super VALOR FLETE $500.000 (precio fijo) | AP: 23388 23386 | 2 ped | $24.067.200 */
  ('2026-09-02','Miércoles','ALPINA','ELKIN AGUIRRE','MAT480','23388 23386','7009 LA50/LA19','ARMENIA SUPER','CESAR AUGUSTO CASTILLO LONDOÑO',1,
   0,0,'VALOR DE FLETE $500.000',
   24067200,
   500000,
   2,NULL,'TYM'),

  /* 10 – ETM037 – ADICIONAL $50.000 | AP: 23445 23431 | 54 ped | $9.281.267 */
  ('2026-09-02','Miércoles','ALPINA','OSCAR MARIN','ETM037','23445 23431','9601 7009LA19','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,50000,'ADICIONAL AL FLETE $50.000',
   9331267,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 50000,
   54,NULL,'TYM'),

  /* 11 – TJX795 – sin adicional | AP: 23446 23407TSS | 55 ped | $7.071.955 */
  ('2026-09-02','Miércoles','ALPINA','ANDRES QUINTERO','TJX795','23446 23407TSS','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, VALENTINA GARCIA',2,
   2,0,'-',
   7071955,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 12 – WFQ635 – ADICIONAL $40.000 | AP: 23447 | 61 ped | $9.414.279 */
  ('2026-09-02','Miércoles','ALPINA','JHENCI LOPEZ','WFQ635','23447','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, ELKIN GARCIA OCAMPO',2,
   2,40000,'ADICIONAL AL FLETE $40.000',
   9454279,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 40000,
   61,NULL,'TYM'),

  /* 13 – SXF257 – ADICIONAL $200.000 ENTREGA DE NEGOCIACION | AP: 23448 23450 | 44 ped | $13.626.538 */
  ('2026-09-02','Miércoles','ALPINA','FABIO RUIZ','SXF257','23448 23450','9604','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS, SAMUEL ARIAS',2,
   2,200000,'ADICIONAL AL FLETE $200.000 ENTREGA DE NEGOCIACION',
   13826538,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 200000,
   44,NULL,'TYM'),

  /* 14 – WLS478 – ADICIONAL $100.000 ENTREGA NEGOCIACION | AP: 23419 FEP: 20266 | 43 ped | $6.308.236 */
  ('2026-09-02','Miércoles','ALPINA','HUMBERTO RINCON','WLS478','23419 20266','9605','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,100000,'ADICIONAL $100.000 ENTREGA NEGOCIACION',
   6408236,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1) + 100000,
   43,NULL,'TYM'),

  /* 15 – TTL256 – sin adicional | AP: 23420 23413 FEP: 20265 | 32 ped | $7.561.103 */
  ('2026-09-02','Miércoles','ALPINA','ANDRES QUINTERO','TTL256','23420 23413 20265','9606 9600','SALENTO','DANIELA CASTIBLANCO',1,
   1,0,'-',
   7561103,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1) + 0,
   32,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ─────────────────────────────── */

  /* 16 – SMO183 – VALOR FLETE $300.000 (precio fijo) | AP: 23415 23432 | 51 ped | $7.437.847 */
  ('2026-09-02','Miércoles','ALPINA','GABRIEL PEREZ','SMO183','23415 23432','9453','PEREIRA','JUAN DAVID QUINTERO GRAJALES',1,
   0,0,'VALOR DE FLETE $300.000',
   7437847,
   300000,
   51,NULL,'TYM'),

  /* 17 – VZD334 – sin adicional | AP: 23437 FEP: 20267 | 44 ped | $7.650.659 */
  ('2026-09-02','Miércoles','ALPINA','JULIAN CUELLAR','VZD334','23437 20267','9454','PEREIRA','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7650659,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 18 – TMZ674 – sin adicional | AP: 23438 | 55 ped | $6.774.452 */
  ('2026-09-02','Miércoles','ALPINA','RICARDO LOPEZ','TMZ674','23438','9455','PEREIRA','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   6774452,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional | AP: 23426 | 50 ped | $7.235.646 */
  ('2026-09-02','Miércoles','ALPINA','CARLOS VELASCO','SPQ814','23426','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   7235646,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 20 – WHM896 – sin adicional | AP: 23440 | 56 ped | $7.359.435 */
  ('2026-09-02','Miércoles','ALPINA','ALEXANDER CUELLAR','WHM896','23440','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7359435,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional | AP: 23441 | 63 ped | $6.896.391 */
  ('2026-09-02','Miércoles','ALPINA','MIGUEL TABARES','PEK019','23441','9458','PEREIRA','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   6896391,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   63,NULL,'TYM'),

  /* 22 – LUM993 – sin adicional | AP: 23442 23399TSS | 57 ped | $9.054.751 */
  ('2026-09-02','Miércoles','ALPINA','PABLO RAMIREZ','LUM993','23442 23399TSS','9459','PEREIRA','QUEBIN LOTERO, CAMILO LEANDRO GUECHE PEÑA',2,
   2,0,'-',
   9054751,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 23 – WLC133 – sin adicional | AP: 23443 | 68 ped | $7.843.342 */
  ('2026-09-02','Miércoles','ALPINA','GABRIEL PEREZ','WLC133','23443','9460','PEREIRA','SANTIAGO HENAO MORALES',1,
   1,0,'-',
   7843342,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   68,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional | AP: 23444 23428 | 55 ped | $9.283.162 */
  ('2026-09-02','Miércoles','ALPINA','ADALBERTO MEJIA','TNH494','23444 23428','9461 9450','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   9283162,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 25 – WTN748 – sin adicional | AP: 23449 23410TSS FEP: 20268 | 70 ped | $10.527.991 */
  ('2026-09-02','Miércoles','ALPINA','DIEGO RATIVA','WTN748','23449 23410TSS 20268','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   10527991,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   70,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ──────────────────────────────── */

  /* 26 – MAT480 – Anserma Nuevo 2T | AP: 23416 FEP: 20259 20235 | 32 ped | $6.316.031 */
  ('2026-09-02','Miércoles','ALPINA','ELKIN AGUIRRE','MAT480','23416 20259 20235','7005','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   6316031,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1) + 0,
   32,NULL,'TYM'),

  /* 27 – ERK303 – sin adicional | AP: 23421 FEP: 20257 | 42 ped | $8.465.629 */
  ('2026-09-02','Miércoles','ALPINA','JORGE ALARCON','ERK303','23421 20257','7006','BALBOA LA CELIA','ROVINSON TORRES RIVERA',1,
   1,0,'-',
   8465629,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1) + 0,
   42,NULL,'TYM'),

  /* 28 – JVM223 – ADICIONAL $100.000 | AP: 23412 23422 FEP: 20260 | 54 ped | $16.999.219 */
  ('2026-09-02','Miércoles','ALPINA','WILMAR CARDONA','JVM223','23412 23422 20260','7007 9451','ANSERMA','MANUEL RAMIREZ, JHON FREDY MORENO',2,
   2,100000,'ADICIONAL AL FLETE $100.000',
   17099219,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1) + 100000,
   54,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional | FEP: 20270 | 40 ped | $4.109.742 */
  ('2026-09-02','Miércoles','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20270','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   4109742,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   40,NULL,'TYM'),

  /* 30 – TRF860 – VALOR FLETE $300.000 (precio fijo, sin pedidos registrados) */
  ('2026-09-02','Miércoles','FLEISCHMANN','ALBERTO GONZALO','TRF860',NULL,'FLEISCHMANN','CARTAGO 2T','JULIAN RODRIGUEZ',1,
   0,0,'VALOR FLETE 300.000',
   300000,
   300000,
   0,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-09-02'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
