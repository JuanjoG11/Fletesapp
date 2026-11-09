-- ==========================================================
-- MIGRACIÓN: Agregar estado 'eliminado' a la tabla vehiculos
-- Fecha: 2026-11-09
-- Descripción: Extiende el constraint de estado_vehiculo para
--              soportar soft-delete ('eliminado'). Los vehículos
--              eliminados se ocultan de todas las listas pero
--              conservan integridad referencial con fletes históricos.
-- ==========================================================

-- 1. Eliminar constraint anterior y recrearlo con el nuevo valor
ALTER TABLE vehiculos
    DROP CONSTRAINT IF EXISTS vehiculos_estado_vehiculo_check;

ALTER TABLE vehiculos
    ADD CONSTRAINT vehiculos_estado_vehiculo_check
        CHECK (estado_vehiculo IN ('activo', 'inactivo', 'temporal', 'eliminado'));

-- 2. Verificación: mostrar conteo por estado
SELECT
    estado_vehiculo,
    COUNT(*) AS total
FROM vehiculos
GROUP BY estado_vehiculo
ORDER BY estado_vehiculo;
