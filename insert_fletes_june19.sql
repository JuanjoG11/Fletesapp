/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 19 JUNIO 2026
   Generado: 2026-06-19
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-19'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 19‑Jun‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – TRL186 – sin adicional */
  ('2026-06-19','Viernes','ALPINA','WILLIAM','TRL186','21265','7002','CHINCHINA','JHON FREDY MORENO',1,
   1,0,'-',
   14203066,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   7,NULL,'TYM'),

  /* 02 – SYU652 – con facturas adicionales FEP+AP */
  ('2026-06-19','Viernes','ALPINA','JOHAN ECHEVERRY','SYU652','21280','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   6036817,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   48,'FEP1187598-601-618 AP664310 19283','TYM'),

  /* 03 – KOL802 – con facturas adicionales FEP */
  ('2026-06-19','Viernes','ALPINA','CAMILO CASTAÑO','KOL802','21261 21281','9553 9550','MANIZALES VILLAMARIA','LUIS CARLOS CADAVID RESTREPO',1,
   1,0,'-',
   8286742,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   56,'FEP1187606-607-608-609-610-611-612-613','TYM'),

  /* 04 – WFV015 – sin adicional */
  ('2026-06-19','Viernes','ALPINA','YONNI VALENCIA','WFV015','21282','9554','MANIZALES VILLAMARIA','CAMILO SUAREZ GARCIA, CRISTIAN CAMILO OSPINA PARRA',2,
   2,0,'-',
   7324110,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'AP664325 19279 19283','TYM'),

  /* 05 – EYY183 – sin adicional */
  ('2026-06-19','Viernes','ALPINA','JOHN ARENAS','EYY183','21283','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   8146609,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   65,'19284','TYM'),

  /* 06 – SLI587 – con facturas adicionales FEP */
  ('2026-06-19','Viernes','ALPINA','MIGUEL GONZALES','SLI587','21284','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   6796324,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   51,'FEP1187603 FEP1187602-605 19285','TYM'),

  /* 07 – WGZ876 – ADICIONAL $100.000 ENTREGA SUPERMERCADOS */
  ('2026-06-19','Viernes','ALPINA','RICARDO PINEDA','WGZ876','21262 21285','9557 9560','SUPIA','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,100000,'WGZ876 ADICIONAL $100.000 ENTREGA DE SUPERMERCADOS',
   18639069,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 100000,
   39,NULL,'TYM'),

  /* 08 – EYX091 – sin adicional */
  ('2026-06-19','Viernes','ALPINA','CARLOS GOMEZ','EYX091','21247 21270','9558','PACORA SALAMINA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   12360614,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1) + 0,
   80,'19270','TYM'),

  /* 09 – SMH182 – EXTRA $60.000 */
  ('2026-06-19','Viernes','ALPINA','JUAN DAVID','SMH182','21286','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'SMH182 EXTRA $60.000',
   9899673,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 60000,
   77,'19287','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 10 – SPU120 – sin adicional */
  ('2026-06-19','Viernes','ALPINA','OSWALDO','SPU120','21287','9601','ARMENIA','YEISON DAVID RENDON SOTO, ANDRES CAMILO MUÑOZ CAICEDO',2,
   2,0,'-',
   7755466,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   64,NULL,'TYM'),

  /* 11 – VZD334 – con facturas adicionales AP */
  ('2026-06-19','Viernes','ALPINA','JULIAN CUELLAR','VZD334','21288','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'-',
   6898809,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   48,'AP664316-317','TYM'),

  /* 12 – EQY944 – sin adicional */
  ('2026-06-19','Viernes','ALPINA','GOBER CRISTANCHO','EQY944','21289','9603','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   4247550,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   54,'19289','TYM'),

  /* 13 – SXF257 – sin adicional */
  ('2026-06-19','Viernes','ALPINA','FABIO RUIZ','SXF257','21290','9604','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   8953264,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   59,'19274 19273 19272','TYM'),

  /* 14 – WLS478 – sin adicional */
  ('2026-06-19','Viernes','ALPINA','HUMBERTO RINCON','WLS478','21267 21291','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, JUAN JOSE CONTRERAS HERNANDEZ',2,
   2,0,'-',
   12771971,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 15 – TTL256 – sin adicional */
  ('2026-06-19','Viernes','ALPINA','YIMERSON GARCIA','TTL256','21263 21292','9606 9600','CIRCASIA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   7182806,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   50,'19290','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 16 – SMO183 – sin adicional */
  ('2026-06-19','Viernes','ALPINA','GABRIEL PEREZ','SMO183','21271','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   5429237,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 17 – XVI496 – con factura adicional AP */
  ('2026-06-19','Viernes','ALPINA','PABLO RAMIREZ','XVI496','21272','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   8268690,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   54,'AP663170','TYM'),

  /* 18 – TMZ674 – EXTRA $60.000 */
  ('2026-06-19','Viernes','ALPINA','RICARDO LOPEZ','TMZ674','21273','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,60000,'TMZ674 EXTRA $60.000',
   6072184,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   54,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional */
  ('2026-06-19','Viernes','ALPINA','CARLOS VELASCO','SPQ814','21226TSS 21274','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5503484,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   43,'19280','TYM'),

  /* 20 – WHM317 – sin adicional */
  ('2026-06-19','Viernes','ALPINA','HUMBERTO PARRA','WHM317','21275','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   8305477,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional */
  ('2026-06-19','Viernes','ALPINA','MIGUEL TABARES','PEK019','21276','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   7285989,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 22 – WHM896 – sin adicional */
  ('2026-06-19','Viernes','ALPINA','ALEXANDER CUELLAR','WHM896','21277','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   7276055,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 23 – WLC133 – sin adicional */
  ('2026-06-19','Viernes','ALPINA','JULIAN','WLC133','21278','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, JOHAN STIVEN MUÑOZ RUIZ',2,
   2,0,'-',
   13004799,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   71,NULL,'TYM'),

  /* 24 – TNH494 – con factura adicional AP */
  ('2026-06-19','Viernes','ALPINA','ADALBERTO MEJIA','TNH494','21240TSS 21279','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   10986278,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   64,'AP664298','TYM'),

  /* 25 – WTN748 – ADICIONAL $26.000 ENTREGA FLEISCHMANN EXTRARUTA */
  ('2026-06-19','Viernes','ALPINA','DIEGO RATIVA','WTN748','21293','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,26000,'WTN748 ADICIONAL $26.000 ENTREGA FLEISCHMANN EXTRARUTA',
   6786885,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 26000,
   50,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 26 – EST067 – sin adicional */
  ('2026-06-19','Viernes','ALPINA','JORGE RIVILLAS','EST067','21294','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5599911,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 27 – ERK303 – sin adicional */
  ('2026-06-19','Viernes','ALPINA','JORGE ALARCON','ERK303','21295','7006','APIA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   10874347,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 0,
   58,'AP664297-299 19291','TYM'),

  /* 28 – JVM223 – sin adicional */
  ('2026-06-19','Viernes','ALPINA','WILMAR CARDONA','JVM223','21260 21296','7007 9451','BELEN DE UMBRIA','OSCAR MAURICIO RESTREPO MORENO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   16275062,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   63,'19292','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional */
  ('2026-06-19','Viernes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19293 19288','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   6108330,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   54,NULL,'TYM');

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
WHERE fecha = '2026-06-19'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
