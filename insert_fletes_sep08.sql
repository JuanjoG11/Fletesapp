/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 8 SEPTIEMBRE 2026
   Generado: 2026-09-08
   Notas:
     - WFV015  EXTRA $60.000
     - WEP384  EXTRA $60.000
     - EYX091  EXTRA $60.000
     - ETM037  ADICIONAL AL FLETE $100.000
     - TMZ674  EXTRA $60.000
     - PEK019  EXTRA $80.000
     - WTN748  EXTRA $60.000
     - ERK303  ADICIONAL AL FLETE $100.000 ENTREGA SUPER
     - JVM223  ADICIONAL AL FLETE $200.000 ENTREGA PEDIDOS EXTRARUTA
     - BCS450  conductor CRIATIAN ZULUAGA
     - JHONNY LOPEZ        → auxiliar de SPU120
     - SAMUEL ARIAS        → auxiliar de LUM993
     - JHON FREDY MORENO   → auxiliar de SXF257
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-09-08'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 08‑Sep‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ─────────────────────────────── */

  /* 01 – SYU652 – sin adicional */
  ('2026-09-08','Martes','ALPINA','JOHAN ECHEVERRY','SYU652','23610 FEP1194066','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   7722127,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   63,NULL,'TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-09-08','Martes','ALPINA','FREDY GALLEGO','KOL802','23589 23611 20339','9553 7000 UNOAC','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,0,'-',
   10036369,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   50,'AP738576TSS AP739445TSS','TYM'),

  /* 03 – WFV015 – EXTRA $60.000 */
  ('2026-09-08','Martes','ALPINA','YONNI VALENCIA','WFV015','23612 FEP1194061-062-063','9554','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,60000,'EXTRA $60.000',
   9720724,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   57,NULL,'TYM'),

  /* 04 – SPU120 – sin adicional */
  ('2026-09-08','Martes','ALPINA','OSWALDO','SPU120','23613 20342','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN, JHONNY LOPEZ',2,
   1,0,'-',
   6739464,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-09-08','Martes','ALPINA','MIGUEL GONZALES','SLI587','23587 23593 FEP1194064-065 FEP1194059','9556 9550 UNOAG','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   10779415,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-09-08','Martes','ALPINA','RICARDO PINEDA','WGZ876','23594 20340','9557','SUPIA','JUAN MANUEL DELGADO NARVAEZ',1,
   1,0,'-',
   8921525,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 0,
   44,'FEP1193944TSS','TYM'),

  /* 07 – WEP384 – EXTRA $60.000 */
  ('2026-09-08','Martes','ALPINA','YOFER LOPEZ','WEP384','23596 23590 20338','9559 7002','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'EXTRA $60.000',
   9871354,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 60000,
   60,NULL,'TYM'),

  /* 08 – EYX091 – EXTRA $60.000 */
  /* Nota: programación dice "SUPIA RIOSUCIO SUPER" → precio tabla RIOSUCIO-SUPIA SUPERMERCADO */
  ('2026-09-08','Martes','ALPINA','ANDRES GOMEZ','EYX091','23588 23592','9560','RIOSUCIO-SUPIA SUPERMERCADO','ANDRES MATEO VILLALBA DIAZ',1,
   1,60000,'EXTRA $60.000',
   13547631,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 60000,
   11,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ──────────────────────────────────── */

  /* 09 – ETM037 – ADICIONAL AL FLETE $100.000 */
  ('2026-09-08','Martes','ALPINA','OSCAR MARIN','ETM037','23614','9601 LECHEPENDIENTEPATRIA','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,100000,'ADICIONAL AL FLETE $100.000',
   5820129,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 100000,
   50,NULL,'TYM'),

  /* 10 – TJX795 – sin adicional */
  ('2026-09-08','Martes','ALPINA','ANDRES QUINTERO','TJX795','23570TSS 23615','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'-',
   7871664,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   74,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional */
  ('2026-09-08','Martes','ALPINA','GOBER CRISTANCHO','EQY944','23616 20333 20336','9603','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   7368199,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   61,NULL,'TYM'),

  /* 12 – SXF257 – sin adicional */
  /* Nota: programación dice "MONTENEGRO PTAPAO" → precio tabla MONTENEGRO */
  ('2026-09-08','Martes','ALPINA','FABIO RUIZ','SXF257','23617 20332','9604 MERCAMOS/MERCAHOGAR','MONTENEGRO PTAPAO','CAMILO ANDRES CONTRERAS RIVAS, JHON FREDY MORENO',2,
   1,0,'-',
   9408120,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO' LIMIT 1) + 0,
   49,'AP740376-377','TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-09-08','Martes','ALPINA','HUMBERTO RINCON','WLS478','23597 20331','9605','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   6621067,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 14 – WHM896 – sin adicional */
  ('2026-09-08','Martes','ALPINA','ALEXANDER CUELLAR','WHM896','23598','9606','CIRCASIA','CESAR AUGUSTO CASTILLO LONDOÑO',1,
   1,0,'-',
   4393122,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
   36,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ─────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-09-08','Martes','ALPINA','GABRIEL PEREZ','SMO183','23601','9453','PEREIRA','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6267250,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   42,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional */
  ('2026-09-08','Martes','ALPINA','JULIAN CUELLAR','VZD334','23602','9454','PEREIRA','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   8607559,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 17 – TMZ674 – EXTRA $60.000 */
  ('2026-09-08','Martes','ALPINA','RICARDO LOPEZ','TMZ674','23603','9455','PEREIRA','ANDRES FELIPE RIOS CAICEDO',1,
   1,60000,'EXTRA $60.000',
   7737192,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 60000,
   70,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-09-08','Martes','ALPINA','CARLOS VELASCO','SPQ814','23604','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6531315,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 19 – BCS450 – sin adicional */
  ('2026-09-08','Martes','ALPINA','CRIATIAN ZULUAGA','BCS450','23605','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   9848952,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 20 – PEK019 – EXTRA $80.000 */
  ('2026-09-08','Martes','ALPINA','MIGUEL TABARES','PEK019','23606','9458','PEREIRA','JHON WILSON GIRALDO CARVAJAL',1,
   1,80000,'EXTRA $80.000',
   8257853,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 80000,
   53,NULL,'TYM'),

  /* 21 – LUM993 – sin adicional */
  ('2026-09-08','Martes','ALPINA','PABLO RAMIREZ','LUM993','23607','9459','PEREIRA','QUEBIN LOTERO, SAMUEL ARIAS',2,
   1,0,'-',
   9390619,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   67,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-09-08','Martes','ALPINA','GABRIEL PEREZ','WLC133','23608','9460','PEREIRA','SANTIAGO HENAO MORALES',1,
   1,0,'-',
   14590070,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   64,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-09-08','Martes','ALPINA','ADALBERTO MEJIA','TNH494','23609','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   5300123,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 24 – WTN748 – EXTRA $60.000 */
  ('2026-09-08','Martes','ALPINA','DIEGO RATIVA','WTN748','23618','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,60000,'EXTRA $60.000',
   7503593,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   49,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ──────────────────────────────── */

  /* 25 – WFQ635 – sin adicional */
  ('2026-09-08','Martes','ALPINA','JENCY LOPEZ','WFQ635','23619','7005','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   10709507,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARGELIA EL CAIRO' LIMIT 1) + 0,
   36,NULL,'TYM'),

  /* 26 – ERK303 – ADICIONAL AL FLETE $100.000 ENTREGA SUPER */
  ('2026-09-08','Martes','ALPINA','JORGE ALARCON','ERK303','23585 23599 20330','7006 9450','SANTUARIO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   1,100000,'ADICIONAL AL FLETE $100.000 ENTREGA SUPER',
   13614732,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1) + 100000,
   49,NULL,'TYM'),

  /* 27 – JVM223 – ADICIONAL AL FLETE $200.000 ENTREGA PEDIDOS EXTRARUTA */
  ('2026-09-08','Martes','ALPINA','WILMAR CARDONA','JVM223','23600 23586','7007 9451','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   1,200000,'ADICIONAL AL FLETE $200.000 ENTREGA PEDIDOS EXTRARUTA',
   11333520,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 200000,
   59,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-09-08','Martes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20335','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   5570622,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   42,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-09-08'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
