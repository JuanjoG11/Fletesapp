/* ==========================================================
   🔧 FIX: WGZ876 – JUEVES 1 OCTUBRE 2026
   Problema: precio tomó el valor_ruta en lugar del precio de lista
             de la población SUPIA RIOSUCIO SUPER = $625.000
             (sin adicional en este día)
   ========================================================== */

UPDATE fletes
SET precio = 625000
WHERE fecha = '2026-10-01'
  AND placa = 'WGZ876'
  AND proveedor = 'ALPINA';

/* Verificación */
SELECT fecha, placa, zona, poblacion,
       valor_ruta, valor_adicional_negociacion, precio, no_pedidos, proveedor
FROM fletes
WHERE fecha = '2026-10-01'
  AND placa = 'WGZ876';
