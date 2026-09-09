/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIERCOLES 9 SEPTIEMBRE 2026
   Generado: 2026-09-09
   Notas:
     - WGZ876  EXTRAS 2 ($120.000)
     - WEP384  EXTRA $60.000
     - WTN748  60.000 EXTRA
     - TRF860  VALOR DE FLETE 350.000 POR TODO CARTAGO
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-09-09'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 09‑Sep‑2026
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
  ('2026-09-09','Miercoles','ALPINA','JOHAN ECHEVERRY','SYU652','23639 23657 FEP1194161','9552 9550 DELCENTRO','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   11170403,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   41,NULL,'TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','FREDY GALLEGO','KOL802','23624 23658 23611TSS FEP1194163','9553 7001 DELCAMPO/FLORIDA','MANIZALES VILLAMARIA','CARLOS JIMENEZ, JHONNY LOPEZ',2,
   1,0,'-',
   16576935,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   63,NULL,'TYM'),

  /* 03 – WFV015 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','YONNI VALENCIA','WFV015','23659 20361','9554 MERCAPLAZA','MANIZALES VILLAMARIA','JUAN JOSE CONTRERAS HERNANDEZ, AUX NUEVO',2,
   1,0,'-',
   9650431,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   55,'AP741791','TYM'),

  /* 04 – SPU120 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','OSWALDO','SPU120','23660 20362','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   8345226,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','MIGUEL GONZALES','SLI587','23627 20363','9556 UNOACENTRO','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   10793673,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   43,'AP741792','TYM'),

  /* 06 – WGZ876 – EXTRAS 2 ($120.000) */
  ('2026-09-09','Miercoles','ALPINA','RICARDO PINEDA','WGZ876','23628','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ',1,
   1,120000,'EXTRAS 2 ($120.000)',
   18110564,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1) + 120000,
   37,NULL,'TYM'),

  /* 07 – WEP384 – EXTRA $60.000 */
  ('2026-09-09','Miercoles','ALPINA','YOFER LOPEZ','WEP384','23630 20350','9559','PALESTINA ARAUCA','BRANDON STEVEN GIL BAEZ, SAMUEL ARIAS',2,
   1,60000,'EXTRA $60.000',
   11043361,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PALESTINA ARAUCA' LIMIT 1) + 60000,
   46,NULL,'TYM'),

  /* 08 – EYX091 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','ANDRES GOMEZ','EYX091','23595 23629 20351','9558','AGUADAS PACORA','JUAN CAMILO COCOMA OROZCO, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   1,0,'-',
   17561305,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1) + 0,
   81,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ──────────────────────────────────── */

  /* 09 – ETM037 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','OSCAR MARIN','ETM037','23626 23642','9601 7009LA19','ARMENIA','YEISON DAVID RENDON SOTO, AUX NUEVO',2,
   1,0,'-',
   13191031,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   52,NULL,'TYM'),

  /* 10 – TJX795 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','ANDRES QUINTERO','TJX795','23631 9920356','9602 EXITOLA16','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, JHON FREDY MORENO',2,
   1,0,'-',
   10609336,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   61,'AP740378-','TYM'),

  /* 11 – EQN953 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','ORLANDO VASQUEZ','EQN953','23625 23632','9603 7008 RINDEMAX','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, ELKIN GARCIA OCAMPO',2,
   1,0,'-',
   12622431,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 12 – SXF257 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','FABIO RUIZ','SXF257','23645 23640','9604 7010','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS, ANDRES MATEO VILLALBA DIAZ',2,
   1,0,'-',
   13765088,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 0,
   40,NULL,'TYM'),

  /* 13 – WLS478 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','HUMBERTO RINCON','WLS478','23633 20355','9605','CORDOBA PIJAO BVISTA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   8184085,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1) + 0,
   43,NULL,'TYM'),

  /* 14 – EQY944 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','GOBER CRISTANCHO','EQY944','23634 20353','9606','SALENTO','CESAR AUGUSTO CASTILLO LONDOÑO',1,
   1,0,'-',
   7807414,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1) + 0,
   32,'AP741789 AP741790','TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ─────────────────────────────── */

  /* 15 – SMO183 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','GABRIEL PEREZ','SMO183','23648','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   8869896,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 16 – VZD334 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','JULIAN CUELLAR','VZD334','23649 20357','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   8155531,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   40,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','RICARDO LOPEZ','TMZ674','23650 23638','9455 E7001','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   7242815,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   39,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','CARLOS VELASCO','SPQ814','23651 23637','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   9981060,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 19 – WHM896 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','ALEXANDER CUELLAR','WHM896','23652','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   9668814,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','MIGUEL TABARES','PEK019','23653','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   8734773,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 21 – LUM993 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','PABLO RAMIREZ','LUM993','23654','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
   1,0,'-',
   9097664,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','GABRIEL PEREZ','WLC133','23655 23608TSS','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, FABIAN NUMERARIO',2,
   1,0,'-',
   10276994,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   76,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','ADALBERTO MEJIA','TNH494','23656 23641','9461 9450','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   10019053,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 24 – WTN748 – 60.000 EXTRA */
  ('2026-09-09','Miercoles','ALPINA','DIEGO RATIVA','WTN748','23646 23618TSS 20359','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,60000,'60.000 EXTRA',
   12396551,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   67,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ──────────────────────────────── */

  /* 25 – WFQ635 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','JHENCI LOPEZ','WFQ635','23647 20345','7005','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   5603054,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1) + 0,
   34,NULL,'TYM'),

  /* 26 – ERK303 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','JORGE ALARCON','ERK303','23635 20344','7006','BALBOA LA CELIA','ROVINSON TORRES RIVERA',1,
   1,0,'-',
   10125423,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1) + 0,
   42,NULL,'TYM'),

  /* 27 – JVM223 – sin adicional */
  ('2026-09-09','Miercoles','ALPINA','WILMAR CARDONA','JVM223','23636 23621 20348','7007 9451','ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   1,0,'-',
   17658708,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 28 – SQB119 – sin adicional */
  ('2026-09-09','Miercoles','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20360 20356','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   5612126,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 29 – TRF860 – VALOR DE FLETE 350.000 POR TODO CARTAGO */
  ('2026-09-09','Miercoles','FLEISCHMANN','ALBERTO GONZALO','TRF860','20347 20358','FLEISCHMANN','CARTAGO 2T','JULIAN RODRIGUEZ',1,
   1,350000,'VALOR DE FLETE 350.000 POR TODO CARTAGO',
   6450609,
   350000,
   41,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-09-09'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
