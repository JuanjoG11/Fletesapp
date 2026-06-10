/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIERCOLES 27 MAYO 2026
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-05-27'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 27‑May‑2026
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
   01 – TMO981 – **ADICIONAL $50.000**
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','JOHAN ECHEVERRY','TMO981','20563 20594 18948','9552 9550','MANIZALES','EDWAR ZAPATA',1,
 1,50000,'ADICIONAL ALFLETE $50.000 ENTREGA DE NEGOCIACION',
 14814436,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 50000,
 52,'FEP1185568','TYM'),

/* -----------------------------------------------------------------
   02 – KOL802 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','CAMILO CASTAÑO','KOL802','20565 20595 18949','9553 7001','VILLAMARIA','GERMAN GALVEZ, MATEO VILLALBA',2,
 2,0,'-',
 15858960,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VILLAMARIA' LIMIT 1) + 0,
 58,'FEP1185572 AP640126-134-138','TYM'),

/* -----------------------------------------------------------------
   03 – WFV015 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','YONNI VALENCIA','WFV015','20596 20564 18950','9554 7000','MANIZALES','YEISON TABARES, CRISTIAN OSPINA',2,
 2,0,'-',
 8252172,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 55,NULL,'TYM'),

/* -----------------------------------------------------------------
   04 – EYY183 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','RUBEN','EYY183','20597 18951','9555','MANIZALES','JUAN ALEJANDRO',1,
 1,0,'-',
 7497685,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 53,NULL,'TYM'),

/* -----------------------------------------------------------------
   05 – TRL186 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','RUBEN','TRL186','20528 20598 18952','9556 7000','MANIZALES','MILTON OSORIO, ADRIAN MARTINEZ',2,
 2,0,'-',
 9880351,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 46,NULL,'TYM'),

/* -----------------------------------------------------------------
   06 – WGZ876 – **ADICIONAL $60.000**
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','RICARDO PINEDA','WGZ876','20599','9557','MARMATO LA MERCED','JUAN DELGADO',1,
 1,60000,'WGZ876 EXTRA $60.000',
 13851819,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1) + 60000,
 27,NULL,'TYM'),

/* -----------------------------------------------------------------
   07 – EYX091 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','CARLOS GOMEZ','EYX091','20550 20570 18947','9558','AGUADAS','VICTOR PULGARIN, JUAN COCOMA',2,
 2,0,'-',
 14136486,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS' LIMIT 1) + 0,
 71,NULL,'TYM'),

/* -----------------------------------------------------------------
   08 – SMH182 – **ADICIONAL $60.000**
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','JUAN DAVID','SMH182','20600 18954','9559','ARAUCA PALESTINA','BRANDON BAEZ',1,
 1,60000,'SMH182 EXTRA $60.000',
 9047869,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PALESTINA ARAUCA' LIMIT 1) + 60000,
 45,NULL,'TYM'),

/* -----------------------------------------------------------------
   09 – SPU120 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','OSWALDO','SPU120','20576 20601 18955','9601 7009','ARMENIA','YEISON RENDON',1,
 1,0,'-',
 9686748,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
 54,NULL,'TYM'),

/* -----------------------------------------------------------------
   10 – VZD334 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','JULIAN CUELLAR','VZD334','20602 20609','9602 7010','ARMENIA','JOHAN MUÑOZ',1,
 1,0,'-',
 7083004,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
 57,NULL,'TYM'),

/* -----------------------------------------------------------------
   11 – EQY944 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','GOBER CRISTANCHO','EQY944','20603','9603','ARMENIA','ALEXANDER COSTAIN',1,
 1,0,'-',
 9248755,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
 61,'AP639535','TYM'),

/* -----------------------------------------------------------------
   12 – SLI587 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','MIGUEL GONZALES','SLI587','20575 20604','9604 7010','QUIMBAYA','CAMILO CONTRERAS, CAMILO SUAREZ',2,
 2,0,'-',
 10922100,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 0,
 45,NULL,'TYM'),

/* -----------------------------------------------------------------
   13 – WLS478 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','HUMBERTO RINCON','WLS478','20580 18960','9605','PIJAO CORDOBA','CRISTIAN CAICEDO',1,
 1,0,'-',
 7672902,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PIJAO CORDOBA' LIMIT 1) + 0,
 45,NULL,'TYM'),

/* -----------------------------------------------------------------
   14 – TTL256 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','YIMERSON GARCIA','TTL256','20581 18956','9606','SALENTO','CRISTIAN CAMACHO',1,
 1,0,'-',
 8051580,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1) + 0,
 35,'AP641020 AP641021','TYM'),

/* -----------------------------------------------------------------
   15 – SMO183 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','GABRIEL PEREZ','SMO183','20586','9453','PEREIRA','JUAN QUINTERO',1,
 1,0,'-',
 6548209,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 59,NULL,'TYM'),

/* -----------------------------------------------------------------
   16 – LUM993 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','PABLO RAMIREZ','LUM993','20587 18961','9454','PEREIRA','ANDRES PINEDA',1,
 1,0,'-',
 6017164,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 41,NULL,'TYM'),

/* -----------------------------------------------------------------
   17 – TMZ674 – **ADICIONAL $60.000**
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','RICARDO LOPEZ','TMZ674','20588','9455','PEREIRA','ANDRES RIOS, CAMILO MUÑOZ',2,
 2,60000,'TMZ674 EXTRA $60.000 SE LE DEBIA',
 9316077,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 60000,
 66,NULL,'TYM'),

/* -----------------------------------------------------------------
   18 – SPQ814 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','CARLOS VELASCO','SPQ814','20585','9456','SANTA ROSA','SANTIAGO HENAO',1,
 1,0,'-',
 7241716,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
 53,NULL,'TYM'),

/* -----------------------------------------------------------------
   19 – WHM317 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','HUMBERTO PARRA','WHM317','20589','9457','PEREIRA','ESTEBAN GALLEGO',1,
 1,0,'-',
 7499124,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 56,NULL,'TYM'),

/* -----------------------------------------------------------------
   20 – PEK019 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','MIGUEL TABARES','PEK019','20590','9458','PEREIRA','JHON GIRALDO',1,
 1,0,'-',
 5778487,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 48,NULL,'TYM'),

/* -----------------------------------------------------------------
   21 – WHM896 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','ALEXANDER CUELLAR','WHM896','20591','9459','PEREIRA','CAMILO PEÑA',1,
 1,0,'-',
 9323845,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 49,NULL,'TYM'),

/* -----------------------------------------------------------------
   22 – WLC133 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','JULIAN','WLC133','20592','9460','PEREIRA','EDWIN GOMEZ, JUAN CONTRERAS',2,
 2,0,'-',
 6276907,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 67,NULL,'TYM'),

/* -----------------------------------------------------------------
   23 – TNH494 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','ADALBERTO MEJIA','TNH494','20543TSS 20584 20593','9461 9450','CARTAGO','DIORLAN FLOREZ',1,
 1,0,'-',
 9220442,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
 51,NULL,'TYM'),

/* -----------------------------------------------------------------
   24 – WTN748 – **ADICIONAL $60.000**
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','DIEGO RATIVA','WTN748','20558TSS 20605 18962','7004','PEREIRA','BRAHIAN VALENCIA',1,
 1,60000,'WTN748 EXTRA $60.000',
 11219512,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 60000,
 74,NULL,'TYM'),

/* -----------------------------------------------------------------
   25 – EST067 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','JORGE RIVILLAS','EST067','20606','7005','ANSERMA NUEVO','CESAR CASTILLO',1,
 1,0,'-',
 5501032,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO' LIMIT 1) + 0,
 37,'FEP1185510','TYM'),

/* -----------------------------------------------------------------
   26 – ERK303 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','JORGE ALARCON','ERK303','20582 18957','7006','BALBOA LA CELIA','ROBINSON TORRES',1,
 1,0,'-',
 8437917,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1) + 0,
 42,NULL,'TYM'),

/* -----------------------------------------------------------------
   27 – JVM223 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','ALPINA','WILMAR CARDONA','JVM223','20562 20583','7007 9451','ANSERMA','OSCAR RESTREPO, EXTRA MORENO',2,
 2,0,'-',
 15311412,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1) + 0,
 51,'FEP1185515','TYM'),

/* -----------------------------------------------------------------
   28 – SQB119 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-27','Miercoles','FLEISCHMANN','CARLOS CASTAÑO','SQB119','18965','FLEISCHMANN','PEREIRA','DIEGO FRANCO',1,
 1,0,'-',
 5366411,
 (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 30,NULL,'TYM');

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
WHERE fecha = '2026-05-27'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
