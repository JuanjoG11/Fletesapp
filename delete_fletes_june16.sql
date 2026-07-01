/* ==========================================================
   🚮 SCRIPT: Eliminar fletes 16‑Jun‑2026
   Generado: 2026-06-16T20:50:08.951Z
   Uso: ejecutar en la BD (psql/supervisor) para eliminar los
          registros de ALPINA y FLEISCHMANN del 2026-06-16.
   ========================================================== */

BEGIN;

SELECT COUNT(*) AS registros_a_eliminar
FROM fletes
WHERE fecha = '2026-06-16'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

DELETE FROM fletes
WHERE fecha = '2026-06-16'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
RETURNING id, placa, contratista, proveedor, fecha, precio;

COMMIT;
