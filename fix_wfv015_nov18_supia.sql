/* ==========================================================
   🔧 FIX: WFV015 – MIÉRCOLES 18 NOVIEMBRE 2026
   Problema: SUPIA RIOSUCIO SUPER no está en precios_fletes,
             el INSERT dejó precio = NULL.
   Corrección: precio de lista $625.000
               + adicional $100.000 ENTREGA DE SUPER CONDUCTOR
               = precio final $725.000
   ========================================================== */

UPDATE fletes
SET precio = 725000
WHERE fecha = '2026-11-18'
  AND placa = 'WFV015'
  AND poblacion = 'SUPIA RIOSUCIO SUPER';

/* Verificación */
SELECT fecha, placa, poblacion, valor_ruta,
       valor_adicional_negociacion, precio, no_pedidos
FROM fletes
WHERE fecha = '2026-11-18'
  AND placa = 'WFV015';
