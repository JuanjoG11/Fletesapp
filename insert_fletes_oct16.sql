/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 16 OCTUBRE 2026
   Generado: 2026-10-16
   ✅ Nombres de auxiliares normalizados según lista oficial

   Notas:
     - WFR160   ADICIONAL AL FLETE $100.000 (2 auxiliares, planillas 24743 24783 24773 + FEP 20826)
     - WEP384   ADICIONAL AL FLETE $200.000 (IRRA LA FELISA VER RIOSUCIO, 2 auxiliares, planillas 24777 24766)
     - WGZ876   ADICIONAL AL FLETE $180.000 (PACORA SALAMINA, 2 auxiliares, planillas 24735 24763 + FEP 20796 20815)
     - TUL630   VALOR DE FLETE $600.000 (CHINCHINA, planilla 24770)
     - WTN748   EXTRA $60.000 (CARTAGO 2T, fac AP778145)
     - SXF257   aparece DOS VECES:
                  · 9604 F conductor FABIO RUIZ (MONTENEGRO PTAPAO, planillas 24758TSS 24799, 2 auxiliares, fac AP778163)
                  · 9457   conductor HERIBERTO GARCIA (PEREIRA, planilla 24793)
     - WLC133   zona 9460 PEREIRA (MARLON MURILLO, 1 auxiliar)
     - TTL256   zona 9460 PEREIRA (2 auxiliares, planillas 24785 24753TSS)
     - TRK507   placa nueva — conductor texto fijo MIGUEL GONZALES
     - EYX091   fac AP778465 (sin costo extra)
     - WLS478   facs AP778164 AP778165 AP778166 (sin costo extra)
     - ERK303   facs AP778144 AP778462 AP778463 (sin costo extra)
     - SQB119   FLEISCHMANN planillas 20823 20824
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-16'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 16‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

  /* 01 – SYU652 – sin adicional (AP 24772 + fac AP778157) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24772','9552 UNOAC','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,0,'-',
   7941352,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7941352) + 0,
   44,'AP778157','TYM'),

  /* 02 – WFR160 – ADICIONAL AL FLETE $100.000 (AP 24743 24783 24773 + FEP 20826, 2 auxiliares) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24743 24783 24773','9553 7001 9550 F','MANIZALES VILLAMARIA','CARLOS JIMENEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,100000,'ADICIONAL AL FLETE $100.000',
   7665332,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7665332) + 100000,
   46,NULL,'TYM'),

  /* 03 – EYX091 – sin adicional (AP 24774 + FEP 20827 + fac AP778465, 2 auxiliares) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','24774','9554 MANA F','MANIZALES VILLAMARIA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   9636044,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 9636044) + 0,
   52,'AP778465','TYM'),

  /* 04 – SPU120 – sin adicional (AP 24775 + FEP 20828) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24775','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   7753758,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7753758) + 0,
   66,NULL,'TYM'),

  /* 05 – TRK507 – sin adicional (AP 24776 + FEP 20825 20829 — conductor texto fijo) */
  ('2026-10-16','Viernes','ALPINA',
   'MIGUEL GONZALES',
   'TRK507','24776','9556 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,0,'-',
   5652627,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5652627) + 0,
   48,NULL,'TYM'),

  /* 06 – WEP384 – ADICIONAL AL FLETE $200.000 (AP 24777 24766, 2 auxiliares) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24777 24766','9557 9560','IRRA LA FELISA VER RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,200000,'ADICIONAL AL FLETE $200.000',
   18216615,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='IRRA LA FELISA VER RIOSUCIO' LIMIT 1), 18216615) + 200000,
   31,NULL,'TYM'),

  /* 07 – WGZ876 – ADICIONAL AL FLETE $180.000 (AP 24735 24763 + FEP 20796 20815, 2 auxiliares) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','24735 24763','9558 F','PACORA SALAMINA','JOHN EDWAR ZAPATA ACEVEDO, JUAN RICO',2,
   2,180000,'ADICIONAL AL FLETE $180.000',
   14665728,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PACORA SALAMINA' LIMIT 1), 14665728) + 180000,
   84,NULL,'TYM'),

  /* 08 – MAT480 – sin adicional (AP 24778 + FEP 20822, 2 auxiliares) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='MAT480' AND razon_social='TYM'),
   'MAT480','24778','9559 F','CHINCHINA','BRANDON STEVEN GIL BAEZ, CRISTIAN GIRALDO',2,
   2,0,'-',
   10341933,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1), 10341933) + 0,
   77,NULL,'TYM'),

  /* 09 – TUL630 – VALOR DE FLETE $600.000 (AP 24770 — conductor texto fijo) */
  ('2026-10-16','Viernes','ALPINA',
   'JUAN DAVID',
   'TUL630','24770','7002','CHINCHINA','JORGE RIVILLAS',1,
   1,0,'-',
   17251610,
   600000,
   6,NULL,'TYM'),

  /* ── ZONA ARMENIA ─────────────────────────────────────────── */

  /* 10 – WFV015 – sin adicional (AP 24797, 2 auxiliares) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFV015' AND razon_social='TYM'),
   'WFV015','24797','9601','ARMENIA','YEISON DAVID RENDON SOTO, JHON FREDY MORENO',2,
   2,0,'-',
   7819156,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 7819156) + 0,
   64,NULL,'TYM'),

  /* 11 – TJX795 – sin adicional (AP 24798 24787) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TJX795' AND razon_social='TYM'),
   'TJX795','24798 24787','9602 7009','ARMENIA','YERFREY FLOWER',1,
   1,0,'-',
   7510837,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 7510837) + 0,
   49,NULL,'TYM'),

  /* 12 – EQY944 – sin adicional (AP 24786 + FEP 20812 20817) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24786','9603 F','CALARCA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   4931638,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1), 4931638) + 0,
   53,NULL,'TYM'),

  /* 13 – SXF257 – sin adicional (AP 24758TSS 24799 + FEP 20800 + fac AP778163, 2 auxiliares — ruta 9604) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24758TSS 24799','9604 F','MONTENEGRO PTAPAO','JOSE ALEXANDER CONSTAIN PERLAZA, PABLO RAMIREZ',2,
   2,0,'-',
   8005086,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1), 8005086) + 0,
   48,'AP778163','TYM'),

  /* 14 – WLS478 – sin adicional (AP 24779 + facs AP778164 AP778165 AP778166, 2 auxiliares) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24779','9605','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO, YESID PATIÑO',2,
   2,0,'-',
   9982897,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1), 9982897) + 0,
   41,'AP778164 AP778165 AP778166','TYM'),

  /* 15 – WHM896 – sin adicional (AP 24767 24780 + FEP 20816) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24767 24780','9606 9600 F','CIRCASIA','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   7618681,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1), 7618681) + 0,
   45,NULL,'TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

  /* 16 – SMO183 – sin adicional (AP 24789) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24789','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   6846642,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6846642) + 0,
   53,NULL,'TYM'),

  /* 17 – VZD334 – sin adicional (AP 24790) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24790','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   7514709,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7514709) + 0,
   52,NULL,'TYM'),

  /* 18 – TMZ674 – sin adicional (AP 24791) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TMZ674' AND razon_social='TYM'),
   'TMZ674','24791','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   6945737,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6945737) + 0,
   64,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional (AP 24792 + FEP 20820) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24792','9456 F','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5621443,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 5621443) + 0,
   55,NULL,'TYM'),

  /* 20 – SXF257 – sin adicional (AP 24793 — ruta 9457, conductor texto fijo HERIBERTO GARCIA) */
  ('2026-10-16','Viernes','ALPINA',
   'HERIBERTO GARCIA',
   'SXF257','24793','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   6570452,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6570452) + 0,
   51,NULL,'TYM'),

  /* 21 – PEK019 – sin adicional (AP 24794) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24794','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,0,'-',
   6229290,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6229290) + 0,
   51,NULL,'TYM'),

  /* 22 – LUM993 – sin adicional (AP 24795 — conductor texto fijo ANDRES, 1 auxiliar) */
  ('2026-10-16','Viernes','ALPINA',
   'ANDRES',
   'LUM993','24795','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO',1,
   1,0,'-',
   5509895,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5509895) + 0,
   49,NULL,'TYM'),

  /* 23 – WLC133 – sin adicional (AP 24802, 1 auxiliar MARLON MURILLO) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24802','9460','PEREIRA - DOSQUEBRADAS','MARLON MURILLO',1,
   1,0,'-',
   6044688,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6044688) + 0,
   34,NULL,'TYM'),

  /* 24 – TTL256 – sin adicional (AP 24785 24753TSS, 2 auxiliares — ruta 9460) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TTL256' AND razon_social='TYM'),
   'TTL256','24785 24753TSS','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, SAMUEL ARIAS',2,
   2,0,'-',
   7825983,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7825983) + 0,
   41,NULL,'TYM'),

  /* 25 – TNH494 – sin adicional (AP 24796) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','24796','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   7412712,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 7412712) + 0,
   56,NULL,'TYM'),

  /* 26 – SXE499 – sin adicional (AP 24800 — conductor texto fijo ANDRES) */
  ('2026-10-16','Viernes','ALPINA',
   'ANDRES',
   'SXE499','24800','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
   1,0,'-',
   7108798,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7108798) + 0,
   55,NULL,'TYM'),

  /* ── ZONA CARTAGO / OCCIDENTE ─────────────────────────────── */

  /* 27 – WTN748 – EXTRA $60.000 (AP 24801 + FEP 20813 + fac AP778145) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','24801','7005 MERCAMOS F','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,60000,'EXTRA $60.000',
   7460773,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1), 7460773) + 60000,
   41,'AP778145','TYM'),

  /* 28 – ERK303 – sin adicional (AP 24781 + FEP 20818 + facs AP778144 AP778462 AP778463, 2 auxiliares) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','24781','7006 F','LA VIRGINIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   13867506,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='LA VIRGINIA' LIMIT 1), 13867506) + 0,
   68,'AP778144 AP778462 AP778463','TYM'),

  /* 29 – JVM223 – sin adicional (AP 24765 24782 + FEP 20819, 2 auxiliares) */
  ('2026-10-16','Viernes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24765 24782','7007 9451 F','MISTRATO','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   14752250,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MISTRATO' LIMIT 1), 14752250) + 0,
   70,NULL,'TYM'),

  /* ── FLEISCHMANN ──────────────────────────────────────────── */

  /* 30 – SQB119 – sin adicional (FEP 20823 20824) */
  ('2026-10-16','Viernes','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','20823 20824','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   6404635,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 6404635) + 0,
   69,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa,
       contratista     AS conductor_bd,
       zona, poblacion,
       precio          AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-10-16'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
