/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-05-22'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 22‑May‑2026
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
   01 – TMO981 – **ADICIONAL $20.000**
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','JOHAN ECHEVERRY','TMO981','20444 20460 18887','9552 7001','MANIZALES','EDWAR ZAPATA',1,
 1,20000,'TMO981 ADICIONAL $20.000 ENTREGA SUPER EN VILLAMARIA',
 7963601,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 20000,
 51,NULL,'TYM'),

/* -----------------------------------------------------------------
   02 – KOL802 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','CAMILO CASTAÑO','KOL802','20435 20461 18888','9553 9550','VILLAMARIA','GERMAN GALVEZ',1,
 1,0,'-',
 9204616,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VILLAMARIA' LIMIT 1) + 0,
 61,NULL,'TYM'),

/* -----------------------------------------------------------------
   03 – WFV015 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','YONNI VALENCIA','WFV015','20438 20462 18889','9554 7000','MANIZALES','YEISON TABARES, CRISTIAN OSPINA',2,
 2,0,'-',
 11717919,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 51,NULL,'TYM'),

/* -----------------------------------------------------------------
   04 – EYY183 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','RUBEN','EYY183','20464 18890','9555','MANIZALES','JUAN ALEJANDRO',1,
 1,0,'-',
 7968178,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 64,NULL,'TYM'),

/* -----------------------------------------------------------------
   05 – SLI587 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','MIGUEL GONZALES','SLI587','20465 18891','9556','MANIZALES','MILTON OSORIO, ADRIAN MARTINEZ',2,
 2,0,'-',
 7949760,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 53,NULL,'TYM'),

/* -----------------------------------------------------------------
   06 – WGZ876 – **ADICIONAL $60.000**
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','RICARDO PINEDA','WGZ876','20466 18856 18858','9557','KM41 IRRA FELISA','JUAN DELGADO',1,
 1,60000,'WGZ876 EXTRA $60.000',
 10337136,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='IRRA LA FELISA VER RIOSUCIO' LIMIT 1) + 60000,
 25,NULL,'TYM'),

/* -----------------------------------------------------------------
   07 – EYX091 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','CARLOS GOMEZ','EYX091','20467 20421 18885 18878','9558','PACORA SALAMINA','VICTOR PULGARIN, JUAN COCOMA',2,
 2,0,'-',
 10390928,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1) + 0,
 65,NULL,'TYM'),

/* -----------------------------------------------------------------
   08 – TUL630 – **ADICIONAL $60.000**
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','JUAN DAVID','TUL630','-','7002','CHINCHINA','JOHAN MUÑOZ',1,
 1,60000,'TUL630 EXTRA $60.000',
 37501709,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 60000,
 3,'AP636698 AP636770-771-768-769','TYM'),

/* -----------------------------------------------------------------
   09 – TRL186 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','RUBEN','TRL186','20436','9560','SUPIA RIOSUCIO','MATEO VILLALBA',1,
 1,0,'-',
 11004262,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA RIOSUCIO' LIMIT 1) + 0,
 4,NULL,'TYM'),

/* -----------------------------------------------------------------
   10 – SMH182 – **ADICIONAL $60.000**
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','JUAN DAVID','SMH182','20468 18893','9559','CHINCHINA','BRANDON BAEZ',1,
 1,60000,'SMH182 EXTRA $60,000',
 8998616,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 60000,
 74,NULL,'TYM'),

/* -----------------------------------------------------------------
   11 – SPU120 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','OSWALDO','SPU120','20469','9601','ARMENIA','YEISON RENDON',1,
 1,0,'-',
 7650758,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
 60,NULL,'TYM'),

/* -----------------------------------------------------------------
   12 – VZD334 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','JULIAN CUELLAR','VZD334','20470','9602','ARMENIA','SEBASTIAN VILLADA',1,
 1,0,'-',
 6036414,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
 47,NULL,'TYM'),

/* -----------------------------------------------------------------
   13 – EQY944 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','GOBER CRISTANCHO','EQY944','20471 18899 18895 18894','9603','CALARCA','ALEXANDER COSTAIN',1,
 1,0,'-',
 4774203,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
 61,NULL,'TYM'),

/* -----------------------------------------------------------------
   14 – SXF257 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','FABIO RUIZ','SXF257','20472 18880','9604','MONTENEGRO P/TAPAO','CAMILO CONTRERAS, CAMILO SUAREZ',2,
 2,0,'-',
 7631767,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
 59,NULL,'TYM'),

/* -----------------------------------------------------------------
   15 – WLS478 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','HUMBERTO RINCON','WLS478','20441 20445','9605 7010','TEBAIDA','CRISTIAN CAICEDO, JUAN CONTRERAS',2,
 2,0,'-',
 11728408,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
 44,NULL,'TYM'),

/* -----------------------------------------------------------------
   16 – TTL256 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','YIMERSON GARCIA','TTL256','20437 20446 18898','9606 9600','CIRCASIA','CRISTIAN CAMACHO',1,
 1,0,'-',
 6624428,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
 40,NULL,'TYM'),

/* -----------------------------------------------------------------
   17 – SMO183 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','GABRIEL PEREZ','SMO183','20451','9453','PEREIRA','JUAN QUINTERO',1,
 1,0,'-',
 6885269,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 57,NULL,'TYM'),

/* -----------------------------------------------------------------
   18 – LUM993 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','PABLO RAMIREZ','LUM993','20452','9454','PEREIRA','ANDRES PINEDA',1,
 1,0,'-',
 6506124,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 49,NULL,'TYM'),

/* -----------------------------------------------------------------
   19 – TMZ674 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','RICARDO LOPEZ','TMZ674','20453','9455','PEREIRA','ANDRES RIOS',1,
 1,0,'-',
 6574412,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 58,NULL,'TYM'),

/* -----------------------------------------------------------------
   20 – SPQ814 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','CARLOS VELASCO','SPQ814','20454','9456','SANTA ROSA','SANTIAGO HENAO',1,
 1,0,'-',
 6305438,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
 49,NULL,'TYM'),

/* -----------------------------------------------------------------
   21 – WHM317 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','HUMBERTO PARRA','WHM317','20455','9457','PEREIRA','ESTEBAN GALLEGO',1,
 1,0,'-',
 7877320,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 62,NULL,'TYM'),

/* -----------------------------------------------------------------
   22 – PEK019 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','MIGUEL TABARES','PEK019','20456','9458','PEREIRA','JHON GIRALDO',1,
 1,0,'-',
 5076930,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 47,NULL,'TYM'),

/* -----------------------------------------------------------------
   23 – WHM896 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','ALEXANDER CUELLAR','WHM896','20457','9459','PEREIRA','CAMILO PEÑA',1,
 1,0,'-',
 8049753,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 60,NULL,'TYM'),

/* -----------------------------------------------------------------
   24 – WLC133 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','JULIAN','WLC133','20458','9460','PEREIRA','EDWIN GOMEZ, CAMILO MUÑOZ',2,
 2,0,'-',
 12927394,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 77,NULL,'TYM'),

/* -----------------------------------------------------------------
   25 – TNH494 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','ADALBERTO MEJIA','TNH494','20414TSS 20459','9461','CARTAGO','DIORLAN FLOREZ',1,
 1,0,'-',
 6171225,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
 55,NULL,'TYM'),

/* -----------------------------------------------------------------
   26 – WTN748 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','DIEGO RATIVA','WTN748','20473','7004','PEREIRA','BRAHIAN VALENCIA',1,
 1,0,'-',
 6841898,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 51,NULL,'TYM'),

/* -----------------------------------------------------------------
   27 – EST067 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','JORGE RIVILLAS','EST067','20474','7005','CARTAGO','CESAR CASTILLO',1,
 1,0,'-',
 5688146,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
 44,NULL,'TYM'),

/* -----------------------------------------------------------------
   28 – ERK303 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','JORGE ALARCON','ERK303','20433 20447 18900 18896','7006 9450','VIRGINIA','ROBINSON TORRES',1,
 1,0,'-',
 11351559,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VIRGINIA' LIMIT 1) + 0,
 68,NULL,'TYM'),

/* -----------------------------------------------------------------
   29 – JVM223 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','ALPINA','WILMAR CARDONA','JVM223','20434 20448 18897','7007 9451','BELEN MISTRATO','LUIS CADAVID, EXTRA MORENO',2,
 2,0,'-',
 16011064,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
 66,NULL,'TYM'),

/* -----------------------------------------------------------------
   30 – SQB119 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','18886 18864','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
 1,0,'-',
 6914369,
 (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
 68,NULL,'TYM');

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
WHERE fecha = '2026-05-22'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
