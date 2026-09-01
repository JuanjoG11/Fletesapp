/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: LUNES 31 AGOSTO 2026
   Generado: 2026-08-31
   Notas:
     - WFV015 VALOR DE FLETE $450.000 INCLUYE DESCARGUE (sin auxiliares)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-08-31'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 31‑Ago‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* 01 – EYX091 – sin adicional */
  ('2026-08-31','Lunes','ALPINA','ANDRES GOMEZ','EYX091','23329 20219','9558','ARANZAZU FILADELFIA','VICTOR ALFONSO PULGARIN MEJIA, JUAN CAMILO COCOMA OROZCO',2,
   2,0,'-',
   7332135,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARANZAZU FILADELFIA' LIMIT 1) + 0,
   32,NULL,'TYM'),

  /* 02 – WFV015 – VALOR DE FLETE $450.000 INCLUYE DESCARGUE */
  ('2026-08-31','Lunes','ALPINA','YONNI VALENCIA','WFV015','','7001','MANIZALES VILLAMARIA','NO APLICA',0,
   0,0,'VALOR DE FLETE $450.000 ENTREGA DE SUPER EN VILLAMARIA Y FLEISCHMANN EN EL CENTRO/INCLUYE DESCARGUE',
   6686914,
   450000,
   2,'AP732314 FEP1193408','TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-08-31'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
