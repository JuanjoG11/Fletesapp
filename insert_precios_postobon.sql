-- ============================================================
-- 💰 NUEVA LISTA DE PRECIOS: POSTOBON (TAT)
-- ============================================================
-- Proveedor: POSTOBON (operado por TAT)
-- Rutas y valores:
--   PEREIRA        $250.000
--   DOSQUEBRADAS   $240.000
--
-- Convención: lista_id con prefijo TAT_ (igual que
-- TAT_BASE, TAT_UNILEVER, TAT_FAMILIA) pero el
-- proveedor que se guarda en fletes es 'POSTOBON'.
-- ============================================================

INSERT INTO precios_fletes (lista_id, poblacion, precio) VALUES
('TAT_POSTOBON', 'PEREIRA',      250000),
('TAT_POSTOBON', 'DOSQUEBRADAS', 240000)
ON CONFLICT (lista_id, poblacion)
DO UPDATE SET precio = EXCLUDED.precio, updated_at = now();

-- Verificación
SELECT lista_id, poblacion, precio
FROM precios_fletes
WHERE lista_id = 'TAT_POSTOBON'
ORDER BY poblacion;
