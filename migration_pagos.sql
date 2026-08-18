/* ==========================================================
   MIGRACIÓN: Agregar campos de estado de pago a tabla fletes
   Ejecutar en Supabase SQL Editor
   ========================================================== */

-- 1. Agregar columnas de pago
ALTER TABLE fletes
  ADD COLUMN IF NOT EXISTS estado_pago  TEXT    NOT NULL DEFAULT 'PENDIENTE'
                                        CHECK (estado_pago IN ('PENDIENTE','PAGADO')),
  ADD COLUMN IF NOT EXISTS fecha_pago   DATE,
  ADD COLUMN IF NOT EXISTS pagado_por   TEXT;   -- nombre del usuario que marcó el pago

-- 2. Índice para consultas rápidas por estado
CREATE INDEX IF NOT EXISTS idx_fletes_estado_pago ON fletes (estado_pago);
CREATE INDEX IF NOT EXISTS idx_fletes_fecha_pago  ON fletes (fecha_pago);

-- Verificar
SELECT column_name, data_type, column_default
FROM information_schema.columns
WHERE table_name = 'fletes'
  AND column_name IN ('estado_pago','fecha_pago','pagado_por')
ORDER BY column_name;
