/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: LUNES 10 AGOSTO 2026
   Generado: 2026-08-10
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-10'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 10‑Ago‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* 01 – WEP384 – EXTRA $60.000 con facturas AP */
  ('2026-08-10','Lunes','ALPINA','YOFER','WEP384','22732','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,60000,'WEP384 EXTRA $60.000',
   6218546,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 60000,
   86,'AP714059 AP714061 9919963','TYM'),

  /* 02 – EYX091 – sin adicional */
  ('2026-08-10','Lunes','ALPINA','ANDRES GOMEZ','EYX091','22733','9558','ARANZAZU FILADELFIA','JUAN CAMILO COCOMA OROZCO',1,
   1,0,'-',
   7540218,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARANZAZU FILADELFIA' LIMIT 1) + 0,
   33,'9919961','TYM'),

  /* 03 – SLI587 – con facturas AP+FEP */
  ('2026-08-10','Lunes','ALPINA','MIGUEL GONZALES','SLI587','22747','9556','MANIZALES VILLAMARIA','MILTON GILMER OSORIO CALLE, JHONNY LOPEZ',2,
   2,0,'-',
   8840582,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   53,'AP714060 AP714062 FEP1191731 9919960','TYM'),

  /* 04 – WLS478 – sin adicional */
  ('2026-08-10','Lunes','ALPINA','HUMBERTO RINCON','WLS478','22727','9605','GENOVA','CHRISTIAN DAVID CAICEDO MONTAÑO',1,
   1,0,'-',
   4939904,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GENOVA' LIMIT 1) + 0,
   32,'9919967','TYM'),

  /* 05 – JVM223 – sin adicional */
  ('2026-08-10','Lunes','ALPINA','WILMAR CARDONA','JVM223','22730','7007','GUATICA','LUIS CARLOS CADAVID RESTREPO, MANUEL RAMIREZ',2,
   2,0,'-',
   10042276,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='GUATICA' LIMIT 1) + 0,
   47,'9919969 9919970','TYM'),

  /* 06 – EST067 – sin adicional */
  ('2026-08-10','Lunes','ALPINA','JORGE RIVILLAS','EST067','22753','7005','EL AGUILA VILLA NUEVA','ARBEY DE JESUS LARGO LARGO',1,
   1,0,'-',
   3696647,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='EL AGUILA VILLA NUEVA' LIMIT 1) + 0,
   33,NULL,'TYM'),

  /* 07 – TNH494 – sin adicional */
  ('2026-08-10','Lunes','ALPINA','ADALBERTO MEJIA','TNH494','22742','9461','CARTAGO 2T','DIORLAN ANTONIO MESA FLOREZ',1,
   1,0,'-',
   6146912,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO 2T' LIMIT 1) + 0,
   50,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-08-10'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
