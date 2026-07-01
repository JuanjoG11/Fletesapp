/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 16 JUNIO 2026
   Generado: 2026-06-16T20:50:08.944Z
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-16'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 16‑Jun‑2026
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
  ('2026-06-16','Martes','ALPINA','JOHAN ECHEVERRY','SYU652','21158 19216 19212','9552','MANIZALES VILLAMARIA','EDWAR ZAPATA',1,
   1,0,'-',
   5848001,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-06-16','Martes','ALPINA','CAMILO CASTAÑO','KOL802','21159 19213','9553','MANIZALES VILLAMARIA','LUIS CADAVID',1,
   1,0,'-',
   4919033,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 03 – WFV015 – sin adicional */
  ('2026-06-16','Martes','ALPINA','YONNI VALENCIA','WFV015','21160 19231 19214','9554','MANIZALES VILLAMARIA','CRISTIAN OSPINA',1,
   1,0,'-',
   6248408,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 04 – EYY183 – sin adicional */
  ('2026-06-16','Martes','ALPINA','JOHN ARENAS','EYY183','21161 19215','9555','MANIZALES VILLAMARIA','ALEJANDRO MARIN',1,
   1,0,'-',
   5306452,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-06-16','Martes','ALPINA','MIGUEL GONZALES','SLI587','21137 21162','9556 9550','MANIZALES VILLAMARIA','MILTON OSORIO, ADRIAN MARTINEZ',2,
   2,0,'-',
   6602468,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 06 – WGZ876 – **ADICIONAL $60.000** */
  ('2026-06-16','Martes','ALPINA','RICARDO PINEDA','WGZ876','21163','9557','SUPIA','JUAN DELGADO',1,
   1,60000,'WGZ876 EXTRA $60.000',
   6766353,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 60000,
   32,NULL,'TYM'),

  /* 07 – EYX091 – sin adicional */
  ('2026-06-16','Martes','ALPINA','CARLOS GOMEZ','EYX091','21119 19217','9558','ARANZAZU FILADELFIA','VICTOR PULGARIN, JUAN COCOMA',2,
   2,0,'-',
   6399335,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARANZAZU FILADELFIA' LIMIT 1) + 0,
   30,NULL,'TYM'),

  /* 08 – SMH182 – sin adicional */
  ('2026-06-16','Martes','ALPINA','JUAN DAVID','SMH182','21164 19218','9559','CHINCHINA','BRANDON BAEZ',1,
   1,0,'-',
   4956615,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 09 – TRL186 – sin adicional */
  ('2026-06-16','Martes','ALPINA','WILLIAM','TRL186','21173','9560','RIOSUCIO','MATEO VILLALBA',1,
   1,0,'-',
   11339538,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1) + 0,
   9,'AP656190','TYM'),

  /* 10 – SNL038 – **ADICIONAL $205.000** */
  ('2026-06-16','Martes','ALPINA','MIGUEL','SNL038','21134','7008','CALARCA','CESAR CASTILLO',1,
   1,205000,'VALOR DE FLETE $550.000',
   12372020,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 205000,
   2,NULL,'TYM'),

  /* 11 – SPU120 – sin adicional */
  ('2026-06-16','Martes','ALPINA','OSWALDO','SPU120','21135 21165','9601 7009','ARMENIA','YEISON RENDON',1,
   1,0,'-',
   6649976,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 12 – VZD334 – sin adicional */
  ('2026-06-16','Martes','ALPINA','JULIAN CUELLAR','VZD334','21174 19230','9602','ARMENIA','SEBASTIAN VILLADA',1,
   1,0,'-',
   6944270,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   57,'AP660301','TYM'),

  /* 13 – EQY944 – sin adicional */
  ('2026-06-16','Martes','ALPINA','GOBER CRISTANCHO','EQY944','21144 21167 19224 19222 19221','9603 7008','CALARCA','ALEXANDER COSTAIN',1,
   1,0,'-',
   10093103,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 14 – TTL256 – sin adicional */
  ('2026-06-16','Martes','ALPINA','ANDRES QUINTERO','TTL256','21168 19220','9604','MONTENEGRO','CAMILO CONTRERAS, CAMILO SUAREZ',2,
   2,0,'-',
   7443080,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO' LIMIT 1) + 0,
   64,'AP660295 AP660296','TYM'),

  /* 15 – WLS478 – sin adicional */
  ('2026-06-16','Martes','ALPINA','HUMBERTO RINCON','WLS478','21140 19223','9605','TEBAIDA','CRISTIAN CAICEDO',1,
   1,0,'-',
   4304761,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 16 – MAT480 – sin adicional */
  ('2026-06-16','Martes','ALPINA','ELKIN AGUIRRE','MAT480','21141 19225','9606','CIRCASIA','CRISTIAN CAMACHO',1,
   1,0,'-',
   2655449,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   33,NULL,'TYM'),

  /* 17 – SMO183 – sin adicional */
  ('2026-06-16','Martes','ALPINA','GABRIEL PEREZ','SMO183','21147','9453','PEREIRA-DOSQUEBRADAS','JUAN QUINTERO',1,
   1,0,'-',
   6450912,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA-DOSQUEBRADAS' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 18 – XVI496 – sin adicional */
  ('2026-06-16','Martes','ALPINA','PABLO RAMIREZ','XVI496','21149 19228','9454','PEREIRA-DOSQUEBRADAS','ANDRES PINEDA',1,
   1,0,'-',
   6957022,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA-DOSQUEBRADAS' LIMIT 1) + 0,
   50,'AP659114','TYM'),

  /* 19 – TMZ674 – sin adicional */
  ('2026-06-16','Martes','ALPINA','RICARDO LOPEZ','TMZ674','21150','9455','PEREIRA-DOSQUEBRADAS','ANDRES RIOS',1,
   1,0,'-',
   5649589,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA-DOSQUEBRADAS' LIMIT 1) + 0,
   64,NULL,'TYM'),

  /* 20 – SPQ814 – sin adicional */
  ('2026-06-16','Martes','ALPINA','CARLOS VELASCO','SPQ814','21151','9456','SANTA ROSA','GERMAN GALVEZ',1,
   1,0,'-',
   4923793,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 21 – WHM317 – sin adicional */
  ('2026-06-16','Martes','ALPINA','HUMBERTO PARRA','WHM317','21152','9457','PEREIRA-DOSQUEBRADAS','ESTEBAN GALLEGO',1,
   1,0,'-',
   5549481,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA-DOSQUEBRADAS' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 22 – PEK019 – sin adicional */
  ('2026-06-16','Martes','ALPINA','MIGUEL TABARES','PEK019','21153','9458','PEREIRA-DOSQUEBRADAS','JHON GIRALDO',1,
   1,0,'-',
   6069798,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA-DOSQUEBRADAS' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 23 – WHM896 – sin adicional */
  ('2026-06-16','Martes','ALPINA','ALEXANDER CUELLAR','WHM896','21154','9459','PEREIRA-DOSQUEBRADAS','CAMILO PEÑA, SANTIAGO HENAO',2,
   2,0,'-',
   7620580,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA-DOSQUEBRADAS' LIMIT 1) + 0,
   64,NULL,'TYM'),

  /* 24 – WLC133 – sin adicional */
  ('2026-06-16','Martes','ALPINA','JULIAN','WLC133','21155','9460','PEREIRA-DOSQUEBRADAS','EDWIN GOMEZ, JUAN CONTRERAS',2,
   2,0,'-',
   7547094,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA-DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 25 – TNH494 – sin adicional */
  ('2026-06-16','Martes','ALPINA','ADALBERTO MEJIA','TNH494','21156','9461','CARTAGO 2T','DIORLAN FLOREZ',1,
   1,0,'-',
   4721251,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   62,'AP659476-485-490-495 AP660241','TYM'),

  /* 26 – WTN748 – **ADICIONAL $60.000** */
  ('2026-06-16','Martes','ALPINA','DIEGO RATIVA','WTN748','21169','7004','PEREIRA-DOSQUEBRADAS','BRAHIAN VALENCIA',1,
   1,60000,'WTN748 EXTRA $60.000',
   7410528,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA-DOSQUEBRADAS' LIMIT 1) + 60000,
   53,NULL,'TYM'),

  /* 27 – EST067 – sin adicional */
  ('2026-06-16','Martes','ALPINA','JORGE RIVILLAS','EST067','21143','7005','ANSERMA NUEVO 2T','ARBEY LARGO',1,
   1,0,'-',
   5244769,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1) + 0,
   32,NULL,'TYM'),

  /* 28 – ERK303 – sin adicional */
  ('2026-06-16','Martes','ALPINA','JORGE ALARCON','ERK303','21132 21157 19226 19229','7006 9450','SANTUARIO APIA','ROBINSON TORRES, JOHAN MUÑOZ',2,
   2,0,'-',
   11712221,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO APIA' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 29 – JVM223 – sin adicional */
  ('2026-06-16','Martes','ALPINA','WILMAR CARDONA','JVM223','21133 21142','7007 9451','BELEN','OSCAR RESTREPO, JOHN MORENO',2,
   2,0,'-',
   8838957,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 30 – SQB119 – sin adicional */
  ('2026-06-16','Martes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19219','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   6488669,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   44,NULL,'TYM');

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
WHERE fecha = '2026-06-16'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
