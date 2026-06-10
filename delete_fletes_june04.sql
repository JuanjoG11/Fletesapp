/* ==========================================================
   🚮 SCRIPT: Eliminar fletes 04‑Jun‑2026
   Generado: 2026-06-04
   Uso: ejecutar en la BD (psql/supervisor) para eliminar los
         registros de ALPINA y FLEISCHMANN del 2026-06-04.
   ========================================================== */

-- Inicia transacción
BEGIN;

-- Vista previa: cuántos registros se eliminarían
SELECT COUNT(*) AS registros_a_eliminar
FROM fletes
WHERE fecha = '2026-06-04'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

-- Si la cuenta es correcta, ejecutar el borrado y devolver filas eliminadas
DELETE FROM fletes
WHERE fecha = '2026-06-04'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
RETURNING id, placa, contratista, proveedor, fecha, precio;

-- Confirma la operación
COMMIT;

-- Nota: si quieres sólo probar, reemplaza COMMIT por ROLLBACK.
