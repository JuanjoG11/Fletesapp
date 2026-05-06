-- ============================================================
-- 💰 ACTUALIZACIÓN PRECIOS QUINDÍO - LISTA ALPINA
-- Fecha: Mayo 2026
-- ============================================================

INSERT INTO precios_fletes (lista_id, poblacion, precio) VALUES
('ALPINA', 'ALCALA ULLOA',          275000),
('ALPINA', 'MONTENEGRO',            300000),
('ALPINA', 'MONTENEGRO PTAPAO',     325000),
('ALPINA', 'QUIMBAYA',              275000),
('ALPINA', 'CAIMO BARCELONA',       360000),
('ALPINA', 'FILANDIA',              300000),
('ALPINA', 'SALENTO',               300000),
('ALPINA', 'CIRCASIA',              300000),
('ALPINA', 'CORDOBA PIJAO BVISTA',  379000),
('ALPINA', 'CAICEDONIA',            398000),
('ALPINA', 'TEBAIDA',               355000),
('ALPINA', 'GENOVA',                430000),
('ALPINA', 'ARMENIA',               330000),
('ALPINA', 'CALARCA',               345000)
ON CONFLICT (lista_id, poblacion)
DO UPDATE SET
    precio     = EXCLUDED.precio,
    updated_at = NOW();

-- Limpiar nombres alternativos que puedan existir por versiones anteriores
UPDATE precios_fletes
SET precio = 325000, updated_at = NOW()
WHERE lista_id = 'ALPINA'
  AND poblacion IN ('MONTENEGRO - P TAPAO', 'MONTENEGRO, PTAPAO');

UPDATE precios_fletes
SET precio = 345000, updated_at = NOW()
WHERE lista_id = 'ALPINA'
  AND poblacion = 'CALARCA';
