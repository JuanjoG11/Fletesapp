/* ==========================================================
   🔧 FIX: Insertar ZMN804 faltante — VIERNES 18 SEPTIEMBRE 2026
   Motivo: Flete no incluido en la programación original del día
   Datos: Planilla 23940 · Zona 9466 · PEREIRA - DOSQUEBRADAS
          Auxiliar: ANDRES FELIPE RIOS CAICEDO · 58 pedidos
          Valor ruta: $7.252.621 · Sin adicional
   Nota:  Placa TAT operando con ALPINA
   ========================================================== */

INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES (
  '2026-09-18','Viernes','ALPINA',
  'ALEJANDRO VARGAS',
  'ZMN804','23940','9466','PEREIRA - DOSQUEBRADAS','ANDRES FELIPE RIOS CAICEDO',1,
  1,0,'-',
  7252621,
  COALESCE((SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA - DOSQUEBRADAS' LIMIT 1), 7252621) + 0,
  58,NULL,'TYM'
);

/* Verificación */
SELECT fecha, placa, contratista, zona, poblacion,
       precio, no_pedidos, proveedor
FROM fletes
WHERE fecha = '2026-09-18' AND placa = 'ZMN804';
