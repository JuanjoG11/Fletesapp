/* ==========================================================
   🔧 FIX: TRF860 — nov-04 y nov-11
   Placa omitida ambos días porque no estaba en vehiculos.
   Este script:
     1. Registra TRF860 en vehiculos (si no existe)
     2. Inserta los 2 fletes omitidos
   ========================================================== */

/* 1️⃣  Registrar el vehículo */
INSERT INTO vehiculos (placa, conductor, modelo, activo, estado_vehiculo, razon_social)
VALUES ('TRF860', 'ALBERTO GONZALO', 'Estándar', true, 'activo', 'TYM')
ON CONFLICT (placa, razon_social) DO NOTHING;

/* 2️⃣  Flete nov-04 — FLEISCHMANN CARTAGO 2T */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','FLEISCHMANN',v.conductor,'TRF860','25301','FLEISCHMANN','CARTAGO 2T','JULIAN RODRIGUEZ',1,
       1,0,'VALOR DE RUTA $350.000',
       7210613,350000,
       42,'21059 21062','TYM'
FROM vehiculos v WHERE v.placa='TRF860' AND v.razon_social='TYM' LIMIT 1;

/* 3️⃣  Flete nov-11 — FLEISCHMANN CARTAGO 2T */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-11','Miércoles','FLEISCHMANN',v.conductor,'TRF860','4913','FLEISCHMANN','CARTAGO 2T','JULIAN RODRIGUEZ',1,
       1,0,'VALOR FLETE $350.000',
       6535325,350000,
       49,'21150 21147','TYM'
FROM vehiculos v WHERE v.placa='TRF860' AND v.razon_social='TYM' LIMIT 1;

/* ✅ Verificar */
SELECT fecha, dia, placa, contratista, proveedor, poblacion, precio, no_pedidos, facturas_adicionales
FROM fletes
WHERE placa = 'TRF860' AND fecha IN ('2026-11-04','2026-11-11')
ORDER BY fecha;
