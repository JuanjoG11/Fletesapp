/* ==========================================================
   🔧 FIX: Corregir fecha 2026-08-03 → 2026-08-04
   Los fletes se subieron con fecha del lunes, deben ser martes
   ========================================================== */

-- Primero eliminar si ya hay algo en el 04 (evita duplicados)
DELETE FROM fletes
WHERE fecha = '2026-08-04'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

-- Mover todos los registros del 03 al 04 y actualizar el día
UPDATE fletes
SET fecha = '2026-08-04',
    dia   = 'Martes'
WHERE fecha = '2026-08-03'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* Verificación */
SELECT fecha, dia, COUNT(*) AS total
FROM fletes
WHERE fecha IN ('2026-08-03','2026-08-04')
  AND proveedor IN ('ALPINA','FLEISCHMANN')
GROUP BY fecha, dia
ORDER BY fecha;
