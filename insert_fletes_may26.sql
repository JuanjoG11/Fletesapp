/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 26 MAYO 2026
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-05-26'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 26‑May‑2026
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
/* -----------------------------------------------------------------
   01 – TMO981 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','JOHAN ECHEVERRY','TMO981','20544','9552','MANIZALES','EDWAR ZAPATA',1,
 1,0,'-',
 6753416,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 57,NULL,'TYM'),

/* -----------------------------------------------------------------
   02 – KOL802 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','CAMILO CASTAÑO','KOL802','20529 20545 18932','9553 7001','MANIZALES','GERMAN GALVEZ',1,
 1,0,'-',
 8184022,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 62,NULL,'TYM'),

/* -----------------------------------------------------------------
   03 – WFV015 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','YONNI VALENCIA','WFV015','20546','9554','MANIZALES','YEISON TABARES, CRISTIAN OSPINA',2,
 2,0,'-',
 8111713,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 52,NULL,'TYM'),

/* -----------------------------------------------------------------
   04 – EYY183 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','RUBEN','EYY183','20547 18933','9555','MANIZALES','JUAN ALEJANDRO',1,
 1,0,'-',
 7425450,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 61,NULL,'TYM'),

/* -----------------------------------------------------------------
   05 – SLI587 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','MIGUEL GONZALES','SLI587','20548 20526 18934','9556 9550','MANIZALES','MILTON OSORIO, ADRIAN MARTINEZ',2,
 2,0,'-',
 9119152,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 47,NULL,'TYM'),

/* -----------------------------------------------------------------
   06 – WGZ876 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','RICARDO PINEDA','WGZ876','20549 18935','9557','SUPIA','JUAN DELGADO, MATEO VILLALBA',2,
 2,0,'-',
 14582975,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 0,
 47,NULL,'TYM'),

/* -----------------------------------------------------------------
   07 – EYX091 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','CARLOS GOMEZ','EYX091','20527','9560','SUPIA RIOSUCIO','VICTOR PULGARIN, JUAN COCOMA',2,
 2,0,'-',
 15341791,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA RIOSUCIO' LIMIT 1) + 0,
 12,NULL,'TYM'),

/* -----------------------------------------------------------------
   08 – SMH182 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','JUAN DAVID','SMH182','20551 20530 18936','9559 7002','CHINCHINA','BRANDON BAEZ',1,
 1,0,'-',
 8371195,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
 67,'AP636699 AP636697','TYM'),

/* -----------------------------------------------------------------
   09 – SPU120 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','OSWALDO','SPU120','20552','9601 LA50','ARMENIA','YEISON RENDON',1,
 1,0,'-',
 8341177,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
 58,'AP636700','TYM'),

/* -----------------------------------------------------------------
   10 – VZD334 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','JULIAN CUELLAR','VZD334','20485 20553','9602 PATRIA','ARMENIA','JOHAN MUÑOZ',1,
 1,0,'-',
 7806225,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
 61,NULL,'TYM'),

/* -----------------------------------------------------------------
   11 – EQY944 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','GOBER CRISTANCHO','EQY944','20554 20531 18937 18938 18940 18941 18942','9603 7008','CALARCA','ALEXANDER COSTAIN',1,
 1,0,'-',
 11105824,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
 63,NULL,'TYM'),

/* -----------------------------------------------------------------
   12 – SXF257 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','FABIO RUIZ','SXF257','20555 18931 18946','9604','MONTENEGRO','CAMILO CONTRERAS, CAMILO SUAREZ',2,
 2,0,'-',
 9273533,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO' LIMIT 1) + 0,
 64,'AP639536 AP639537','TYM'),

/* -----------------------------------------------------------------
   13 – WLS478 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','HUMBERTO RINCON','WLS478','20556 18939','9605','TEBAIDA','CRISTIAN CAICEDO',1,
 1,0,'-',
 5549005,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
 49,NULL,'TYM'),

/* -----------------------------------------------------------------
   14 – TTL256 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','YIMERSON GARCIA','TTL256','20557 18944 18945','9606','CIRCASIA','CRISTIAN CAMACHO',1,
 1,0,'-',
 3696629,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
 44,NULL,'TYM'),

/* -----------------------------------------------------------------
   15 – SMO183 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','GABRIEL PEREZ','SMO183','20535','9453','PEREIRA','JUAN QUINTERO',1,
 1,0,'-',
 7429527,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 58,NULL,'TYM'),

/* -----------------------------------------------------------------
   16 – LUM993 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','PABLO RAMIREZ','LUM993','20536','9454','PEREIRA','ANDRES PINEDA',1,
 1,0,'-',
 7123452,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 48,NULL,'TYM'),

/* -----------------------------------------------------------------
   17 – TMZ674 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','RICARDO LOPEZ','TMZ674','20537','9455','PEREIRA','ANDRES RIOS, JUAN CONTRERAS',2,
 2,0,'-',
 7961510,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 66,NULL,'TYM'),

/* -----------------------------------------------------------------
   18 – SPQ814 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','CARLOS VELASCO','SPQ814','20538','9456','SANTA ROSA','SANTIAGO HENAO',1,
 1,0,'-',
 7321833,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
 53,NULL,'TYM'),

/* -----------------------------------------------------------------
   19 – WHM317 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','HUMBERTO PARRA','WHM317','20539','9457','PEREIRA','ESTEBAN GALLEGO',1,
 1,0,'-',
 9664572,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 53,NULL,'TYM'),

/* -----------------------------------------------------------------
   20 – PEK019 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','MIGUEL TABARES','PEK019','20540','9458','PEREIRA','JHON GIRALDO',1,
 1,0,'-',
 7046404,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 50,NULL,'TYM'),

/* -----------------------------------------------------------------
   21 – WHM896 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','ALEXANDER CUELLAR','WHM896','20541','9459','PEREIRA','CAMILO PEÑA',1,
 1,0,'-',
 10136973,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 73,NULL,'TYM'),

/* -----------------------------------------------------------------
   22 – WLC133 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','JULIAN','WLC133','20542','9460','PEREIRA','EDWIN GOMEZ, CAMILO MUÑOZ',2,
 2,0,'-',
 11276169,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 59,NULL,'TYM'),

/* -----------------------------------------------------------------
   23 – TNH494 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','ADALBERTO MEJIA','TNH494','20543','9461','CARTAGO','DIORLAN FLOREZ',1,
 1,0,'-',
 6678884,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
 64,NULL,'TYM'),

/* -----------------------------------------------------------------
   24 – WTN748 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','DIEGO RATIVA','WTN748','20558','7004','PEREIRA','BRAHIAN VALENCIA',1,
 1,0,'-',
 9091634,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 66,NULL,'TYM'),

/* -----------------------------------------------------------------
   25 – TRL186 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','RUBEN','TRL186','20524','9450','VIRGINIA','JOHN',1,
 1,0,'-',
 8634785,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VIRGINIA' LIMIT 1) + 0,
 3,NULL,'TYM'),

/* -----------------------------------------------------------------
   26 – EST067 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','JORGE RIVILLAS','EST067','20559','7005','CAIRO ARGELIA','CESAR CASTILLO',1,
 1,0,'-',
 9575432,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARGELIA EL CAIRO' LIMIT 1) + 0,
 32,NULL,'TYM'),

/* -----------------------------------------------------------------
   27 – ERK303 – **ADICIONAL $60.000**
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','JORGE ALARCON','ERK303','20560 18943','7006','SANTUARIO VIRGINIA','ROBINSON TORRES',1,
 1,60000,'ERK303 EXTRA $60.000',
 12731197,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO VIRGINIA' LIMIT 1) + 60000,
 49,NULL,'TYM'),

/* -----------------------------------------------------------------
   28 – JVM223 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','ALPINA','WILMAR CARDONA','JVM223','20525 20561','7007 9451','BELEN DE UMBRIA','OSCAR RESTREPO, EXTRA MORENO',2,
 2,0,'-',
 10694523,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
 65,NULL,'TYM'),

/* -----------------------------------------------------------------
   29 – SQB119 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-26','Martes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','18929','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
 1,0,'-',
 7667443,
 (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
 51,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida (opcional)
   ------------------------------------------------- */
SELECT fecha,
       placa,
       precio                AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion   AS motivo,
       proveedor
FROM fletes
WHERE fecha = '2026-05-26'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
