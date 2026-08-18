/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 6 AGOSTO 2026
   (Programación dice "JUEVES 5 AGOSTO" pero es jueves 6)
   Generado: 2026-08-06
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: WEP384 aparece dos veces:
         1) Milpas lunes 03/08 → VALOR FLETE $450.000 (se registra en 06 como pendiente)
         2) RDA S JOSE BELALCAZAR + EXTRA $60.000 (ruta del día)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-06'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 06‑Ago‑2026
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
  ('2026-08-06','Jueves','ALPINA','JOHAN ECHEVERRY','SYU652','22659','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   5633482,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   46,'9919931','TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-08-06','Jueves','ALPINA','FREDY','KOL802','22645 22660','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   6383674,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   47,'9919934','TYM'),

  /* 03 – EYX091 – sin adicional */
  ('2026-08-06','Jueves','ALPINA','CARLOS GOMEZ','EYX091','22648 22649','9554','PACORA SALAMINA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   15386556,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1) + 0,
   92,'9919930 9919935','TYM'),

  /* 04 – EYY183 – EXTRA $80.000 con factura AP */
  ('2026-08-06','Jueves','ALPINA','JOHN ARENAS','EYY183','22661','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,80000,'EYY183 EXTRA $80.000 PEDIDO FUERA DE CIUDAD',
   7714516,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 80000,
   54,'AP710626 9919932','TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-08-06','Jueves','ALPINA','MIGUEL GONZALES','SLI587','22644 22662','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE, YONNY LOPEZ',2,
   2,0,'-',
   9141543,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   60,'9919933 9919920','TYM'),

  /* 06 – WGZ876 – con facturas FEP */
  ('2026-08-06','Jueves','ALPINA','RICARDO PINEDA','WGZ876','22663','9557','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   15806226,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1) + 0,
   55,'FEP1191398 FEP1191403 FEP1191405 FEP1191407 9919906','TYM'),

  /* 07 – WEP384 (Milpas lunes) – VALOR FLETE $450.000 pendiente */
  ('2026-08-06','Jueves','ALPINA','YOFER','WEP384','','MILPAS LUNES 03 AGOSTO','CHINCHINA','',0,
   0,0,'WEP384 VALOR FLETE $450.000 MILPAS LUNES 03/08',
   11689579,
   450000,
   2,'AP705680 AP705687','TYM'),

  /* 08 – MAT480 – VALOR FLETE $450.000 */
  ('2026-08-06','Jueves','ALPINA','ELKIN AGUIRRE','MAT480','22641','7002','CHINCHINA','JHON FREDY MORENO',1,
   1,0,'MAT480 VALOR FLETE $450.000',
   26696869,
   450000,
   7,NULL,'TYM'),

  /* 09 – WEP384 (RDA S JOSE) – EXTRA $60.000 */
  ('2026-08-06','Jueves','ALPINA','YOFER','WEP384','9919936 22664','9559','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'WEP384 EXTRA $60.000',
   11328156,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RDA S JOSE BELALCAZAR' LIMIT 1) + 60000,
   57,'9919909','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 10 – WFV015 – EXTRA $80.000 DESCARGUE */
  ('2026-08-06','Jueves','ALPINA','YONNI VALENCIA','WFV015','22642','7008','CALARCA','',0,
   0,80000,'WFV015 EXTRA $80.000 DESCARGUE',
   10457345,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 80000,
   3,NULL,'TYM'),

  /* 11 – ETM037 – sin adicional */
  ('2026-08-06','Jueves','ALPINA','OSCAR MARIN','ETM037','22643 22665','9601','ARMENIA','YEISON DAVID RENDON SOTO, OSCAR MAURICIO RESTREPO MORENO',2,
   2,0,'-',
   8259043,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 12 – VZD334 – EXTRA $40.000 */
  ('2026-08-06','Jueves','ALPINA','JULIAN CUELLAR','VZD334','22646 22598 22666','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,40000,'VZD334 EXTRA $40.000',
   8817487,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 40000,
   70,'9919921 9919922','TYM'),

  /* 13 – EQY944 – con factura AP */
  ('2026-08-06','Jueves','ALPINA','GOBER CRISTANCHO','EQY944','22667','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   6668966,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   65,'AP710021','TYM'),

  /* 14 – SXF257 – sin adicional */
  ('2026-08-06','Jueves','ALPINA','FABIO RUIZ','SXF257','22668','9604','ALCALA ULLOA','CAMILO ANDRES CONTRERAS RIVAS',1,
   1,0,'-',
   7756306,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1) + 0,
   50,'9919927 9919926','TYM'),

  /* 15 – WLS478 – sin adicional */
  ('2026-08-06','Jueves','ALPINA','HUMBERTO RINCON','WLS478','22669','9605','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, VALENTINA GARCIA',2,
   2,0,'-',
   10086563,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1) + 0,
   56,'9919924','TYM'),

  /* 16 – TTL256 – sin adicional */
  ('2026-08-06','Jueves','ALPINA','ANDRES QUINTERO','TTL256','22675 22670','9606 9600','FILANDIA','CRISTIAN FABIAN CAMACHO MARTINEZ, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   9616822,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1) + 0,
   41,'9919895','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 17 – DQA454 – sin adicional (zona 9453 hoy) */
  ('2026-08-06','Jueves','ALPINA','LUIS MONTOYA','DQA454','22650','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   5678003,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 18 – SPU120 – sin adicional (zona 9454) */
  ('2026-08-06','Jueves','ALPINA','OSWALDO','SPU120','22651','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   9633638,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   63,'9919918','TYM'),

  /* 19 – TMZ674 – EXTRA $40.000 */
  ('2026-08-06','Jueves','ALPINA','RICARDO LOPEZ','TMZ674','TSS22617 22652','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, DANIELA CASTIBLANCO',2,
   2,40000,'TMZ674 EXTRA $40.000 RUTA DOSQUEBRADAS Y BAJA A CENTRO',
   7224867,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 40000,
   75,NULL,'TYM'),

  /* 20 – SPQ814 – sin adicional */
  ('2026-08-06','Jueves','ALPINA','CARLOS VELASCO','SPQ814','22653','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   3757725,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   34,NULL,'TYM'),

  /* 21 – WHM896 – sin adicional */
  ('2026-08-06','Jueves','ALPINA','ALEXANDER CUELLAR','WHM896','22654','9457','ARABIA ALTAGRACIA','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   5501839,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARABIA ALTAGRACIA' LIMIT 1) + 0,
   56,'9919919','TYM'),

  /* 22 – PEK019 – sin adicional */
  ('2026-08-06','Jueves','ALPINA','MIGUEL TABARES','PEK019','22655','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   5592582,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 23 – XVI496 – sin adicional */
  ('2026-08-06','Jueves','ALPINA','PABLO RAMIREZ','XVI496','TSS22621 22656','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   5744590,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   39,NULL,'TYM'),

  /* 24 – WLC133 – sin adicional */
  ('2026-08-06','Jueves','ALPINA','JULIAN','WLC133','22657','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO',1,
   1,0,'-',
   5668894,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   40,NULL,'TYM'),

  /* 25 – TNH494 – sin adicional */
  ('2026-08-06','Jueves','ALPINA','ADALBERTO MEJIA','TNH494','22658','9461 9450','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   6591197,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 26 – WTN748 – con factura AP */
  ('2026-08-06','Jueves','ALPINA','DIEGO RATIVA','WTN748','22671','7004','MARSELLA','BRAHIAN STIVEN VALENCIA IGLESIAS, SAMUEL ANDRES ARIAS',2,
   2,0,'-',
   11400899,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARSELLA' LIMIT 1) + 0,
   54,'AP711139 9919917','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 27 – EST067 – con factura AP */
  ('2026-08-06','Jueves','ALPINA','JORGE RIVILLAS','EST067','22672','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5469176,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   44,'AP711257','TYM'),

  /* 28 – ERK303 – sin adicional */
  ('2026-08-06','Jueves','ALPINA','JORGE ALARCON','ERK303','22673','7006','APIA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   12395483,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 0,
   47,'9919916','TYM'),

  /* 29 – JVM223 – sin adicional */
  ('2026-08-06','Jueves','ALPINA','WILMAR CARDONA','JVM223','22674 22640','7007 9451','VITERBO','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   12476265,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1) + 0,
   66,'9919925','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 30 – SQB119 – sin adicional */
  ('2026-08-06','Jueves','FLEISCHMANN','CARLOS CASTAÑO','SQB119','9919923','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   4493697,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   43,NULL,'TYM');

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
WHERE fecha = '2026-08-06'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
