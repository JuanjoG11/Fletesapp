/* ==========================================================
   🚛 FLETE POSTOBON (TAT): MARTES 10 NOVIEMBRE 2026
   Placa  : JKV745 – JORGE PINEDA
   Ruta   : PEREIRA - DOSQUEBRADAS
   Planilla: 4885-4886-4887-4888-4889
   Pedidos: 33  |  T Valor: $1.602.309
   Precio fijo negociado: $270.000
   Auxiliar: MICHAEL STEVEN HENAO RODRIGUEZ
   ========================================================== */

/* -------------------------------------------------
   0️⃣  Registrar JKV745 en vehiculos (TAT) si no existe
   ------------------------------------------------- */
INSERT INTO vehiculos (placa, conductor, contratista, modelo, activo, razon_social)
VALUES ('JKV745', 'JORGE PINEDA', 'JORGE PINEDA', 'Estándar', true, 'TAT')
ON CONFLICT (placa, razon_social) DO UPDATE SET
    conductor   = EXCLUDED.conductor,
    contratista = EXCLUDED.contratista,
    activo      = true;

/* -------------------------------------------------
   1️⃣  Insertar el flete
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
SELECT
    '2026-11-10', 'Martes', 'POSTOBON',
    v.conductor,
    'JKV745',
    '4885-4886-4887-4888-4889',
    'POSTOBON',
    'PEREIRA - DOSQUEBRADAS',
    'MICHAEL STEVEN HENAO RODRIGUEZ', 1,
    1,
    0, 'VALOR FLETE $270.000',
    1602309,
    270000,
    33, NULL, 'TAT'
FROM vehiculos v
WHERE v.placa = 'JKV745' AND v.razon_social = 'TAT'
LIMIT 1;

/* -------------------------------------------------
   2️⃣  Verificación
   ------------------------------------------------- */
SELECT fecha, dia, proveedor, placa, contratista,
       zona, poblacion, valor_ruta, precio, no_pedidos, razon_social
FROM fletes
WHERE fecha = '2026-11-10'
  AND placa = 'JKV745'
  AND proveedor = 'POSTOBON';
