-- ==========================================================
-- 🔄 ACTUALIZACIÓN VEHÍCULO: SXG018 — TYM (ALPINA)
-- Fecha: 2026-03-27
-- Datos extraídos de Licencia de Tránsito No. 10030229363
-- Propietario: CARDONA CLAVIJO LEIDY JOHANA — C.C. 1088261996
-- Organismo: Instituto de Movilidad de Pereira
-- ==========================================================

UPDATE vehiculos
SET
    proveedor         = 'ALPINA',
    contratista       = 'CARDONA CLAVIJO LEIDY JOHANA',
    doc_contratista   = '1088261996',
    titular_contrato  = 'CARDONA CLAVIJO LEIDY JOHANA',
    carroceria        = 'FURGON',
    capacidad         = '6400',
    servicio          = 'PUBLICO',
    licencia_transito = '10030229363',
    contrato          = 'SI',
    activo            = TRUE
WHERE placa        = 'SXG018'
  AND razon_social = 'TYM';

-- ✅ Verificación
SELECT
    placa,
    razon_social,
    proveedor,
    contratista,
    doc_contratista,
    titular_contrato,
    carroceria,
    capacidad,
    servicio,
    licencia_transito,
    contrato,
    activo
FROM vehiculos
WHERE placa = 'SXG018'
  AND razon_social = 'TYM';
