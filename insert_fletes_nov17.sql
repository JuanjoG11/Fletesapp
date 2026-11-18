/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 17 NOVIEMBRE 2026
   Generado: 2026-11-17

   ✅ REGLAS:
     - contratista  = vehiculos.conductor (nombre real en BD)
     - valor_ruta   = T VALOR de la programación (total AP+FEP)
     - precio       = precio de lista (sin adicionales en este caso)
     - valor_adicional_negociacion = 0 (sin adicionales)

   Notas:
     - WGZ876  ARANZAZU FILADELFIA, 2 aux
               AP: 31 pedidos $6.899.543 planilla 25603
               FEP: 5 pedidos $601.747 planilla 21199
               T: 36 pedidos $7.501.290
   ========================================================== */

/* -------------------------------------------------
   0️⃣  DIAGNÓSTICO PREVIO
   ------------------------------------------------- */
SELECT placa_programada, 'NO EXISTE EN vehiculos — flete se OMITIRÁ' AS alerta
FROM (VALUES
  ('WGZ876')
) AS prog(placa_programada)
WHERE NOT EXISTS (
  SELECT 1 FROM vehiculos v
  WHERE v.placa = prog.placa_programada
    AND v.razon_social = 'TYM'
);

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-11-17'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 17‑Nov‑2026
   ------------------------------------------------- */

/* ── ZONA CALDAS / OCCIDENTE ──────────────────────────────── */

/* 01 – WGZ876 – ARANZAZU FILADELFIA, 2 aux
        AP planilla 25603 | FEP planilla 21199 | T VALOR: 7.501.290 */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-17','Martes','ALPINA',v.conductor,'WGZ876','25603','9558','ARANZAZU FILADELFIA','JOHN EDWAR ZAPATA ACEVEDO, YESID PATIÑO',2,
       1,0,'-',
       7501290,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARANZAZU FILADELFIA' LIMIT 1),
       36,'21199','TYM'
FROM vehiculos v WHERE v.placa='WGZ876' AND v.razon_social='TYM' LIMIT 1;

/* -------------------------------------------------
   3️⃣  Verificación
   ------------------------------------------------- */
SELECT '✅ INSERTADO' AS estado, placa, contratista AS conductor_bd,
       zona, poblacion, valor_ruta, precio, no_pedidos, proveedor
FROM fletes
WHERE fecha = '2026-11-17'
  AND proveedor IN ('ALPINA','FLEISCHMANN')

UNION ALL

SELECT '❌ OMITIDO — placa no existe en vehiculos' AS estado,
       placa_programada AS placa, NULL, NULL, NULL, NULL, NULL, NULL, NULL
FROM (VALUES
  ('WGZ876')
) AS prog(placa_programada)
WHERE NOT EXISTS (
  SELECT 1 FROM fletes f
  WHERE f.placa = prog.placa_programada
    AND f.fecha = '2026-11-17'
    AND f.proveedor IN ('ALPINA','FLEISCHMANN')
)

ORDER BY estado DESC, placa;
