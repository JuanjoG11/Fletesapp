/* ==========================================================
   MIGRACIÓN: Quitar estado POR DESPACHAR de planillas
   Ejecutar en Supabase SQL Editor
   ========================================================== */

-- 1. Mover planillas que estén en POR DESPACHAR a DESPACHADA
UPDATE planillas
SET estado = 'DESPACHADA'
WHERE estado = 'POR DESPACHAR';

-- 2. Actualizar el CHECK constraint sin POR DESPACHAR
ALTER TABLE planillas DROP CONSTRAINT IF EXISTS planillas_estado_check;
ALTER TABLE planillas
    ADD CONSTRAINT planillas_estado_check
    CHECK (estado IN ('TRANSITORIA', 'DESPACHADA', 'CUADRADA'));

-- 3. Verificar
SELECT estado, COUNT(*) FROM planillas GROUP BY estado ORDER BY estado;
