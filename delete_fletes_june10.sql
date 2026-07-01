/* ==========================================================
   🚮 SCRIPT: Eliminar fletes 10‑Jun‑2026
   Generado: 2026-06-11T19:40:04.588Z
   Uso: ejecutar en la BD (psql/supervisor) para eliminar los
          registros de ALPINA y FLEISCHMANN del 2026-06-10.
   ========================================================== */

BEGIN;

SELECT COUNT(*) AS registros_a_eliminar
FROM fletes
WHERE fecha = '2026-06-10'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

DELETE FROM fletes
WHERE fecha = '2026-06-10'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
RETURNING id, placa, contratista, proveedor, fecha, precio;

COMMIT;
