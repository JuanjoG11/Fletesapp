/* ==========================================================
   🔧 FIX: SXG787 – MARTES 23 JUNIO 2026
   Corrige el precio del flete a $550.000 (valor negociado)
   La placa no está en la tabla de vehículos pero el registro
   ya existe en fletes — se actualiza directamente.
   ========================================================== */

UPDATE fletes
SET precio = 550000
WHERE fecha    = '2026-06-23'
  AND placa    = 'SXG787'
  AND proveedor = 'ALPINA';

/* Verificación */
SELECT fecha, placa, zona, poblacion, precio, valor_ruta, no_pedidos, facturas_adicionales
FROM fletes
WHERE fecha = '2026-06-23'
  AND placa = 'SXG787';
