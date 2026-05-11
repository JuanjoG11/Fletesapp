-- ==========================================================
-- 🔍 AUDITORÍA DE DUPLICADOS - ABRIL 2026
-- Busca placas que tengan más de un flete el mismo día
-- ==========================================================

SELECT 
    placa, 
    fecha, 
    COUNT(*) as total_fletes,
    STRING_AGG(proveedor, ' / ') as empresas,
    STRING_AGG(poblacion, ' / ') as destinos,
    SUM(precio) as valor_total_dia,
    STRING_AGG(
        COALESCE(CAST(valor_adicional_negociacion AS TEXT), '0'), 
        ' + '
    ) as valores_negociacion,
    STRING_AGG(
        COALESCE(razon_adicional_negociacion, 'Sin motivo'), 
        ' | '
    ) as motivos_negociacion
FROM fletes
WHERE fecha >= '2026-04-01' AND fecha <= '2026-04-30'
GROUP BY placa, fecha
HAVING COUNT(*) > 1
ORDER BY fecha DESC, total_fletes DESC;

-- NOTA: Si ves registros duplicados con la misma placa, fecha y proveedor, 
-- podría ser un error de dedo al ingresar el flete dos veces.
-- Si son proveedores diferentes, puede que el vehículo haya hecho dos viajes distintos.
