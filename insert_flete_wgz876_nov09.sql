/* ==========================================================
   🚛 FLETE ALPINA (TYM): LUNES 9 NOVIEMBRE 2026
   Placa  : WGZ876 – RICARDO PINEDA
   Zona   : 9558
   Ruta   : ARANZAZU FILADELFIA
   Auxiliar: JOHN EDWAR ZAPATA ACEVEDO
   AP: planilla 25418 · 31 pedidos · $6.475.508
   FEP: planilla 21111 · 5 pedidos · $703.984
   T pedidos: 36  |  T valor: $7.179.492
   EXTRA $60.000
   ========================================================== */

/* -------------------------------------------------
   0️⃣  Diagnóstico previo
   ------------------------------------------------- */
SELECT placa, 'NO EXISTE EN vehiculos — flete se OMITIRÁ' AS alerta
FROM (VALUES ('WGZ876')) AS p(placa)
WHERE NOT EXISTS (
  SELECT 1 FROM vehiculos v
  WHERE v.placa = 'WGZ876' AND v.razon_social = 'TYM'
);

/* -------------------------------------------------
   1️⃣  Eliminar si ya existe (evita duplicado)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-11-09'
  AND placa = 'WGZ876'
  AND proveedor = 'ALPINA';

/* -------------------------------------------------
   2️⃣  Insertar el flete
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
SELECT
    '2026-11-09', 'Lunes', 'ALPINA',
    v.conductor,
    'WGZ876',
    '25418',
    '9558',
    'ARANZAZU FILADELFIA',
    'JOHN EDWAR ZAPATA ACEVEDO', 1,
    1,
    60000, 'EXTRA $60.000',
    7179492,
    COALESCE(
        (SELECT precio FROM precios_fletes
         WHERE lista_id = 'ALPINA'
           AND UPPER(poblacion) = 'ARANZAZU FILADELFIA'
         LIMIT 1),
        460000
    ),
    36, '21111', 'TYM'
FROM vehiculos v
WHERE v.placa = 'WGZ876' AND v.razon_social = 'TYM'
LIMIT 1;

/* -------------------------------------------------
   3️⃣  Verificación
   ------------------------------------------------- */
SELECT fecha, dia, proveedor, placa, contratista,
       zona, poblacion, valor_ruta, precio, no_pedidos,
       facturas_adicionales, valor_adicional_negociacion
FROM fletes
WHERE fecha = '2026-11-09'
  AND placa = 'WGZ876'
  AND proveedor = 'ALPINA';
