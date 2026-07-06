/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 2 JULIO 2026
   Generado: 2026-07-02
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: WFVO15 en planilla corregido a WFV015
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-02'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 02‑Jul‑2026
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
  ('2026-07-02','Jueves','ALPINA','JOHAN ECHEVERRY','SYU652','21662','9552','MANIZALES VILLAMARIA','ANDRES MATEO VILLALBA DIAZ',1,
   1,0,'-',
   4952186,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   43,'19442','TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-07-02','Jueves','ALPINA','CAMILO CASTAÑO','KOL802','21663','9553','MANIZALES VILLAMARIA','CRISTIAN CAMILO OSPINA PARRA',1,
   1,0,'-',
   4892561,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   46,'19443','TYM'),

  /* 03 – EYX091 – sin adicional */
  ('2026-07-02','Jueves','ALPINA','CARLOS GOMEZ','EYX091','21664','9554','NEIRA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   7896449,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1) + 0,
   54,'19444','TYM'),

  /* 04 – EYY183 – sin adicional */
  ('2026-07-02','Jueves','ALPINA','JOHN ARENAS','EYY183','21665','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   5469978,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   49,'19445','TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-07-02','Jueves','ALPINA','MIGUEL GONZALES','SLI587','21666 21642','9556 9550','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   8003857,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   52,'19446','TYM'),

  /* 06 – WGZ876 – EXTRA $60.000 con facturas FEP */
  ('2026-07-02','Jueves','ALPINA','RICARDO PINEDA','WGZ876','21667','9557','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ',1,
   1,60000,'WGZ876 EXTRA $60.000',
   10887000,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1) + 60000,
   57,'FEP1188594-595-596','TYM'),

  /* 07 – SMH182 – sin adicional */
  ('2026-07-02','Jueves','ALPINA','JUAN DAVID','SMH182','21668','9559','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   10255579,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RDA S JOSE BELALCAZAR' LIMIT 1) + 0,
   54,'19448','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 08 – WFV015 – sin adicional */
  ('2026-07-02','Jueves','ALPINA','YONNI VALENCIA','WFV015','21633 21646','7008','CALARCA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   16698343,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   4,'19422','TYM'),

  /* 09 – SPU120 – con factura AP */
  ('2026-07-02','Jueves','ALPINA','OSWALDO','SPU120','21645 21669','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   7442411,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   57,'AP676648','TYM'),

  /* 10 – VZD334 – con facturas AP */
  ('2026-07-02','Jueves','ALPINA','JULIAN CUELLAR','VZD334','21670','9602 7009','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, CAMILO SUAREZ GARCIA',2,
   2,0,'-',
   12449153,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   62,'AP675306 AP676649 19440','TYM'),

  /* 11 – EQY944 – con factura AP */
  ('2026-07-02','Jueves','ALPINA','GOBER CRISTANCHO','EQY944','21671','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   5363630,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   56,'AP675486','TYM'),

  /* 12 – SXF257 – ADICIONAL $50.000 ENTREGA SUPER EN MONTENEGRO */
  ('2026-07-02','Jueves','ALPINA','FABIO RUIZ','SXF257','21599 21672','9604 7010','ALCALA ULLOA','CAMILO ANDRES CONTRERAS RIVAS',1,
   1,50000,'SXF257 ADICIONAL $50.000 ENTREGA DE SUPER EN MONTENEGRO',
   8503497,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1) + 50000,
   53,'AP676650 19451','TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-07-02','Jueves','ALPINA','HUMBERTO RINCON','WLS478','21647','9605','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, SEBASTIAN MONTES',2,
   2,0,'-',
   8199921,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1) + 0,
   55,'19452','TYM'),

  /* 14 – TTL256 – sin adicional */
  ('2026-07-02','Jueves','ALPINA','YIMERSON GARCIA','TTL256','21643 21648','9606 9600','FILANDIA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   11156680,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1) + 0,
   37,'19455','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-07-02','Jueves','ALPINA','GABRIEL PEREZ','SMO183','21653','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   4408308,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 16 – XVI496 – con factura FEP */
  ('2026-07-02','Jueves','ALPINA','PABLO RAMIREZ','XVI496','21654','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7305587,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   61,'FEP1188673','TYM'),

  /* 17 – TMZ674 – EXTRA $60.000 */
  ('2026-07-02','Jueves','ALPINA','RICARDO LOPEZ','TMZ674','21611TSS 21655','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,60000,'TMZ674 EXTRA $60.000',
   5835522,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   65,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-07-02','Jueves','ALPINA','CARLOS VELASCO','SPQ814','21656 21644','9456 7002','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   4282447,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   38,NULL,'TYM'),

  /* 19 – WHM317 – sin adicional */
  ('2026-07-02','Jueves','ALPINA','HUMBERTO PARRA','WHM317','21657','9457','ARABIA ALTAGRACIA','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   4340386,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARABIA ALTAGRACIA' LIMIT 1) + 0,
   49,'19439','TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-07-02','Jueves','ALPINA','MIGUEL TABARES','PEK019','21658','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   4927394,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 21 – WHM896 – sin adicional */
  ('2026-07-02','Jueves','ALPINA','ALEXANDER CUELLAR','WHM896','21659','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   6673424,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-07-02','Jueves','ALPINA','JULIAN','WLC133','21660','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   5334867,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   39,NULL,'TYM'),

  /* 23 – TNH494 – con factura AP */
  ('2026-07-02','Jueves','ALPINA','ADALBERTO MEJIA','TNH494','21661','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   7916493,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   55,'AP676670','TYM'),

  /* 24 – WTN748 – ADICIONAL $30.000 ENTREGA TSS con facturas FEP */
  ('2026-07-02','Jueves','ALPINA','DIEGO RATIVA','WTN748','21673','7004','MARSELLA','JHON FREDY MORENO, ANDRES CAMILO MUÑOZ CAICEDO',2,
   2,30000,'WTN748 ADICIONAL $30.000 ENTREGA TSS',
   8638946,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARSELLA' LIMIT 1) + 30000,
   53,'FEP1188665-667-671','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 25 – EST067 – con factura AP */
  ('2026-07-02','Jueves','ALPINA','JORGE RIVILLAS','EST067','21674','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   6493969,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   46,'AP676671','TYM'),

  /* 26 – ERK303 – sin adicional */
  ('2026-07-02','Jueves','ALPINA','JORGE ALARCON','ERK303','21649','7006','APIA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   8266910,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 0,
   50,'19441','TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-07-02','Jueves','ALPINA','WILMAR CARDONA','JVM223','21641 21650','7007 9451','VITERBO','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   10552481,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1) + 0,
   58,'19449','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-07-02','Jueves','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19453','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   3199994,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   39,NULL,'TYM');

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
WHERE fecha = '2026-07-02'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
