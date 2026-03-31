-- ==========================================================
-- 🚛 INSERCIÓN DE FLETE DE URGENCIA: ALPINA (MARZO 30, 2026)
-- Vehículo: MAT480
-- ==========================================================

INSERT INTO fletes (
    fecha, dia, proveedor, placa, contratista, no_planilla, 
    zona, poblacion, auxiliares, no_auxiliares, 
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion, 
    precio, valor_ruta, no_pedidos, razon_social
)
VALUES (
    '2026-03-30',
    'Lunes',
    'ALPINA',
    'MAT480',
    'ELKIN AGUIRRE',
    '9559',
    'CHINCHINA',
    'CHINCHINA',
    'BRANDON BAEZ',
    1,
    'No',
    0,
    '-',
    250000,
    3509725,
    44,
    'TYM'
);

-- 🔍 Verificación del flete insertado
SELECT 
    fecha, dia, proveedor, placa, contratista, no_planilla, 
    zona, poblacion, precio, valor_adicional_negociacion, valor_ruta, no_pedidos
FROM fletes
WHERE placa = 'MAT480'
  AND fecha = '2026-03-30';
