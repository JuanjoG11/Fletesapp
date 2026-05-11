-- ==========================================================
-- 🚛 NUEVO VEHÍCULO: SXG018 - CARDONA CLAVIJO LEIDY JOHANA
-- Registrado el: 2026-03-27
-- Datos extraídos de la Licencia de Tránsito No. 10030229363
-- Organismo: Instituto de Movilidad de Pereira
-- ==========================================================

-- Datos del vehículo desde la Licencia de Tránsito:
-- Placa:        SXG018
-- Marca:        HINO
-- Línea:        FC9JJTA
-- Modelo:       2016
-- Clase:        CAMIÓN
-- Carrocería:   FURGÓN
-- Combustible:  DIESEL
-- Capacidad:    6400 Kg
-- Servicio:     PÚBLICO
-- No. Motor:    J05ETY11078
-- VIN / Chasis: 9F3FC9JJTGXX10446
-- Cilindrada:   5.123 cc
-- Propietario:  CARDONA CLAVIJO LEIDY JOHANA
-- C.C.:         1088261996
-- Fecha Matrícula: 06/11/2015

INSERT INTO vehiculos (
    placa,
    razon_social,
    contratista,
    doc_contratista,
    titular_contrato,
    -- Datos técnicos del vehículo
    carroceria,
    capacidad,
    servicio,
    licencia_transito,
    -- Contrato activo por defecto
    contrato,
    activo
)
SELECT
    'SXG018'           AS placa,
    rs.nombre          AS razon_social,
    'CARDONA CLAVIJO LEIDY JOHANA' AS contratista,
    '1088261996'       AS doc_contratista,
    'CARDONA CLAVIJO LEIDY JOHANA' AS titular_contrato,
    'FURGON'           AS carroceria,
    '6400'             AS capacidad,
    'PUBLICO'          AS servicio,
    '10030229363'      AS licencia_transito,   -- N° Licencia de Tránsito
    'SI'               AS contrato,
    TRUE               AS activo
FROM (SELECT unnest(ARRAY['TYM', 'TAT']) AS nombre) rs

ON CONFLICT (placa, razon_social) DO UPDATE SET
    contratista      = EXCLUDED.contratista,
    doc_contratista  = EXCLUDED.doc_contratista,
    titular_contrato = EXCLUDED.titular_contrato,
    carroceria       = EXCLUDED.carroceria,
    capacidad        = EXCLUDED.capacidad,
    servicio         = EXCLUDED.servicio,
    licencia_transito = EXCLUDED.licencia_transito,
    contrato         = EXCLUDED.contrato,
    activo           = EXCLUDED.activo;

-- ✅ Verificación post-insert
SELECT
    placa,
    razon_social,
    contratista,
    doc_contratista,
    carroceria,
    capacidad,
    servicio,
    licencia_transito,
    contrato,
    activo
FROM vehiculos
WHERE placa = 'SXG018'
ORDER BY razon_social;
