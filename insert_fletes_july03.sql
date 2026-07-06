/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 3 JULIO 2026
   Generado: 2026-07-03
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-07-03'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 03‑Jul‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – EQN953 – VALOR DE FLETE $500.000 */
  ('2026-07-03','Viernes','ALPINA','ORLANDO VASQUEZ','EQN953','21565','7002','CHINCHINA','JHON FREDY MORENO, ELKIN GARCIA OCAMPO',2,
   2,500000,'EQN953 VALOR DE FLETE $500.000',
   14972665,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 500000,
   1,NULL,'TYM'),

  /* 02 – TRL186 – VALOR DE FLETE $380.000 */
  ('2026-07-03','Viernes','ALPINA','WILLIAM','TRL186','21686','7002','CHINCHINA','JHON FREDY MORENO, ELKIN GARCIA OCAMPO',2,
   2,380000,'TRL186 VALOR DE FLETE $380.000',
   13811375,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 380000,
   7,NULL,'TYM'),

  /* 03 – SYU652 – con factura AP */
  ('2026-07-03','Viernes','ALPINA','JOHAN ECHEVERRY','SYU652','21705','9552','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   6480229,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   48,'AP677960 19460','TYM'),

  /* 04 – KOL802 – con factura FEP */
  ('2026-07-03','Viernes','ALPINA','CAMILO CASTAÑO','KOL802','21706','9553','MANIZALES VILLAMARIA','ANDRES MATEO VILLALBA DIAZ',1,
   1,0,'-',
   4833481,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   48,'FEP1188593 19461','TYM'),

  /* 05 – WFV015 – con factura AP */
  ('2026-07-03','Viernes','ALPINA','YONNI VALENCIA','WFV015','21707','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   7158595,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   38,'AP677974','TYM'),

  /* 06 – EYY183 – sin adicional */
  ('2026-07-03','Viernes','ALPINA','JOHN ARENAS','EYY183','21708','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6113659,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 07 – SLI587 – sin adicional */
  ('2026-07-03','Viernes','ALPINA','MIGUEL GONZALES','SLI587','21709','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   6051473,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   49,'19463 19459','TYM'),

  /* 08 – WGZ876 – EXTRA $60.000 */
  ('2026-07-03','Viernes','ALPINA','RICARDO PINEDA','WGZ876','21710 21683','9557 9560','SUPIA','JUAN MANUEL DELGADO NARVAEZ',1,
   1,60000,'WGZ876 EXTRA $60.000',
   15218411,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 60000,
   37,NULL,'TYM'),

  /* 09 – EYX091 – sin adicional */
  ('2026-07-03','Viernes','ALPINA','ANDRES GOMEZ','EYX091','21690 21691','9558','PACORA SALAMINA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   9905470,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1) + 0,
   69,'19447','TYM'),

  /* 10 – SMH182 – EXTRA $60.000 */
  ('2026-07-03','Viernes','ALPINA','JUAN DAVID','SMH182','21711','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'SMH182 EXTRA $60.000',
   9497634,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 60000,
   70,'19465','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 11 – SPU120 – ADICIONAL $30.000 con factura AP */
  ('2026-07-03','Viernes','ALPINA','OSWALDO','SPU120','21712','9601','ARMENIA','YEISON DAVID RENDON SOTO, CAMILO SUAREZ GARCIA',2,
   2,30000,'SPU120 ADICIONAL $30.000',
   8027043,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 30000,
   67,'AP677966','TYM'),

  /* 12 – VZD334 – con facturas AP */
  ('2026-07-03','Viernes','ALPINA','JULIAN CUELLAR','VZD334','21713','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'-',
   7712712,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   51,'AP676642 AP677977','TYM'),

  /* 13 – EQY944 – sin adicional */
  ('2026-07-03','Viernes','ALPINA','GOBER CRISTANCHO','EQY944','21714','9603','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   3433011,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   50,'19467','TYM'),

  /* 14 – SXF257 – sin adicional */
  ('2026-07-03','Viernes','ALPINA','FABIO RUIZ','SXF257','21715','9604','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   8810031,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   67,'19450 19466','TYM'),

  /* 15 – WLS478 – con factura AP */
  ('2026-07-03','Viernes','ALPINA','HUMBERTO RINCON','WLS478','21688 21694','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, SEBASTIAN MONTES',2,
   2,0,'-',
   10296972,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   48,'AP676643','TYM'),

  /* 16 – TTL256 – sin adicional */
  ('2026-07-03','Viernes','ALPINA','YIMERSON GARCIA','TTL256','21695 21684','9606 9600','CIRCASIA','CRISTIAN FABIAN CAMACHO MARTINEZ',1,
   1,0,'-',
   6580809,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   44,'19468','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 17 – SMO183 – sin adicional */
  ('2026-07-03','Viernes','ALPINA','GABRIEL PEREZ','SMO183','21696','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   5443933,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 18 – TUL630 – EXTRA $60.000 ENTREGA TSS */
  ('2026-07-03','Viernes','ALPINA','JUAN DAVID','TUL630','21697','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,60000,'TUL630 EXTRA $60.000 ENTREGA DE TSS',
   5692888,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   41,NULL,'TYM'),

  /* 19 – TMZ674 – EXTRA $60.000 */
  ('2026-07-03','Viernes','ALPINA','RICARDO LOPEZ','TMZ674','21698','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,60000,'TMZ674 EXTRA $60.000',
   6727474,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   61,NULL,'TYM'),

  /* 20 – SPQ814 – sin adicional */
  ('2026-07-03','Viernes','ALPINA','CARLOS VELASCO','SPQ814','21699','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   4819816,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   46,'19458','TYM'),

  /* 21 – WHM317 – sin adicional */
  ('2026-07-03','Viernes','ALPINA','HUMBERTO PARRA','WHM317','21700','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   6677231,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 22 – PEK019 – sin adicional */
  ('2026-07-03','Viernes','ALPINA','MIGUEL TABARES','PEK019','21701','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   6506946,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 23 – WHM896 – sin adicional */
  ('2026-07-03','Viernes','ALPINA','ALEXANDER CUELLAR','WHM896','21702','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'-',
   7459517,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 24 – WLC133 – sin adicional */
  ('2026-07-03','Viernes','ALPINA','JULIAN','WLC133','21703','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, ANDRES CAMILO MUÑOZ CAICEDO',2,
   2,0,'-',
   9655165,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   68,NULL,'TYM'),

  /* 25 – TNH494 – sin adicional */
  ('2026-07-03','Viernes','ALPINA','ADALBERTO MEJIA','TNH494','21704','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   5906612,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 26 – WTN748 – EXTRA $60.000 */
  ('2026-07-03','Viernes','ALPINA','DIEGO RATIVA','WTN748','21716','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,60000,'WTN748 EXTRA $60.000',
   6745993,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   55,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 27 – EST067 – con factura AP */
  ('2026-07-03','Viernes','ALPINA','JORGE RIVILLAS','EST067','21717','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   7167684,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   47,'AP677949','TYM'),

  /* 28 – ERK303 – con facturas AP */
  ('2026-07-03','Viernes','ALPINA','JORGE ALARCON','ERK303','21692','7006','APIA VIRGINIA','ROVINSON TORRES RIVERA',1,
   1,0,'-',
   6709886,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA VIRGINIA' LIMIT 1) + 0,
   66,'AP677950 AP677968 19469','TYM'),

  /* 29 – JVM223 – sin adicional */
  ('2026-07-03','Viernes','ALPINA','WILMAR CARDONA','JVM223','21682 21693','7007 9451','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   14671286,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
   60,'19470','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 30 – SQB119 – sin adicional */
  ('2026-07-03','Viernes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19457 19471','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   4549492,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   49,NULL,'TYM');

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
WHERE fecha = '2026-07-03'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
