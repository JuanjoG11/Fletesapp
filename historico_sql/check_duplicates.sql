-- ==========================================================
-- 🔍 DIAGNÓSTICO COMPLETO DE DUPLICACIÓN EN REPORTE
-- ==========================================================

-- 1. BUSCAR ZONAS QUE APARECEN MÚLTIPLES VECES HOY
-- Esto mostrará si hay zonas repetidas (ej: MNEJ1300-TSS aparece 2 veces)
SELECT zona, COUNT(*) as veces_aparece, 
       STRING_AGG(DISTINCT contratista, ', ') as conductores,
       STRING_AGG(DISTINCT no_planilla, ', ') as planillas
FROM fletes
WHERE created_at >= '2026-02-10 00:00:00'
  AND proveedor IN ('UNILEVER', 'FAMILIA', 'UNILEVER-FAMILIA')
GROUP BY zona
HAVING COUNT(*) > 1
ORDER BY veces_aparece DESC;

-- 2. VER TODOS LOS FLETES DE HOY ORDENADOS POR ZONA
-- Para comparar con el PDF y ver qué está duplicado
SELECT zona, no_planilla, facturas_adicionales, contratista, auxiliares, 
       no_pedidos, valor_ruta, created_at
FROM fletes
WHERE created_at >= '2026-02-10 00:00:00'
  AND proveedor IN ('UNILEVER', 'FAMILIA', 'UNILEVER-FAMILIA')
ORDER BY zona, created_at;

-- 3. BUSCAR PLANILLAS IDÉNTICAS EN COLUMNAS DIFERENTES
-- (Cuando no_planilla = facturas_adicionales)
SELECT id, zona, no_planilla, facturas_adicionales, contratista
FROM fletes
WHERE created_at >= '2026-02-10 00:00:00'
  AND no_planilla = facturas_adicionales
  AND no_planilla IS NOT NULL;

-- 4. CONTAR TOTAL DE FLETES HOY POR PROVEEDOR
SELECT proveedor, COUNT(*) as total
FROM fletes
WHERE created_at >= '2026-02-10 00:00:00'
GROUP BY proveedor
ORDER BY total DESC;
