-- ==========================================================
-- 🚛 INSERCIÓN DE FLETES: ZENÚ (MARZO 28 - 29, 2026)
-- Vehículo de Prueba: WFT928
-- ==========================================================

-- 1. Insertar flete del Sábado 28-03-2026 (Apia - Pueblo Rico)
INSERT INTO fletes (
    fecha, dia, proveedor, placa, contratista, no_planilla, 
    zona, poblacion, auxiliares, no_auxiliares, 
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion, 
    precio, valor_ruta, no_pedidos, razon_social
)
VALUES (
    '2026-03-28',
    'Sabado',
    'ZENU',
    'WFT928',
    'CONTRATISTA ZENÚ',
    '1157',
    'APIA- PUEBLO RICO',
    'APIA- PUEBLO RICO',
    'SEBASTIAN SALAZAR HENAO',
    1,
    'No',
    0,
    '-',
    320000,
    8405921,
    30,
    'TYM'
);

-- 2. Insertar flete del Domingo 29-03-2026 (Santa Rosa)
INSERT INTO fletes (
    fecha, dia, proveedor, placa, contratista, no_planilla, 
    zona, poblacion, auxiliares, no_auxiliares, 
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion, 
    precio, valor_ruta, no_pedidos, razon_social
)
VALUES (
    '2026-03-29',
    'Domingo',
    'ZENU',
    'WFT928',
    'CONTRATISTA ZENÚ',
    '1166',
    'SANTA ROSA',
    'SANTA ROSA',
    'GUSTAVO ADOLFO MORALES TIRADO',
    1,
    'No',
    0,
    '-',
    212000,
    7709644,
    84,
    'TYM'
);

-- 🔍 Verificación de los fletes insertados
SELECT 
    fecha, dia, proveedor, placa, contratista, no_planilla, 
    poblacion, precio, valor_ruta, no_pedidos
FROM fletes
WHERE placa = 'WFT928'
  AND (fecha = '2026-03-28' OR fecha = '2026-03-29')
ORDER BY fecha;

