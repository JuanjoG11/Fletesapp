/* ==========================================================
   🔧 FIX: TRF860 nov04 – placa no encontrada en vehiculos
   
   TRF860 no estaba registrado en la tabla vehiculos, por eso
   el INSERT del miércoles 4 fue omitido silenciosamente.
   
   Opciones:
     A) Registrar el vehículo y luego insertar el flete (recomendado)
     B) Insertar el flete usando el conductor de la programación (puntual)
   
   Ejecuta la opción que corresponda según si el vehículo es
   temporal o debe quedar en la flota permanente.
   ========================================================== */

/* ----------------------------------------------------------
   OPCIÓN A – Registrar vehículo en flota y crear el flete
   (usar si TRF860 debe quedar en la base de vehiculos)
   ---------------------------------------------------------- */

-- 1. Crear el vehículo
INSERT INTO vehiculos (placa, conductor, modelo, activo, estado_vehiculo, razon_social)
VALUES ('TRF860', 'ALBERTO GONZALO', 'Estándar', true, 'activo', 'TYM')
ON CONFLICT (placa, razon_social) DO NOTHING;

-- 2. Insertar el flete tomando el conductor de vehiculos
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
SELECT '2026-11-04','Miercoles','FLEISCHMANN',v.conductor,'TRF860','25301','FLEISCHMANN','CARTAGO 2T','JULIAN RODRIGUEZ',1,
       1,0,'VALOR DE RUTA $350.000',
       7210613,350000,
       42,'21059 21062','TYM'
FROM vehiculos v WHERE v.placa='TRF860' AND v.razon_social='TYM' LIMIT 1;


/* ----------------------------------------------------------
   OPCIÓN B – Solo insertar el flete sin tocar vehiculos
   (usar si fue un vehículo puntual / prestado)
   ---------------------------------------------------------- */

/*
INSERT INTO fletes (fecha,dia,proveedor,contratista,placa,no_planilla,zona,poblacion,auxiliares,no_auxiliares,adicionales,valor_adicional_negociacion,razon_adicional_negociacion,valor_ruta,precio,no_pedidos,facturas_adicionales,razon_social)
VALUES ('2026-11-04','Miercoles','FLEISCHMANN','ALBERTO GONZALO','TRF860','25301','FLEISCHMANN','CARTAGO 2T','JULIAN RODRIGUEZ',1,
        1,0,'VALOR DE RUTA $350.000',
        7210613,350000,
        42,'21059 21062','TYM');
*/

/* Verificar resultado */
SELECT fecha, placa, contratista, proveedor, poblacion, precio, no_pedidos, facturas_adicionales
FROM fletes
WHERE fecha = '2026-11-04' AND proveedor = 'FLEISCHMANN'
ORDER BY placa;
