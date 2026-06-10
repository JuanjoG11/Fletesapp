/* ==========================================================
   Brief: 🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 5 JUNIO 2026
   Generado: 2026-06-05T18:33:18.877Z
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-05'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 05‑Jun‑2026
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
  ('2026-06-05','Viernes','ALPINA','JOHAN ECHEVERRY','SYU652','20877','9552','MANIZALES','EDWAR ZAPATA',1,
   1,0,'-',
   5916533,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   55,'FEP1186345-350-352','TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','CAMILO CASTAÑO','KOL802','20860 20878 19094','9553 9550','VILLAMARIA','GERMAN GALVEZ',1,
   1,0,'-',
   9632540,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 03 – WFV015 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','YONNI VALENCIA','WFV015','20879 19095','9554','MANIZALES','CRISTIAN OSPINA',1,
   1,0,'-',
   10813621,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   48,'AP650818','TYM'),

  /* 04 – TRL186 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','RUBEN','TRL186','20880 19096','9555 TSS','MANIZALES','JUAN ALEJANDRO, MILTON OSORIO',2,
   2,0,'-',
   8257502,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   68,NULL,'TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','MIGUEL GONZALES','SLI587','20881 19091 19097','9556','MANIZALES','ADRIAN MARTINEZ',1,
   1,0,'-',
   7071314,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   57,'FEP1186342-344','TYM'),

  /* 06 – WGZ876 – **ADICIONAL $60.000** */
  ('2026-06-05','Viernes','ALPINA','RICARDO PINEDA','WGZ876','20882','9557','KM41 IRRA FELISA','JUAN DELGADO',1,
   1,60000,'WGZ876 EXTRA $60.000',
   10252307,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='IRRA LA FELISA VER RIOSUCIO' LIMIT 1) + 60000,
   30,NULL,'TYM'),

  /* 07 – EYX091 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','CARLOS GOMEZ','EYX091','20846 20867 19081','9558','PACORA SALAMINA','VICTOR PULGARIN, JUAN COCOMA',2,
   2,0,'-',
   10746608,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1) + 0,
   74,NULL,'TYM'),

  /* 08 – TUL630 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','JUAN DAVID','TUL630','20861','9560','SUPIA RIOSUCIO','MATEO VILLALBA',1,
   1,0,'-',
   9471118,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 0,
   8,NULL,'TYM'),

  /* 09 – TJX795 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','ANDRES QUINTERO','TJX795','20864','7002','CHINCHINA','BIBIANA, BLADIMIR',2,
   2,0,'-',
   15653588,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA SUPERMERCADO' LIMIT 1) + 0,
   6,NULL,'TYM'),

  /* 10 – SMH182 – **ADICIONAL $60.000** */
  ('2026-06-05','Viernes','ALPINA','JUAN DAVID','SMH182','20883 19100','9559','CHINCHINA','BRANDON BAEZ',1,
   1,60000,'SMH182 EXTRA $60.000',
   9451217,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 60000,
   74,NULL,'TYM'),

  /* 11 – SPU120 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','OSWALDO','SPU120','20824 20884','9601 7009','ARMENIA','YEISON RENDON',1,
   1,0,'-',
   9906550,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   67,NULL,'TYM'),

  /* 12 – VZD334 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','JULIAN CUELLAR','VZD334','20885','9602','ARMENIA','SEBASTIAN VILLADA',1,
   1,0,'-',
   7877448,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   52,'AP650824','TYM'),

  /* 13 – EQY944 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','GOBER CRISTANCHO','EQY944','20886 19101','9603','CALARCA','ALEXANDER COSTAIN',1,
   1,0,'-',
   3841532,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 14 – SXF257 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','FABIO RUIZ','SXF257','20810TSS 20887 19083 19084','9604','MONTENEGRO P/TAPAO','CAMILO CONTRERAS, CAMILO SUAREZ',2,
   2,0,'-',
   8122789,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   64,NULL,'TYM'),

  /* 15 – WLS478 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','HUMBERTO RINCON','WLS478','20866 20888','9605 7010','TEBAIDA','CRISTIAN CAICEDO, JOHAN MUÑOZ',2,
   2,0,'-',
   13379248,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 16 – TTL256 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','ANDRES QUINTERO','TTL256','20862 20889 19102','9606 9600','CIRCASIA','CRISTIAN CAMACHO',1,
   1,0,'-',
   10124248,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 17 – SMO183 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','GABRIEL PEREZ','SMO183','20868','9453','PEREIRA','JUAN QUINTERO',1,
   1,0,'-',
   7878909,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 18 – XVI496 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','PABLO RAMIIREZ','XVI496','20869','9454','PEREIRA','ANDRES PINEDA',1,
   1,0,'-',
   7804979,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 19 – TMZ674 – **ADICIONAL $60.000** */
  ('2026-06-05','Viernes','ALPINA','RICARDO LOPEZ','TMZ674','20870','9455','PEREIRA','ANDRES RIOS',1,
   1,60000,'TMZ674 EXTRA $60.000',
   6627126,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   58,'AP648216','TYM'),

  /* 20 – SPQ814 – **ADICIONAL $100.000** */
  ('2026-06-05','Viernes','ALPINA','CARLOS VELASCO','SPQ814','20871','9456','SANTA ROSA','CARLOS VELASCO',1,
   1,100000,'SPQ814 ADICIONAR AL FLETE $100.000 CONDUCTOR/ENTREGADOR',
   5509590,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 100000,
   50,NULL,'TYM'),

  /* 21 – WHM317 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','HUMBERTO PARRA','WHM317','20872','9457','PEREIRA','ESTEBAN GALLEGO',1,
   1,0,'-',
   7647363,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   63,NULL,'TYM'),

  /* 22 – PEK019 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','MIGUEL TABARES','PEK019','20873','9458','PEREIRA','JHON GIRALDO',1,
   1,0,'-',
   7395907,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 23 – WHM896 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','ALEXANDER CUELLAR','WHM896','20874','9459','PEREIRA','CAMILO PEÑA',1,
   1,0,'-',
   7890105,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* 24 – WLC133 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','JULIAN','WLC133','20875','9460','PEREIRA','EDWIN GOMEZ, JUAN CONTRERAS',2,
   2,0,'-',
   11243589,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   67,NULL,'TYM'),

  /* 25 – TNH494 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','ADALBERTO MEJIA','TNH494','20839','9461TSS','CARTAGO','DIORLAN FLOREZ',1,
   1,0,'-',
   10165929,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   62,'AP649397','TYM'),

  /* 26 – WTN748 – **ADICIONAL $60.000** */
  ('2026-06-05','Viernes','ALPINA','DIEGO RATIVA','WTN748','20890','7004','PEREIRA','BRAHIAN VALENCIA',1,
   1,60000,'WTN748 EXTRA $60.000 SE DEBIA DE AYER',
   6349806,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   54,NULL,'TYM'),

  /* 27 – EQN953 – **ADICIONAL $50.000** */
  ('2026-06-05','Viernes','ALPINA','ORLANDO VASQUEZ','EQN953','20853TSS 20891','7005','CARTAGO','CESAR CASTILLO',1,
   1,50000,'EQN953 VALOR DE FLETE $340.000',
   6564131,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 50000,
   53,NULL,'TYM'),

  /* 28 – ERK303 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','JORGE ALARCON','ERK303','20858 20892 19103','7006','APIA VIRGINIA','ROBINSON TORRES, GERMAN GALVEZ',2,
   2,0,'-',
   9991781,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 0,
   69,NULL,'TYM'),

  /* 29 – JVM223 – sin adicional */
  ('2026-06-05','Viernes','ALPINA','WILMAR CARDONA','JVM223','20893 20859 19104','7007 9451','BELEN MISTRATO','OSCAR RESTREPO, JOHN MORENO',2,
   2,0,'-',
   17122192,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   71,NULL,'TYM'),

  /* 30 – SQB119 – sin adicional */
  ('2026-06-05','Viernes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19090','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   7757808,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   64,NULL,'TYM');

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
WHERE fecha = '2026-06-05'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
