/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 11 JUNIO 2026
   Generado: 2026-06-11T19:45:27.002Z
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-11'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 11‑Jun‑2026
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
  ('2026-06-11','Jueves','ALPINA','JOHAN ECHEVERRY','SYU652','21031 19166','9552','MANIZALES VILLAMARIA','EDWAR ZAPATA',1,
   1,0,'-',
   5346332,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   42,NULL,'TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','CAMILO CASTAÑO','KOL802','21032 19167','9553','MANIZALES VILLAMARIA','CRISTIAN OSPINA',1,
   1,0,'-',
   4512355,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 03 – EYX091 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','CARLOS GOMEZ','EYX091','21033 19157','9554','NEIRA','VICTOR PULGARIN, JUAN COCOMA',2,
   2,0,'-',
   8056863,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 04 – EYY183 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','RUBEN','EYY183','21034 19168 19161','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO',1,
   1,0,'-',
   6511969,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','MIGUEL GONZALES','SLI587','21015 21035 19162 19169','9556 9550','MANIZALES VILLAMARIA','MILTON OSORIO, ADRIAN MARTINEZ',2,
   2,0,'-',
   8676870,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','RICARDO PINEDA','WGZ876','21036 19148','9557','RIOSUCIO','JUAN DELGADO, MATEO VILLALBA',2,
   2,0,'-',
   9748360,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 07 – SMH182 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','JUAN DAVID','SMH182','21038 19171','9559','RDA S JOSE BELALCAZAR','BRANDON BAEZ, CAMILO SUAREZ',2,
   2,0,'-',
   10182502,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RDA S JOSE BELALCAZAR' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 08 – WFV015 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','YONNI VALENCIA','WFV015','21013','7008','CALARCA','JOHAN MUÑOZ',1,
   1,0,'-',
   12606766,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   3,NULL,'TYM'),

  /* 09 – SPU120 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','OSWALDO','SPU120','21039 21014','9601 7009','ARMENIA','YEISON RENDON',1,
   1,0,'-',
   8269575,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 10 – EQN953 – **AJUSTE ADICIONAL $20.000** */
  ('2026-06-11','Jueves','ALPINA','ORLANDO VASQUEZ','EQN953','21002 21047','9602','ARMENIA','SEBASTIAN VILLADA',1,
   1,20000,'EQN953 VALOR DE FLETE $350.000',
   6015086,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 20000,
   57,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','GOBER CRISTANCHO','EQY944','21041','9603','ARMENIA','ALEXANDER COSTAIN',1,
   1,0,'-',
   5971478,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   60,'AP654914','TYM'),

  /* 12 – SXF257 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','FABIO RUIZ','SXF257','21042 19172 19174','9604','ALCALA ULLOA','CAMILO CONTRERAS',1,
   1,0,'-',
   6805209,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','HUMBERTO RINCON','WLS478','21021 19175','9605','CAICEDONIA','CRISTIAN CAICEDO, JUAN CONTRERAS',2,
   2,0,'-',
   12161038,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 14 – TTL256 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','ANDRES QUINTERO','TTL256','21010 21020 19178','9606 9600','FILANDIA','CRISTIAN CAMACHO',1,
   1,0,'-',
   7456086,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1) + 0,
   37,NULL,'TYM'),

  /* 15 – SMO183 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','GABRIEL PEREZ','SMO183','21022','9453','PEREIRA - DOSQUEBRADAS','JUAN QUINTERO',1,
   1,0,'-',
   5742745,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 16 – XVI496 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','PABLO RAMIREZ','XVI496','20986TSS 21023 19158','9454','PEREIRA - DOSQUEBRADAS','ANDRES PINEDA',1,
   1,0,'-',
   9099565,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   73,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','RICARDO LOPEZ','TMZ674','21024','9455','PEREIRA - DOSQUEBRADAS','ANDRES RIOS',1,
   1,0,'-',
   4608765,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','CARLOS VELASCO','SPQ814','21025 21012','9456 7002','SANTA ROSA','SANTIAGO HENAO',1,
   1,0,'-',
   5416218,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 19 – WHM317 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','HUMBERTO PARRA','WHM317','21026 19163','9457','PEREIRA - DOSQUEBRADAS','ESTEBAN GALLEGO',1,
   1,0,'-',
   4026953,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','MIGUEL TABARES','PEK019','21027','9458','PEREIRA - DOSQUEBRADAS','JHON GIRALDO',1,
   1,0,'-',
   5069800,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 21 – WLC133 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','JULIAN','WLC133','21028','9459','PEREIRA - DOSQUEBRADAS','CAMILO PEÑA',1,
   1,0,'-',
   9264338,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 22 – WHM896 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','ALEXANDER CUELLAR','WHM896','21029','9460','PEREIRA - DOSQUEBRADAS','EDWIN GOMEZ',1,
   1,0,'-',
   4824868,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   35,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','ADALBERTO MEJIA','TNH494','21030','9461','CARTAGO 2T','DIORLAN FLOREZ',1,
   1,0,'-',
   6382711,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   52,'AP656201','TYM'),

  /* 24 – WTN748 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','DIEGO RATIVA','WTN748','21043 19159','7004','MARSELLA','BRAHIAN VALENCIA, CAMILO MUÑOZ',2,
   2,0,'-',
   9270797,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARSELLA' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 25 – EST067 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','JORGE RIVILLAS','EST067','21044','7005','CARTAGO 2T','CESAR CASTILLO',1,
   1,0,'-',
   7010596,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   42,'AP656183','TYM'),

  /* 26 – ERK303 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','JORGE ALARCON','ERK303','21018 19160','7006','APIA VIRGINIA','ROBINSON TORRES, GERMAN GALVEZ',2,
   2,0,'-',
   8440837,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-06-11','Jueves','ALPINA','WILMAR CARDONA','JVM223','21008 21019 19177','7007 9451','VITERBO','OSCAR RESTREPO, JOHN MORENO',2,
   2,0,'-',
   13612470,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1) + 0,
   64,NULL,'TYM'),

  /* 28 – SQB119 – sin adicional */
  ('2026-06-11','Jueves','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19165 19176','FLEISCHMANN','CUBA','DIEGO FRANCO',1,
   1,0,'-',
   5284962,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='CUBA' LIMIT 1) + 0,
   36,NULL,'TYM');

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
WHERE fecha = '2026-06-11'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
