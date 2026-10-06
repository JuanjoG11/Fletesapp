/* ==========================================================
   🔧 FIX: SQB119 – SÁBADO 3 OCTUBRE 2026
   Problema: población 'FLEISCHMANN S/ROSA-D/BRADAS' no existe en
             precios_fletes → COALESCE tomó valor_ruta ($4.129.696).
   Corrección: precio = $300.000 (precio de lista SANTA ROSA FLEISCHMANN)
   ========================================================== */

UPDATE fletes
SET precio = 300000
WHERE fecha = '2026-10-03'
  AND placa = 'SQB119'
  AND proveedor = 'FLEISCHMANN';

/* Verificación */
SELECT fecha, placa, zona, poblacion,
       valor_ruta, precio, no_pedidos, proveedor
FROM fletes
WHERE fecha = '2026-10-03'
  AND placa = 'SQB119';
