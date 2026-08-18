/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: LUNES 17 AGOSTO 2026
   Generado: 2026-08-18
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-17'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 17‑Ago‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* 01 – EYX091 – sin adicional */
  ('2026-08-17','Lunes','ALPINA','ANDRES GOMEZ','EYX091','22908','9558','ARANZAZU FILADELFIA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   7476330,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARANZAZU FILADELFIA' LIMIT 1) + 0,
   34,'20061','TYM'),

  /* 02 – TMZ674 – sin adicional */
  ('2026-08-17','Lunes','ALPINA','RICARDO LOPEZ','TMZ674','22897','9457','PEREIRA - DOSQUEBRADAS','JUAN ESTEBAN GALLEGO DIEZ, SAMUEL ARIAS',2,
   2,0,'-',
   12170208,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1) + 0,
   62,NULL,'TYM');

/* Verificación */
SELECT fecha, placa, zona, poblacion, precio, no_pedidos, proveedor
FROM fletes
WHERE fecha = '2026-08-17'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY placa;
