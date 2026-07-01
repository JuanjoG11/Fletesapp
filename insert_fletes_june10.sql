/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 10 JUNIO 2026
   Generado: 2026-06-11T19:40:04.579Z
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-10'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 10‑Jun‑2026
   -------------------------------------------------
   - base_price = (SELECT precio FROM precios_fletes …)
   - price      = base_price + valor_adicional_negociacion
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES
  /* 01 – SYU652 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','JOHAN ECHEVERRY','SYU652','20994','9552','MANIZALES VILLAMARIA','EDWAR ZAPATA',1,
   1,0,'-',
   5299601,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   42,NULL,'TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','CAMILO CASTAÑO','KOL802','20934 20995 19146','9553 7001','MANIZALES VILLAMARIA','GERMAN GALVEZ',1,
   1,0,'-',
   13346842,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 03 – WFV015 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','YONNI VALENCIA','WFV015','20996 19140 19143','9554','MANIZALES VILLAMARIA','CRISTIAN OSPINA',1,
   1,0,'-',
   7747552,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   56,'FEP1186670','TYM'),

  /* 04 – TRL186 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','WILLIAM','TRL186','20956 19127','9555TSS','MANIZALES VILLAMARIA','ADRIAN MARTINEZ',1,
   1,0,'-',
   4570778,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 05 – EYY183 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','JOHN ARENAS','EYY183','20973 20997 19144','9555 7001','MANIZALES VILLAMARIA','ALEJANDRO MARIN',1,
   1,0,'-',
   6462952,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 06 – SLI587 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','MIGUEL GONZALES','SLI587','20998','9556','MANIZALES VILLAMARIA','MILTON OSORIO',1,
   1,0,'-',
   4798874,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   40,'FEP1186668 FEP1186671','TYM'),

  /* 07 – WGZ876 – **ADICIONAL $100.000** */
  ('2026-06-10','Miércoles','ALPINA','RICARDO PINEDA','WGZ876','20999','9557','MARMATO LA MERCED','JUAN DELGADO, MATEO VILLALBA',2,
   2,100000,'WGZ876 ADICIONAL AL FLETE $100.000 ENTREGA DE SUPER Y MAYORISTA DE FLEISCHMANN P',
   15439071,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1) + 100000,
   36,NULL,'TYM'),

  /* 08 – EYX091 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','CARLOS GOMEZ','EYX091','20980 19136','9558','AGUADAS PACORA','VICTOR PULGARIN, JUAN COCOMA',2,
   2,0,'-',
   12171353,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 09 – SMH182 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','JUAN DAVID','SMH182','21000 19147','9559','PALESTINA ARAUCA','BRANDON BAEZ',1,
   1,0,'-',
   10240860,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PALESTINA ARAUCA' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 10 – SPU120 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','OSWALDO','SPU120','21001','9601','ARMENIA','YEISON RENDON',1,
   1,0,'-',
   6150151,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','GOBER CRISTANCHO','EQY944','21003','9603','ARMENIA','ALEXANDER COSTAIN, JOHAN MUÑOZ',2,
   2,0,'-',
   8235576,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 12 – SXF257 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','FABIO RUIZ','SXF257','20974 21004','9604 7010','QUIMBAYA','CAMILO CONTRERAS, CAMILO SUAREZ',2,
   2,0,'-',
   7210166,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 0,
   39,NULL,'TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','HUMBERTO RINCON','WLS478','20976 19151','9605','CORDOBA PIJAO BVISTA','CRISTIAN CAICEDO',1,
   1,0,'-',
   7674816,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 14 – TTL256 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','YIMERSON GARCIA','TTL256','20977 19150','9606','SALENTO','CRISTIAN CAMACHO',1,
   1,0,'-',
   9823307,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1) + 0,
   37,'AP654912 AP654913','TYM'),

  /* 15 – SMO183 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','GABRIEL PEREZ','SMO183','20985','9453','PEREIRA - DOSQUEBRADAS','JUAN QUINTERO',1,
   1,0,'-',
   5680737,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 16 – XVI496 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','PABLO RAMIREZ','XVI496','20986 19153','9454','PEREIRA - DOSQUEBRADAS','SEBASTIAN VILLADA',1,
   1,0,'-',
   8044655,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','RICARDO LOPEZ','TMZ674','20987','9455','PEREIRA - DOSQUEBRADAS','ANDRES RIOS',1,
   1,0,'-',
   6418959,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','CARLOS VELASCO','SPQ814','20988','9456','SANTA ROSA','SANTIAGO HENAO',1,
   1,0,'-',
   7530712,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 19 – WHM317 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','HUMBERTO PARRA','WHM317','20989','9457','PEREIRA - DOSQUEBRADAS','CAMILO MUÑOZ',1,
   1,0,'-',
   6651293,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','MIGUEL TABARES','PEK019','20990','9458','PEREIRA - DOSQUEBRADAS','JHON GIRALDO',1,
   1,0,'-',
   5370941,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 21 – WHM896 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','ALEXANDER CUELLAR','WHM896','20991','9459','PEREIRA - DOSQUEBRADAS','CAMILO PEÑA',1,
   1,0,'-',
   7172058,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','JULIAN','WLC133','20992','9460','PEREIRA - DOSQUEBRADAS','EDWIN GOMEZ, JUAN CONTRERAS',2,
   2,0,'-',
   6696034,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   69,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','ADALBERTO MEJIA','TNH494','20993 20982','9461 9450','CARTAGO 2T','DIORLAN FLOREZ',1,
   1,0,'-',
   9233638,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 24 – WTN748 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','DIEGO RATIVA','WTN748','21005 19155 19152','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN VALENCIA',1,
   1,0,'-',
   8696721,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   66,NULL,'TYM'),

  /* 25 – EST067 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','JORGE RIVILLAS','EST067','21006','7005','ARGELIA EL CAIRO','CESAR CASTILLO',1,
   1,0,'-',
   8472885,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARGELIA EL CAIRO' LIMIT 1) + 0,
   31,'AP653357-359-360 AP653533','TYM'),

  /* 26 – ERK303 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','JORGE ALARCON','ERK303','20978 19138','7006','BALBOA LA CELIA','ROBINSON TORRES',1,
   1,0,'-',
   7319249,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1) + 0,
   42,NULL,'TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-06-10','Miércoles','ALPINA','WILMAR CARDONA','JVM223','20971 20979 19141','7007 9451','ANSERMA','OSCAR RESTREPO, JOHN MORENO',2,
   2,0,'-',
   17150048,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 28 – SQB119 – sin adicional */
  ('2026-06-10','Miércoles','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19137','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   5794969,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida (opcional)
   ------------------------------------------------- */
SELECT fecha,
       placa,
       precio                      AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       proveedor
FROM fletes
WHERE fecha = '2026-06-10'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
