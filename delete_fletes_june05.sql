/* ==========================================================
   🚮 SCRIPT: Eliminar fletes 05‑Jun‑2026
   Generado: 2026-06-05T18:33:18.879Z
   Uso: ejecutar en la BD (psql/supervisor) para eliminar los
         registros de ALPINA y FLEISCHMANN del 2026-06-05.
   ========================================================== */

BEGIN;

SELECT COUNT(*) AS registros_a_eliminar
FROM fletes
WHERE fecha = '2026-06-05'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

DELETE FROM fletes
WHERE fecha = '2026-06-05'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
RETURNING id, placa, contratista, proveedor, fecha, precio;

COMMIT;
