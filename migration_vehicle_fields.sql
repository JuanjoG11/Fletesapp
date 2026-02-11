-- ==========================================================
-- 🛠️ MIGRACIÓN: AMPLIACIÓN DE INFORMACIÓN DE VEHÍCULOS
-- ==========================================================
-- Este script añade campos detallados para conductores y documentos.

ALTER TABLE vehiculos 
ADD COLUMN IF NOT EXISTS doc_contratista TEXT,
ADD COLUMN IF NOT EXISTS cedula_conductor TEXT,
ADD COLUMN IF NOT EXISTS telefono_conductor TEXT,
ADD COLUMN IF NOT EXISTS titular_contrato TEXT,
ADD COLUMN IF NOT EXISTS licencia_transito TEXT,
ADD COLUMN IF NOT EXISTS soat_vencimiento DATE,
ADD COLUMN IF NOT EXISTS tecnomecanica_vencimiento DATE,
ADD COLUMN IF NOT EXISTS inspeccion_sanitaria_vencimiento DATE,
ADD COLUMN IF NOT EXISTS fumigacion_vencimiento DATE,
ADD COLUMN IF NOT EXISTS carnet_bpm_vencimiento DATE,
ADD COLUMN IF NOT EXISTS licencia_conduccion_vencimiento DATE,
ADD COLUMN IF NOT EXISTS num_licencia_conduccion TEXT,
ADD COLUMN IF NOT EXISTS arl_afiliacion TEXT,
ADD COLUMN IF NOT EXISTS examenes_medicos_vencimiento DATE,
ADD COLUMN IF NOT EXISTS eps_afiliacion TEXT;

COMMENT ON COLUMN vehiculos.doc_contratista IS 'Documento del contratista';
COMMENT ON COLUMN vehiculos.cedula_conductor IS 'Cédula del conductor';
COMMENT ON COLUMN vehiculos.telefono_conductor IS 'Teléfono de contacto del conductor';
COMMENT ON COLUMN vehiculos.titular_contrato IS 'Titular del contrato';
COMMENT ON COLUMN vehiculos.licencia_transito IS 'Número o datos de la licencia de tránsito';
COMMENT ON COLUMN vehiculos.soat_vencimiento IS 'Fecha de vencimiento del SOAT';
COMMENT ON COLUMN vehiculos.tecnomecanica_vencimiento IS 'Fecha de vencimiento de la tecnomecánica';
COMMENT ON COLUMN vehiculos.inspeccion_sanitaria_vencimiento IS 'Fecha de vencimiento de la inspección sanitaria';
COMMENT ON COLUMN vehiculos.fumigacion_vencimiento IS 'Fecha de vencimiento del certificado de fumigación';
COMMENT ON COLUMN vehiculos.carnet_bpm_vencimiento IS 'Fecha de vencimiento del carnet BPM';
COMMENT ON COLUMN vehiculos.licencia_conduccion_vencimiento IS 'Fecha de vencimiento de la licencia de conducción';
COMMENT ON COLUMN vehiculos.num_licencia_conduccion IS 'Número de la licencia de conducción';
COMMENT ON COLUMN vehiculos.arl_afiliacion IS 'Información de afiliación ARL';
COMMENT ON COLUMN vehiculos.examenes_medicos_vencimiento IS 'Fecha de vencimiento de exámenes médicos';
COMMENT ON COLUMN vehiculos.eps_afiliacion IS 'Información de afiliación EPS';
