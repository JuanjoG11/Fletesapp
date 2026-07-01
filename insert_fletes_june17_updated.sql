/* ==========================================================
    🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 17 JUNIO 2026
    Generado: 2026-06-17T14:10:00Z
    ✅ Valores tomados directamente del CSV entregado por el usuario
    ========================================================== */

/* -------------------------------------------------
    1️⃣  Eliminar los fletes del día (evita duplicados)
    ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-17'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
    2️⃣  Insertar los fletes del 17‑Jun‑2026 usando los valores exactos
    ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
) VALUES
  -- 01 – SYU652
  ('2026-06-17','Miércoles','ALPINA','JOHAN ECHEVERRY','SYU652','21199','9552','MANIZALES VILLAMARIA','JOHAN ECHEVERRY',1,
   1,0,'-',
   8320102,        -- valor_ruta
   8400250,        -- precio (T VALOR)
   47,NULL,'TYM'),

  -- 02 – KOL802
  ('2026-06-17','Miércoles','ALPINA','CAMILO CASTAÑO','KOL802','21177','9553','MANIZALES VILLAMARIA','CAMILO CASTAÑO',1,
   1,0,'-',
   10297063,
   10466389,
   56,NULL,'TYM'),

  -- 03 – WFV015
  ('2026-06-17','Miércoles','ALPINA','YONNI VALENCIA','WFV015','21201','9554','MANIZALES VILLAMARIA','YONNI VALENCIA',1,
   1,0,'-',
   8342192,
   8803490,
   57,NULL,'TYM'),

  -- 04 – EYY183
  ('2026-06-17','Miércoles','ALPINA','JOHN ARENAS','EYY183','21202','9555','MANIZALES VILLAMARIA','JOHN ARENAS',1,
   1,0,'-',
   7169106,
   7383564,
   50,NULL,'TYM'),

  -- 05 – SLI587
  ('2026-06-17','Miércoles','ALPINA','MIGUEL GONZALES','SLI587','21203','9556','MANIZALES VILLAMARIA','MIGUEL GONZALES',2,
   2,0,'-',
   4451316,
   5366592,
   41,NULL,'TYM'),

  -- 06 – WGZ876 (sin adicional)
  ('2026-06-17','Miércoles','ALPINA','RICARDO PINEDA','WGZ876','21204','9557','MARMATO LA MERCED','RICARDO PINEDA',1,
   1,0,'-',
   12826168,
   12826168,
   30,NULL,'TYM'),

  -- 07 – EYX091
  ('2026-06-17','Miércoles','ALPINA','CARLOS GOMEZ','EYX091','21181','9558','AGUADAS PACORA','CARLOS GOMEZ',2,
   2,0,'-',
   14988071,
   19254326,
   61,NULL,'TYM'),

  -- 08 – SMH182 (con adicional $60.000)
  ('2026-06-17','Miércoles','ALPINA','JUAN DAVID','SMH182','21205','9559','PALESTINA ARAUCA','JUAN DAVID',1,
   1,60000,'SMH182 EXTRA $60.000',
   9360402,
   9829181,
   45,NULL,'TYM'),

  -- 09 – TJX795 (valor único, sin adicional definido)
  ('2026-06-17','Miércoles','ALPINA','ANDRES QUINTERO','TJX795','-','7010','-','ANDRES QUINTERO',3,
   1,0,'QUIMABAYA/MONTENEGRO/TEBAIDA VALOR DE FLETE $700.000 INCLUYE DESCARGUE',
   17109840,
   17109840,
   3,NULL,'TYM'),

  -- 10 – SPU120
  ('2026-06-17','Miércoles','ALPINA','OSWALDO','SPU120','21180','9601','ARMENIA','OSWALDO',1,
   1,0,'-',
   7264262,
   7264262,
   59,NULL,'TYM'),

  -- 11 – VZD334
  ('2026-06-17','Miércoles','ALPINA','JULIAN CUELLAR','VZD334','-','9602','ARMENIA','JULIAN CUELLAR',1,
   1,0,'-',
   8725457,
   8725457,
   63,NULL,'TYM'),

  -- 12 – EQY944
  ('2026-06-17','Miércoles','ALPINA','GOBER CRISTANCHO','EQY944','-','9603','ARMENIA','GOBER CRISTANCHO',1,
   1,0,'-',
   8160115,
   8160115,
   55,NULL,'TYM'),

  -- 13 – SXF257 (adicional $100.000)
  ('2026-06-17','Miércoles','ALPINA','FABIO RUIZ','SXF257','-','9604','QUIMBAYA','FABIO RUIZ',1,
   1,100000,'SXF257 ADICIONAL AL FLETE $100.000 SOBRECARGO',
   13429082,
   13429082,
   51,NULL,'TYM'),

  -- 14 – WLS478 (adicional $1.118.851)
  ('2026-06-17','Miércoles','ALPINA','HUMBERTO RINCON','WLS478','21184','9605','CORDOBA PIJAO BVISTA','HUMBERTO RINCON',1,
   1,1118851,'WLS478 EXTRA $1.118.851',
   5584269,
   6703120,
   38,NULL,'TYM'),

  -- 15 – TTL256
  ('2026-06-17','Miércoles','ALPINA','YIMERSON GARCIA','TTL256','-','9606','SALENTO','YIMERSON GARCIA',1,
   1,0,'-',
   8329916,
   8329916,
   33,NULL,'TYM'),

  -- 16 – SMO183 (adicional $300.000)
  ('2026-06-17','Miércoles','ALPINA','GABRIEL PEREZ','SMO183','-','9453','PEREIRA','GABRIEL PEREZ',1,
   1,300000,'SMO183 VALOR DE FLETE $300.000 ENTREGA LECHE EN LAS VIOLETAS',
   7606141,
   7606141,
   59,NULL,'TYM'),

  -- 17 – XVI496
  ('2026-06-17','Miércoles','ALPINA','PABLO RAMIREZ','XVI496','-','9454','PEREIRA','PABLO RAMIREZ',1,
   1,0,'-',
   7934917,
   8418647,
   46,NULL,'TYM'),

  -- 18 – TMZ674
  ('2026-06-17','Miércoles','ALPINA','RICARDO LOPEZ','TMZ674','-','9455','PEREIRA','RICARDO LOPEZ',1,
   1,0,'-',
   8676576,
   8676576,
   63,NULL,'TYM'),

  -- 19 – SPQ814
  ('2026-06-17','Miércoles','ALPINA','CARLOS VELASCO','SPQ814','-','9456','SANTA ROSA','CARLOS VELASCO',1,
   1,0,'-',
   6402879,
   6402879,
   46,NULL,'TYM'),

  -- 20 – WHM317
  ('2026-06-17','Miércoles','ALPINA','HUMBERTO PARRA','WHM317','-','9457','PEREIRA','HUMBERTO PARRA',1,
   1,0,'-',
   7012375,
   7012375,
   58,NULL,'TYM'),

  -- 21 – PEK019
  ('2026-06-17','Miércoles','ALPINA','MIGUEL TABARES','PEK019','-','9458','PEREIRA','MIGUEL TABARES',1,
   1,0,'-',
   5934562,
   5934562,
   53,NULL,'TYM'),

  -- 22 – WHM896
  ('2026-06-17','Miércoles','ALPINA','ALEXANDER CUELLAR','WHM896','-','9459','PEREIRA','ALEXANDER CUELLAR',1,
   1,0,'-',
   6769857,
   6769857,
   55,NULL,'TYM'),

  -- 23 – WLC133
  ('2026-06-17','Miércoles','ALPINA','JULIAN','WLC133','-','9460','PEREIRA','JULIAN',2,
   2,0,'-',
   6820547,
   6820547,
   68,NULL,'TYM'),

  -- 24 – TNH494
  ('2026-06-17','Miércoles','ALPINA','ADALBERTO MEJIA','TNH494','-','9461','CARTAGO','ADALBERTO MEJIA',1,
   1,0,'-',
   7168376,
   7168376,
   43,NULL,'TYM'),

  -- 25 – WTN748 (adicional $1.266.676)
  ('2026-06-17','Miércoles','ALPINA','DIEGO RATIVA','WTN748','-','7004','PEREIRA','DIEGO RATIVA',1,
   1,1266676,'WTN748 EXTRA $1.266.676',
   7786538,
   9053214,
   53,NULL,'TYM'),

  -- 26 – EST067 (adicional $185.606)
  ('2026-06-17','Miércoles','ALPINA','JORGE RIVILLAS','EST067','-','7005','ARGELIA EL CAIRO','JORGE RIVILLAS',1,
   1,185606,'EST067 ADICIONAL $185.606',
   10842847,
   10842847,
   34,NULL,'TYM'),

  -- 27 – ERK303 (adicional $927.621)
  ('2026-06-17','Miércoles','ALPINA','JORGE ALARCON','ERK303','-','7006','BALBOA LA CELIA','JORGE ALARCON',1,
   1,927621,'ERK303 EXTRA $927.621',
   7079950,
   8007571,
   38,NULL,'TYM'),

  -- 28 – JVM223
  ('2026-06-17','Miércoles','ALPINA','WILMAR CARDONA','JVM223','-','7007','ANSERMA','WILMAR CARDONA',1,
   1,0,'-',
   15841428,
   16702133,
   53,NULL,'TYM'),

  -- 29 – SQB119 (FLEISCHMANN)
  ('2026-06-17','Miércoles','FLEISCHMANN','CARLOS CASTAÑO','SQB119','-','-','PEREIRA - DOSQUEBRADAS','CARLOS CASTAÑO',1,
   1,0,'-',
   5593512,
   5593512,
   56,NULL,'TYM');

/* -------------------------------------------------
    3️⃣  Verificación rápida (opcional)
    ------------------------------------------------- */
SELECT fecha,
       placa,
       precio                      AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       proveedor
FROM fletes
WHERE fecha = '2026-06-17'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
