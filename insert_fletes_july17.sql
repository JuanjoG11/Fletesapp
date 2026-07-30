/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 17 JULIO 2026
   Generado: 2026-07-17
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: TRL186 sale dos veces (WILLIAM - Chinchina, RUBEN - Supia Riosucio Super)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-17'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 17‑Jul‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – WEP384 – VALOR DE FLETE $360.000 */
  ('2026-07-17','Viernes','ALPINA','YOFER','WEP384','22067','7002','CHINCHINA','SANTIAGO HENAO MORALES',1,
   1,0,'WEP384 VALOR DE FLETE $360.000',
   28422790,
   360000,
   6,NULL,'TYM'),

  /* 02 – TDY481 – VALOR DE FLETE $300.000 (sin pedidos) */
  ('2026-07-17','Viernes','ALPINA','SANDRO ZULUAGA','TDY481','','CHINCHINA','CHINCHINA','',0,
   0,0,'TDY481 VALOR DE FLETE $300.000',
   0,
   300000,
   0,NULL,'TYM'),

  /* 03 – SYU652 – con facturas FEP */
  ('2026-07-17','Viernes','ALPINA','JOHAN ECHEVERRY','SYU652','22087 22066','9552 7000','MANIZALES VILLAMARIA','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   7636490,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   29,'FEP1190037-040-043','TYM'),

  /* 04 – KOL802 – sin adicional */
  ('2026-07-17','Viernes','ALPINA','FREDY','KOL802','22088','9553','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   5823847,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   47,'19656','TYM'),

  /* 05 – WFV015 – con facturas FEP */
  ('2026-07-17','Viernes','ALPINA','YONNI VALENCIA','WFV015','22089','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   4992728,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   38,'FEP1190035-044','TYM'),

  /* 06 – EYY183 – con facturas FEP */
  ('2026-07-17','Viernes','ALPINA','JOHN ARENAS','EYY183','22090','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   5518055,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   49,'FEP1190036-038-041','TYM'),

  /* 07 – SLI587 – con factura FEP */
  ('2026-07-17','Viernes','ALPINA','MIGUEL GONZALES','SLI587','22091','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   5130533,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   46,'FEP1190042 19658','TYM'),

  /* 08 – WGZ876 – EXTRA $60.000 */
  ('2026-07-17','Viernes','ALPINA','RICARDO PINEDA','WGZ876','22092','9557','SUPIA','JUAN MANUEL DELGADO NARVAEZ',1,
   1,60000,'WGZ876 EXTRA $60.000',
   13203047,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 60000,
   31,NULL,'TYM'),

  /* 09 – EYX091 – sin adicional */
  ('2026-07-17','Viernes','ALPINA','ANDRES GOMEZ','EYX091','22054 22070','9558','PACORA SALAMINA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   11611572,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1) + 0,
   71,'19633','TYM'),

  /* 10 – TRL186 (WILLIAM) – Chinchina */
  ('2026-07-17','Viernes','ALPINA','WILLIAM','TRL186','22093','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,0,'-',
   7376103,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   75,'19654','TYM'),

  /* 11 – TRL186 (RUBEN) – Supia Riosucio Super */
  ('2026-07-17','Viernes','ALPINA','RUBEN','TRL186','22065','9560','RIOSUCIO-SUPIA SUPERMERCADO','ANDRES MATEO VILLALBA DIAZ',1,
   1,0,'-',
   9876671,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 0,
   10,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 12 – SPU120 – sin adicional */
  ('2026-07-17','Viernes','ALPINA','OSWALDO','SPU120','22094','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   6302091,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 13 – ETM037 – con facturas AP */
  ('2026-07-17','Viernes','ALPINA','OSCAR MARIN','ETM037','22095','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'-',
   8118983,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   48,'AP691805-806','TYM'),

  /* 14 – EQY944 – sin adicional */
  ('2026-07-17','Viernes','ALPINA','GOBER CRISTANCHO','EQY944','22096','9603','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   3976424,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   49,'19650','TYM'),

  /* 15 – SXF257 – EXTRA $60.000 */
  ('2026-07-17','Viernes','ALPINA','FABIO RUIZ','SXF257','22097','9604','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS, JUAN LARGO',2,
   2,60000,'SXF257 EXTRA $60.000',
   8197044,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 60000,
   68,'19640 19638','TYM'),

  /* 16 – WLS478 – sin adicional */
  ('2026-07-17','Viernes','ALPINA','HUMBERTO RINCON','WLS478','22071 22069','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, SEBASTIAN MONTES',2,
   2,0,'-',
   9548924,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   44,NULL,'TYM'),

  /* 17 – TTL256 – sin adicional */
  ('2026-07-17','Viernes','ALPINA','ANDRES QUINTERO','TTL256','22072 22077','9606 9600','CIRCASIA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   7931581,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   42,'19649','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 18 – SMO183 – sin adicional */
  ('2026-07-17','Viernes','ALPINA','GABRIEL PEREZ','SMO183','22078','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   5884192,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 19 – VZD334 – sin adicional */
  ('2026-07-17','Viernes','ALPINA','JULIAN CUELLAR','VZD334','22079','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7788523,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 20 – TMZ674 – sin adicional */
  ('2026-07-17','Viernes','ALPINA','RICARDO LOPEZ','TMZ674','22080','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5483298,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 21 – SPQ814 – sin adicional */
  ('2026-07-17','Viernes','ALPINA','CARLOS VELASCO','SPQ814','22081','9456','SANTA ROSA','CARLOS JIMENEZ',1,
   1,0,'-',
   6480545,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 22 – WHM317 – sin adicional */
  ('2026-07-17','Viernes','ALPINA','HUMBERTO PARRA','WHM317','22082','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7529434,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 23 – PEK019 – sin adicional */
  ('2026-07-17','Viernes','ALPINA','MIGUEL TABARES','PEK019','22083','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   6001245,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 24 – XVI496 – sin adicional */
  ('2026-07-17','Viernes','ALPINA','PABLO RAMIREZ','XVI496','22084','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   7669060,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   63,NULL,'TYM'),

  /* 25 – WLC133 – sin adicional */
  ('2026-07-17','Viernes','ALPINA','JULIAN','WLC133','22085','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, CAMILO SUAREZ GARCIA',2,
   2,0,'-',
   13183969,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   80,NULL,'TYM'),

  /* 26 – TNH494 – con factura AP */
  ('2026-07-17','Viernes','ALPINA','ADALBERTO MEJIA','TNH494','22086','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   7817131,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   56,'AP693176','TYM'),

  /* 27 – WTN748 – sin adicional */
  ('2026-07-17','Viernes','ALPINA','DIEGO RATIVA','WTN748','22098','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   6261897,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 28 – EST067 – sin adicional */
  ('2026-07-17','Viernes','ALPINA','JORGE RIVILLAS','EST067','22099','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5248945,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   40,NULL,'TYM'),

  /* 29 – ERK303 – sin adicional */
  ('2026-07-17','Viernes','ALPINA','JORGE ALARCON','ERK303','22073','7006','APIA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   11140328,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 0,
   63,'AP691785-786-787 19651','TYM'),

  /* 30 – JVM223 – sin adicional */
  ('2026-07-17','Viernes','ALPINA','WILMAR CARDONA','JVM223','22064 22074','7007 9451','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   16785592,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   66,'19652','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 31 – SQB119 – sin adicional */
  ('2026-07-17','Viernes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19621 19648','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   7014993,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   60,NULL,'TYM');

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
WHERE fecha = '2026-07-17'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
