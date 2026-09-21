/* ==========================================================
   MIGRACIÓN: Campos de descuentos por conductor en tabla fletes
   Ejecutar en: Supabase SQL Editor
   Descripción: Agrega tres tipos de descuento que se aplican
                al momento del pago del flete al conductor:
                - Retención en la fuente
                - Descuento de seguridad (seguro de carga / SOAT)
                - Vales (anticipos descontados al pago)
   Seguridad: ADD COLUMN IF NOT EXISTS — no destructivo.
   ========================================================== */

ALTER TABLE fletes
    ADD COLUMN IF NOT EXISTS desc_retencion  NUMERIC DEFAULT 0,  -- Retención en la fuente
    ADD COLUMN IF NOT EXISTS desc_seguridad  NUMERIC DEFAULT 0,  -- Descuento seguridad / seguro
    ADD COLUMN IF NOT EXISTS desc_vales      NUMERIC DEFAULT 0;  -- Vales / anticipos descontados

-- Índice para consultas que filtren por descuentos > 0
CREATE INDEX IF NOT EXISTS idx_fletes_desc_retencion ON fletes (desc_retencion) WHERE desc_retencion > 0;
CREATE INDEX IF NOT EXISTS idx_fletes_desc_vales     ON fletes (desc_vales)     WHERE desc_vales > 0;

-- ==========================================================
--  VERIFICACIÓN — ejecutar para confirmar columnas creadas
-- ==========================================================
SELECT column_name, data_type, column_default
FROM information_schema.columns
WHERE table_name = 'fletes'
  AND column_name IN ('desc_retencion', 'desc_seguridad', 'desc_vales')
ORDER BY column_name;
