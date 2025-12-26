-- ============================================================
-- MIGRACIÓN: Agregar Adicionales por Negociación
-- Fecha: 2025-12-26
-- Descripción: Agrega campos para registrar valores adicionales
--              negociados que se suman al total del flete
-- ============================================================

-- 1. Agregar columnas a la tabla fletes
ALTER TABLE fletes 
ADD COLUMN IF NOT EXISTS valor_adicional_negociacion DECIMAL(10,2) DEFAULT 0,
ADD COLUMN IF NOT EXISTS razon_adicional_negociacion TEXT;

-- 2. Verificar que las columnas se crearon correctamente
SELECT 
    column_name, 
    data_type, 
    is_nullable, 
    column_default
FROM information_schema.columns
WHERE table_name = 'fletes' 
  AND column_name IN ('valor_adicional_negociacion', 'razon_adicional_negociacion')
ORDER BY ordinal_position;

-- Resultado esperado:
-- valor_adicional_negociacion | numeric | YES | 0
-- razon_adicional_negociacion | text    | YES | NULL
