/* ==========================================================
   🔧 FIX: Insertar TRF860 faltante — MIÉRCOLES 16 SEPTIEMBRE 2026
   Motivo: Flete no incluido en la programación original del día
   Datos: Planilla AP 23831TSS · FEP 20435 · CARTAGO 2T
          Auxiliar: JULIAN RODRIGUEZ
          Pedidos AP: 8  ($1.322.647) · Pedidos FEP: 39 ($8.069.613)
          Total pedidos: 47 · Valor total: $9.392.260
          Precio flete: $350.000 (VALOR DE FLETE)
   Proveedor: FLEISCHMANN
   ========================================================== */

INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES (
  '2026-09-16','Miércoles','FLEISCHMANN',
  'ALBERTO GONZALO',
  'TRF860','23831TSS 20435','FLEISCHMANN','CARTAGO 2T','JULIAN RODRIGUEZ',1,
  1,0,'-',
  9392260,
  350000,
  47,NULL,'TYM'
);

/* Verificación */
SELECT fecha, placa, contratista, zona, poblacion,
       precio, no_pedidos, proveedor
FROM fletes
WHERE fecha = '2026-09-16' AND placa = 'TRF860';
