/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 11 SEPTIEMBRE 2026
   Generado: 2026-09-11
   Notas:
     - SPU120  ADICIONAL AL FLETE $120.000 ENTREGA DE TSS Y SUPERMERCADO
     - WGZ876  EXTRA $60.000
     - WEP384  EXTRA $60.000
     - ETM037  ADICIONAL AL FLETE $50.000 ENTREGA DE SUPER
     - WTN748  60.000 EXTRA
     - VZD334  60.000 EXTRA
     - WLC133  VALOR DE FLETE $250.000
     - EQN953  VALOR DE FLETE $250.000
     - MAT480  VALOR DE FLETE $320.000 ENTREGA DE TSS
     - JHONNY LOPEZ        → auxiliar de SYU652
     - ADRIAN FELIPE MARTINEZ ORTEGON → auxiliar de SYU652
     - SAMUEL ARIAS        → auxiliar de WLS478
     - APOYO VENDEDOR      → auxiliar de TJX795
     - AUX NUEVO           → auxiliar de ETM037 / WLC133
     - JUAN RICO           → auxiliar de TNH494
     - ELKIN GARCIA OCAMPO → auxiliar de ERK303
     - MANUEL RAMIREZ      → auxiliar de JVM223
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-09-11'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 11‑Sep‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ─────────────────────────────── */

  /* 01 – WFV015 – sin adicional */
  ('2026-09-11','Viernes','ALPINA','YONI VALENCIA','WFV015','23740 FEP1194431','9552','MANIZALES VILLAMARIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,0,'-',
   5329997,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 02 – KOL802 – sin adicional */
  ('2026-09-11','Viernes','ALPINA','FREDY GALLEGO','KOL802','23709 23741 20382 20393','9553 9550 PUNTOMERCO','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,0,'-',
   7297914,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   47,NULL,'TYM'),

  /* 03 – SYU652 – sin adicional */
  ('2026-09-11','Viernes','ALPINA','JOHAN ECHEVERRY','SYU652','23742 20394','9554 MANA','MANIZALES VILLAMARIA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   1,0,'-',
   10389368,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   51,'AP744454','TYM'),

  /* 04 – SPU120 – ADICIONAL AL FLETE $120.000 ENTREGA DE TSS Y SUPERMERCADO */
  ('2026-09-11','Viernes','ALPINA','OSWALDO','SPU120','23743 20395 20398','9555','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,120000,'ADICIONAL AL FLETE $120.000 ENTREGA DE TSS Y SUPERMERCADO',
   7601114,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 120000,
   62,NULL,'TYM'),

  /* 05 – SLI587 – sin adicional */
  ('2026-09-11','Viernes','ALPINA','MIGUEL GONZALES','SLI587','23729 20396 20397','9556 UNOACENTRO','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   8037858,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   49,'FEP1194419-421 AP744455','TYM'),

  /* 06 – WGZ876 – EXTRA $60.000 */
  ('2026-09-11','Viernes','ALPINA','RICARDO PINEDA','WGZ876','23715','9557','IRRA LA FELISA VER RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ',1,
   1,60000,'EXTRA $60.000',
   11227595,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='IRRA LA FELISA VER RIOSUCIO' LIMIT 1) + 60000,
   28,NULL,'TYM'),

  /* 07 – EYX091 – sin adicional */
  ('2026-09-11','Viernes','ALPINA','ANDRES GOMEZ','EYX091','23673 23716 20374 20375','9558','PACORA SALAMINA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   1,0,'-',
   13352895,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1) + 0,
   79,NULL,'TYM'),

  /* 08 – WEP384 – EXTRA $60.000 */
  ('2026-09-11','Viernes','ALPINA','YOFER LOPEZ','WEP384','23717 20389','9559 CAMPESINO/MERCADIA/AURELIO','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'EXTRA $60.000',
   10973715,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 60000,
   75,'AP744457-459-458','TYM'),

  /* 09 – WFQ635 – sin adicional */
  ('2026-09-11','Viernes','ALPINA','JHENCI LOPEZ','WFQ635','23721 23710','9560','RIOSUCIO-SUPIA SUPERMERCADO','ANDRES MATEO VILLALBA DIAZ',1,
   1,0,'-',
   10710304,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO-SUPIA SUPERMERCADO' LIMIT 1) + 0,
   8,NULL,'TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ──────────────────────────────────── */

  /* 10 – ETM037 – ADICIONAL AL FLETE $50.000 ENTREGA DE SUPER */
  ('2026-09-11','Viernes','ALPINA','OSCAR MARIN','ETM037','23669 23744 20383','9601 7009 P/ESPEJO','ARMENIA','YEISON DAVID RENDON SOTO, AUX NUEVO',2,
   1,50000,'ADICIONAL AL FLETE $50.000 ENTREGA DE SUPER',
   11114726,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 50000,
   67,NULL,'TYM'),

  /* 11 – TJX795 – sin adicional */
  ('2026-09-11','Viernes','ALPINA','ANDRES QUINTERO','TJX795','23714 23730','9602 7009 LA50','ARMENIA','CESAR AUGUSTO CASTILLO LONDOÑO, APOYO VENDEDOR',2,
   1,0,'-',
   10870737,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   46,NULL,'TYM'),

  /* 12 – EQY944 – sin adicional */
  ('2026-09-11','Viernes','ALPINA','GOBER CRISTANCHO','EQY944','23745','9603','CALARCA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   3173850,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
   45,NULL,'TYM'),

  /* 13 – SXF257 – sin adicional */
  ('2026-09-11','Viernes','ALPINA','FABIO RUIZ','SXF257','23746 20371','9604','MONTENEGRO PTAPAO','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   10300415,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1) + 0,
   49,NULL,'TYM'),

  /* 14 – WLS478 – sin adicional */
  ('2026-09-11','Viernes','ALPINA','HUMBERTO RINCON','WLS478','23720 23718','9605','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, SAMUEL ARIAS',2,
   1,0,'-',
   14407086,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
   42,NULL,'TYM'),

  /* 15 – WTN748 – EXTRA $60.000 */
  ('2026-09-11','Viernes','ALPINA','DIEGO RATIVA','WTN748','23719 23726 20386','9606 9600','CIRCASIA','DANIELA CASTIBLANCO',1,
   1,60000,'EXTRA $60.000',
   7159661,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 60000,
   43,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ─────────────────────────────── */

  /* 16 – SMO183 – sin adicional */
  ('2026-09-11','Viernes','ALPINA','GABRIEL PEREZ','SMO183','23731','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   8217584,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 17 – VZD334 – EXTRA $60.000 */
  ('2026-09-11','Viernes','ALPINA','JULIAN CUELLAR','VZD334','23689TSS 23732','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,60000,'EXTRA $60.000',
   9908664,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 60000,
   54,NULL,'TYM'),

  /* 18 – TMZ674 – sin adicional */
  ('2026-09-11','Viernes','ALPINA','RICARDO LOPEZ','TMZ674','23733','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   7019777,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   58,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional */
  ('2026-09-11','Viernes','ALPINA','CARLOS VELASCO','SPQ814','23734','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   6866511,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   64,NULL,'TYM'),

  /* 20 – WHM896 – sin adicional */
  ('2026-09-11','Viernes','ALPINA','ALEXANDER CUELLAR','WHM896','23735','9457','PEREIRA - DOSQUEBRADAS','JHON FREDY MORENO',1,
   1,0,'-',
   7900767,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   54,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional */
  ('2026-09-11','Viernes','ALPINA','MIGUEL TABARES','PEK019','23736','9458','PEREIRA - DOSQUEBRADAS','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   7552534,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   59,NULL,'TYM'),

  /* 22 – LUM993 – sin adicional */
  ('2026-09-11','Viernes','ALPINA','PABLO RAMIREZ','LUM993','23737','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
   1,0,'-',
   6546085,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   51,NULL,'TYM'),

  /* 23 – WLC133 – VALOR DE FLETE $250.000 */
  ('2026-09-11','Viernes','ALPINA','GABRIEL PEREZ','WLC133','23738','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, AUX NUEVO',2,
   1,250000,'VALOR DE FLETE $250.000',
   13430047,
   250000,
   71,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional */
  ('2026-09-11','Viernes','ALPINA','ADALBERTO MEJIA','TNH494','23739','9461 MERCAMOS/PETROCHELY','CARTAGO','OSCAR MAURICIO RESTREPO MORENO, JUAN RICO',2,
   1,0,'-',
   10954913,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   59,'AP744441 AP743092','TYM'),

  /* 25 – EQN953 – VALOR DE FLETE $250.000 */
  ('2026-09-11','Viernes','ALPINA','ORLANDO VASQUEZ','EQN953','23747','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,250000,'VALOR DE FLETE $250.000',
   7411882,
   250000,
   53,NULL,'TYM'),

  /* ── ZONA CARTAGO / OCCIDENTE ────────────────────────────────── */

  /* 26 – MAT480 – VALOR DE FLETE $320.000 ENTREGA DE TSS */
  ('2026-09-11','Viernes','ALPINA','ELKIN AGUIRRE','MAT480','23695TSS 23748','7005','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,320000,'VALOR DE FLETE $320.000 ENTREGA DE TSS',
   6411853,
   320000,
   45,NULL,'TYM'),

  /* 27 – ERK303 – sin adicional */
  ('2026-09-11','Viernes','ALPINA','JORGE ALARCON','ERK303','23722 20387','7006','LA VIRGINIA','YERFREY FLOWER, ELKIN GARCIA OCAMPO',2,
   1,0,'-',
   12479239,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='LA VIRGINIA' LIMIT 1) + 0,
   68,'AP744439-440-442','TYM'),

  /* 28 – JVM223 – sin adicional */
  ('2026-09-11','Viernes','ALPINA','WILMAR CARDONA','JVM223','23708 23723 20388','7007 9451','MISTRATO','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   1,0,'-',
   17582771,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MISTRATO' LIMIT 1) + 0,
   66,'AP743443TSS','TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional */
  ('2026-09-11','Viernes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','20384 20385','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   8185386,
   (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
   60,'FEP1194188','TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-09-11'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
