/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 4 JUNIO 2026
   Generado: 2026-06-05T18:24:14.600Z
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-04'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 04‑Jun‑2026
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
  ('2026-06-04','Jueves','ALPINA','JOHAN ECHEVERRY','SYU652','20840','9552','MANIZALES','EDWAR ZAPATA',1,
   1,0,'-',
   6160077,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','CAMILO CASTAÑO','KOL802','20801TSS 20841 19077','9553','MANIZALES','CRISTIAN OSPINA',1,
   1,0,'-',
   8182730,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   61,NULL,'TYM'),

  /* 03 – EYX091 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','CARLOS GOMEZ','EYX091','20842','9554','NEIRA','VICTOR PULGARIN, JUAN COCOMA',2,
   2,0,'-',
   7783833,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 04 – TRL186 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','RUBEN','TRL186','20843 19078 19071','9555','MANIZALES','JUAN ALEJANDRO',1,
   1,0,'-',
   11650491,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   56,'AP648058','TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','MIGUEL GONZALES','SLI587','20844 20820 19079','9556 9550','MANIZALES','MILTON OSORIO, ADRIAN MARTINEZ',2,
   2,0,'-',
   10446984,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','RICARDO PINEDA','WGZ876','20845 19080 19058','9557','RIOSUCIO','JUAN DELGADO, MATEO VILLALBA',2,
   2,0,'-',
   14009002,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 07 – SMH182 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','JUAN DAVID','SMH182','20847 19082','9559','SAN JOSE BELALCAZAR','BRANDON BAEZ, CAMILO SUAREZ',2,
   2,0,'-',
   11074205,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SAN JOSE BELALCAZAR' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 08 – WFV015 – **ADICIONAL $100.000** */
  ('2026-06-04','Jueves','ALPINA','YONNI VALENCIA','WFV015','20823','7008','CALARCA','YONNI VALENCIA',1,
   1,100000,'WFV015 ADICIONAL $100.000 INCLUYE DESCARGUE',
   15788024,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 100000,
   3,NULL,'TYM'),

  /* 09 – SPU120 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','OSWALDO','SPU120','20848','9601','ARMENIA','YEISON RENDON',1,
   1,0,'-',
   6648848,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 10 – VZD334 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','JULIAN CUELLAR','VZD334','20849 19052 19069','9602','ARMENIA','SEBASTIAN VILLADA',1,
   1,0,'-',
   6750954,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   64,'AP648982','TYM'),

  /* 11 – EQY944 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','GOBER CRISTANCHO','EQY944','20850','9603','ARMENIA','ALEXANDER COSTAIN',1,
   1,0,'-',
   6573598,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   62,'AP648053 AP648054','TYM'),

  /* 12 – SXF257 – **ADICIONAL $80.000** */
  ('2026-06-04','Jueves','ALPINA','FABIO RUIZ','SXF257','20810TSS 20851 19085','9604 TSS','ALCALA ULLOA QUIMBAYA','CAMILO CONTRERAS',1,
   1,80000,'SXF257 ADICIONAL $80.000 ENTREGA TSS QUIMBAYA',
   10342669,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 80000,
   73,NULL,'TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','HUMBERTO RINCON','WLS478','20825 19086','9605','CAICEDONIA','CRISTIAN CAICEDO, JUAN CONTRERAS',2,
   2,0,'-',
   10060387,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1) + 0,
   67,NULL,'TYM'),

  /* 14 – TTL256 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','ANDRES QUINTERO','TTL256','20826 20821 19088','9606 9600','FILANDIA','CRISTIAN CAMACHO',1,
   1,0,'-',
   11815062,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1) + 0,
   40,NULL,'TYM'),

  /* 15 – SMO183 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','GABRIEL PEREZ','SMO183','20831','9453','PEREIRA','JUAN QUINTERO',1,
   1,0,'-',
   5816783,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 16 – XVI496 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','PABLO RAMIREZ','XVI496','20832 19073 19072','9454','PEREIRA','ANDRES PINEDA',1,
   1,0,'-',
   10502997,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','RICARDO LOPEZ','TMZ674','20833','9455','PEREIRA','ANDRES RIOS',1,
   1,0,'-',
   5831577,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','CARLOS VELASCO','SPQ814','20834 20822','9456 7002','SANTA ROSA','CAMILO MUÑOZ',1,
   1,0,'-',
   7881958,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 19 – WHM317 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','HUMBERTO PARRA','WHM317','20835 19067','9457','PEREIRA','ESTEBAN GALLEGO',1,
   1,0,'-',
   6247757,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','MIGUEL TABARES','PEK019','20836','9458','PEREIRA','JHON GIRALDO',1,
   1,0,'-',
   6632881,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 21 – WHM896 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','ALEXANDER CUELLAR','WHM896','20837','9459','PEREIRA','CAMILO PEÑA',1,
   1,0,'-',
   7799178,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','JULIAN','WLC133','20838','9460','PEREIRA','EDWIN GOMEZ',1,
   1,0,'-',
   6018038,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   42,NULL,'TYM'),

  /* 23 – WTN748 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','DIEGO RATIVA','WTN748','20852 19075','7004','MARSELLA','BRAHIAN VALENCIA',1,
   1,0,'-',
   10154827,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARSELLA' LIMIT 1) + 0,
   53,'AP649164','TYM'),

  /* 24 – JVM223 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','WILMAR CARDONA','JVM223','20853','7005','CARTAGO','CESAR CASTILLO',1,
   1,0,'-',
   7509567,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   41,'AP649395 AP649396','TYM'),

  /* 25 – ERK303 – sin adicional */
  ('2026-06-04','Jueves','ALPINA','JORGE ALARCON','ERK303','20827 19074 19070','7006','APIA VIRGINIA','ROBINSON TORRES, GERMAN GALVEZ',2,
   2,0,'-',
   9277711,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 26 – TNH494 – **ADICIONAL $50.000** */
  ('2026-06-04','Jueves','ALPINA','ADALBERTO MEJIA','TNH494','20819 20828 19087','7007 9451','VITERBO','JOHN MORENO, JOHAN MUÑOZ',2,
   2,50000,'TNH494 ADICIONAL $50.000 SOBRECARGO',
   14683529,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1) + 50000,
   67,NULL,'TYM'),

  /* 27 – SQB119 – sin adicional */
  ('2026-06-04','Jueves','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19076','FLEISCHMANN','CUBA','DIEGO FRANCO',1,
   1,0,'-',
   3458882,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='CUBA' LIMIT 1) + 0,
   45,NULL,'TYM');

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
WHERE fecha = '2026-06-04'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
