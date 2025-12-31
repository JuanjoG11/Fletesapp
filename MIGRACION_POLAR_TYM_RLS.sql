-- ================================================================
-- � RECUPERACIÓN: DEVOLVER VEHÍCULOS A TAT Y AJUSTAR RLS
-- ================================================================

-- 1. Devolver los vehículos a TAT que NUNCA debieron irse a TYM
-- Si el vehículo tiene fletes de UNILEVER o FAMILIA, es definitivamente de TAT
UPDATE public.vehiculos
SET razon_social = 'TAT'
WHERE id IN (
    SELECT DISTINCT vehiculo_id 
    FROM public.fletes 
    WHERE proveedor IN ('UNILEVER', 'FAMILIA')
);

-- 2. Manejo de vehículos POLAR: 
-- Si el usuario dice que TAT se quedó sin vehículos, es porque sus vehículos de Polar también deben estar en TAT
-- para que puedan gestionarlos (activar/desactivar).
UPDATE public.vehiculos
SET razon_social = 'TAT'
WHERE razon_social = 'TYM' 
AND id IN (
    SELECT DISTINCT vehiculo_id 
    FROM public.fletes 
    WHERE proveedor = 'POLAR'
);

-- 3. AJUSTAR RLS PARA VEHÍCULOS (Para que TYM pueda verlos en los reportes)
DROP POLICY IF EXISTS "RLS_VEHICULOS_STRICT" ON public.vehiculos;

CREATE POLICY "RLS_VEHICULOS_STRICT_V2" ON public.vehiculos 
FOR ALL USING (
    -- Acceso normal por empresa
    (get_my_razon_social() = UPPER(razon_social))
    OR
    -- TYM puede ver vehículos de TAT que tengan fletes de Polar
    (get_my_razon_social() = 'TYM' AND EXISTS (
        SELECT 1 FROM public.fletes f 
        WHERE f.vehiculo_id = public.vehiculos.id 
        AND UPPER(f.proveedor) = 'POLAR'
    ))
);

-- 4. AJUSTAR RLS PARA FLETES (Asegurar total visibilidad para TYM de lo que está en TYM)
DROP POLICY IF EXISTS "RLS_FLETES_STRICT" ON public.fletes;

CREATE POLICY "RLS_FLETES_STRICT_V2" ON public.fletes 
FOR ALL USING (
    -- Acceso normal por empresa
    (get_my_razon_social() = UPPER(razon_social))
    OR 
    -- TAT ve fletes de Polar que están en TYM
    (get_my_razon_social() = 'TAT' AND UPPER(proveedor) = 'POLAR')
);

-- Verificación de conteos
SELECT razon_social, COUNT(*) as vehiculos_por_empresa
FROM public.vehiculos
GROUP BY razon_social;
