/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 9 JUNIO 2026
   Generado: 2026-06-09T21:15:00.000Z
   ✅  Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-09'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 09‑Jun‑2026
   -------------------------------------------------
   Mapeo de poblaciones:
     MANIZALES        → MANIZALES VILLAMARIA
     SUPIA            → SUPIA
     SUPIA RIOSUCIO   → RIOSUCIO-SUPIA SUPERMERCADO
     CHINCHINA        → CHINCHINA
     ARMENIA          → ARMENIA
     CALARCA          → CALARCA
     MONTENEGRO       → MONTENEGRO PTAPAO
     TEBAIDA          → TEBAIDA
     CIRCASIA         → CIRCASIA
     PEREIRA          → PEREIRA - DOSQUEBRADAS
     SANTA ROSA       → SANTA ROSA
     CARTAGO          → CARTAGO 2T
     ANSERMA NUEVO    → ANSERMA NUEVO 2T
     SANTUARIO VIRGINIA → APIA VIRGINIA
     BELEN DE UMBRIA  → BELEN DE UMBRIA
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
  ('2026-06-09','Martes','ALPINA','JOHAN ECHEVERRY','SYU652','20953','9552','MANIZALES VILLAMARIA','EDWAR ZAPATA',1,
   1,0,'-',
   5890649,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-06-09','Martes','ALPINA','CAMILO CASTAÑO','KOL802','20895TSS 20954 19125','9553 7001','MANIZALES VILLAMARIA','GERMAN GALVEZ, MATEO VILLALBA',2,
   2,0,'-',
   7751086,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 03 – WFV015 – sin adicional */
  ('2026-06-09','Martes','ALPINA','YONNI VALENCIA','WFV015','20955 19126','9554','MANIZALES VILLAMARIA','CRISTIAN OSPINA',1,
   1,0,'-',
   5480891,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 04 – EYY183 – sin adicional – con facturas adicionales AP/FEP */
  ('2026-06-09','Martes','ALPINA','RUBEN','EYY183','20917 20970 19123','9555 7000','MANIZALES VILLAMARIA','ALEJANDRO MARIN, ADRIAN MARTINEZ',2,
   2,0,'-',
   11852578,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   62,'FEP1186542 FEP1186543 AP650817','TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-06-09','Martes','ALPINA','MIGUEL GONZALES','SLI587','20933 20969 19128','9556 9550','MANIZALES VILLAMARIA','MILTON OSORIO',1,
   1,0,'-',
   7814231,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 06 – WGZ876 – EXTRA $60.000 */
  ('2026-06-09','Martes','ALPINA','RICARDO PINEDA','WGZ876','20957 19129','9557','SUPIA','JUAN DELGADO',1,
   1,60000,'WGZ876 EXTRA $60.000',
   9388830,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 60000,
   43,NULL,'TYM'),

  /* 07 – EYX091 – sin adicional */
  ('2026-06-09','Martes','ALPINA','CARLOS GOMEZ','EYX091','20937','9560','RIOSUCIO-SUPIA SUPERMERCADO','VICTOR PULGARIN, JUAN COCOMA',2,
   2,0,'-',
   8467823,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 0,
   6,NULL,'TYM'),

  /* 08 – SMH182 – sin adicional */
  ('2026-06-09','Martes','ALPINA','JUAN DAVID','SMH182','20958 19130','9559','CHINCHINA','BRANDON BAEZ',1,
   1,0,'-',
   4796064,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 09 – SPU120 – sin adicional */
  ('2026-06-09','Martes','ALPINA','OSWALDO','SPU120','20897 20959','9601 7009','ARMENIA','YEISON RENDON',1,
   1,0,'-',
   5110145,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   28,NULL,'TYM'),

  /* 10 – VZD334 – sin adicional */
  ('2026-06-09','Martes','ALPINA','JULIAN CUELLAR','VZD334','20896 20960','9602 7008','ARMENIA','SEBASTIAN VILLADA',1,
   1,0,'-',
   7233678,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional – con planillas FEP */
  ('2026-06-09','Martes','ALPINA','GOBER CRISTANCHO','EQY944','20961 19134 19132','9603','CALARCA','ALEXANDER COSTAIN',1,
   1,0,'-',
   5598620,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* 12 – SXF257 – sin adicional */
  ('2026-06-09','Martes','ALPINA','FABIO RUIZ','SXF257','20935 20962 19131','9604 7010','MONTENEGRO PTAPAO','CAMILO CONTRERAS, CAMILO SUAREZ',2,
   2,0,'-',
   7723222,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 13 – WLS478 – sin adicional – con factura adicional AP */
  ('2026-06-09','Martes','ALPINA','HUMBERTO RINCON','WLS478','20939 19133','9605','TEBAIDA','CRISTIAN CAICEDO',1,
   1,0,'-',
   7110425,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   38,'AP650827','TYM'),

  /* 14 – TTL256 – sin adicional */
  ('2026-06-09','Martes','ALPINA','ANDRES QUINTERO','TTL256','20940','9606','CIRCASIA','CRISTIAN CAMACHO',1,
   1,0,'-',
   2417508,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   28,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-06-09','Martes','ALPINA','GABRIEL PEREZ','SMO183','20944','9453','PEREIRA - DOSQUEBRADAS','JUAN QUINTERO',1,
   1,0,'-',
   5264196,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 16 – XVI496 – sin adicional */
  ('2026-06-09','Martes','ALPINA','PABLO RAMIREZ','XVI496','20945','9454','PEREIRA - DOSQUEBRADAS','ANDRES PINEDA',1,
   1,0,'-',
   5289215,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-06-09','Martes','ALPINA','RICARDO LOPEZ','TMZ674','20946','9455','PEREIRA - DOSQUEBRADAS','ANDRES RIOS, CAMILO MUÑOZ',2,
   2,0,'-',
   5531236,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-06-09','Martes','ALPINA','CARLOS VELASCO','SPQ814','20947','9456','SANTA ROSA','SANTIAGO HENAO',1,
   1,0,'-',
   3541241,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   38,NULL,'TYM'),

  /* 19 – WHM317 – sin adicional */
  ('2026-06-09','Martes','ALPINA','HUMBERTO PARRA','WHM317','20948','9457','PEREIRA - DOSQUEBRADAS','ESTEBAN GALLEGO',1,
   1,0,'-',
   4031721,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   37,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-06-09','Martes','ALPINA','MIGUEL TABARES','PEK019','20949','9458','PEREIRA - DOSQUEBRADAS','JHON GIRALDO',1,
   1,0,'-',
   5619617,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   41,NULL,'TYM'),

  /* 21 – TJX795 – sin adicional */
  ('2026-06-09','Martes','ALPINA','ANDRES QUINTERO','TJX795','20950','9459','PEREIRA - DOSQUEBRADAS','CAMILO PEÑA',1,
   1,0,'-',
   6132854,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-06-09','Martes','ALPINA','JULIAN','WLC133','20951','9460','PEREIRA - DOSQUEBRADAS','EDWIN GOMEZ, JUAN CONTRERAS',2,
   2,0,'-',
   7350537,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-06-09','Martes','ALPINA','ADALBERTO MEJIA','TNH494','20952','9461','CARTAGO 2T','DIORLAN FLOREZ',1,
   1,0,'-',
   4658001,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 24 – WTN748 – EXTRA $60.000 */
  ('2026-06-09','Martes','ALPINA','DIEGO RATIVA','WTN748','20963','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN VALENCIA',1,
   1,60000,'WTN748 EXTRA $60.000',
   7184052,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   55,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – EST067 – sin adicional */
  ('2026-06-09','Martes','ALPINA','JORGE RIVILLAS','EST067','20964','7005','ANSERMA NUEVO 2T','CESAR CASTILLO',1,
   1,0,'-',
   2163415,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1) + 0,
   18,NULL,'TYM'),

  /* 26 – ERK303 – sin adicional */
  ('2026-06-09','Martes','ALPINA','JORGE ALARCON','ERK303','20932 20941 19135','7006 9450','APIA VIRGINIA','ROBINSON TORRES, JOHAN MUÑOZ',2,
   2,0,'-',
   12775345,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-06-09','Martes','ALPINA','WILMAR CARDONA','JVM223','20936 20942','7007 9451','BELEN DE UMBRIA','OSCAR RESTREPO, JOHN MORENO',2,
   2,0,'-',
   8403916,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-06-09','Martes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19122','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   5750209,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   39,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida (opcional)
   ------------------------------------------------- */
SELECT fecha,
       placa,
       zona,
       poblacion,
       precio                      AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos,
       proveedor
FROM fletes
WHERE fecha = '2026-06-09'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
