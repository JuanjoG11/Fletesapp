/* ==========================================================
   🔧 FIX: SXE499 — nov-03, nov-04 y nov-05
   Placa omitida los 3 días porque no estaba en vehiculos.
   Este script:
     1. Registra SXE499 en vehiculos (si no existe)
     2. Inserta los 3 fletes omitidos
   ========================================================== */

/* 1️⃣  Registrar el vehículo */
INSERT INTO vehiculos (placa, conductor, modelo, activo, estado_vehiculo, razon_social)
VALUES ('SXE499', 'BRAHIAN STIVEN VALENCIA IGLESIAS', 'Estándar', true, 'activo', 'TYM')
ON CONFLICT (placa, razon_social) DO NOTHING;

/* 2️⃣  Flete nov-03 — ALPINA PEREIRA - DOSQUEBRADAS */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-03','Martes','ALPINA',v.conductor,'SXE499','25269','7004','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS',1,
       1,0,'-',
       6664989,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),6664989)+0,
       49,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SXE499' AND v.razon_social='TYM' LIMIT 1;

/* 3️⃣  Flete nov-04 — ALPINA PEREIRA - DOSQUEBRADAS (2 auxiliares) */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','ALPINA',v.conductor,'SXE499','25315','7004 F','PEREIRA - DOSQUEBRADAS','BRAHIAN STIVEN VALENCIA IGLESIAS, EDWAR GIL',2,
       1,0,'-',
       10612039,
       COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),10612039)+0,
       71,'21057','TYM'
FROM vehiculos v WHERE v.placa='SXE499' AND v.razon_social='TYM' LIMIT 1;

/* 4️⃣  Flete nov-05 — ALPINA PEREIRA - DOSQUEBRADAS (2 auxiliares) */
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-05','Jueves','ALPINA',v.conductor,'SXE499','25348','9459','PEREIRA - DOSQUEBRADAS','QUEBIN LOTERO, MANUEL RAMIREZ',2,
       1,0,'-',
       8782085,
       (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1),
       45,NULL,'TYM'
FROM vehiculos v WHERE v.placa='SXE499' AND v.razon_social='TYM' LIMIT 1;

/* ✅ Verificar */
SELECT fecha, dia, placa, contratista, proveedor, poblacion, precio, no_pedidos, facturas_adicionales
FROM fletes
WHERE placa = 'SXE499' AND fecha IN ('2026-11-03','2026-11-04','2026-11-05')
ORDER BY fecha;
