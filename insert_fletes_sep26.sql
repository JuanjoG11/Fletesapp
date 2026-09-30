/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: SÁBADO 26 SEPTIEMBRE 2026
   Generado: 2026-09-26
   Notas:
     - WFQ635  ADICIONAL AL FLETE $200.000
     - WFV015  ADICIONAL AL FLETE $150.000 (sin auxiliar)
     - EQN953  VALOR DE FLETE $440.000
     - WLC133  ADICIONAL AL FLETE $26.000
     - SQB119  FLEISCHMANN S/ROSA-D/BRADAS → precio tabla SANTA ROSA
     - precio usa COALESCE para poblaciones no registradas en tabla
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-09-26'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 26‑Sep‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ─────────────────────────────── */

  /* 01 – WGZ876 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','24174','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   6762930,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6762930) + 0,
   52,'FEP1195789 FEP1195776-783-782-781-787-779-775-794','TYM'),

  /* 02 – WFR160 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24175 20575','9553','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,0,'-',
   6588621,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6588621) + 0,
   57,NULL,'TYM'),

  /* 03 – SYU652 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24176 20576','9554','MANIZALES VILLAMARIA','DUVIER GALVIZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   1,0,'-',
   8816709,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 8816709) + 0,
   52,NULL,'TYM'),

  /* 04 – SPU120 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24152TSS 24177 20579','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6935750,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6935750) + 0,
   51,'FEP1195796-803 FEP1195806','TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SLI587' AND razon_social='TYM'),
   'SLI587','24178 20578 20561TSS','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   1,0,'-',
   9278668,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 9278668) + 0,
   48,'FEP1195800 FEP1195793','TYM'),

  /* 06 – WFQ635 – ADICIONAL AL FLETE $200.000 */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFQ635' AND razon_social='TYM'),
   'WFQ635','24142TSS 24187 24179 20546 20560','9557 9559','QUINCHIA','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   1,200000,'ADICIONAL AL FLETE $200.000',
   13627272,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUINCHIA' LIMIT 1), 13627272) + 200000,
   54,NULL,'TYM'),

  /* 07 – WEP384 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24181 24186','9559 E7000','CHINCHINA','BRANDON STEVEN GIL BAEZ, SAMUEL ARIAS',2,
   1,0,'-',
   6948848,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1), 6948848) + 0,
   78,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ──────────────────────────────────── */

  /* 08 – WFV015 – ADICIONAL AL FLETE $150.000 (sin auxiliar) */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFV015' AND razon_social='TYM'),
   'WFV015','24172 24173','7008 7010','ARMENIA',NULL,0,
   1,150000,'ADICIONAL AL FLETE $150.000',
   6539052,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 6539052) + 150000,
   3,NULL,'TYM'),

  /* 09 – TTL256 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TTL256' AND razon_social='TYM'),
   'TTL256','24198','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   5019875,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 5019875) + 0,
   57,NULL,'TYM'),

  /* 10 – TJX795 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TJX795' AND razon_social='TYM'),
   'TJX795','24199','9602','ARMENIA','YERFREY FLOWER, CRISTIAN GIRALDO',2,
   1,0,'-',
   6577002,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 6577002) + 0,
   59,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24200','9603','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, JORGE RIVILLAS',2,
   1,0,'-',
   8892076,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 8892076) + 0,
   57,NULL,'TYM'),

  /* 12 – SXF257 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24201 20569','9604','QUIMBAYA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   3173895,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1), 3173895) + 0,
   40,NULL,'TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24182','9605','GENOVA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   4450370,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GENOVA' LIMIT 1), 4450370) + 0,
   32,NULL,'TYM'),

  /* 14 – EQN953 – VALOR DE FLETE $440.000 */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQN953' AND razon_social='TYM'),
   'EQN953','24183','9606','CAIMO BARCELONA','JHON WILSON GIRALDO CARVAJAL, APOYO VENDEDOR',2,
   1,440000,'VALOR DE FLETE $440.000',
   6845673,
   440000,
   52,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ─────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24189','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6674962,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6674962) + 0,
   50,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24190','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   8020492,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8020492) + 0,
   47,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TMZ674' AND razon_social='TYM'),
   'TMZ674','24191','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   4022271,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 4022271) + 0,
   51,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24192','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6368095,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 6368095) + 0,
   62,NULL,'TYM'),

  /* 19 – WHM896 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24193','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   6854998,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6854998) + 0,
   56,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24194','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,0,'-',
   5514873,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5514873) + 0,
   50,NULL,'TYM'),

  /* 21 – LUM993 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='LUM993' AND razon_social='TYM'),
   'LUM993','24195','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO, MARLON MURILLO',2,
   1,0,'-',
   7486193,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7486193) + 0,
   59,NULL,'TYM'),

  /* 22 – WLC133 – ADICIONAL AL FLETE $26.000 */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24196','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, JUAN RICO',2,
   1,26000,'ADICIONAL AL FLETE $26.000',
   6131209,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6131209) + 26000,
   52,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','24197','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   7793184,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 7793184) + 0,
   51,NULL,'TYM'),

  /* 24 – MAT480 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='MAT480' AND razon_social='TYM'),
   'MAT480','24202','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, JHON FREDY MORENO',2,
   1,0,'-',
   8452106,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8452106) + 0,
   61,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ──────────────────────────────── */

  /* 25 – WTN748 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','24203','7005','EL AGUILA','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   6520855,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='EL AGUILA' LIMIT 1), 6520855) + 0,
   22,NULL,'TYM'),

  /* 26 – ERK303 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','24184 20570','7006','PUEBLO RICO','ELKIN GARCIA OCAMPO',1,
   1,0,'-',
   9489714,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PUEBLO RICO' LIMIT 1), 9489714) + 0,
   36,NULL,'TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-09-26','Sábado','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24185 20571','7007','GUATICA ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   1,0,'-',
   12858801,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GUATICA ANSERMA' LIMIT 1), 12858801) + 0,
   62,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional (S/ROSA-D/BRADAS → precio tabla SANTA ROSA) */
  ('2026-09-26','Sábado','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','20572','FLEISCHMANN','SANTA ROSA','DIEGO FRANCO',1,
   1,0,'-',
   6266859,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 6266859) + 0,
   58,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, contratista AS conductor_bd, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-09-26'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
