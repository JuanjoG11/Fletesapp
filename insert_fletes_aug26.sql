/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 26 AGOSTO 2026
   Generado: 2026-08-26
   ✅ Nombres de auxiliares normalizados según lista oficial
   Notas:
     - MAT480  CHINCHINA sin pedidos → precio fijo $550.000
     - WFQ635  CHINCHINA 1 pedido   → precio fijo $350.000
     - SLI587  EXTRA $60.000
     - WEP384  ADICIONAL $100.000
     - ETM037  ADICIONAL $50.000 ENTREGA SUPER EXTRARUTA
     - TMZ674  EXTRA RUTA $50.000
     - EQN953  VALOR DE FLETE $250.000 (precio fijo)
     - TTL256  SALDO PENDIENTE $120.000 (adicional)
     - CARLOS JIMENEZ      → CARLOS ALBERTO JIMENEZ JACOME
     - JHONNY LOPEZ        → YHONY ALEXANDER LOPEZ LOPEZ
     - SAMUEL ARIAS        → SAMUEL ANDRES ARIAS ARCILA
     - VALENTINA GARCIA    → VALENTINA GARCIA GOMEZ
     - DANIELA CASTIBLANCO → DANIELA CASTIBLANCO RAMIREZ
     - MANUEL RAMIREZ      → MANUEL ALEJANDRO RAMIREZ OVALLE
     - DIEGO FRANCO        → JUAN DIEGO FRANCO VERGARA
     - QUEBIN LOTERO: no está en lista oficial ALPINA
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-26'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 26‑Ago‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES ─────────────────────────────────────────── */

  /* 01 – MAT480 – VALOR DE FLETE $550.000 INCLUYE DESCARGUE */
  ('2026-08-26','Miercoles','ALPINA','ELKIN AGUIRRE','MAT480','','7002','CHINCHINA','NO APLICA',0,
   0,0,'VALOR DE FLETE $550.000 INCLUYE DESCARGUE',
   0,
   550000,
   0,NULL,'TYM'),

  /* 02 – WFQ635 – VALOR DE FLETE $350.000 */
  ('2026-08-26','Miercoles','ALPINA','JHENCI LOPEZ','WFQ635','23198','','CHINCHINA','JHON FREDY MORENO',1,
   1,0,'VALOR DE FLETE $350.000',
   27247917,
   350000,
   1,NULL,'TYM'),

  /* 03 – SYU652 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','JOHAN ECHEVERRY','SYU652','23206 20171 20135TSS','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   7123768,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   45,'FEP1193137-138-140','TYM'),

  /* 04 – KOL802 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','FREDY','KOL802','23207','9553','MANIZALES VILLAMARIA','CARLOS ALBERTO JIMENEZ JACOME, YHONY ALEXANDER LOPEZ LOPEZ',2,
   2,0,'-',
   9326859,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   56,'FEP1193136','TYM'),

  /* 05 – WLS478 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','HUMBERTO RINCON','WLS478','23208 23190 20172','9554 7000 MERCAPLAZA','MANIZALES VILLAMARIA','ADRIAN FELIPE MARTINEZ ORTEGON',1,
   1,0,'-',
   10494468,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 06 – SPU120 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','OSWALDO','SPU120','23209 20173','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   7118882,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 07 – SLI587 – EXTRA $60.000 */
  ('2026-08-26','Miercoles','ALPINA','MIGUEL GONZALES','SLI587','23210 23137TSS 23179TSS 20174','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,60000,'SLI587 EXTRA $60.000',
   8165884,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 60000,
   45,NULL,'TYM'),

  /* 08 – WGZ876 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','RICARDO PINEDA','WGZ876','23201','9557','MARMATO LA MERCED','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   15059878,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MARMATO LA MERCED' LIMIT 1) + 0,
   36,NULL,'TYM'),

  /* 09 – EYX091 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','ANDRES GOMEZ','EYX091','23165 23202 20176','9558','AGUADAS PACORA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   18932351,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='AGUADAS PACORA' LIMIT 1) + 0,
   83,NULL,'TYM'),

  /* 10 – WEP384 – ADICIONAL $100.000 */
  ('2026-08-26','Miercoles','ALPINA','YOFER LOPEZ','WEP384','23211 20177','9559','PALESTINA ARAUCA','BRANDON STEVEN GIL BAEZ',1,
   1,100000,'WEP384 ADICIONAL $100.000',
   10570202,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PALESTINA ARAUCA' LIMIT 1) + 100000,
   44,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ─────────────────────────────────── */

  /* 11 – ETM037 – ADICIONAL $50.000 ENTREGA SUPER EXTRARUTA */
  ('2026-08-26','Miercoles','ALPINA','OSCAR MARIN','ETM037','23222 23191','9601 7008 RINDEMAX','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,50000,'ETM037 ADICIONAL $50.000 ENTREGA SUPER EXTRARUTA',
   9509791,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 50000,
   53,'AP726954','TYM'),

  /* 12 – TJX795 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','ANDRES QUINTERO','TJX795','23223','9602 ÉXITO LA16','ARMENIA','SEBASTIAN VILLADA VELASQUEZ, SANTIAGO HENAO MORALES',2,
   2,0,'-',
   7400841,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   56,'AP726954','TYM'),

  /* 13 – EQY944 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','GOBER CRISTANCHO','EQY944','23224','9603','ARMENIA','JOSE ALEXANDER CONSTAIN PERLAZA, SAMUEL ANDRES ARIAS ARCILA',2,
   2,0,'-',
   9948337,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   55,NULL,'TYM'),

  /* 14 – SXF257 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','FABIO RUIZ','SXF257','23225 23193','9604 7010','QUIMBAYA','CAMILO ANDRES CONTRERAS RIVAS, VALENTINA GARCIA GOMEZ',2,
   2,0,'-',
   9114100,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='QUIMBAYA' LIMIT 1) + 0,
   40,NULL,'TYM'),

  /* 15 – WFV015 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','YONNI VALENCIA','WFV015','23194 20166','9605','CORDOBA PIJAO BVISTA','CESAR AUGUSTO CASTILLO LONDOÑO',1,
   1,0,'-',
   5976870,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CORDOBA PIJAO BVISTA' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 16 – TTL256 – SALDO PENDIENTE $120.000 */
  ('2026-08-26','Miercoles','ALPINA','ANDRES QUINTERO','TTL256','23195 23189 20164','9606 9600','SALENTO','DANIELA CASTIBLANCO RAMIREZ',1,
   1,120000,'TTL256 SALDO PENDIENTE $120.000',
   6630348,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SALENTO' LIMIT 1) + 120000,
   30,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ────────────────────────────── */

  /* 17 – SMO183 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','GABRIEL PEREZ','SMO183','23213','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   7511277,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   57,NULL,'TYM'),

  /* 18 – VZD334 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','JULIAN CUELLAR','VZD334','23214 20167','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   8956482,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   53,NULL,'TYM'),

  /* 19 – TMZ674 – EXTRA RUTA $50.000 */
  ('2026-08-26','Miercoles','ALPINA','RICARDO LOPEZ','TMZ674','23215 23199 23143TSS','9455 E7001','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,50000,'TMZ674 EXTRA RUTA $50.000',
   7242609,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 50000,
   24,NULL,'TYM'),

  /* 20 – SPQ814 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','CARLOS VELASCO','SPQ814','23216','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   7288358,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 21 – LUM993 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','PABLO RAMIREZ','LUM993','23217','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   8066374,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 22 – PEK019 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','MIGUEL TABARES','PEK019','23218','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   7178652,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* 23 – EQN953 – VALOR DE FLETE $250.000 */
  ('2026-08-26','Miercoles','ALPINA','ORLANDO VASQUEZ','EQN953','23219','9459','PEREIRA - DOSQUEBRADAS','CAMILO LEANDRO GUECHE PEÑA',1,
   1,0,'VALOR DE FLETE $250.000',
   7972723,
   250000,
   53,NULL,'TYM'),

  /* 24 – WLC133 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','JULIAN','WLC133','23220','9460','PEREIRA - DOSQUEBRADAS','EDWIN MAURICIO GOMEZ GALINDO, QUEBIN LOTERO',2,
   2,0,'-',
   9095742,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   65,NULL,'TYM'),

  /* 25 – TNH494 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','ADALBERTO MEJIA','TNH494','23221 23200','9461 9450 PETROCHELY','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   10783470,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   48,NULL,'TYM'),

  /* 26 – WTN748 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','DIEGO RATIVA','WTN748','23226 20168','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   9598100,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   61,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ─────────────────────────────── */

  /* 27 – EST067 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','JORGE RIVILLAS','EST067','23212 20161','7005','ANSERMA NUEVO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   7614653,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA NUEVO 2T' LIMIT 1) + 0,
   36,NULL,'TYM'),

  /* 28 – ERK303 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','JORGE ALARCON','ERK303','23196 20160','7006','BALBOA LA CELIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   9418009,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BALBOA LA CELIA' LIMIT 1) + 0,
   42,NULL,'TYM'),

  /* 29 – JVM223 – sin adicional */
  ('2026-08-26','Miercoles','ALPINA','WILMAR CARDONA','JVM223','23188 23197 20163','7007 9451','ANSERMA','LUIS CARLOS CADAVID RESTREPO, MANUEL ALEJANDRO RAMIREZ OVALLE',2,
   2,0,'-',
   15427256,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ANSERMA' LIMIT 1) + 0,
   56,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 30 – SQB119 – sin adicional */
  ('2026-08-26','Miercoles','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20175','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','JUAN DIEGO FRANCO VERGARA',1,
   1,0,'-',
   5046391,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
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
WHERE fecha = '2026-08-26'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
