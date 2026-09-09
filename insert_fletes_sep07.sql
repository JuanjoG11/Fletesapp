/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: LUNES 7 SEPTIEMBRE 2026
   Generado: 2026-09-08
   Notas:
     - SYU652  VALOR DE FLETE $600.000 DESCARGUE Y ENTREGA SUPER DEL DIA SABADO (precio fijo)
     - WEP384  VALOR DE FLETE $500.000 POR SOBRECARGO Y DESCARGUE (precio fijo, sin pedidos AP/FEP)
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-09-07'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 07‑Sep‑2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES

  /* ── ZONA MANIZALES / VILLAMARIA ─────────────────────────────── */

  /* 01 – EYX091 – sin adicional */
  ('2026-09-07','Lunes','ALPINA','ANDRES GOMEZ','EYX091','23549 20316','9558','MANIZALES VILLAMARIA','JUAN CAMILO COCOMA OROZCO, ADRIAN FELIPE MARTINEZ ORTEGON',2,
   1,0,'-',
   7098729,
   (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES VILLAMARIA' LIMIT 1) + 0,
   30,NULL,'TYM'),

  /* 02 – SYU652 – VALOR DE FLETE $600.000 (precio fijo, descargue y entrega super del sábado) */
  ('2026-09-07','Lunes','ALPINA','JOHAN ECHEVERRY','SYU652','AP739060','9550','MANIZALES VILLAMARIA',NULL,0,
   0,0,'VALOR DE FLETE $600.000 DESCARGUE Y ENTREGA SUPER DEL DIA SABADO',
   22080000,
   600000,
   1,'AP739060','TYM'),

  /* 03 – WEP384 – VALOR DE FLETE $500.000 (precio fijo, sobrecargo y descargue, sin pedidos) */
  ('2026-09-07','Lunes','ALPINA','YOFER LOPEZ','WEP384','23552 23550','9559 7002 MILPAS/GAMERO','MANIZALES VILLAMARIA',NULL,0,
   0,0,'VALOR DE FLETE $500.000 POR SOBRECARGO Y DESCARGUE',
   0,
   500000,
   0,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida
   ------------------------------------------------- */
SELECT fecha, placa, zona, poblacion,
       precio AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       no_pedidos, facturas_adicionales, proveedor
FROM fletes
WHERE fecha = '2026-09-07'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
