-- SCRIPT PARA CORREGIR FLETES CON VALOR 0 (ABRIL 09 - ABRIL 14)
-- Ejecuta esto en el SQL Editor de Supabase

-- 1. Actualizar Alpina y Fleischmann usando la tabla de precios
UPDATE fletes
SET precio = (
    CASE 
        -- Casos especiales de mapeo de nombres de población (Excel vs DB)
        -- Usamos subconsultas calificadas para evitar ambigüedad
        WHEN UPPER(fletes.poblacion) = 'APIA VIRGINIA' THEN (SELECT p2.precio FROM precios_fletes p2 WHERE p2.lista_id = 'ALPINA' AND p2.poblacion = 'LA VIRGINIA' LIMIT 1)
        WHEN UPPER(fletes.poblacion) = 'SAN JOSE BELALCAZAR' THEN (SELECT p3.precio FROM precios_fletes p3 WHERE p3.lista_id = 'ALPINA' AND p3.poblacion = 'BELAL RDA SJOSE' LIMIT 1)
        WHEN UPPER(fletes.poblacion) = 'ALCALA ULLOA' THEN (SELECT p4.precio FROM precios_fletes p4 WHERE p4.lista_id = 'ALPINA' AND p4.poblacion = 'ALCALA ULLOA' LIMIT 1)
        ELSE (
            SELECT p.precio 
            FROM precios_fletes p 
            WHERE p.lista_id = 'ALPINA' 
            AND UPPER(p.poblacion) = UPPER(fletes.poblacion)
            LIMIT 1
        )
    END
) + 
-- Sumar los 60.000 si tiene adicionales marcados como 'Si'
(CASE WHEN fletes.adicionales = 'Si' THEN 60000 ELSE 0 END) +
-- Sumar el valor adicional de negociación que ya tenga el registro
COALESCE(fletes.valor_adicional_negociacion, 0)
WHERE fletes.precio = 0
AND fletes.proveedor IN ('ALPINA', 'FLEISCHMANN')
AND fletes.fecha BETWEEN '2026-04-09' AND '2026-04-14';

-- 2. Casos específicos que se detectaron con fletes fijos en las observaciones
UPDATE fletes SET precio = 400000 + (CASE WHEN adicionales = 'Si' THEN 60000 ELSE 0 END) + COALESCE(valor_adicional_negociacion, 0) WHERE (precio IS NULL OR precio <= 60000) AND placa = 'SXF257' AND fecha BETWEEN '2026-04-09' AND '2026-04-14';
UPDATE fletes SET precio = 280000 + (CASE WHEN adicionales = 'Si' THEN 60000 ELSE 0 END) + COALESCE(valor_adicional_negociacion, 0) WHERE (precio IS NULL OR precio <= 60000) AND placa = 'MAT480' AND fecha BETWEEN '2026-04-09' AND '2026-04-14';
UPDATE fletes SET precio = 250000 + (CASE WHEN adicionales = 'Si' THEN 60000 ELSE 0 END) + COALESCE(valor_adicional_negociacion, 0) WHERE (precio IS NULL OR precio <= 60000) AND placa = 'LUM993' AND fecha BETWEEN '2026-04-09' AND '2026-04-14';

-- 3. Verificación rápida
-- SELECT placa, poblacion, proveedor, precio FROM fletes WHERE precio = 0 AND fecha BETWEEN '2026-04-09' AND '2026-04-14';
