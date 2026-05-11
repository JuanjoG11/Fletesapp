-- ==========================================================
-- 🔧 SOLUCIÓN: CORRECCIÓN DE DÍA ALPINA (MARTES -> LUNES)
-- ==========================================================
-- Este script cambia el nombre del día de 'Martes' a 'Lunes'
-- para los 27 fletes registrados hoy que ya fueron corregidos a la fecha 2026-02-02.

-- 1. Actualizar la columna 'dia'
UPDATE fletes
SET dia = 'Lunes'
WHERE fecha = '2026-02-02'
AND proveedor IN ('ALPINA', 'ALPINA-FLEISCHMANN')
AND created_at >= '2026-02-03 18:44:10';

-- 2. Resumen de la verificación
SELECT 
    proveedor, 
    fecha, 
    dia,
    COUNT(*) as total_fletes
FROM fletes
WHERE fecha = '2026-02-02'
AND created_at >= '2026-02-03 18:44:10'
GROUP BY proveedor, fecha, dia;
