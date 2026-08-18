/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 31 JULIO 2026
   Generado: 2026-07-31
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: MAT480 duplicado en planilla → se inserta solo una vez
         TRL186 hoy va a Pereira zona 9454
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-31'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 31‑Jul‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – SYU652 – EXTRA $100.000 con facturas AP+FEP */
  ('2026-07-31','Viernes','ALPINA','JOHAN ECHEVERRY','SYU652','22501','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,100000,'SYU652 EXTRA $100.000',
   8967274,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 100000,
   44,'AP705673 FEP1191170 FEP1191171 FEP1191174','TYM'),

  /* 02 – KOL802 – con factura AP */
  ('2026-07-31','Viernes','ALPINA','FREDY','KOL802','22502','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   8088096,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   53,'AP705725 9919836','TYM'),

  /* 03 – WFV015 – EXTRA $150.000 con factura AP */
  ('2026-07-31','Viernes','ALPINA','YONNI VALENCIA','WFV015','22503','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,150000,'WFV015 EXTRA $150.000 PASADOS Y HOY',
   8748277,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 150000,
   49,'AP705674 9919837','TYM'),

  /* 04 – EYY183 – sin adicional */
  ('2026-07-31','Viernes','ALPINA','JOHN ARENAS','EYY183','22504','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6249670,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   55,'9919838','TYM'),

  /* 05 – SLI587 – con facturas FEP */
  ('2026-07-31','Viernes','ALPINA','MIGUEL GONZALES','SLI587','22505','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   5178896,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   50,'FEP1191176 FEP1191162 FEP1191165 FEP1191167','TYM'),

  /* 06 – WGZ876 – ADICIONAL $500.000 SUPERMERCADOS */
  ('2026-07-31','Viernes','ALPINA','RICARDO PINEDA','WGZ876','22506','9557','SUPIA','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,500000,'WGZ876 SUMAR A FLETE $500.000 SUPERMERCADOS',
   19083165,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 500000,
   39,'9919799','TYM'),

  /* 07 – EYX091 – sin adicional */
  ('2026-07-31','Viernes','ALPINA','ANDRES GOMEZ','EYX091','22489','9558','PACORA SALAMINA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   6654067,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1) + 0,
   41,'9919819','TYM'),

  /* 08 – WEP384 – con facturas AP */
  ('2026-07-31','Viernes','ALPINA','YOFER','WEP384','22507','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   8408417,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   67,'AP701424 AP705678 9919841','TYM'),

  /* 09 – MAT480 – VALOR FLETE $600.000 (una sola vez) */
  ('2026-07-31','Viernes','ALPINA','ELKIN AGUIRRE','MAT480','','SUPER DEL CENTRO','MANIZALES VILLAMARIA','JHON FREDY MORENO',1,
   1,0,'MAT480 VALOR FLETE $600.000',
   31513690,
   600000,
   2,'AP705726 AP705727','TYM'),

  /* 10 – WPP948 – VALOR FLETE $400.000 */
  ('2026-07-31','Viernes','ALPINA','SEBASTIAN OROZCO','WPP948','','AHORROS LECHE','MANIZALES VILLAMARIA','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'WPP948 VALOR FLETE $400.000',
   9936000,
   400000,
   5,'AP704300 AP704301 AP704302','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 11 – ETM037 – con factura AP */
  ('2026-07-31','Viernes','ALPINA','OSCAR MARIN','ETM037','22508','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   6727547,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   61,'AP705729','TYM'),

  /* 12 – TUL630 (Salento) – VALOR FLETE $550.000 */
  ('2026-07-31','Viernes','ALPINA','JUAN','TUL630','22444','MIO SALENTO SUPERCOCORA','SALENTO','',0,
   0,0,'TUL630 VALOR FLETE $550.000',
   5667160,
   550000,
   2,NULL,'TYM'),

  /* 13 – VZD334 – EXTRA $40.000 con factura AP */
  ('2026-07-31','Viernes','ALPINA','JULIAN CUELLAR','VZD334','22509','9602','ARMENIA','SANTIAGO HENAO MORALES',1,
   1,40000,'VZD334 EXTRA $40.000',
   6157753,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 40000,
   49,'AP705681','TYM'),

  /* 14 – EQY944 – sin adicional */
  ('2026-07-31','Viernes','ALPINA','GOBER CRISTANCHO','EQY944','22510','9603','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   3563675,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   51,'9919842','TYM'),

  /* 15 – SXF257 – EXTRA $140.000 pedido en otra ciudad */
  ('2026-07-31','Viernes','ALPINA','FABIO RUIZ','SXF257','22511','9604','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS, JUAN LARGO',2,
   2,140000,'SXF257 EXTRA $140.000 PEDIDO EN OTRA CIUDAD',
   7796836,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 140000,
   63,'9919822 9919823 9919824','TYM'),

  /* 16 – WLS478 – sin adicional */
  ('2026-07-31','Viernes','ALPINA','HUMBERTO RINCON','WLS478','22487 22512','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, SEBASTIAN MONTES',2,
   2,0,'-',
   7826752,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   40,NULL,'TYM'),

  /* 17 – TTL256 – con factura AP */
  ('2026-07-31','Viernes','ALPINA','ANDRES QUINTERO','TTL256','22513','9606','CIRCASIA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   5807192,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   54,'AP705728 9919843','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 18 – SMO183 – sin adicional */
  ('2026-07-31','Viernes','ALPINA','GABRIEL PEREZ','SMO183','22492','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   5805371,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 19 – TRL186 – sin adicional (hoy zona 9454 Pereira) */
  ('2026-07-31','Viernes','ALPINA','WILLIAM','TRL186','22493','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7712857,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 20 – TMZ674 – sin adicional */
  ('2026-07-31','Viernes','ALPINA','RICARDO LOPEZ','TMZ674','22494','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5988618,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 21 – SPQ814 – sin adicional */
  ('2026-07-31','Viernes','ALPINA','CARLOS VELASCO','SPQ814','22495','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5723861,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 22 – WHM896 – sin adicional (zona 9457 hoy) */
  ('2026-07-31','Viernes','ALPINA','ALEXANDER CUELLAR','WHM896','22496','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   6957878,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 23 – PEK019 – sin adicional */
  ('2026-07-31','Viernes','ALPINA','MIGUEL TABARES','PEK019','22497','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   6533592,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 24 – XVI496 – sin adicional */
  ('2026-07-31','Viernes','ALPINA','PABLO RAMIREZ','XVI496','22498','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   6253687,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 25 – WLC133 – sin adicional */
  ('2026-07-31','Viernes','ALPINA','JULIAN','WLC133','22499','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, CAMILO SUAREZ GARCIA',2,
   2,0,'-',
   12220368,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   66,NULL,'TYM'),

  /* 26 – TNH494 – sin adicional */
  ('2026-07-31','Viernes','ALPINA','ADALBERTO MEJIA','TNH494','22500','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   6613082,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   56,'9919833','TYM'),

  /* 27 – WTN748 – sin adicional */
  ('2026-07-31','Viernes','ALPINA','DIEGO RATIVA','WTN748','22514','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   6146105,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 28 – EST067 – sin adicional */
  ('2026-07-31','Viernes','ALPINA','JORGE RIVILLAS','EST067','22515','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5021830,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   36,NULL,'TYM'),

  /* 29 – TUL630 (La Virginia) – VALOR FLETE $350.000 */
  ('2026-07-31','Viernes','ALPINA','JUAN','TUL630','','LAPOSADA MERCAPLAZA','LA VIRGINIA','',0,
   0,0,'TUL630 VALOR FLETE $350.000 LA VIRGINIA',
   9237980,
   350000,
   3,'AP705659 AP705662','TYM'),

  /* 30 – DQA454 – EXTRA $150.000 */
  ('2026-07-31','Viernes','ALPINA','LUIS MONTOYA','DQA454','22445','PALERMO SUPER CHINCHINA','MANIZALES VILLAMARIA','',0,
   0,150000,'DQA454 EXTRA $150.000',
   6303568,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 150000,
   4,'AP705677 AP705675 AP705679','TYM'),

  /* 31 – ERK303 – EXTRA $60.000 con factura AP */
  ('2026-07-31','Viernes','ALPINA','JORGE ALARCON','ERK303','22515','7006','LA VIRGINIA','ROVINSON TORRES RIVERA',1,
   1,60000,'ERK303 EXTRA $60.000',
   7696897,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='LA VIRGINIA' LIMIT 1) + 60000,
   64,'AP705660 9919844','TYM'),

  /* 32 – JVM223 – sin adicional */
  ('2026-07-31','Viernes','ALPINA','WILMAR CARDONA','JVM223','22482 22517','7007 9451','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   12211354,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   61,'9919845','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 33 – SQB119 – sin adicional */
  ('2026-07-31','Viernes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','9919834','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   4630870,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   50,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha,
       placa,
       zona,
       poblacion,
       precio                      AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos,
       facturas_adicionales,
       proveedor
FROM fletes
WHERE fecha = '2026-07-31'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
