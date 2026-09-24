-- ==========================================================
-- MIGRACIÓN: Agregar columna estado_vehiculo a la tabla vehiculos
-- Fecha: 2026-09-24
-- Descripción: Agrega soporte para el estado "temporal" además
--              de activo/inactivo. Mantiene retrocompatibilidad
--              con el campo booleano `activo` existente.
-- ==========================================================

-- 1. Agregar columna estado_vehiculo con constraint de valores válidos
ALTER TABLE vehiculos
ADD COLUMN IF NOT EXISTS estado_vehiculo TEXT
    CHECK (estado_vehiculo IN ('activo', 'inactivo', 'temporal'))
    DEFAULT 'activo';

-- 2. Poblar la columna según el valor actual del campo booleano `activo`
--    para que los registros existentes queden consistentes
UPDATE vehiculos
SET estado_vehiculo = CASE
    WHEN activo = TRUE  THEN 'activo'
    WHEN activo = FALSE THEN 'inactivo'
    ELSE 'activo'
END
WHERE estado_vehiculo IS NULL OR estado_vehiculo = 'activo';

-- 3. Hacer la columna NOT NULL ahora que todos los registros tienen valor
ALTER TABLE vehiculos
ALTER COLUMN estado_vehiculo SET NOT NULL;

-- 4. Crear índice para consultas de filtrado por estado (rendimiento)
CREATE INDEX IF NOT EXISTS idx_vehiculos_estado
    ON vehiculos (estado_vehiculo, razon_social);

-- 5. Verificación: mostrar conteo por estado después de la migración
SELECT
    estado_vehiculo,
    COUNT(*) AS total
FROM vehiculos
GROUP BY estado_vehiculo
ORDER BY estado_vehiculo;
