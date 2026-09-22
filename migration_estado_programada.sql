/* ==========================================================
   MIGRACIÓN: Agregar estado PROGRAMADA a tabla planillas
   ──────────────────────────────────────────────────────────
   Flujo nuevo:
     TRANSITORIA → PROGRAMADA → DESPACHADA → CUADRADA

   PROGRAMADA: el programador asignó placa + conductor,
               pero el camión aún no ha salido físicamente.
   DESPACHADA: el camión ya salió — la cajera puede cuadrar.
   ========================================================== */

-- 1. Actualizar el CHECK constraint para incluir PROGRAMADA
ALTER TABLE planillas DROP CONSTRAINT IF EXISTS planillas_estado_check;
ALTER TABLE planillas
    ADD CONSTRAINT planillas_estado_check
    CHECK (estado IN ('TRANSITORIA', 'PROGRAMADA', 'DESPACHADA', 'CUADRADA'));

-- 2. Índice para consultas por el nuevo estado
CREATE INDEX IF NOT EXISTS idx_planillas_estado_prog
    ON planillas (estado)
    WHERE estado = 'PROGRAMADA';

-- 3. Verificar
SELECT estado, COUNT(*) AS total
FROM planillas
GROUP BY estado
ORDER BY
    CASE estado
        WHEN 'TRANSITORIA' THEN 1
        WHEN 'PROGRAMADA'  THEN 2
        WHEN 'DESPACHADA'  THEN 3
        WHEN 'CUADRADA'    THEN 4
    END;
