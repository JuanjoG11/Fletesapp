/* ==========================================================
   🔧 FIX: WGZ876 – MARTES 20 OCTUBRE 2026
   Problema: precio tomó valor_ruta ($16.281.334) como fallback
             porque SUPIA RIOSUCIO SUPER no está en precios_fletes.
   Corrección: precio de lista SUPIA RIOSUCIO SUPER = $625.000
               sin adicional = $625.000
   ========================================================== */

UPDATE fletes
SET precio = 625000
WHERE fecha = '2026-10-20'
  AND placa = 'WGZ876'
  AND proveedor = 'ALPINA';

/* Verificación */
SELECT fecha, placa, zona, poblacion,
       valor_ruta, valor_adicional_negociacion, precio, no_pedidos, proveedor
FROM fletes
WHERE fecha = '2026-10-20'
  AND placa = 'WGZ876';
