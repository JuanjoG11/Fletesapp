/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 28 MAYO 2026
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-05-28'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 28‑May‑2026
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
   01 – SYU652 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','JOHAN ECHEVERRY','SYU652','20637 20594TSS 18967','9552','MANIZALES','EDWAR ZAPATA, CRISTIAN OSPINA',2,
 2,0,'-',
 7200495,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 46,NULL,'TYM'),

/* -----------------------------------------------------------------
   02 – KOL802 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','CAMILO CASTAÑO','KOL802','20638 18968','9553','MANIZALES','GERMAN GALVEZ',1,
 1,0,'-',
 5140460,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 49,NULL,'TYM'),

/* -----------------------------------------------------------------
   03 – EYX091 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','CARLOS GOMEZ','EYX091','20650 18969 18986','9554','NEIRA','VICTOR PULGARIN, JUAN COCOMA',2,
 2,0,'-',
 7974945,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1) + 0,
 47,NULL,'TYM'),

/* -----------------------------------------------------------------
   04 – EYY183 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','RUBEN','EYY183','20639 18970','9555','MANIZALES','JUAN ALEJANDRO',1,
 1,0,'-',
 6780959,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 55,NULL,'TYM'),

/* -----------------------------------------------------------------
   05 – SLI587 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','MIGUEL GONZALES','SLI587','20612 20640 18971','9556 9550','MANIZALES','MILTON OSORIO, ADRIAN MARTINEZ',2,
 2,0,'-',
 10902463,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 55,NULL,'TYM'),

/* -----------------------------------------------------------------
   06 – WGZ876 – **ADICIONAL $60.000**
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','RICARDO PINEDA','WGZ876','20641 18972','9557','RIOSUCIO','JUAN DELGADO, MATEO VILLALBA',2,
 2,60000,'WGZ876 EXTRA $60.000 SE LE DEBIA',
 11742401,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1) + 60000,
 53,NULL,'TYM'),

/* -----------------------------------------------------------------
   07 – SMH182 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','JUAN DAVID','SMH182','20643 18974','9559','SAN JOSE BELALCAZAR','BRANDON BAEZ, YEISON TABARES',2,
 2,0,'-',
 12434973,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SAN JOSE BELALCAZAR' LIMIT 1) + 0,
 52,NULL,'TYM'),

/* -----------------------------------------------------------------
   08 – WFV015 – **ADICIONAL $120.000**
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','YONNI VALENCIA','WFV015','20615','7008','CALARCA','CAMILO MUÑOZ',1,
 1,120000,'ADICIONAL AL FLETE $120.000 POR DESCARGUE POR PARTE DE CONDUCTORES',
 11895058,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 120000,
 3,NULL,'TYM'),

/* -----------------------------------------------------------------
   09 – SPU120 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','OSWALDO','SPU120','20616 20644 18976','9601 7009','ARMENIA','YEISON RENDON',1,
 1,0,'-',
 9205027,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
 60,NULL,'TYM'),

/* -----------------------------------------------------------------
   10 – VZD334 – **ADICIONAL $100.000**
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','JULIAN CUELLAR','VZD334','20645 20602TSS','9602','ARMENIA','JOHAN MUÑOZ, CAMILO SUAREZ',2,
 2,100000,'ADICIONAL AL FLETE $100.000 ENTREGA DE TSS',
 7597791,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 100000,
 81,NULL,'TYM'),

/* -----------------------------------------------------------------
   11 – EQY944 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','GOBER CRISTANCHO','EQY944','20646','9603','ARMENIA','ALEXANDER COSTAIN',1,
 1,0,'-',
 6881584,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
 59,'AP641018 AP641019','TYM'),

/* -----------------------------------------------------------------
   12 – SXF257 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','FABIO RUIZ','SXF257','20647 18978','9604','ALCALA ULLOA','CAMILO CONTRERAS',1,
 1,0,'-',
 6321943,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1) + 0,
 49,NULL,'TYM'),

/* -----------------------------------------------------------------
   13 – WLS478 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','HUMBERTO RINCON','WLS478','20620 18979','9605','CAICEDONIA','CRISTIAN CAICEDO, JUAN CONTRERAS',2,
 2,0,'-',
 10586985,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1) + 0,
 55,NULL,'TYM'),

/* -----------------------------------------------------------------
   14 – TTL256 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','YIMERSON GARCIA','TTL256','20613 20621 20626 18984','9606 9600','FILANDIA','CRISTIAN CAMACHO',1,
 1,0,'-',
 9625677,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1) + 0,
 40,NULL,'TYM'),

/* -----------------------------------------------------------------
   15 – TRL186 – **ADICIONAL $55.000**
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','RUBEN','TRL186','20617','A/COLON GALERIA','CALARCA','NO APLICA',0,
 0,55000,'TRL186 VALOR DE FLETE $400.000',
 10822241,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 55000,
 2,NULL,'TYM'),

/* -----------------------------------------------------------------
   16 – SNL038 – **ADICIONAL $270.000**
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','MIGUEL','SNL038','20566','LA50 P/ESPEJO','ARMENIA','NO APLICA',0,
 0,270000,'VALOR DE FLETE $600.000 INCLUYE DESCARGUE',
 13646388,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 270000,
 2,NULL,'TYM'),

/* -----------------------------------------------------------------
   17 – TJX795 – **ADICIONAL $370.000**
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','ANDRES','TJX795','20618 20574','LA19 M/TEBAIDA','ARMENIA TEBAIDA','NO APLICA',0,
 0,370000,'VALOR DE FLETE $700.000 INCLUYE DESCARGUE',
 19906751,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 370000,
 2,NULL,'TYM'),

/* -----------------------------------------------------------------
   18 – SMO183 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','GABRIEL PEREZ','SMO183','20628','9453','PEREIRA','JUAN QUINTERO',1,
 1,0,'-',
 5856958,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 52,NULL,'TYM'),

/* -----------------------------------------------------------------
   19 – XVI496 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','PABLO RAMIREZ','XVI496','20629 18980','9454','PEREIRA','ANDRES PINEDA',1,
 1,0,'-',
 9892644,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 57,NULL,'TYM'),

/* -----------------------------------------------------------------
   20 – TMZ674 – **ADICIONAL $60.000**
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','RICARDO LOPEZ','TMZ674','20630','9455','PEREIRA','ANDRES RIOS',1,
 1,60000,'TMZ674 EXTRA $60.000',
 5640680,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 60000,
 51,NULL,'TYM'),

/* -----------------------------------------------------------------
   21 – SPQ814 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','CARLOS VELASCO','SPQ814','20631','9456','SANTA ROSA','SANTIAGO HENAO',1,
 1,0,'-',
 6767658,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
 47,'AP642340','TYM'),

/* -----------------------------------------------------------------
   22 – WHM317 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','HUMBERTO PARRA','WHM317','20632','9457','PEREIRA','ESTEBAN GALLEGO',1,
 1,0,'-',
 4873313,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 50,'FEP1185686-701-692-685','TYM'),

/* -----------------------------------------------------------------
   23 – PEK019 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','MIGUEL TABARES','PEK019','20633','9458','PEREIRA','JHON GIRALDO',1,
 1,0,'-',
 5242117,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 41,NULL,'TYM'),

/* -----------------------------------------------------------------
   24 – WHM896 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','ALEXANDER CUELLAR','WHM896','20634','9459','PEREIRA','CAMILO PEÑA',1,
 1,0,'-',
 5181234,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 45,NULL,'TYM'),

/* -----------------------------------------------------------------
   25 – WLC133 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','JULIAN','WLC133','20635','9460','PEREIRA','EDWIN GOMEZ',1,
 1,0,'-',
 5539799,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 41,NULL,'TYM'),

/* -----------------------------------------------------------------
   26 – TNH494 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','ADALBERTO MEJIA','TNH494','20636','9461','CARTAGO','DIORLAN FLOREZ',1,
 1,0,'-',
 10655340,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
 55,'AP642334 AP642335','TYM'),

/* -----------------------------------------------------------------
   27 – WTN748 – **ADICIONAL $50.000**
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','DIEGO RATIVA','WTN748','20648 18982','7004','MARSELLA','BRAHIAN VALENCIA',1,
 1,50000,'WTN748 ADICONAL $50.000 ENTREGA TSS AEROPUERTO',
 10187796,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARSELLA' LIMIT 1) + 50000,
 45,NULL,'TYM'),

/* -----------------------------------------------------------------
   28 – EST067 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','JORGE RIVILLAS','EST067','20649','7005','CARTAGO','CESAR CASTILLO',1,
 1,0,'-',
 7301658,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
 43,'AP642332 AP642333','TYM'),

/* -----------------------------------------------------------------
   29 – ERK303 – **ADICIONAL $60.000**
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','JORGE ALARCON','ERK303','20622 18981','7006','APIA VIRGINIA','ROBINSON TORRES',1,
 1,60000,'ERK303 EXTRA $60.000',
 10247791,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 60000,
 46,NULL,'TYM'),

/* -----------------------------------------------------------------
   30 – JVM223 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','ALPINA','WILMAR CARDONA','JVM223','20611 20623 18983','7007 9451','VITERBO','OSCAR RESTREPO, EXTRA MORENO',2,
 2,0,'-',
 10217754,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1) + 0,
 60,NULL,'TYM'),

/* -----------------------------------------------------------------
   31 – SQB119 – sin adicional
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','FLEISCHMANN','CARLOS CASTAÑO','SQB119','18975','FLEISCHMANN','CUBA','DIEGO FRANCO',1,
 1,0,'-',
 3434809,
 (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='CUBA' LIMIT 1) + 0,
 38,NULL,'TYM');

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
WHERE fecha = '2026-05-28'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
