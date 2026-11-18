/* ==========================================================
   🔍 DIAGNÓSTICO: Días de noviembre sin flete
      para placas específicas
   
   Placas a revisar: TRF860, SXE499, TRK507
   Mes:              Noviembre 2026
   
   Resultado: una fila por cada (placa, día) donde
   NO existe ningún flete registrado en la tabla `fletes`.
   ========================================================== */

/* ----------------------------------------------------------
   1️⃣  Generar todos los días hábiles de noviembre
       (lunes a sábado — ajusta el filtro si trabajas domingos)
   ---------------------------------------------------------- */
WITH dias_nov AS (
  SELECT generate_series(
    '2026-11-01'::date,
    '2026-11-30'::date,
    '1 day'::interval
  )::date AS fecha
),

/* ----------------------------------------------------------
   2️⃣  Excluir domingos (DOW = 0)
       Comenta esta línea si también trabajas domingos.
   ---------------------------------------------------------- */
dias_laborales AS (
  SELECT fecha
  FROM dias_nov
  WHERE EXTRACT(DOW FROM fecha) != 0   -- 0 = domingo
),

/* ----------------------------------------------------------
   3️⃣  Cruce de cada placa con cada día laboral
   ---------------------------------------------------------- */
placas(placa) AS (
  VALUES ('TRF860'), ('SXE499'), ('TRK507')
),

cruce AS (
  SELECT p.placa, d.fecha
  FROM placas p
  CROSS JOIN dias_laborales d
),

/* ----------------------------------------------------------
   4️⃣  Fletes existentes en noviembre para esas placas
   ---------------------------------------------------------- */
fletes_nov AS (
  SELECT DISTINCT placa, fecha
  FROM fletes
  WHERE fecha >= '2026-11-01'
    AND fecha <= '2026-11-30'
    AND placa IN ('TRF860', 'SXE499', 'TRK507')
)

/* ----------------------------------------------------------
   5️⃣  Resultado: combinaciones sin flete registrado
   ---------------------------------------------------------- */
SELECT
  c.placa,
  c.fecha,
  TO_CHAR(c.fecha, 'Day') AS dia_semana,
  CASE
    WHEN v.placa IS NULL THEN '⚠️  placa no existe en vehiculos'
    ELSE '❌  sin flete'
  END AS estado
FROM cruce c
LEFT JOIN fletes_nov f
  ON f.placa = c.placa AND f.fecha = c.fecha
LEFT JOIN vehiculos v
  ON v.placa = c.placa AND v.razon_social = 'TYM'
WHERE f.fecha IS NULL   -- días sin flete
ORDER BY c.placa, c.fecha;


/* ----------------------------------------------------------
   ALTERNATIVA: resumen por placa (cuántos días faltan)
   Descomenta si prefieres un conteo rápido.
   ---------------------------------------------------------- */
/*
WITH dias_nov AS (
  SELECT generate_series('2026-11-01'::date,'2026-11-30'::date,'1 day'::interval)::date AS fecha
),
dias_laborales AS (
  SELECT fecha FROM dias_nov WHERE EXTRACT(DOW FROM fecha) != 0
),
placas(placa) AS (VALUES ('TRF860'),('SXE499'),('TRK507')),
cruce AS (SELECT p.placa, d.fecha FROM placas p CROSS JOIN dias_laborales d),
fletes_nov AS (
  SELECT DISTINCT placa, fecha FROM fletes
  WHERE fecha BETWEEN '2026-11-01' AND '2026-11-30'
    AND placa IN ('TRF860','SXE499','TRK507')
)
SELECT
  c.placa,
  COUNT(*) AS dias_laborales_total,
  COUNT(f.fecha) AS dias_con_flete,
  COUNT(*) - COUNT(f.fecha) AS dias_sin_flete
FROM cruce c
LEFT JOIN fletes_nov f ON f.placa = c.placa AND f.fecha = c.fecha
GROUP BY c.placa
ORDER BY c.placa;
*/
