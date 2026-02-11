-- ==========================================================
-- 🔧 SOLUCIÓN: CORRECCIÓN DE FECHA Y DÍA (2026-02-10 -> 2026-02-09)
-- ==========================================================

-- 1. Actualizar los fletes registrados hoy (Martes 10) al Lunes 09
UPDATE fletes
SET 
    fecha = '2026-02-09',
    dia = 'Lunes',
    created_at = now() -- Para que aparezcan de primero
WHERE (fecha = '2026-02-10' OR fecha::text LIKE '2026-02-10%')
  AND created_at >= '2026-02-10 00:00:00';

-- 2. Resumen de la verificación
SELECT 
    proveedor, 
    fecha, 
    dia,
    COUNT(*) as total_fletes
FROM fletes
WHERE fecha = '2026-02-09'
  AND created_at >= now() - interval '10 minutes'
GROUP BY proveedor, fecha, dia;
