-- ============================================================
-- 🛒 REGISTRO DE NUEVAS POBLACIONES: SUPERMERCADOS (ALPINA)
-- Fecha: 11 de Mayo de 2026
-- ============================================================

INSERT INTO precios_fletes (lista_id, poblacion, precio) VALUES
('ALPINA', 'CHINCHINA SUPERMERCADO',       320000),
('ALPINA', 'RIOSUCIO-SUPIA SUPERMERCADO', 625000),
('ALPINA', 'ARMENIA SUPERMERCADO',         350000),
('ALPINA', 'CALARCA SUPERMERCADO',         370000),
('ALPINA', 'MANIZALES SUPERMERCADO',       365000)
ON CONFLICT (lista_id, poblacion) 
DO UPDATE SET 
    precio = EXCLUDED.precio,
    updated_at = NOW();

-- Verificación
SELECT * FROM precios_fletes 
WHERE poblacion LIKE '%SUPERMERCADO%' 
AND lista_id = 'ALPINA';
