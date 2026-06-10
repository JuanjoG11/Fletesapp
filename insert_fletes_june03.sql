/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 3 JUNIO 2026
   Generado: 2026-06-03T22:31:00.000Z
   ✅  Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-03'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 03‑Jun‑2026
   -------------------------------------------------
   Nombres exactos en precios_fletes:
     MANIZALES        → MANIZALES VILLAMARIA
     VILLAMARIA       → MANIZALES VILLAMARIA
     ARAUCA PALESTINA → PALESTINA ARAUCA
     AGUADAS          → AGUADAS PACORA
     PIJAO CORDOBA    → CORDOBA PIJAO BVISTA
     CARTAGO          → CARTAGO 2T
     ANSERMA NUEVO    → ANSERMA NUEVO 2T
     PEREIRA          → PEREIRA - DOSQUEBRADAS
     MARMATO LA MERCED→ MARMATO LA MERCED  ✓
     BALBOA LA CELIA  → BALBOA LA CELIA    ✓
     SALENTO          → SALENTO            ✓
     QUIMBAYA         → QUIMBAYA           ✓
     ANSERMA          → ANSERMA            ✓
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

/* -----------------------------------------------------------------
   01 – SYU652 – EXTRA $60.000  |  MANIZALES
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','JOHAN ECHEVERRY','SYU652','20800 19054','9552','MANIZALES VILLAMARIA','EDWAR ZAPATA',1,
 1,60000,'SYU652 EXTRA $60.000',
 15609514,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
 49,'AP648056','TYM'),

/* -----------------------------------------------------------------
   02 – KOL802 – sin adicional  |  VILLAMARIA → MANIZALES VILLAMARIA
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','CAMILO CASTAÑO','KOL802','20801','9553','MANIZALES VILLAMARIA','GERMAN GALVEZ',1,
 1,0,'-',
 9143775,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
 48,'AP648059','TYM'),

/* -----------------------------------------------------------------
   03 – WFV015 – ADICIONAL $100.000  |  MANIZALES
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','YONNI VALENCIA','WFV015','20735 20802 19055','9554 7000','MANIZALES VILLAMARIA','CRISTIAN OSPINA',1,
 1,100000,'WFV015 ADICIONAL AL FLETE $100.000 ENTREGA DE NEGOCIACION+SUPER',
 13146047,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 100000,
 58,'AP648057','TYM'),

/* -----------------------------------------------------------------
   04 – TRL186 – sin adicional  |  MANIZALES
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','RUBEN','TRL186','20803 19056','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO',1,
 1,0,'-',
 8792691,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
 50,NULL,'TYM'),

/* -----------------------------------------------------------------
   05 – SLI587 – sin adicional  |  MANIZALES
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','MIGUEL GONZALES','SLI587','20804 19057','9556','MANIZALES VILLAMARIA','ADRIAN MARTINEZ',1,
 1,0,'-',
 5884151,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
 44,NULL,'TYM'),

/* -----------------------------------------------------------------
   06 – WGZ876 – sin adicional  |  MARMATO LA MERCED ✓ nombre exacto
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','RICARDO PINEDA','WGZ876','20805','9557','MARMATO LA MERCED','JUAN DELGADO, MATEO VILLALBA',2,
 2,0,'-',
 12920989,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1) + 0,
 32,NULL,'TYM'),

/* -----------------------------------------------------------------
   07 – EYX091 – sin adicional  |  AGUADAS → AGUADAS PACORA
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','CARLOS GOMEZ','EYX091','20785 20786 19045','9558','AGUADAS PACORA','VICTOR PULGARIN, JUAN COCOMA',2,
 2,0,'-',
 16086195,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1) + 0,
 72,NULL,'TYM'),

/* -----------------------------------------------------------------
   08 – SMH182 – EXTRA $60.000  |  ARAUCA PALESTINA → PALESTINA ARAUCA
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','JUAN DAVID','SMH182','20806 19059','9559','PALESTINA ARAUCA','BRANDON BAEZ',1,
 1,60000,'SMH182 EXTRA $60.000',
 10438436,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PALESTINA ARAUCA' LIMIT 1) + 60000,
 51,NULL,'TYM'),

/* -----------------------------------------------------------------
   09 – SPU120 – sin adicional  |  ARMENIA ✓
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','OSWALDO','SPU120','20790 20807','9601 7009','ARMENIA','YEISON RENDON',1,
 1,0,'-',
 8751294,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
 53,NULL,'TYM'),

/* -----------------------------------------------------------------
   10 – VZD334 – sin adicional  |  ARMENIA ✓
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','JULIAN CUELLAR','VZD334','20808','9602','ARMENIA','SEBASTIAN VILLADA, CAMILO MUÑOZ',2,
 2,0,'-',
 8750824,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
 66,NULL,'TYM'),

/* -----------------------------------------------------------------
   11 – EQY944 – sin adicional  |  ARMENIA ✓
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','GOBER CRISTANCHO','EQY944','20809','9603','ARMENIA','ALEXANDER COSTAIN, JUAN CONTRERAS',2,
 2,0,'-',
 8796994,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
 54,NULL,'TYM'),

/* -----------------------------------------------------------------
   12 – SXF257 – ADICIONAL $100.000 NEGOCIACION  |  QUIMBAYA ✓
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','FABIO RUIZ','SXF257','20810 20784','9604 7010','QUIMBAYA','CAMILO CONTRERAS, CAMILO SUAREZ',2,
 2,100000,'SXF257 ADICIONAL AL FLETE $100.000 NEGOCIACION',
 14741880,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 100000,
 50,NULL,'TYM'),

/* -----------------------------------------------------------------
   13 – WLS478 – sin adicional  |  PIJAO CORDOBA → CORDOBA PIJAO BVISTA
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','HUMBERTO RINCON','WLS478','20811 19061 19062','9605','CORDOBA PIJAO BVISTA','CRISTIAN CAICEDO',1,
 1,0,'-',
 8499731,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1) + 0,
 46,NULL,'TYM'),

/* -----------------------------------------------------------------
   14 – TTL256 – sin adicional  |  SALENTO ✓
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','YIMERSON GARCIA','TTL256','20812 19060','9606','SALENTO','CRISTIAN CAMACHO',1,
 1,0,'-',
 9344549,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1) + 0,
 36,'AP648052 AP648055','TYM'),

/* -----------------------------------------------------------------
   15 – MAT480 – TSS planilla  |  PEREIRA → PEREIRA - DOSQUEBRADAS
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','ELKIN AGUIRRE','MAT480','20754TSS','9459TSS','PEREIRA - DOSQUEBRADAS','FABIAN VENDEDOR',1,
 1,0,'-',
 2494452,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
 28,NULL,'TYM'),

/* -----------------------------------------------------------------
   16 – SMO183 – sin adicional  |  PEREIRA → PEREIRA - DOSQUEBRADAS
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','GABRIEL PEREZ','SMO183','20791','9453','PEREIRA - DOSQUEBRADAS','JUAN QUINTERO',1,
 1,0,'-',
 6846647,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
 57,NULL,'TYM'),

/* -----------------------------------------------------------------
   17 – LUM993 – sin adicional  |  PEREIRA → PEREIRA - DOSQUEBRADAS
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','PABLO RAMIREZ','LUM993','20792 19063','9454','PEREIRA - DOSQUEBRADAS','ANDRES PINEDA',1,
 1,0,'-',
 7229468,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
 43,NULL,'TYM'),

/* -----------------------------------------------------------------
   18 – TMZ674 – sin adicional  |  PEREIRA → PEREIRA - DOSQUEBRADAS
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','RICARDO LOPEZ','TMZ674','20793','9455','PEREIRA - DOSQUEBRADAS','ANDRES RIOS, JOHN MORENO',2,
 2,0,'-',
 9360012,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
 69,NULL,'TYM'),

/* -----------------------------------------------------------------
   19 – SPQ814 – sin adicional  |  SANTA ROSA ✓
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','CARLOS VELASCO','SPQ814','20794','9456','SANTA ROSA','SANTIAGO HENAO',1,
 1,0,'-',
 7284592,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
 52,NULL,'TYM'),

/* -----------------------------------------------------------------
   20 – WHM317 – sin adicional  |  PEREIRA → PEREIRA - DOSQUEBRADAS
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','HUMBERTO PARRA','WHM317','20795','9457','PEREIRA - DOSQUEBRADAS','ESTEBAN GALLEGO',1,
 1,0,'-',
 8520980,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
 58,NULL,'TYM'),

/* -----------------------------------------------------------------
   21 – PEK019 – sin adicional  |  PEREIRA → PEREIRA - DOSQUEBRADAS
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','MIGUEL TABARES','PEK019','20796','9458','PEREIRA - DOSQUEBRADAS','JHON GIRALDO',1,
 1,0,'-',
 7167172,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
 59,NULL,'TYM'),

/* -----------------------------------------------------------------
   22 – WHM896 – sin adicional  |  PEREIRA → PEREIRA - DOSQUEBRADAS
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','ALEXANDER CUELLAR','WHM896','20797','9459','PEREIRA - DOSQUEBRADAS','CAMILO PEÑA',1,
 1,0,'-',
 7943295,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
 57,NULL,'TYM'),

/* -----------------------------------------------------------------
   23 – WLC133 – sin adicional  |  PEREIRA → PEREIRA - DOSQUEBRADAS
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','JULIAN','WLC133','20798','9460','PEREIRA - DOSQUEBRADAS','EDWIN GOMEZ',1,
 1,0,'-',
 8113156,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
 70,NULL,'TYM'),

/* -----------------------------------------------------------------
   24 – TNH494 – sin adicional  |  CARTAGO → CARTAGO 2T
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','ADALBERTO MEJIA','TNH494','20789 20799','9461 9450','CARTAGO 2T','DIORLAN FLOREZ',1,
 1,0,'-',
 9987750,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
 52,NULL,'TYM'),

/* -----------------------------------------------------------------
   25 – WTN748 – sin adicional  |  PEREIRA → PEREIRA - DOSQUEBRADAS
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','DIEGO RATIVA','WTN748','20813 19064','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN VALENCIA',1,
 1,0,'-',
 10164612,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
 69,NULL,'TYM'),

/* -----------------------------------------------------------------
   26 – TJX795 – VALOR DE FLETE FIJO $400.000  |  ANSERMA NUEVO 2T
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','ANDRES QUINTERO','TJX795','20769TSS 20814 19051','7005','ANSERMA NUEVO 2T','CESAR CASTILLO, JOHAN MUÑOZ',2,
 2,400000,'TJX795 VALOR DE FLETE $400.000',
 7699771,
 400000,
 54,NULL,'TYM'),

/* -----------------------------------------------------------------
   27 – ERK303 – sin adicional  |  BALBOA LA CELIA ✓ nombre exacto
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','JORGE ALARCON','ERK303','20815 19046 19047','7006','BALBOA LA CELIA','ROBINSON TORRES',1,
 1,0,'-',
 8649890,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1) + 0,
 45,NULL,'TYM'),

/* -----------------------------------------------------------------
   28 – JVM223 – sin adicional  |  ANSERMA ✓ nombre exacto
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','ALPINA','WILMAR CARDONA','JVM223','20816 20780 19050','7007 9451','ANSERMA','OSCAR RESTREPO, MILTON OSORIO',2,
 2,0,'-',
 18248853,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1) + 0,
 57,NULL,'TYM'),

/* -----------------------------------------------------------------
   29 – SQB119 – FLEISCHMANN  |  PEREIRA → PEREIRA - DOSQUEBRADAS
   ----------------------------------------------------------------- */
('2026-06-03','Miercoles','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19048 19053','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
 1,0,'-',
 6074131,
 (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
 58,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha,
       placa,
       poblacion,
       precio                      AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       proveedor
FROM fletes
WHERE fecha = '2026-06-03'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
