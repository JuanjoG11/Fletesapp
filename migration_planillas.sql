/* ==========================================================
   MIGRACIÓN: Módulo de Gestión de Planillas
   Ejecutar en Supabase SQL Editor
   ==========================================================
   Crea:
     1. tabla  planillas          — cabecera de cada planilla
     2. tabla  planilla_facturas  — detalle de facturas por planilla
     3. índices de búsqueda
     4. Trigger updated_at automático
   ========================================================== */

-- ===========================================================
-- 1. TABLA PRINCIPAL: planillas
-- ===========================================================
CREATE TABLE IF NOT EXISTS planillas (
    id                  UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
    no_planilla         TEXT        NOT NULL,
    fecha               DATE        NOT NULL,
    zona                TEXT,                           -- Zona de la planilla ej: M9552
    proveedor           TEXT        NOT NULL DEFAULT 'ALPINA',
    estado              TEXT        NOT NULL DEFAULT 'TRANSITORIA'
                                    CHECK (estado IN (
                                        'TRANSITORIA',
                                        'POR DESPACHAR',
                                        'DESPACHADA',
                                        'CUADRADA'
                                    )),
    total_facturas      INTEGER     DEFAULT 0,
    valor_bruto_total   NUMERIC     DEFAULT 0,
    valor_factura_total NUMERIC     DEFAULT 0,
    valor_total         NUMERIC     DEFAULT 0,
    razon_social        TEXT        NOT NULL DEFAULT 'TYM',

    -- Campos de programación (llenados por usuario 'programador')
    flete_id            UUID        REFERENCES fletes(id) ON DELETE SET NULL,
    placa               TEXT,
    conductor           TEXT,
    fecha_programacion  DATE,
    programado_por      TEXT,       -- nombre del usuario programador

    -- Auditoría
    cargado_por         TEXT,       -- nombre del usuario que subió el Excel
    created_by          UUID        REFERENCES auth.users(id) ON DELETE SET NULL,
    created_at          TIMESTAMPTZ DEFAULT now(),
    updated_at          TIMESTAMPTZ DEFAULT now()
);

-- ===========================================================
-- 2. TABLA DETALLE: planilla_facturas
-- ===========================================================
CREATE TABLE IF NOT EXISTS planilla_facturas (
    id              UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
    planilla_id     UUID        NOT NULL REFERENCES planillas(id) ON DELETE CASCADE,
    no_factura      TEXT        NOT NULL,
    fecha_entrega   DATE,
    zona            TEXT,
    valor_bruto     NUMERIC     DEFAULT 0,
    valor_factura   NUMERIC     DEFAULT 0,
    valor_total     NUMERIC     DEFAULT 0,
    -- Estado de la factura (puede quedar suelta si la desasignan de la planilla)
    asignada        BOOLEAN     DEFAULT true,   -- false = factura suelta/desasignada
    razon_social    TEXT        NOT NULL DEFAULT 'TYM',
    created_at      TIMESTAMPTZ DEFAULT now()
);

-- ===========================================================
-- 3. ÍNDICES
-- ===========================================================
CREATE INDEX IF NOT EXISTS idx_planillas_fecha
    ON planillas (fecha DESC);

CREATE INDEX IF NOT EXISTS idx_planillas_estado
    ON planillas (estado);

CREATE INDEX IF NOT EXISTS idx_planillas_rs
    ON planillas (razon_social);

CREATE INDEX IF NOT EXISTS idx_planillas_no_planilla
    ON planillas (no_planilla);

CREATE INDEX IF NOT EXISTS idx_pf_planilla_id
    ON planilla_facturas (planilla_id);

CREATE INDEX IF NOT EXISTS idx_pf_no_factura
    ON planilla_facturas (no_factura);

CREATE INDEX IF NOT EXISTS idx_pf_asignada
    ON planilla_facturas (asignada);

-- ===========================================================
-- 4. TRIGGER: actualizar updated_at automáticamente
-- ===========================================================
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_planillas_updated_at ON planillas;
CREATE TRIGGER trg_planillas_updated_at
    BEFORE UPDATE ON planillas
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ===========================================================
-- 5. ROW LEVEL SECURITY (RLS)
-- ===========================================================
ALTER TABLE planillas         ENABLE ROW LEVEL SECURITY;
ALTER TABLE planilla_facturas ENABLE ROW LEVEL SECURITY;

-- Política: usuarios autenticados ven solo su razon_social
-- (usa la función ya existente que lee el perfil del usuario)
-- Nota: ajusta el nombre de la función si difiere en tu proyecto

-- planillas: lectura
CREATE POLICY "planillas_select" ON planillas
    FOR SELECT TO authenticated
    USING (true);   -- El filtro de empresa se hace en JS (igual que fletes)

-- planillas: insert/update/delete
CREATE POLICY "planillas_write" ON planillas
    FOR ALL TO authenticated
    USING (true)
    WITH CHECK (true);

-- planilla_facturas: lectura
CREATE POLICY "pf_select" ON planilla_facturas
    FOR SELECT TO authenticated
    USING (true);

-- planilla_facturas: insert/update/delete
CREATE POLICY "pf_write" ON planilla_facturas
    FOR ALL TO authenticated
    USING (true)
    WITH CHECK (true);

-- ===========================================================
-- 6. VERIFICACIÓN
-- ===========================================================
SELECT
    table_name,
    column_name,
    data_type,
    column_default
FROM information_schema.columns
WHERE table_name IN ('planillas', 'planilla_facturas')
ORDER BY table_name, ordinal_position;
