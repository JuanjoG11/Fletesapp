/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: LUNES 5 OCTUBRE 2026
   Generado: 2026-10-05
   Notas:
     - WGZ876   EXTRA $60.000
     - WFV015   ADICIONAL AL FLETE $120.000 (fact. adicionales AP766250-251)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-05'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 05‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* 01 – WGZ876 – EXTRA $60.000 (ARANZAZU FILADELFIA, AP 24399 + FEP 20655) */
  ('2026-10-05','Lunes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WGZ876' AND razon_social='TYM'),
   'WGZ876','24399 20655','9558 FLEISCHMANN','ARANZAZU FILADELFIA','JOHN EDWAR ZAPATA ACEVEDO, JUAN RICO',2,
   1,60000,'EXTRA $60.000',
   7371032,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARANZAZU FILADELFIA' LIMIT 1), 7371032) + 60000,
   38,NULL,'TYM'),

  /* 02 – WFV015 – ADICIONAL AL FLETE $120.000 (CHINCHINA, planilla AP 24400, 1 auxiliar) */
  ('2026-10-05','Lunes','ALPINA',
   (SELECT conductor FROM vehiculos WHERE placa='WFV015' AND razon_social='TYM'),
   'WFV015','24400','9559','CHINCHINA','BRANDON STEVEN GIL BAEZ',1,
   1,120000,'ADICIONAL AL FLETE $120.000',
   7661307,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1), 7661307) + 120000,
   81,'AP766250-251','TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, contratista AS conductor_bd, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-10-05'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
