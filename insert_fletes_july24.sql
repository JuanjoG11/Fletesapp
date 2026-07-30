/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 24 JULIO 2026
   Generado: 2026-07-24
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: SPU120 cubre zona 9454 Pereira hoy
         TUL630 valor flete fijo $450.000
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-24'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 24‑Jul‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – SYU652 – EXTRA $60.000 */
  ('2026-07-24','Viernes','ALPINA','JOHAN ECHEVERRY','SYU652','22264 22287','9552 7000','MANIZALES VILLAMARIA','OSCAR MAURICIO RESTREPO MORENO',1,
   1,60000,'SYU652 EXTRA $60.000',
   10217951,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   51,NULL,'TYM'),

  /* 02 – KOL802 – con facturas AP */
  ('2026-07-24','Viernes','ALPINA','FREDY','KOL802','22288','9553 9550','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   7245929,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   47,'AP698585 AP697880','TYM'),

  /* 03 – WFV015 – EXTRA $60.000 */
  ('2026-07-24','Viernes','ALPINA','YONNI VALENCIA','WFV015','22289','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,60000,'WFV015 EXTRA $60.000',
   7772269,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   48,NULL,'TYM'),

  /* 04 – EYY183 – sin adicional */
  ('2026-07-24','Viernes','ALPINA','JOHN ARENAS','EYY183','22290','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   8877907,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   63,'9919739','TYM'),

  /* 05 – SLI587 – con factura AP */
  ('2026-07-24','Viernes','ALPINA','MIGUEL GONZALES','SLI587','22291','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   11416329,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   55,'AP698587 9919740','TYM'),

  /* 06 – WGZ876 – EXTRA $100.000 */
  ('2026-07-24','Viernes','ALPINA','RICARDO PINEDA','WGZ876','22292','9557','SUPIA','',0,
   0,100000,'WGZ876 EXTRA $100.000',
   8163043,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 100000,
   26,NULL,'TYM'),

  /* 07 – EYX091 – sin adicional */
  ('2026-07-24','Viernes','ALPINA','ANDRES GOMEZ','EYX091','22273','9558','PACORA SALAMINA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   8252190,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1) + 0,
   53,'9919742 9919724','TYM'),

  /* 08 – TRL186 – EXTRA $50.000 */
  ('2026-07-24','Viernes','ALPINA','WILLIAM','TRL186','22293','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,50000,'TRL186 EXTRA $50.000',
   9928526,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 50000,
   79,'9919743','TYM'),

  /* 09 – TUL630 – VALOR FLETE $450.000 */
  ('2026-07-24','Viernes','ALPINA','JUAN','TUL630','22265','7002','CHINCHINA','JHON FREDY MORENO',1,
   1,0,'TUL630 VALOR FLETE $450.000',
   15996983,
   450000,
   9,NULL,'TYM'),

  /* 10 – WEP384 – sin adicional */
  ('2026-07-24','Viernes','ALPINA','YOFER','WEP384','22263','9560','RIOSUCIO-SUPIA SUPERMERCADO','ANDRES MATEO VILLALBA DIAZ',1,
   1,0,'-',
   11399885,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 0,
   10,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 11 – ETM037 – EXTRA $60.000 */
  ('2026-07-24','Viernes','ALPINA','OSCAR MARIN','ETM037','22294','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,60000,'ETM037 EXTRA $60.000',
   8745809,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 60000,
   64,NULL,'TYM'),

  /* 12 – VZD334 – EXTRA $90.000 con facturas AP */
  ('2026-07-24','Viernes','ALPINA','JULIAN CUELLAR','VZD334','22295','9602','ARMENIA','SANTIAGO HENAO MORALES',1,
   1,90000,'VZD334 EXTRA $90.000',
   7580564,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 90000,
   46,'AP700059 AP700060','TYM'),

  /* 13 – EQY944 – sin adicional */
  ('2026-07-24','Viernes','ALPINA','GOBER CRISTANCHO','EQY944','22268','9603','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   4910164,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   59,'9919744 9919747 9919746','TYM'),

  /* 14 – SXF257 – EXTRA $60.000 */
  ('2026-07-24','Viernes','ALPINA','FABIO RUIZ','SXF257','22296','9604','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS, CAMILO SUAREZ GARCIA',2,
   2,60000,'SXF257 EXTRA $60.000',
   8389258,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 60000,
   50,'9919728','TYM'),

  /* 15 – WLS478 – sin adicional */
  ('2026-07-24','Viernes','ALPINA','HUMBERTO RINCON','WLS478','22267 22274','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, SEBASTIAN MONTES',2,
   2,0,'-',
   13898492,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   52,'9919745','TYM'),

  /* 16 – TTL256 – sin adicional */
  ('2026-07-24','Viernes','ALPINA','ANDRES QUINTERO','TTL256','22270 22275','9606 9600','CIRCASIA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   9050478,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   60,'9919748','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 17 – SMO183 – sin adicional */
  ('2026-07-24','Viernes','ALPINA','GABRIEL PEREZ','SMO183','22278','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   7853541,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   65,NULL,'TYM'),

  /* 18 – SPU120 – EXTRA $60.000 (zona 9454 hoy) */
  ('2026-07-24','Viernes','ALPINA','OSWALDO','SPU120','22279','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,60000,'SPU120 EXTRA $60.000',
   7977067,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   55,NULL,'TYM'),

  /* 19 – TMZ674 – sin adicional */
  ('2026-07-24','Viernes','ALPINA','RICARDO LOPEZ','TMZ674','22280','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   6831760,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 20 – SPQ814 – sin adicional */
  ('2026-07-24','Viernes','ALPINA','CARLOS VELASCO','SPQ814','22281','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5207186,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   41,NULL,'TYM'),

  /* 21 – WHM317 – sin adicional */
  ('2026-07-24','Viernes','ALPINA','HUMBERTO PARRA','WHM317','22282','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   8128341,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   63,NULL,'TYM'),

  /* 22 – PEK019 – sin adicional */
  ('2026-07-24','Viernes','ALPINA','MIGUEL TABARES','PEK019','22283','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   7570101,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 23 – XVI496 – sin adicional */
  ('2026-07-24','Viernes','ALPINA','PABLO RAMIREZ','XVI496','22284','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   7936526,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   61,NULL,'TYM'),

  /* 24 – WLC133 – sin adicional */
  ('2026-07-24','Viernes','ALPINA','JULIAN','WLC133','22285','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, JUAN LARGO',2,
   2,0,'-',
   15539122,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   73,NULL,'TYM'),

  /* 25 – TNH494 – sin adicional */
  ('2026-07-24','Viernes','ALPINA','ADALBERTO MEJIA','TNH494','22286','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   5634275,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 26 – WTN748 – sin adicional */
  ('2026-07-24','Viernes','ALPINA','DIEGO RATIVA','WTN748','22297','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   7947665,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 27 – EST067 – sin adicional */
  ('2026-07-24','Viernes','ALPINA','JORGE RIVILLAS','EST067','22298','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5427526,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 28 – ERK303 – sin adicional */
  ('2026-07-24','Viernes','ALPINA','JORGE ALARCON','ERK303','22276','7006 9450','APIA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   12776827,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 0,
   71,'AP698566 AP698567 AP698569 9919749','TYM'),

  /* 29 – JVM223 – sin adicional */
  ('2026-07-24','Viernes','ALPINA','WILMAR CARDONA','JVM223','22262 22272','7007 9451','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   14873839,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   62,'9919750','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 30 – SQB119 – sin adicional */
  ('2026-07-24','Viernes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','9919734','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   5899135,
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
WHERE fecha = '2026-07-24'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
