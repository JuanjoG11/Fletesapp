/* ==========================================================
   MIGRACIÓN: Agregar campo planillas_ids a tabla programaciones
   Ejecutar en Supabase SQL Editor
   ==========================================================
   Guarda los IDs de TODAS las planillas del flete (no solo la
   primera) para que al aprobar se marquen TODAS como DESPACHADA.
   ========================================================== */

ALTER TABLE programaciones
    ADD COLUMN IF NOT EXISTS planillas_ids TEXT;
-- Formato: UUID separados por coma  "id1,id2,id3"
-- Columna planilla_id se conserva para compatibilidad con registros previos.

-- Índice útil para buscar programaciones por cualquiera de sus planillas
-- (búsqueda LIKE no usa índice B-tree, pero es suficiente para el volumen actual)
COMMENT ON COLUMN programaciones.planillas_ids IS
    'CSV de UUIDs de todas las planillas incluidas en el flete. Si es NULL, usar planilla_id.';

-- Verificar
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'programaciones'
  AND column_name IN ('planilla_id', 'planillas_ids')
ORDER BY column_name;
