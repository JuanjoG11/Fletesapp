-- ============================================================
-- 🆕 NUEVA POBLACIÓN: PEREIRA FLEISCHMANN
-- Fecha: 20 de Mayo de 2026
-- Valor del flete: $230.000
-- ============================================================

INSERT INTO precios_fletes (lista_id, poblacion, precio) VALUES
('ALPINA', 'PEREIRA FLEISCHMANN', 230000),
('FLEISCHMANN', 'PEREIRA FLEISCHMANN', 230000)
ON CONFLICT (lista_id, poblacion) 
DO UPDATE SET 
    precio = EXCLUDED.precio,
    updated_at = NOW();

-- Verificación
SELECT * FROM precios_fletes 
WHERE poblacion = 'PEREIRA FLEISCHMANN';
