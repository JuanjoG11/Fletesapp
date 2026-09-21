/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 10 SEPTIEMBRE 2026
   Generado: 2026-09-10
   Notas:
     - SYU652  EXTRA $60.000
     - SPU120  $50.000 MIL EXTRAS POR SUPER DE OTRA ZONA
     - WEP384  EXTRA $60.000
     - WFV015  EXTRA $80.000
     - WFQ635  ADICIONAL AL FLETE $200.000
     - MAT480  VALOR DE FLETE $350.000
     - JHONNY LOPEZ        → auxiliar de SPU120
     - SAMUEL ARIAS        → auxiliar de VZD334
     - AUX NUEVO           → auxiliar de ETM037 / WFQ635
     - VALENTINA GARCIA    → auxiliar de SXF257
     - JHON FREDY MORENO   → auxiliar de WLS478
     - MANUEL RAMIREZ      → auxiliar de JVM223
     - JUAN JOSE CONTRERAS HERNANDEZ → auxiliar de MAT480
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-09-10'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 10‑Sep‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ─────────────────────────────── */

  /* 01 – SYU652 – EXTRA $60.000 */
  ('2026-09-10','Jueves','ALPINA','JOHAN ECHEVERRY','SYU652','23683','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,60000,'EXTRA $60.000',
   6884956,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   45,NULL,'TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','FREDY GALLEGO','KOL802','23684 20380','9553','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,0,'-',
   4933940,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   41,NULL,'TYM'),

  /* 03 – EYX091 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','ANDRES GOMEZ','EYX091','23670 20377','9554','NEIRA','JUAN CAMILO COCOMA OROZCO, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   1,0,'-',
   10297337,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1) + 0,
   62,NULL,'TYM'),

  /* 04 – SPU120 – $50.000 MIL EXTRAS POR SUPER DE OTRA ZONA */
  ('2026-09-10','Jueves','ALPINA','OSWALDO','SPU120','23679 23685 20378','9555 9550 UNOAG','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN, JHONNY LOPEZ',2,
   1,50000,'50.000 MIL EXTRAS POR SUPER DE OTRA ZONA',
   10159628,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 50000,
   56,NULL,'TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','MIGUEL GONZALES','SLI587','23681 23671 20379 20372','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   6647816,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 06 – WGZ876 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','RICARDO PINEDA','WGZ876','23672 20349','9557','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   1,0,'-',
   14295202,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 07 – WEP384 – EXTRA $60.000 */
  ('2026-09-10','Jueves','ALPINA','YOFER LOPEZ','WEP384','23674 20376','9559','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'EXTRA $60.000',
   12352542,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RDA S JOSE BELALCAZAR' LIMIT 1) + 60000,
   55,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ──────────────────────────────────── */

  /* 08 – WFV015 – EXTRA $80.000 */
  ('2026-09-10','Jueves','ALPINA','YONNI VALENCIA','WFV015','23668','7008','CALARCA',NULL,0,
   1,80000,'EXTRA $80.000',
   12939114,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 80000,
   3,NULL,'TYM'),

  /* 09 – ETM037 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','OSCAR MARIN','ETM037','23697','9601','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   9740253,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   60,NULL,'TYM'),

  /* 10 – TJX795 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','ANDRES QUINTERO','TJX795','23698 20368','9602','ARMENIA','SEBASTIAN VILLADA VELASQUEZ',1,
   1,0,'-',
   7386471,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   65,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','GOBER CRISTANCHO','EQY944','23699','9603 ANDY','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   7890203,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   62,'AP741796','TYM'),

  /* 12 – SXF257 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','FABIO RUIZ','SXF257','23700 20370','9604','ALCALA ULLOA','CAMILO ANDRES CONTRERAS RIVAS, VALENTINA GARCIA',2,
   1,0,'-',
   9879746,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','HUMBERTO RINCON','WLS478','23675 20369','9605','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, JHON FREDY MORENO',2,
   1,0,'-',
   11801510,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 14 – WFQ635 – ADICIONAL AL FLETE $200.000 */
  ('2026-09-10','Jueves','ALPINA','JENCY LOPEZ','WFQ635','23667 23676 23634TSS 20354','9606 9600 LA 7','FILANDIA','DANIELA CASTIBLANCO',1,
   1,200000,'ADICIONAL AL FLETE $200.000',
   12740261,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1) + 200000,
   40,'FEP1194173TSS','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ─────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','GABRIEL PEREZ','SMO183','23688','9453','PEREIRA','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   5468499,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   42,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','JULIAN CUELLAR','VZD334','23689','9454','PEREIRA','CARLOS ANDRES PINEDA CANO, SAMUEL ARIAS',2,
   1,0,'-',
   10810328,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   69,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','RICARDO LOPEZ','TMZ674','23690','9455','PEREIRA','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5918883,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   50,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','CARLOS VELASCO','SPQ814','23691 23680','9456 7002 MERCALOCURA','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6208568,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 19 – WHM896 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','ALEXANDER CUELLAR','WHM896','23692 20367','9457','ARABIA ALTAGRACIA','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   6975225,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARABIA ALTAGRACIA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','MIGUEL TABARES','PEK019','23693','9458','PEREIRA','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   5373048,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   40,NULL,'TYM'),

  /* 21 – LUM993 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','PABLO RAMIREZ','LUM993','23694','9459','PEREIRA','QUEBIN LOTERO',1,
   1,0,'-',
   7383863,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','GABRIEL PEREZ','WLC133','23695','9460','PEREIRA','SANTIAGO HENAO MORALES, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   1,0,'-',
   7354533,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','ADALBERTO MEJIA','TNH494','23696','9461 SUPERMISCELANEA','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   7853655,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   52,'AP743091','TYM'),

  /* 24 – MAT480 – VALOR DE FLETE $350.000 */
  ('2026-09-10','Jueves','ALPINA','ELKIN AGUIRRE','MAT480','23701','7004','MARSELLA','BRAHIAN STIVEN VALENCIA IGLESIAS, JUAN JOSE CONTRERAS HERNANDEZ',2,
   1,350000,'VALOR DE FLETE $350.000',
   12597760,
   350000,
   52,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ──────────────────────────────── */

  /* 25 – WTN748 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','DIEGO RATIVA','WTN748','23702','7005 MERCAPLAZA','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   6615235,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   44,'AP743093','TYM'),

  /* 26 – ERK303 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','JORGE ALARCON','ERK303','23677 20364','7006','APIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   1,0,'-',
   10933279,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-09-10','Jueves','ALPINA','WILMAR CARDONA','JVM223','23666 23678 20366','7007 9451','VITERBO','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   1,0,'-',
   14039911,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1) + 0,
   65,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-09-10','Jueves','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20373','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   5449691,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   37,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-09-10'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
