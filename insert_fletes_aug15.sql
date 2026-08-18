/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: SÁBADO 15 AGOSTO 2026
   Generado: 2026-08-15
   ✅ Nombres de población corregidos según tabla precios_fletes
   Nota: MAT480 sale dos veces (Milpas Chinchina + Pereira)
         TNH494 sin valor/pedidos → solo EXTRA $60.000 registrado
         WGZ876 y EYY183 ambos zona 9557 con diferentes rutas
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-15'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 15‑Ago‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – MAT480 (Milpas Chinchina) – VALOR FLETE $550.000 */
  ('2026-08-15','Sábado','ALPINA','ELKIN AGUIRRE','MAT480','22919','7002','CHINCHINA','',0,
   0,0,'MAT480 VALOR DE FLETE $550.000',
   14752400,
   550000,
   1,NULL,'TYM'),

  /* 02 – WFQ635 – con facturas AP (sin T VALOR en planilla) */
  ('2026-08-15','Sábado','ALPINA','JHENCI LOPEZ','WFQ635','','7002','CHINCHINA','JHON FREDY MORENO',1,
   1,0,'-',
   28345863,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   3,'AP717529 AP717740 AP717741 AP717742','TYM'),

  /* 03 – SYU652 – con factura FEP */
  ('2026-08-15','Sábado','ALPINA','JOHAN ECHEVERRY','SYU652','22889 22902','9552 9550','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO, JHONNY LOPEZ',2,
   2,0,'-',
   13178743,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   51,'FEP1192225 20046 20040','TYM'),

  /* 04 – KOL802 – sin adicional */
  ('2026-08-15','Sábado','ALPINA','JUAN','KOL802','22890 22903','9553 7001','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   8464978,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   55,'20041','TYM'),

  /* 05 – WFV015 – sin adicional */
  ('2026-08-15','Sábado','ALPINA','YONNI VALENCIA','WFV015','22904','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   7106143,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   48,'20045 20042','TYM'),

  /* 06 – SPU120 – con facturas FEP */
  ('2026-08-15','Sábado','ALPINA','OSWALDO','SPU120','22881 22905','9555 7000','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   5774411,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   30,'FEP1192211 FEP1192212','TYM'),

  /* 07 – SLI587 – EXTRA $60.000 */
  ('2026-08-15','Sábado','ALPINA','MIGUEL GONZALES','SLI587','22892 22867TSS 22906','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,60000,'SLI587 EXTRA $60.000',
   10388871,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   58,'20044','TYM'),

  /* 08 – WGZ876 – sin adicional (Supia) */
  ('2026-08-15','Sábado','ALPINA','RICARDO PINEDA','WGZ876','22885','9557','SUPIA','ANDRES MATEO VILLALBA DIAZ',1,
   1,0,'-',
   13246681,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 0,
   31,NULL,'TYM'),

  /* 09 – EYY183 – sin adicional (hoy Quinchia zona 9557) */
  ('2026-08-15','Sábado','ALPINA','JOHN ARENAS','EYY183','22907','9557','QUINCHIA','JUAN MANUEL DELGADO NARVAEZ',1,
   1,0,'-',
   12211598,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUINCHIA' LIMIT 1) + 0,
   48,'9920027','TYM'),

  /* 10 – WEP384 – EXTRA $60.000 */
  ('2026-08-15','Sábado','ALPINA','YOFER','WEP384','22893 22877TSS 22909','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'WEP384 EXTRA $60.000',
   7510053,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 60000,
   94,'20047','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 11 – EQN953 – VALOR FLETE $500.000 */
  ('2026-08-15','Sábado','ALPINA','ORLANDO VASQUEZ','EQN953','22891 22883 22882 22843','7008 7009 7010','ARMENIA','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'EQN953 VALOR DE FLETE $500.000',
   12094640,
   500000,
   3,NULL,'TYM'),

  /* 12 – ETM037 – sin adicional */
  ('2026-08-15','Sábado','ALPINA','OSCAR MARIN','ETM037','22910','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   5604955,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 13 – WFR160 – EXTRA $60.000 */
  ('2026-08-15','Sábado','ALPINA','LEANDRO LOPEZ','WFR160','22884','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,60000,'WFR160 EXTRA $60.000',
   5863807,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 60000,
   50,NULL,'TYM'),

  /* 14 – EQY944 – sin adicional */
  ('2026-08-15','Sábado','ALPINA','GOBER CRISTANCHO','EQY944','22911','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, SAMUEL ARIAS',2,
   2,0,'-',
   8904875,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 15 – WTN748 – EXTRA $60.000 (hoy zona 9604 Quimbaya) */
  ('2026-08-15','Sábado','ALPINA','DIEGO RATIVA','WTN748','22912','9604','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS',1,
   1,60000,'WTN748 EXTRA $60.000',
   3936325,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 60000,
   37,'20049 20048','TYM'),

  /* 16 – WLS478 – sin adicional */
  ('2026-08-15','Sábado','ALPINA','HUMBERTO RINCON','WLS478','22913','9605','GENOVA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   5964646,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GENOVA' LIMIT 1) + 0,
   33,NULL,'TYM'),

  /* 17 – TDY481 – sin adicional (Caimo Barcelona) */
  ('2026-08-15','Sábado','ALPINA','SANDRO ZULUAGA','TDY481','22870TSS 22914','9606','CAIMO BARCELONA','DANIELA CASTIBLANCO, VALENTINA GARCIA',2,
   2,0,'-',
   6388347,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAIMO BARCELONA' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 18 – MAT480 (Pereira) – sin adicional */
  ('2026-08-15','Sábado','ALPINA','ELKIN AGUIRRE','MAT480','22894','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   10533773,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 19 – EST590 – sin adicional (placa nueva) */
  ('2026-08-15','Sábado','ALPINA','FREDY GALLEGO','EST590','22895','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   4859815,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   29,NULL,'TYM'),

  /* 20 – SPQ814 – sin adicional */
  ('2026-08-15','Sábado','ALPINA','CARLOS VELASCO','SPQ814','22896','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   7068221,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional */
  ('2026-08-15','Sábado','ALPINA','MIGUEL TABARES','PEK019','22898','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   5871992,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 22 – LUM993 – sin adicional */
  ('2026-08-15','Sábado','ALPINA','PABLO RAMIREZ','LUM993','22899','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   11047711,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 23 – WLC133 – sin adicional */
  ('2026-08-15','Sábado','ALPINA','JULIAN','WLC133','22900','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, CARLOS JIMENEZ',2,
   2,0,'-',
   11321201,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   63,NULL,'TYM'),

  /* 24 – VZD334 – EXTRA $60.000 (hoy zona 9461 Cartago) */
  ('2026-08-15','Sábado','ALPINA','JULIAN CUELLAR','VZD334','22901','9461','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,60000,'VZD334 EXTRA $60.000',
   7260962,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 60000,
   50,NULL,'TYM'),

  /* 25 – TNH494 – EXTRA $60.000 (sin pedidos ni valor en esta planilla) */
  ('2026-08-15','Sábado','ALPINA','ADALBERTO MEJIA','TNH494','22862TSS','9461','CARTAGO 2T','ANDRES FELIPE RIOS CAICEDO',1,
   1,60000,'TNH494 EXTRA $60.000',
   0,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 60000,
   0,NULL,'TYM'),

  /* 26 – SXF257 – EXTRA $60.000 (hoy zona 7004 Pereira) */
  ('2026-08-15','Sábado','ALPINA','FABIO RUIZ','SXF257','22916','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,60000,'SXF257 EXTRA $60.000',
   11526285,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   59,'20039','TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 27 – EST067 – sin adicional */
  ('2026-08-15','Sábado','ALPINA','JORGE RIVILLAS','EST067','22917','7005','EL AGUILA','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   4938644,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='EL AGUILA' LIMIT 1) + 0,
   19,NULL,'TYM'),

  /* 28 – ERK303 – sin adicional */
  ('2026-08-15','Sábado','ALPINA','JORGE ALARCON','ERK303','22918','7006','PUEBLO RICO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   7796231,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PUEBLO RICO' LIMIT 1) + 0,
   34,'20050','TYM'),

  /* 29 – JVM223 – sin adicional */
  ('2026-08-15','Sábado','ALPINA','WILMAR CARDONA','JVM223','22880 22886','7007 9451','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   18020110,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   63,'9920036 9920035','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 30 – SQB119 – sin adicional */
  ('2026-08-15','Sábado','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20054 20037','FLEISCHMANN','SANTA ROSA','DIEGO FRANCO',1,
   1,0,'-',
   4458916,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   47,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-08-15'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
