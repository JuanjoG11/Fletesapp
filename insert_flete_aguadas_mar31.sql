-- ==========================================================
-- 🚛 INSERCIÓN DE FLETE: AGUADAS (MARZO 31, 2026)
-- Vehículo: EYX091
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
    'EYX091',
    'CARLOS GOMEZ',
    '9558',
    'AGUADAS',
    'AGUADAS',
    'VICTOR PULGARIN, JUAN COCOMA',
    2,
    'No',
    0,
    '-',
    690000,
    12678223,
    34,
    'TYM'
);

-- 🔍 Verificación del flete insertado
SELECT 
    fecha, dia, proveedor, placa, contratista, no_planilla, 
    zona, poblacion, precio, valor_ruta, no_pedidos
FROM fletes
WHERE placa = 'EYX091'
  AND fecha = '2026-03-31';
