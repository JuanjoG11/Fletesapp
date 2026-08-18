/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 14 AGOSTO 2026
   Generado: 2026-08-14
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-14'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 14‑Ago‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – MAT480 – VALOR FLETE $650.000 */
  ('2026-08-14','Viernes','ALPINA','ELKIN AGUIRRE','MAT480','22840 22845','9560','RIOSUCIO-SUPIA SUPERMERCADO','JHON FREDY MORENO',1,
   1,0,'MAT480 VALOR DE FLETE $650.000',
   8041802,
   650000,
   9,NULL,'TYM'),

  /* 02 – SYU652 – con factura AP */
  ('2026-08-14','Viernes','ALPINA','JOHAN ECHEVERRY','SYU652','22863','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   10271703,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   49,'AP717523 20020','TYM'),

  /* 03 – EYY183 – sin adicional (hoy zona 9553) */
  ('2026-08-14','Viernes','ALPINA','JOHN ARENAS','EYY183','22864','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   8305069,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   55,'20021','TYM'),

  /* 04 – WFV015 – con facturas AP+FEP */
  ('2026-08-14','Viernes','ALPINA','YONNI VALENCIA','WFV015','22865','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ, JUAN EXTRA',2,
   2,0,'-',
   15016038,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   64,'AP717739 FEP1192115 20018 20022 20019','TYM'),

  /* 05 – SPU120 – sin adicional (hoy zona 9555 Manizales) */
  ('2026-08-14','Viernes','ALPINA','OSWALDO','SPU120','22866','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   12306312,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   79,'20023','TYM'),

  /* 06 – SLI587 – con factura FEP */
  ('2026-08-14','Viernes','ALPINA','MIGUEL GONZALES','SLI587','22867','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   11121751,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   73,'FEP1192117 20024','TYM'),

  /* 07 – WGZ876 – sin adicional (T PEDIDOS = 0 en planilla, uso valor) */
  ('2026-08-14','Viernes','ALPINA','RICARDO PINEDA','WGZ876','22848','9557','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   14382451,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1) + 0,
   0,'19981','TYM'),

  /* 08 – WFQ635 – con facturas AP (hoy zona 9559 Chinchina) */
  ('2026-08-14','Viernes','ALPINA','JHENCI LOPEZ','WFQ635','22877','9559','CHINCHINA','DANIELA CASTIBLANCO',1,
   1,0,'-',
   12307817,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   57,'AP717524 AP717526 AP717527 AP717525 AP717528 20026','TYM'),

  /* 09 – WEP384 – EXTRA $60.000 */
  ('2026-08-14','Viernes','ALPINA','YOFER','WEP384','22850','9559','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'WEP384 EXTRA $60.000',
   12764550,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RDA S JOSE BELALCAZAR' LIMIT 1) + 60000,
   53,'20006','TYM'),

  /* 10 – EYX091 – sin adicional */
  ('2026-08-14','Viernes','ALPINA','ANDRES GOMEZ','EYX091','22852 22849','9558','PACORA SALAMINA','JUAN CAMILO COCOMA OROZCO, JHONNY LOPEZ',2,
   2,0,'-',
   12587125,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1) + 0,
   72,'20004','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 11 – ETM037 – sin adicional */
  ('2026-08-14','Viernes','ALPINA','OSCAR MARIN','ETM037','22868','9601','ARMENIA','YEISON DAVID RENDON SOTO, OSCAR MAURICIO RESTREPO MORENO',2,
   2,0,'-',
   13562092,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   74,NULL,'TYM'),

  /* 12 – WFR160 – EXTRA $60.000 */
  ('2026-08-14','Viernes','ALPINA','LEANDRO LOPEZ','WFR160','22869','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,60000,'WFR160 EXTRA $60.000',
   9672452,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 60000,
   46,NULL,'TYM'),

  /* 13 – EQY944 – sin adicional */
  ('2026-08-14','Viernes','ALPINA','GOBER CRISTANCHO','EQY944','22870','9603','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   9626731,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   72,'20031 20028 20029 20032','TYM'),

  /* 14 – SXF257 – sin adicional */
  ('2026-08-14','Viernes','ALPINA','FABIO RUIZ','SXF257','22871','9604','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS, VALENTINA GARCIA',2,
   2,0,'-',
   12159292,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   64,'20010 20009 20007','TYM'),

  /* 15 – WLS478 – sin adicional */
  ('2026-08-14','Viernes','ALPINA','HUMBERTO RINCON','WLS478','22846 22872','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, JUAN JOSE',2,
   2,0,'-',
   16289037,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   52,'20030','TYM'),

  /* 16 – TTL256 – sin adicional */
  ('2026-08-14','Viernes','ALPINA','ANDRES QUINTERO','TTL256','22854 22873','9606 9600','CIRCASIA','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   9570148,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   62,'20033','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 17 – PEK019 – sin adicional (zona 9453 hoy) */
  ('2026-08-14','Viernes','ALPINA','MIGUEL TABARES','PEK019','22855','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6095585,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 18 – VZD334 – sin adicional */
  ('2026-08-14','Viernes','ALPINA','JULIAN CUELLAR','VZD334','22856','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   12183036,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 19 – XVI496 – sin adicional */
  ('2026-08-14','Viernes','ALPINA','ANDRES','XVI496','22847','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5075952,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   41,NULL,'TYM'),

  /* 20 – SPQ814 – sin adicional */
  ('2026-08-14','Viernes','ALPINA','CARLOS VELASCO','SPQ814','22857','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   7404167,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 21 – TMZ674 – sin adicional (zona 9457 hoy) */
  ('2026-08-14','Viernes','ALPINA','RICARDO LOPEZ','TMZ674','22858','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   14400977,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   74,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional (zona 9458 hoy) */
  ('2026-08-14','Viernes','ALPINA','JULIAN','WLC133','22859','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL, QUEBIN LOTERO',2,
   2,0,'-',
   15784807,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   91,NULL,'TYM'),

  /* 23 – LUM993 – sin adicional */
  ('2026-08-14','Viernes','ALPINA','PABLO RAMIREZ','LUM993','22860','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   5325609,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   33,NULL,'TYM'),

  /* 24 – JVM223 – VALOR FLETE $350.000 (zona 9460 Pereira) */
  ('2026-08-14','Viernes','ALPINA','WILMAR CARDONA','JVM223','22861','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, CARLOS JIMENEZ',2,
   2,0,'JVM223 VALOR DE FLETE $350.000',
   26897222,
   350000,
   77,NULL,'TYM'),

  /* 25 – WTN748 – sin adicional */
  ('2026-08-14','Viernes','ALPINA','DIEGO RATIVA','WTN748','22874','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   8820850,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 26 – EST067 – sin adicional */
  ('2026-08-14','Viernes','ALPINA','JORGE RIVILLAS','EST067','22844 22875','7005 9450','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   9431878,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   40,NULL,'TYM'),

  /* 27 – TNH494 – sin adicional (hoy zona 7006 La Virginia) */
  ('2026-08-14','Viernes','ALPINA','ADALBERTO MEJIA','TNH494','22838 22876','7006 9450','LA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   16104301,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='LA VIRGINIA' LIMIT 1) + 0,
   70,'20034','TYM'),

  /* 28 – KOL802 – sin adicional (hoy zona 7007 Viterbo) */
  ('2026-08-14','Viernes','ALPINA','JUAN','KOL802','22796 22851','7007 9451','VITERBO','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   13687646,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1) + 0,
   63,'20013','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional */
  ('2026-08-14','Viernes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20017','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   5301947,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   55,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-08-14'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
