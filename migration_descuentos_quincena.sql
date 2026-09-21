/* ==========================================================
   MIGRACIÓN: Tabla de descuentos globales por placa/quincena
   ──────────────────────────────────────────────────────────
   Contexto:
     - La RETENCIÓN (2%) se aplica flete a flete → ya está en
       la tabla `fletes` como `desc_retencion`.
     - La SEGURIDAD y los VALES son un valor único por placa
       en cada quincena → se almacenan aquí.
   
   Periodo: string con formato 'YYYY-MM-Q1' o 'YYYY-MM-Q2'
     Ej: '2026-09-Q1' = primera quincena de septiembre 2026
         '2026-09-Q2' = segunda quincena de septiembre 2026
   ========================================================== */

CREATE TABLE IF NOT EXISTS descuentos_quincena (
    id          UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
    placa       TEXT        NOT NULL,
    periodo     TEXT        NOT NULL,          -- 'YYYY-MM-Q1' | 'YYYY-MM-Q2'
    seguridad   NUMERIC     NOT NULL DEFAULT 0,
    vales       NUMERIC     NOT NULL DEFAULT 0,
    registrado_por  TEXT,
    created_at  TIMESTAMPTZ DEFAULT now(),
    updated_at  TIMESTAMPTZ DEFAULT now(),

    -- Un solo registro por placa por quincena
    CONSTRAINT uq_descuento_placa_periodo UNIQUE (placa, periodo)
);

-- Índices para búsquedas frecuentes
CREATE INDEX IF NOT EXISTS idx_dq_placa   ON descuentos_quincena (placa);
CREATE INDEX IF NOT EXISTS idx_dq_periodo ON descuentos_quincena (periodo);

-- Trigger para actualizar updated_at automáticamente
CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_dq_updated_at ON descuentos_quincena;
CREATE TRIGGER trg_dq_updated_at
    BEFORE UPDATE ON descuentos_quincena
    FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- RLS: acceso público de lectura (el portal del conductor la lee sin auth)
ALTER TABLE descuentos_quincena ENABLE ROW LEVEL SECURITY;

CREATE POLICY IF NOT EXISTS "Lectura pública descuentos_quincena"
    ON descuentos_quincena FOR SELECT
    USING (true);

CREATE POLICY IF NOT EXISTS "Escritura autenticada descuentos_quincena"
    ON descuentos_quincena FOR ALL
    USING (auth.role() = 'authenticated');

-- Verificar
SELECT column_name, data_type, column_default
FROM information_schema.columns
WHERE table_name = 'descuentos_quincena'
ORDER BY ordinal_position;
