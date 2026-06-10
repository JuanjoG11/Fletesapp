-- Identificar fletes de ALPINA sin registro en la tabla `vehiculos`
-- Uso:
--  psql -d <db> -f scripts/check_alpina_missing_vehiculos.sql

-- 1) Todos los fletes de ALPINA que no tienen placa en `vehiculos`
SELECT f.fecha, f.placa, f.contratista, f.proveedor, f.precio, f.no_pedidos
FROM fletes f
LEFT JOIN vehiculos v ON f.placa = v.placa
WHERE f.proveedor = 'ALPINA' AND v.placa IS NULL
ORDER BY f.fecha DESC, f.placa;

-- 2) Ejemplo: fletes de una fecha concreta (descomenta y modifica la fecha)
-- SELECT f.fecha, f.placa, f.contratista, f.proveedor, f.precio, f.no_pedidos
-- FROM fletes f
-- LEFT JOIN vehiculos v ON f.placa = v.placa
-- WHERE f.proveedor = 'ALPINA' AND f.fecha = '2026-05-29' AND v.placa IS NULL
-- ORDER BY f.placa;
