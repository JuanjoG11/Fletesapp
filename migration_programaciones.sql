/* ==========================================================
   MIGRACIÓN: Tabla de Programaciones (pendientes de aprobación)
   Ejecutar en Supabase SQL Editor DESPUÉS de migration_planillas.sql
   ==========================================================
   Flujo:
     1. Programador llena formulario → INSERT en programaciones (estado='PENDIENTE')
     2. Admin revisa → UPDATE estado='APROBADA' → se crea registro en fletes
     3. Admin rechaza → UPDATE estado='RECHAZADA' (con motivo)
   ========================================================== */

-- ===========================================================
-- 1. TABLA: programaciones
-- ===========================================================
CREATE TABLE IF NOT EXISTS programaciones (
    id                          UUID        PRIMARY KEY DEFAULT gen_random_uuid(),

    -- Estado del flujo de aprobación
    estado                      TEXT        NOT NULL DEFAULT 'PENDIENTE'
                                            CHECK (estado IN (
                                                'PENDIENTE',    -- recién creada por el programador
                                                'APROBADA',     -- aprobada por el admin → ya existe en fletes
                                                'RECHAZADA'     -- rechazada por el admin
                                            )),

    -- Datos del flete (mismos campos que tabla fletes)
    placa                       TEXT        NOT NULL,
    contratista                 TEXT,                   -- conductor
    proveedor                   TEXT        NOT NULL,
    zona                        TEXT        NOT NULL,
    dia                         TEXT,
    fecha                       DATE        NOT NULL,
    poblacion                   TEXT        NOT NULL,
    auxiliares                  TEXT,
    auxiliares_extra            TEXT,
    no_auxiliares               INTEGER     DEFAULT 1,
    no_pedidos                  INTEGER     DEFAULT 0,
    valor_ruta                  NUMERIC     DEFAULT 0,
    no_planilla                 TEXT        NOT NULL,
    facturas_seleccionadas      TEXT,       -- lista de facturas separadas por coma
    valor_adicional_negociacion NUMERIC     DEFAULT 0,
    razon_adicional_negociacion TEXT,
    precio                      NUMERIC     DEFAULT 0,  -- total flete calculado
    adicionales                 TEXT        DEFAULT 'No',
    razon_social                TEXT        NOT NULL DEFAULT 'TYM',

    -- Relación con planilla
    planilla_id                 UUID        REFERENCES planillas(id) ON DELETE SET NULL,

    -- Facturas deseleccionadas (quedan pendientes para otra ruta)
    facturas_deseleccionadas    TEXT,       -- IDs separados por coma

    -- Auditoría del programador
    programado_por              TEXT,
    programado_por_id           UUID        REFERENCES auth.users(id) ON DELETE SET NULL,
    created_at                  TIMESTAMPTZ DEFAULT now(),
    updated_at                  TIMESTAMPTZ DEFAULT now(),

    -- Auditoría del admin (aprobación/rechazo)
    revisado_por                TEXT,
    revisado_por_id             UUID        REFERENCES auth.users(id) ON DELETE SET NULL,
    fecha_revision              TIMESTAMPTZ,
    motivo_rechazo              TEXT,

    -- Referencia al flete creado tras aprobación
    flete_id                    UUID        REFERENCES fletes(id) ON DELETE SET NULL
);

-- ===========================================================
-- 2. ÍNDICES
-- ===========================================================
CREATE INDEX IF NOT EXISTS idx_prog_estado
    ON programaciones (estado);

CREATE INDEX IF NOT EXISTS idx_prog_fecha
    ON programaciones (fecha DESC);

CREATE INDEX IF NOT EXISTS idx_prog_placa
    ON programaciones (placa);

CREATE INDEX IF NOT EXISTS idx_prog_planilla
    ON programaciones (planilla_id);

CREATE INDEX IF NOT EXISTS idx_prog_rs
    ON programaciones (razon_social);

-- ===========================================================
-- 3. TRIGGER updated_at
-- ===========================================================
-- La función update_updated_at_column() ya existe desde migration_planillas.sql
-- Solo creamos el trigger para esta tabla

DROP TRIGGER IF EXISTS trg_programaciones_updated_at ON programaciones;
CREATE TRIGGER trg_programaciones_updated_at
    BEFORE UPDATE ON programaciones
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ===========================================================
-- 4. ROW LEVEL SECURITY
-- ===========================================================
ALTER TABLE programaciones ENABLE ROW LEVEL SECURITY;

CREATE POLICY "prog_select" ON programaciones
    FOR SELECT TO authenticated USING (true);

CREATE POLICY "prog_write" ON programaciones
    FOR ALL TO authenticated USING (true) WITH CHECK (true);

-- ===========================================================
-- 5. VERIFICACIÓN
-- ===========================================================
SELECT
    column_name,
    data_type,
    column_default
FROM information_schema.columns
WHERE table_name = 'programaciones'
ORDER BY ordinal_position;
