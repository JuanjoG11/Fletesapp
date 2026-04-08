-- ==========================================================
-- 🚛 INSERCIÓN DE FLETE: CHINCHINA (MARZO 31, 2026)
-- Vehículo: MAT480
-- ==========================================================

INSERT INTO fletes (
    fecha, dia, proveedor, placa, contratista, no_planilla, 
    zona, poblacion, auxiliares, no_auxiliares, 
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion, 
    precio, valor_ruta, no_pedidos, razon_social
)
VALUES (
    '2026-03-31',
    'Martes',
    'ALPINA',
    'MAT480',
    'ELKIN AGUIRRE',
    '7002',
    'CHINCHINA',
    'CHINCHINA',
    'DIORLAN',
    1,
    'No',
    0,
    '-',
    250000,
    11285132,
    7,
    'TYM'
);

-- 🔍 Verificación del flete insertado
SELECT 
    fecha, dia, proveedor, placa, contratista, no_planilla, 
    zona, poblacion, precio, valor_ruta, no_pedidos
FROM fletes
WHERE placa = 'MAT480'
  AND fecha = '2026-03-31';
