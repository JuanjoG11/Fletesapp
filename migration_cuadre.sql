/* ==========================================================
   MIGRACIÓN: Campos de cuadre para tabla planillas
   Ejecutar en Supabase SQL Editor
   ==========================================================
   Agrega los campos que usa el modal de cuadre de la cajera:
     - cuadrado_por   → nombre de la cajera que cuadró
     - valor_cuadrado → valor recibido confirmado por la cajera
     - obs_cuadre     → observación opcional al cuadrar
     - fecha_cuadre   → fecha en que se cuadró
   ========================================================== */

ALTER TABLE planillas
    ADD COLUMN IF NOT EXISTS cuadrado_por    TEXT,
    ADD COLUMN IF NOT EXISTS valor_cuadrado  NUMERIC,
    ADD COLUMN IF NOT EXISTS obs_cuadre      TEXT,
    ADD COLUMN IF NOT EXISTS fecha_cuadre    DATE;

-- Índice para consultas rápidas de cuadres por fecha
CREATE INDEX IF NOT EXISTS idx_planillas_fecha_cuadre
    ON planillas (fecha_cuadre DESC)
    WHERE fecha_cuadre IS NOT NULL;

-- Verificar
SELECT
    column_name,
    data_type,
    column_default,
    is_nullable
FROM information_schema.columns
WHERE table_name = 'planillas'
  AND column_name IN ('cuadrado_por','valor_cuadrado','obs_cuadre','fecha_cuadre')
ORDER BY column_name;
