-- ==========================================================
-- �️ CORRECCIÓN TAT SEGURA: RESTAURAR MARTES 10 DE FEBRERO
-- ==========================================================
-- Este script devuelve los fletes de TAT a Martes 10,
-- pero SOLO afecta a los que fueron creados HOY (10 de Feb).
-- Los que se crearon ayer (Lunes 09) NO se tocarán.

UPDATE fletes
SET 
    fecha = '2026-02-10',
    dia = 'Martes'
WHERE 
    razon_social = 'TAT' 
    AND fecha = '2026-02-09'
    AND created_at >= '2026-02-10 00:00:00'; -- Solo lo registrado hoy

-- Verificación de seguridad
SELECT 
    razon_social,
    fecha, 
    dia,
    COUNT(*) as total,
    MIN(created_at) as primer_registro_hoy
FROM fletes
WHERE (fecha = '2026-02-09' OR fecha = '2026-02-10')
  AND created_at >= '2026-02-10 00:00:00'
GROUP BY razon_social, fecha, dia;
