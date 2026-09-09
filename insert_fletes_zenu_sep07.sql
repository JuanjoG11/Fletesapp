/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN ZENÚ: LUNES 7 SEPTIEMBRE 2026
   Generado: 2026-09-08
   Rutas: 25021-25029
   Vehículos: SPO480, WHM622, PED694, WHN489, TUK011
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-09-07'
  AND proveedor = 'ZENU';

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 07‑Sep‑2026 ZENÚ
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* 01 – SPO480 – SANTA ROSA */
  ('2026-09-07','Lunes','ZENU','HERNANDO','SPO480','25027-25029','SANTA ROSA','SANTA ROSA','FELIPE-MICHAEL',1,
   0,0,'-',
   12061055,
   (SELECT precio FROM precios_fletes WHERE lista_id='ZENU' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   0,NULL,'TYM'),

  /* 02 – WHM622 – SANTA ROSA */
  ('2026-09-07','Lunes','ZENU','VELEZ','WHM622','25022-25029','SANTA ROSA','SANTA ROSA','GUSTAVO',1,
   0,0,'-',
   7254300,
   (SELECT precio FROM precios_fletes WHERE lista_id='ZENU' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
   0,NULL,'TYM'),

  /* 03 – PED694 – CARTAGO */
  ('2026-09-07','Lunes','ZENU','DENNIS','PED694','25024-25025','CARTAGO','CARTAGO','OSCAR',1,
   0,0,'-',
   7934779,
   (SELECT precio FROM precios_fletes WHERE lista_id='ZENU' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
   0,NULL,'TYM'),

  /* 04 – WHN489 – DOSQUEBRADAS */
  ('2026-09-07','Lunes','ZENU','ANDRES','WHN489','25021-25023','DOSQUEBRADAS','DOSQUEBRADAS','CRISTIAN',1,
   0,0,'-',
   9630039,
   (SELECT precio FROM precios_fletes WHERE lista_id='ZENU' AND UPPER(poblacion)='DOSQUEBRADAS' LIMIT 1) + 0,
   0,NULL,'TYM'),

  /* 05 – TUK011 – DOSQUEBRADAS */
  ('2026-09-07','Lunes','ZENU','FERNANDO','TUK011','25026-25028','DOSQUEBRADAS','DOSQUEBRADAS','JAMMES',1,
   0,0,'-',
   9624571,
   (SELECT precio FROM precios_fletes WHERE lista_id='ZENU' AND UPPER(poblacion)='DOSQUEBRADAS' LIMIT 1) + 0,
   0,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete,
       valor_ruta,
       proveedor
FROM fletes
WHERE fecha = '2026-09-07'
  AND proveedor = 'ZENU'
ORDER BY placa;
