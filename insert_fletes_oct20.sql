/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 20 OCTUBRE 2026
   Generado: 2026-10-20

   Notas:
     - SYU652   EXTRA $60.000 (AP 24854)
     - WFR160   ADICIONAL AL FLETE $50.000 (AP 24864 24855 + FEP 20853)
     - TRK507   EXTRA $60.000 (AP 24849 24858 + FEP 20851 20867)
     - TUL630   E7001 MERCASA, EXTRA $60.000 (AP 24884)
     - PEK019   EXTRA $60.000 (AP 24874)
     - WLC133   ADICIONAL AL FLETE $26.000 (AP 24876)
     - ERK303   ADICIONAL AL FLETE $100.000 SUPER (AP 24865 24848 + FEP 20856 20860, 2 auxiliares)
     - WTN748   VALOR DE FLETE $480.000 (AP 24883)
     - SXE867   fac AP779829 (AP 24861 24851 + FEP 20863, 2 auxiliares)
     - WFV015   fac AP780904 (AP 24878)
     - SXF257   facs AP780902 AP780903 (AP 24881 + FEP 20855, 2 auxiliares)
     - SXE499   fac AP780780 (AP 24882)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-20'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 20‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

  /* 01 – SYU652 – EXTRA $60.000 (AP 24854) */
  ('2026-10-20','Martes','ALPINA',
   'JOHAN ECHEVERRY',
   'SYU652','24854','9552','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,60000,'EXTRA $60.000',
   6837752,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6837752) + 60000,
   61,NULL,'TYM'),

  /* 02 – WFR160 – ADICIONAL AL FLETE $50.000 (AP 24864 24855 + FEP 20853) */
  ('2026-10-20','Martes','ALPINA',
   'LEANDRO LOPEZ',
   'WFR160','24864 24855','9553 7000 UNOAC F','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,50000,'ADICIONAL AL FLETE $50.000',
   6546280,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6546280) + 50000,
   49,'20853','TYM'),

  /* 03 – EYX091 – sin adicional (AP 24856 + FEP 20865, 2 auxiliares) */
  ('2026-10-20','Martes','ALPINA',
   'ANDRES GOMEZ',
   'EYX091','24856','9554 F','MANIZALES VILLAMARIA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   7850612,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 7850612) + 0,
   57,'20865','TYM'),

  /* 04 – SPU120 – sin adicional (AP 24857 + FEP 20866) */
  ('2026-10-20','Martes','ALPINA',
   'OSWALDO',
   'SPU120','24857','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6404665,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6404665) + 0,
   59,'20866','TYM'),

  /* 05 – TRK507 – EXTRA $60.000 (AP 24849 24858 + FEP 20851 20867) */
  ('2026-10-20','Martes','ALPINA',
   'MIGUEL GONZALES',
   'TRK507','24849 24858','9556 9550 UNOAG F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE',1,
   1,60000,'EXTRA $60.000',
   10105401,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 10105401) + 60000,
   52,'20851 20867','TYM'),

  /* 06 – WEP384 – sin adicional (AP 24859 + FEP 20852, 2 auxiliares) */
  ('2026-10-20','Martes','ALPINA',
   'YOFER LOPEZ',
   'WEP384','24859','9557 F','SUPIA','JUAN MANUEL DELGADO NARVAEZ, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   11206523,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1), 11206523) + 0,
   54,'20852','TYM'),

  /* 07 – SXE867 – sin adicional (AP 24861 24851 + FEP 20863, fac AP779829, 2 auxiliares) */
  ('2026-10-20','Martes','ALPINA',
   'HERIBERTO GARCIA',
   'SXE867','24861 24851','9559 7002 E7000TSS F','CHINCHINA','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
   2,0,'-',
   6564054,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1), 6564054) + 0,
   59,'20863 AP779829','TYM'),

  /* 08 – WGZ876 – sin adicional (AP 24850 + FEP 20854, 2 auxiliares) */
  ('2026-10-20','Martes','ALPINA',
   'RICARDO PINEDA',
   'WGZ876','24850','9560 F','SUPIA RIOSUCIO SUPER','JOHN EDWAR ZAPATA ACEVEDO, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   16281334,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA RIOSUCIO SUPER' LIMIT 1), 625000) + 0,
   10,'20854','TYM'),

  /* ── ZONA ARMENIA ─────────────────────────────────────────── */

  /* 09 – WFV015 – sin adicional (AP 24878, fac AP780904) */
  ('2026-10-20','Martes','ALPINA',
   'YONI VALENCIA',
   'WFV015','24878','9601 EXITOLA16','ARMENIA','YEISON DAVID RENDON SOTO',1,
   1,0,'-',
   6362462,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 6362462) + 0,
   53,'AP780904','TYM'),

  /* 10 – TJX795 – sin adicional (AP 24804 24879, 2 auxiliares) */
  ('2026-10-20','Martes','ALPINA',
   'ANDRES QUINTERO',
   'TJX795','24804 24879','9602 7008','ARMENIA','YERFREY FLOWER, SAMUEL ARIAS',2,
   2,0,'-',
   7540125,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 7540125) + 0,
   63,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional (AP 24880 + FEP 20859) */
  ('2026-10-20','Martes','ALPINA',
   'GOBER CRISTANCHO',
   'EQY944','24880','9603 F','CALARCA','JUAN JOSE CONTRERAS HERNANDEZ',1,
   1,0,'-',
   6586129,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1), 6586129) + 0,
   55,'20859','TYM'),

  /* 12 – SXF257 – sin adicional (AP 24881 + FEP 20855, facs AP780902 AP780903, 2 auxiliares) */
  ('2026-10-20','Martes','ALPINA',
   'FABIO RUIZ',
   'SXF257','24881','9604 F','MONTENEGRO PTAPAO','JOSE ALEXANDER CONSTAIN PERLAZA, JUAN RICO',2,
   2,0,'-',
   9179218,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO PTAPAO' LIMIT 1), 9179218) + 0,
   50,'20855 AP780902 AP780903','TYM'),

  /* 13 – WLS478 – sin adicional (AP 24862 + FEP 20831 20858) */
  ('2026-10-20','Martes','ALPINA',
   'HUMBERTO RINCON',
   'WLS478','24862','9605 F','TEBAIDA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   7378854,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1), 7378854) + 0,
   50,'20831 20858','TYM'),

  /* 14 – SQB119 – sin adicional (AP 24863) */
  ('2026-10-20','Martes','ALPINA',
   'CARLOS CASTAÑO',
   'SQB119','24863','9606','CIRCASIA','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   3528429,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1), 3528429) + 0,
   39,NULL,'TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

  /* 15 – TUL630 – EXTRA $60.000 (AP 24884, E7001 MERCASA) */
  ('2026-10-20','Martes','ALPINA',
   'JUAN DAVID',
   'TUL630','24884','E7001 MERCASA','PEREIRA - DOSQUEBRADAS',NULL,0,
   1,60000,'EXTRA $60.000',
   6768827,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6768827) + 60000,
   2,NULL,'TYM'),

  /* 16 – SMO183 – sin adicional (AP 24869) */
  ('2026-10-20','Martes','ALPINA',
   'GABRIEL PEREZ',
   'SMO183','24869','9453','PEREIRA - DOSQUEBRADAS','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   7228226,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7228226) + 0,
   56,NULL,'TYM'),

  /* 17 – VZD334 – sin adicional (AP 24870) */
  ('2026-10-20','Martes','ALPINA',
   'JULIAN CUELLAR',
   'VZD334','24870','9454','PEREIRA - DOSQUEBRADAS','CARLOS ANDRES PINEDA CANO',1,
   1,0,'-',
   6692937,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 6692937) + 0,
   53,NULL,'TYM'),

  /* 18 – TMZ674 – sin adicional (AP 24871, 2 auxiliares) */
  ('2026-10-20','Martes','ALPINA',
   'RICARDO LOPEZ',
   'TMZ674','24871','9455','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO, YESID PATIÑO',2,
   2,0,'-',
   8280270,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8280270) + 0,
   69,NULL,'TYM'),

  /* 19 – SPQ814 – sin adicional (AP 24872 + FEP 20862) */
  ('2026-10-20','Martes','ALPINA',
   'CARLOS VELASCO',
   'SPQ814','24872','9456 F','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   7036123,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 7036123) + 0,
   60,'20862','TYM'),

  /* 20 – TTL256 – sin adicional (AP 24873, 2 auxiliares) */
  ('2026-10-20','Martes','ALPINA',
   'ANDRES QUINTERO',
   'TTL256','24873','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ, JHON FREDY MORENO',2,
   2,0,'-',
   8409777,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8409777) + 0,
   51,NULL,'TYM'),

  /* 21 – PEK019 – EXTRA $60.000 (AP 24874) */
  ('2026-10-20','Martes','ALPINA',
   'MIGUEL TABARES',
   'PEK019','24874','9458','PEREIRA - DOSQUEBRADAS','SEBASTIAN MONTES',1,
   1,60000,'EXTRA $60.000',
   9950840,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 9950840) + 60000,
   54,NULL,'TYM'),

  /* 22 – MAT480 – sin adicional (AP 24875, 2 auxiliares) */
  ('2026-10-20','Martes','ALPINA',
   'ELKIN AGUIRRE',
   'MAT480','24875','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO, PABLO RAMIREZ',2,
   2,0,'-',
   9605573,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 9605573) + 0,
   67,NULL,'TYM'),

  /* 23 – WLC133 – ADICIONAL AL FLETE $26.000 (AP 24876, 2 auxiliares) */
  ('2026-10-20','Martes','ALPINA',
   'GABRIEL PEREZ',
   'WLC133','24876','9460','PEREIRA - DOSQUEBRADAS','SANTIAGO HENAO MORALES, MARLON MURILLO',2,
   2,26000,'ADICIONAL AL FLETE $26.000',
   11986007,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 11986007) + 26000,
   68,NULL,'TYM'),

  /* 24 – TNH494 – sin adicional (AP 24877) */
  ('2026-10-20','Martes','ALPINA',
   'ADALBERTO MEJIA',
   'TNH494','24877','9461','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   6553026,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 6553026) + 0,
   55,NULL,'TYM'),

  /* 25 – SXE499 – sin adicional (AP 24882, fac AP780780, 2 auxiliares) */
  ('2026-10-20','Martes','ALPINA',
   'ANDRES',
   'SXE499','24882','7004 TSS','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, CRISTIAN GIRALDO',2,
   2,0,'-',
   8148052,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 8148052) + 0,
   54,'AP780780','TYM'),

  /* ── ZONA OCCIDENTE ───────────────────────────────────────── */

  /* 26 – WTN748 – VALOR DE FLETE $480.000 (AP 24883) */
  ('2026-10-20','Martes','ALPINA',
   'DIEGO RATIVA',
   'WTN748','24883','7005 F','ARGELIA EL CAIRO','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   8761856,
   480000,
   31,NULL,'TYM'),

  /* 27 – ERK303 – ADICIONAL AL FLETE $100.000 SUPER (AP 24865 24848 + FEP 20856 20860, 2 auxiliares) */
  ('2026-10-20','Martes','ALPINA',
   'JORGE ALARCON',
   'ERK303','24865 24848','7006 9450 F','SANTUARIO','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,100000,'ADICIONAL AL FLETE $100.000 SUPER',
   15950040,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO' LIMIT 1), 15950040) + 100000,
   53,'20856 20860','TYM'),

  /* 28 – JVM223 – sin adicional (AP 24853 24866 + FEP 20861, 2 auxiliares) */
  ('2026-10-20','Martes','ALPINA',
   'WILMAR CARDONA',
   'JVM223','24853 24866','7007 9451 F','BELEN DE UMBRIA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   11006315,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1), 11006315) + 0,
   63,'20861','TYM'),

  /* ── FLEISCHMANN ──────────────────────────────────────────── */

  /* 29 – WEF511 – sin adicional (FEP 20864) */
  ('2026-10-20','Martes','FLEISCHMANN',
   'RICARDO FAMILIA',
   'WEF511','20864','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
   1,0,'-',
   4897741,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 4897741) + 0,
   47,NULL,'TYM');

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
WHERE fecha = '2026-10-20'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
