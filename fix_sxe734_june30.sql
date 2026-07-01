/* ==========================================================
   🔧 FIX: SXE734 – MARTES 30 JUNIO 2026
   Corrige el precio del flete a $700.000 (valor total negociado)
   ========================================================== */

UPDATE fletes
SET precio = 700000
WHERE fecha    = '2026-06-30'
  AND placa    = 'SXE734'
  AND proveedor = 'ALPINA';

/* Verificación */
SELECT fecha, placa, zona, poblacion, precio, valor_ruta, no_pedidos, facturas_adicionales
FROM fletes
WHERE fecha = '2026-06-30'
  AND placa = 'SXE734';


