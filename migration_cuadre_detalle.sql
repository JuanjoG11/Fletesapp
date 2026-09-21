/* ==========================================================
   MIGRACIÓN: Campos de desglose para cuadre de caja diario
   Archivo:   migration_cuadre_detalle.sql
   Seguridad: usa ADD COLUMN IF NOT EXISTS — 100% no destructivo.
              Si la columna ya existe, la instrucción no hace nada.
   Ejecutar en: Supabase SQL Editor
   ========================================================== */

ALTER TABLE planillas
    -- Medios de pago en efectivo/especie
    ADD COLUMN IF NOT EXISTS cuadre_efectivo            NUMERIC DEFAULT 0,
    ADD COLUMN IF NOT EXISTS cuadre_monedas             NUMERIC DEFAULT 0,
    ADD COLUMN IF NOT EXISTS cuadre_credito             NUMERIC DEFAULT 0,
    ADD COLUMN IF NOT EXISTS cuadre_sobrante_caja       NUMERIC DEFAULT 0,

    -- Consignaciones
    ADD COLUMN IF NOT EXISTS cuadre_consignaciones      NUMERIC DEFAULT 0,
    ADD COLUMN IF NOT EXISTS cuadre_consignaciones_alpina NUMERIC DEFAULT 0,
    ADD COLUMN IF NOT EXISTS cuadre_no_consignaciones   TEXT,          -- ej: "7C", "5C"

    -- Descuentos / retenciones
    ADD COLUMN IF NOT EXISTS cuadre_devolucion          NUMERIC DEFAULT 0,
    ADD COLUMN IF NOT EXISTS cuadre_vales               NUMERIC DEFAULT 0,
    ADD COLUMN IF NOT EXISTS cuadre_descuento_nomina    NUMERIC DEFAULT 0,
    ADD COLUMN IF NOT EXISTS cuadre_retefuente          NUMERIC DEFAULT 0,

    -- Ajustes
    ADD COLUMN IF NOT EXISTS cuadre_ajuste_peso         NUMERIC DEFAULT 0,   -- ajuste al peso (negativo = faltante)
    ADD COLUMN IF NOT EXISTS cuadre_ajuste_peso_ing     NUMERIC DEFAULT 0,   -- ajuste al peso ingreso
    ADD COLUMN IF NOT EXISTS cuadre_otros_gastos        NUMERIC DEFAULT 0,

    -- Planilla transitoria relacionada
    ADD COLUMN IF NOT EXISTS cuadre_planilla_transitoria TEXT,
    ADD COLUMN IF NOT EXISTS cuadre_fact_transitoria     TEXT,

    -- Tipo de cuadre: 'MANUAL' | 'SISTEMA' (para la columna CUADRE del Excel)
    ADD COLUMN IF NOT EXISTS cuadre_tipo                TEXT DEFAULT 'MANUAL',

    -- Campo libre adicional (columna SEPTIEMBRE / mes en el Excel = número de mes o semana)
    ADD COLUMN IF NOT EXISTS cuadre_periodo             TEXT;

-- Índice para facilitar consultas de cuadre detallado por fecha
CREATE INDEX IF NOT EXISTS idx_planillas_cuadre_tipo
    ON planillas (cuadre_tipo)
    WHERE cuadre_tipo IS NOT NULL;

-- ==========================================================
--  VERIFICACIÓN — ejecutar para confirmar columnas creadas
-- ==========================================================
SELECT column_name, data_type, column_default
FROM information_schema.columns
WHERE table_name = 'planillas'
  AND column_name LIKE 'cuadre_%'
ORDER BY ordinal_position;
