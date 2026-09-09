/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: SÁBADO 5 SEPTIEMBRE 2026
   Generado: 2026-09-05
   Notas:
     - EYX091  VALOR DE FLETE $450.000 (precio fijo)
     - WFV015  ADICIONAL AL FLETE $200.000
     - MAT480  VALOR DE FLETE $700.000 INCLUYE DESCARGUE (precio fijo)
     - EQN953  VALOR DE FLETE $400.000 (precio fijo)
     - SXF257  ADICIONAL AL FLETE $120.000
     - EQY944  EXTRA $60.000
     - JHONNY LOPEZ         → JHONNY LOPEZ (auxiliar)
     - SAMUEL ARIAS         → SAMUEL ARIAS (auxiliar)
     - VALENTINA GARCIA     → VALENTINA GARCIA (auxiliar)
     - MANUEL RAMIREZ       → MANUEL RAMIREZ (auxiliar)
     - DIEGO FRANCO         → DIEGO FRANCO (auxiliar)
     - SQB119 FLEISCHMANN S/ROSA-D/BRADAS → precio tabla 'SANTA ROSA'
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-09-05'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 05‑Sep‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ─────────────────────────────── */

  /* 01 – EYX091 – VALOR DE FLETE $450.000 (precio fijo) */
  ('2026-09-05','Sabado','ALPINA','ANDRES GOMEZ','EYX091','23544 23574','7001 PALERMO','MANIZALES VILLAMARIA','ANDRES FELIPE RIOS CAICEDO',1,
   0,0,'VALOR DE FLETE $450.000',
   16134601,
   450000,
   3,'AP739378','TYM'),

  /* 02 – SYU652 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','JOHAN ECHEVERRY','SYU652','23565 20321 20326','9552 DELCENTRO','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO, JHONNY LOPEZ',2,
   1,0,'-',
   20310759,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   49,'AP739394','TYM'),

  /* 03 – KOL802 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','FREDY GALLEGO','KOL802','23528TSS 23566 20322','9553 PUNTOMERCO','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,0,'-',
   10885871,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   57,'AP737729','TYM'),

  /* 04 – WFV015 – ADICIONAL AL FLETE $200.000 */
  ('2026-09-05','Sabado','ALPINA','YONNI VALENCIA','WFV015','23529TSS 23567 20323 20327','9554 MERCAPLAZA','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,200000,'ADICIONAL AL FLETE $200.000',
   13974422,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 200000,
   60,'FEP1193935 AP739061','TYM'),

  /* 05 – SPU120 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','OSWALDO','SPU120','23568 20324','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   8014684,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','RICARDO PINEDA','WGZ876','23506TSS 23547 20325','9556 RECREACION','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   10914234,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   50,'AP739396','TYM'),

  /* 07 – WFQ635 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','JHENCI LOPEZ','WFQ635','23548 23554 20303','9557 9559','QUINCHIA','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   1,0,'-',
   14509339,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUINCHIA' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 08 – WEP384 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','YOFER LOPEZ','WEP384','23552 23550','9559 7002 MILPAS/GAMERO','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,0,'-',
   8153219,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
   84,'AP739397-398','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ──────────────────────────────────── */

  /* 09 – MAT480 – VALOR DE FLETE $700.000 INCLUYE DESCARGUE (precio fijo) */
  ('2026-09-05','Sabado','ALPINA','ELKIN AGUIRRE','MAT480','23391 23386','7009 7010 N LA50/PATRIA','ARMENIA SUPER','JHON FREDY MORENO',1,
   0,0,'VALOR DE FLETE $700.000 INCLUYE DESCARGUE',
   16780800,
   700000,
   2,NULL,'TYM'),

  /* 10 – ETM037 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','OSCAR MARIN','ETM037','23569','9601 LAPATRIA','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   7514675,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   56,'AP739395','TYM'),

  /* 11 – TJX795 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','ANDRES QUINTERO','TJX795','23540 23570 20315 20313','9602 7008 RINDEMAX','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   1,0,'-',
   15937523,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* 12 – EQN953 – VALOR DE FLETE $400.000 (precio fijo) */
  ('2026-09-05','Sabado','ALPINA','ORLANDO VASQUEZ','EQN953','23571 23551','9603 HOREB','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, SAMUEL ARIAS',2,
   1,0,'VALOR DE FLETE $400.000',
   12089110,
   400000,
   59,'AP739064','TYM'),

  /* 13 – SXF257 – ADICIONAL AL FLETE $120.000 */
  ('2026-09-05','Sabado','ALPINA','FABIO RUIZ','SXF257','23461 23392 23572 20317','9604 7010','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS, VALENTINA GARCIA',2,
   1,120000,'ADICIONAL AL FLETE $120.000',
   8642650,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 120000,
   45,NULL,'TYM'),

  /* 14 – WLS478 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','HUMBERTO RINCON','WLS478','23542','9605','GENOVA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   5537979,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GENOVA' LIMIT 1) + 0,
   34,NULL,'TYM'),

  /* 15 – EQY944 – EXTRA $60.000 */
  ('2026-09-05','Sabado','ALPINA','GOBER CRISTANCHO','EQY944','23543','9606','CAIMO BARCELONA',NULL,0,
   1,60000,'EXTRA $60.000',
   7586698,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAIMO BARCELONA' LIMIT 1) + 60000,
   48,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ─────────────────────────────── */

  /* 16 – SMO183 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','GABRIEL PEREZ','SMO183','23557','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   7837844,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 17 – VZD334 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','JULIAN CUELLAR','VZD334','23558','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7496229,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   42,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','CARLOS VELASCO','SPQ814','23559','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5870414,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 19 – WHM896 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','ALEXANDER CUELLAR','WHM896','23560','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   8070573,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','MIGUEL TABARES','PEK019','23561','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   6211694,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 21 – LUM993 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','PABLO RAMIREZ','LUM993','23562','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
   1,0,'-',
   9380160,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','GABRIEL PEREZ','WLC133','23563','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES',1,
   1,0,'-',
   7479460,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','ADALBERTO MEJIA','TNH494','23564','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   6845190,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 24 – WTN748 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','DIEGO RATIVA','WTN748','23573 20312','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   8874312,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ──────────────────────────────── */

  /* 25 – EST067 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','JORGE RIVILLAS','EST067','23553','7005','EL AGUILA VILLA NUEVA','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   10486077,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='EL AGUILA VILLA NUEVA' LIMIT 1) + 0,
   30,NULL,'TYM'),

  /* 26 – JVM223 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','WILMAR CARDONA','JVM223','23545 20318','7006','SANTA CECILIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   1,0,'-',
   13665063,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA CECILIA' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 27 – WRF160 – sin adicional */
  ('2026-09-05','Sabado','ALPINA','LEANDRO','WRF160','23498TSS 23546 20319','7007','GUATICA ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   1,0,'-',
   13049130,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GUATICA ANSERMA' LIMIT 1) + 0,
   61,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  /* Nota: programación dice "FLEISCHMANN S/ROSA-D/BRADAS" → precio tabla SANTA ROSA */
  ('2026-09-05','Sabado','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20320','FLEISCHMANN','SANTA ROSA','DIEGO FRANCO',1,
   1,0,'-',
   4095918,
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
WHERE fecha = '2026-09-05'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
