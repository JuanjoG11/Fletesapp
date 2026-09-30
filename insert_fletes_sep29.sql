/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 29 SEPTIEMBRE 2026
   Generado: 2026-09-29
   Notas:
     - TUL630  VALOR DE FLETE $600.000 (conductor texto fijo, sin aux)
     - WEP384  zona 9557 9560 → SUPIA
     - MAT480  aparece dos veces: 7009 ARMENIA SUPER ($700k fijo) y 7004 PEREIRA
     - WFV015  EXTRA $60.000
     - WLC133  ADICIONAL AL FLETE $26.000
     - SQB119  solo FEP (sin planilla AP)
     - precio usa COALESCE para poblaciones no registradas en tabla
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-09-29'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 29‑Sep‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ─────────────────────────────── */

  /* 01 – TUL630 – VALOR DE FLETE $600.000 (placa nueva, sin auxiliar) */
  ('2026-09-29','Martes','ALPINA',
   'JUAN DAVID',
   'TUL630',NULL,'7002','CHINCHINA',NULL,0,
   1,600000,'VALOR DE FLETE $600.000',
   13636400,
   600000,
   1,'AP760895 AP758198','TYM'),

  /* 02 – SYU652 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24229 20589','9552 FLEIS/COMPAR','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ, JUAN RICO',2,
   1,0,'-',
   7463206,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7463206) + 0,
   69,'FEP1195839','TYM'),

  /* 03 – WFR160 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24230','9553','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,0,'-',
   5161726,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5161726) + 0,
   49,'AP759860TSS','TYM'),

  /* 04 – EYX091 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','24231 20590','9554','MANIZALES VILLAMARIA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   1,0,'-',
   6945371,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6945371) + 0,
   56,NULL,'TYM'),

  /* 05 – SPU120 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24226 24232','9555 7000','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   1,0,'-',
   9536235,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 9536235) + 0,
   56,'AP759157TSS','TYM'),

  /* 06 – SLI587 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SLI587' AND razon_social='TYM'),
   'SLI587','24224 24233','9556 9550 FLEISCH/COMPAR','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   7748989,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7748989) + 0,
   45,'FEP1195842-840','TYM'),

  /* 07 – WEP384 – sin adicional (SUPIA) */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24234 24225 20586','9557 9560','SUPIA','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   1,0,'-',
   17146676,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1), 17146676) + 0,
   50,NULL,'TYM'),

  /* 08 – WGZ876 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','24236 20594','9559 7002','CHINCHINA','BRANDON STEVEN GIL BAEZ, JOHN EDWAR ZAPATA ACEVEDO',2,
   1,0,'-',
   8129659,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1), 8129659) + 0,
   60,'AP760894-896-897-898','TYM'),

  /* ── ZONA ARMENIA / QUINDÍO ──────────────────────────────────── */

  /* 09 – MAT480 (7009) – VALOR DE FLETE $700.000 DOS VEHICULOS ARMENIA SUPER */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='MAT480' AND razon_social='TYM'),
   'MAT480','24214 24215 24216 24217','7009','ARMENIA SUPER','JHON FREDY MORENO',1,
   1,700000,'VALOR DE FLETE $700.000',
   21177330,
   700000,
   4,NULL,'TYM'),

  /* 10 – TTL256 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TTL256' AND razon_social='TYM'),
   'TTL256','24250','9601 EXITO16','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   4922279,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 4922279) + 0,
   40,'AP760900','TYM'),

  /* 11 – WFV015 – EXTRA $60.000 */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFV015' AND razon_social='TYM'),
   'WFV015','24251','9602','ARMENIA','YERFREY FLOWER, CRISTIAN GIRALDO',2,
   1,60000,'EXTRA $60.000',
   5171393,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 5171393) + 60000,
   59,NULL,'TYM'),

  /* 12 – EQY944 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24252 20582','9603','CALARCA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   6200363,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1), 6200363) + 0,
   54,NULL,'TYM'),

  /* 13 – SXF257 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24220 24221 24253 20587','9604 7010','MONTENEGRO PTAPAO','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,0,'-',
   7909608,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1), 7909608) + 0,
   44,'AP760899','TYM'),

  /* 14 – WLS478 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24219 24237 20581','9605 7010','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   7465149,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1), 7465149) + 0,
   43,NULL,'TYM'),

  /* 15 – WFQ635 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFQ635' AND razon_social='TYM'),
   'WFQ635','24238','9606','CIRCASIA','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   3286686,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1), 3286686) + 0,
   33,NULL,'TYM'),

  /* ── ZONA PEREIRA / EJE CAFETERO ─────────────────────────────── */

  /* 16 – SMO183 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24241 20588','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   7356236,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7356236) + 0,
   47,NULL,'TYM'),

  /* 17 – VZD334 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24242','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7487590,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7487590) + 0,
   48,NULL,'TYM'),

  /* 18 – TMZ674 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TMZ674' AND razon_social='TYM'),
   'TMZ674','24243','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, SAMUEL ARIAS',2,
   1,0,'-',
   6575668,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6575668) + 0,
   68,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24244 20593','9456','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5366514,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 5366514) + 0,
   52,NULL,'TYM'),

  /* 20 – WHM896 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24245','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   7889981,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7889981) + 0,
   54,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24246','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,0,'-',
   5610526,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5610526) + 0,
   45,NULL,'TYM'),

  /* 22 – LUM993 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='LUM993' AND razon_social='TYM'),
   'LUM993','24247','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO, MARLON MURILLO',2,
   1,0,'-',
   8485082,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8485082) + 0,
   64,NULL,'TYM'),

  /* 23 – WLC133 – ADICIONAL AL FLETE $26.000 */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24248','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, DUVIER GALVIZ',2,
   1,26000,'ADICIONAL AL FLETE $26.000',
   12172513,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 12172513) + 26000,
   63,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','24249','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   5158307,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 5158307) + 0,
   52,NULL,'TYM'),

  /* 25 – MAT480 (7004) – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='MAT480' AND razon_social='TYM'),
   'MAT480','24254','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   7714396,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7714396) + 0,
   51,NULL,'TYM'),

  /* ── ZONA OCCIDENTE / RISARALDA ──────────────────────────────── */

  /* 26 – WTN748 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','24255','7005','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   8009927,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARGELIA EL CAIRO' LIMIT 1), 8009927) + 0,
   31,NULL,'TYM'),

  /* 27 – ERK303 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','24222 24239 20580 20583','7006 9450','SANTUARIO','ELKIN GARCIA OCAMPO, JORGE RIVILLAS',2,
   1,0,'-',
   14322715,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1), 14322715) + 0,
   48,NULL,'TYM'),

  /* 28 – JVM223 – sin adicional */
  ('2026-09-29','Martes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24223 24240 20584','7007 9451','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   1,0,'-',
   11370953,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1), 11370953) + 0,
   62,NULL,'TYM'),

  /* ── FLEISCHMANN ─────────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional (solo FEP) */
  ('2026-09-29','Martes','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','20592','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   3176356,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 3176356) + 0,
   33,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, contratista AS conductor_bd, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-09-29'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
