/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 15 OCTUBRE 2026
   Generado: 2026-10-15
   ✅ Nombres de auxiliares normalizados según lista oficial

   Notas:
     - SYU652   EXTRA $60.000 (MANIZALES VILLAMARIA)
     - WFV015   ADICIONAL AL FLETE $80.000 (CALARCA 7008, sin auxiliar, solo 3 pedidos)
     - SXF257   ADICIONAL AL FLETE $150.000 (ALCALA ULLOA)
     - TUL630   VALOR DE FLETE $550.000 (RDA S JOSE BELALCAZAR, 2 auxiliares)
     - VZD334   EXTRA $60.000 (PEREIRA)
     - SXE499   VALOR DE FLETE $350.000 (MARSELLA, 2 auxiliares — conductor texto fijo)
     - WTN748   VALOR DE FLETE $500.000 (CARTAGO 2T, fac AP776827)
     - EST067   EXTRA pago $880.000 (sin pedidos normales — JORGE RIVILLAS)
     - WHM896   fac adicional AP776830 (sin costo extra)
     - EQY944   fac adicional AP777274 (sin costo extra)
     - TNH494   facs AP777131 AP777132 (sin costo extra)
     - SQB119   FLEISCHMANN planilla AP 24711TSS + FEP 20807
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-15'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 15‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ──────────────────────────── */

  /* 01 – SYU652 – EXTRA $60.000 (AP 24729) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SYU652' AND razon_social='TYM'),
   'SYU652','24729','9552','MANIZALES VILLAMARIA','MICHAEL STEVEN HENAO RODRIGUEZ',1,
   1,60000,'EXTRA $60.000',
   5745471,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5745471) + 60000,
   47,NULL,'TYM'),

  /* 02 – WFR160 – sin adicional (AP 24730 + FEP 20811 20808) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFR160' AND razon_social='TYM'),
   'WFR160','24730','9553 F','MANIZALES VILLAMARIA','CARLOS JIMENEZ',1,
   1,0,'-',
   5591649,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 5591649) + 0,
   49,NULL,'TYM'),

  /* 03 – EYX091 – sin adicional (AP 24731 + FEP 20795, 2 auxiliares) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EYX091' AND razon_social='TYM'),
   'EYX091','24731','9554 F','NEIRA','JHONNY LOPEZ, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   2,0,'-',
   7846815,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='NEIRA' LIMIT 1), 7846815) + 0,
   56,NULL,'TYM'),

  /* 04 – SPU120 – sin adicional (AP 24732 + FEP 20809) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPU120' AND razon_social='TYM'),
   'SPU120','24732','9555 F','MANIZALES VILLAMARIA','JUAN ALEJANDRO FRANCO MARIN',1,
   1,0,'-',
   6565870,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 6565870) + 0,
   50,NULL,'TYM'),

  /* 05 – WGZ876 – sin adicional (AP 24742 24733 + FEP 20810, 2 auxiliares) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','24742 24733','9556 9550 F','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE, CRISTIAN GIRALDO',2,
   2,0,'-',
   8751403,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1), 8751403) + 0,
   54,NULL,'TYM'),

  /* 06 – WEP384 – sin adicional (AP 24724 24734 + FEP 20786, 2 auxiliares) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WEP384' AND razon_social='TYM'),
   'WEP384','24724 24734','9557 9560 F','RIOSUCIO','JUAN MANUEL DELGADO NARVAEZ, ANDRES MATEO VILLALBA DIAZ',2,
   2,0,'-',
   14673394,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='RIOSUCIO' LIMIT 1), 14673394) + 0,
   55,NULL,'TYM'),

  /* 07 – TUL630 – VALOR DE FLETE $550.000 (AP 24736 + FEP 20798, 2 auxiliares) */
  ('2026-10-15','Jueves','ALPINA',
   'JUAN DAVID',
   'TUL630','24736','9559 F','RDA S JOSE BELALCAZAR','BRANDON STEVEN GIL BAEZ, JORGE RIVILLAS',2,
   2,0,'-',
   11313127,
   550000,
   53,NULL,'TYM'),

  /* ── ZONA ARMENIA / CALARCA ───────────────────────────────── */

  /* 08 – WFV015 – ADICIONAL AL FLETE $80.000 (AP 24727, sin auxiliar, CALARCA) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFV015' AND razon_social='TYM'),
   'WFV015','24727','7008','CALARCA','NO APLICA',0,
   0,80000,'ADICIONAL AL FLETE $80.000',
   11954618,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1), 11954618) + 80000,
   3,NULL,'TYM'),

  /* 09 – TTL256 – sin adicional (AP 24728 24755, 2 auxiliares) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TTL256' AND razon_social='TYM'),
   'TTL256','24728 24755','9601 7009','ARMENIA','YEISON DAVID RENDON SOTO, SAMUEL ARIAS',2,
   2,0,'-',
   7612492,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 7612492) + 0,
   53,NULL,'TYM'),

  /* 10 – TJX795 – sin adicional (AP 24756) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TJX795' AND razon_social='TYM'),
   'TJX795','24756','9602','ARMENIA','YERFREY FLOWER',1,
   1,0,'-',
   5562396,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 5562396) + 0,
   56,NULL,'TYM'),

  /* 11 – EQY944 – sin adicional (AP 24757 + fac AP777274, 2 auxiliares) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='EQY944' AND razon_social='TYM'),
   'EQY944','24757','9603 ANDY','ARMENIA','JUAN JOSE CONTRERAS HERNANDEZ, JHON FREDY MORENO',2,
   2,0,'-',
   5995173,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1), 5995173) + 0,
   53,'AP777274','TYM'),

  /* 12 – SXF257 – ADICIONAL AL FLETE $150.000 (AP 24758 + FEP 20799) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SXF257' AND razon_social='TYM'),
   'SXF257','24758','9604 F','ALCALA ULLOA','JOSE ALEXANDER CONSTAIN PERLAZA',1,
   1,150000,'ADICIONAL AL FLETE $150.000',
   7298460,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ALCALA ULLOA' LIMIT 1), 7298460) + 150000,
   51,NULL,'TYM'),

  /* 13 – WLS478 – sin adicional (AP 24737 + FEP 20801, 2 auxiliares) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLS478' AND razon_social='TYM'),
   'WLS478','24737','9605 F','CAICEDONIA','CHRISTIAN DAVID CAICEDO MONTAÑO, YESID PATIÑO',2,
   2,0,'-',
   10880353,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CAICEDONIA' LIMIT 1), 10880353) + 0,
   60,NULL,'TYM'),

  /* 14 – WHM896 – sin adicional (AP 24738 + FEP 20779 + fac AP776830) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WHM896' AND razon_social='TYM'),
   'WHM896','24738','9606 MERCA F','FILANDIA','JHON WILSON GIRALDO CARVAJAL',1,
   1,0,'-',
   7722083,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='FILANDIA' LIMIT 1), 7722083) + 0,
   36,'AP776830','TYM'),

  /* ── ZONA PEREIRA / DOSQUEBRADAS ──────────────────────────── */

  /* 15 – SMO183 – sin adicional (AP 24746) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SMO183' AND razon_social='TYM'),
   'SMO183','24746','9453','PEREIRA','JUAN DAVID QUINTERO GRAJALES',1,
   1,0,'-',
   8019523,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 8019523) + 0,
   49,NULL,'TYM'),

  /* 16 – VZD334 – EXTRA $60.000 (AP 24747) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='VZD334' AND razon_social='TYM'),
   'VZD334','24747','9454','PEREIRA','CARLOS ANDRES PINEDA CANO',1,
   1,60000,'EXTRA $60.000',
   8883937,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 8883937) + 60000,
   59,NULL,'TYM'),

  /* 17 – TMZ674 – sin adicional (AP 24748) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TMZ674' AND razon_social='TYM'),
   'TMZ674','24748','9455','PEREIRA','ANDRES FELIPE RIOS CAICEDO',1,
   1,0,'-',
   5612044,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 5612044) + 0,
   55,NULL,'TYM'),

  /* 18 – SPQ814 – sin adicional (AP 24749 24726 + FEP 20806) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='SPQ814' AND razon_social='TYM'),
   'SPQ814','24749 24726','9456 7002 F','SANTA ROSA','GERMAN GALVEZ CORTES',1,
   1,0,'-',
   5389898,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1), 5389898) + 0,
   45,NULL,'TYM'),

  /* 19 – BCS450 – sin adicional (AP 24750 + FEP 20804) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='BCS450' AND razon_social='TYM'),
   'BCS450','24750','9457 F','ARABIA ALTAGRACIA','JUAN ESTEBAN GALLEGO DIEZ',1,
   1,0,'-',
   5204310,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARABIA ALTAGRACIA' LIMIT 1), 5204310) + 0,
   46,NULL,'TYM'),

  /* 20 – PEK019 – sin adicional (AP 24751) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='PEK019' AND razon_social='TYM'),
   'PEK019','24751','9458','PEREIRA','SEBASTIAN MONTES',1,
   1,0,'-',
   5751404,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 5751404) + 0,
   43,NULL,'TYM'),

  /* 21 – LUM993 – sin adicional (AP 24752, 2 auxiliares — conductor texto fijo) */
  ('2026-10-15','Jueves','ALPINA',
   'PABLO RAMIREZ',
   'LUM993','24752','9459','PEREIRA','QUEBIN LOTERO, PABLO RAMIREZ',2,
   2,0,'-',
   6763827,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 6763827) + 0,
   41,NULL,'TYM'),

  /* 22 – WLC133 – sin adicional (AP 24753, 2 auxiliares) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WLC133' AND razon_social='TYM'),
   'WLC133','24753','9460','PEREIRA','SANTIAGO HENAO MORALES, MARLON MURILLO',2,
   2,0,'-',
   5955332,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1), 5955332) + 0,
   42,NULL,'TYM'),

  /* 23 – TNH494 – sin adicional (AP 24754 + facs AP777131 AP777132) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='TNH494' AND razon_social='TYM'),
   'TNH494','24754','9461 SUPERM','CARTAGO','OSCAR MAURICIO RESTREPO MORENO',1,
   1,0,'-',
   7739650,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1), 7739650) + 0,
   56,'AP777131 AP777132','TYM'),

  /* 24 – EST067 – VALOR PAGO DE EXTRA $880.000 (sin pedidos, sin planilla ordinaria) */
  ('2026-10-15','Jueves','ALPINA',
   'JORGE RIVILLAS',
   'EST067','-','EXTRA','EXTRA','EXTRA',0,
   0,0,'VALOR PAGO DE EXTRA $880.000',
   880000,
   880000,
   0,NULL,'TYM'),

  /* 25 – SXE499 – VALOR DE FLETE $350.000 (AP 24759 + FEP 20802, 2 auxiliares — conductor texto fijo) */
  ('2026-10-15','Jueves','ALPINA',
   'ANDRES',
   'SXE499','24759','7004 F','MARSELLA','BRAHIAN STIVEN VALENCIA IGLESIAS, CESAR AUGUSTO CASTILLO LONDOÑO',2,
   2,0,'-',
   9906844,
   350000,
   50,NULL,'TYM'),

  /* ── ZONA CARTAGO / OCCIDENTE ─────────────────────────────── */

  /* 26 – WTN748 – VALOR DE FLETE $500.000 (AP 24760 + fac AP776827) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WTN748' AND razon_social='TYM'),
   'WTN748','24760','7005 MERCAP','CARTAGO 2T','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   6055770,
   500000,
   38,'AP776827','TYM'),

  /* 27 – ERK303 – sin adicional (AP 24739 + FEP 20803, 2 auxiliares) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='ERK303' AND razon_social='TYM'),
   'ERK303','24739','7006 F','APIA','ROVINSON TORRES RIVERA, ELKIN GARCIA OCAMPO',2,
   2,0,'-',
   10157514,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA' LIMIT 1), 10157514) + 0,
   50,NULL,'TYM'),

  /* 28 – JVM223 – sin adicional (AP 24740 24723 + FEP 20805, 2 auxiliares) */
  ('2026-10-15','Jueves','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='JVM223' AND razon_social='TYM'),
   'JVM223','24740 24723','7007 9451 F','VITERBO','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   13176906,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='VITERBO' LIMIT 1), 13176906) + 0,
   63,NULL,'TYM'),

  /* ── FLEISCHMANN ──────────────────────────────────────────── */

  /* 29 – SQB119 – sin adicional (AP 24711TSS + FEP 20807) */
  ('2026-10-15','Jueves','FLEISCHMANN',
   (SELECT conductor FROM vehiculos WHERE placa='SQB119' AND razon_social='TYM'),
   'SQB119','24711TSS 20807','FLEISCHMANN','PEREIRA - DOSQUEBRADAS','DIEGO FRANCO',1,
   1,0,'-',
   5160876,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 5160876) + 0,
   48,NULL,'TYM');

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
WHERE fecha = '2026-10-15'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
