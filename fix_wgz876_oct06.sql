/* ==========================================================
   🔧 FIX: WGZ876 – MARTES 6 OCTUBRE 2026
   Problema: precio tomó valor de precios_fletes para SUPIA RIOSUCIO SUPER
             en lugar de valor_ruta + adicional.
   Corrección: precio = valor_ruta ($15.620.606) + adicional ($60.000)
                      = $15.680.606
   ========================================================== */

/* Precio de lista SUPIA RIOSUCIO SUPER = $625.000
   + adicional AUX EXTRA $60.000 = $685.000 */
UPDATE fletes
SET precio = 685000
WHERE fecha = '2026-10-06'
  AND placa = 'WGZ876'
  AND proveedor = 'ALPINA';

/* Verificación */
SELECT fecha, placa, zona, poblacion,
       valor_ruta, valor_adicional_negociacion, precio, no_pedidos, proveedor
FROM fletes
WHERE fecha = '2026-10-06'
  AND placa = 'WGZ876';
