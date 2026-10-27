/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: LUNES 26 OCTUBRE 2026
   Generado: 2026-10-26

   Notas:
     - WGZ876   EXTRA $60.000 (AP 25015 + FEP 20927, ARANZAZU FILADELFIA)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-10-26'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 26‑Oct‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* 01 – WGZ876 – EXTRA $60.000 (AP 25015 + FEP 20927) */
  ('2026-10-26','Lunes','ALPINA',
   'RICARDO PINEDA',
   'WGZ876','25015','9558','ARANZAZU FILADELFIA','JOHN EDWAR ZAPATA ACEVEDO',1,
   1,60000,'EXTRA $60.000',
   7397415,
   COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARANZAZU FILADELFIA' LIMIT 1), 7397415) + 60000,
   36,'20927','TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa,
       contratista     AS conductor,
       zona, poblacion,
       precio          AS precio_flete,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-10-26'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor DESC, zona, placa;
