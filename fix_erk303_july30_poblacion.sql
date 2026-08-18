/* ==========================================================
   🔧 FIX: ERK303 30 JULIO 2026
   Cambiar poblacion de 'APIA VIRGINIA' a 'APIA'
   ========================================================== */

UPDATE fletes
SET poblacion = 'APIA',
    precio = (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='APIA' LIMIT 1)
WHERE fecha = '2026-07-30'
  AND placa = 'ERK303'
  AND proveedor = 'ALPINA';

/* Verificación */
SELECT fecha, placa, poblacion, precio
FROM fletes
WHERE fecha = '2026-07-30'
  AND placa = 'ERK303';
