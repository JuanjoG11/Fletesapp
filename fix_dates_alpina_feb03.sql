-- ==========================================================
-- 🔧 SOLUCIÓN: CORRECCIÓN DE FECHAS ALPINA (ULTIMOS 27 FLETES)
-- ==========================================================
-- Este script cambia la fecha de los últimos 27 fletes registrados hoy (2026-02-03)
-- de los proveedores ALPINA y ALPINA-FLEISCHMANN a la fecha de ayer (2026-02-02).
-- Rango identificado: Desde JHON MARTINEZ hasta CARLOS ARTURO.

-- 1. Realizar la actualización de los 27 registros más recientes
UPDATE fletes
SET fecha = '2026-02-02'
WHERE fecha = '2026-02-03'
AND proveedor IN ('ALPINA', 'ALPINA-FLEISCHMANN')
AND created_at >= '2026-02-03 18:44:10';

-- 2. Mostrar resumen de la actualización (Debería devolver exactamente 27 registros)
SELECT 
    proveedor, 
    fecha, 
    COUNT(*) as total_fletes
FROM fletes
WHERE fecha = '2026-02-02'
AND proveedor IN ('ALPINA', 'ALPINA-FLEISCHMANN')
AND created_at >= '2026-02-03 18:44:10'
GROUP BY proveedor, fecha;
