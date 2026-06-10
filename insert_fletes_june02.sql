/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 2 JUNIO 2026
   Generado: 2026-06-03T15:57:56.935Z
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-02'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 02‑Jun‑2026
   -------------------------------------------------
   - base_price = (SELECT precio FROM precios_fletes …)
   - price      = base_price + valor_adicional_negociacion
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES
/* -----------------------------------------------------------------
   01 – SYU652 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','JOHAN ECHEVERRY','SYU652','20757','9552','MANIZALES','EDWAR ZAPATA',1,
 1,0,'-',
 6005024,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 49,NULL,'TYM'),

/* -----------------------------------------------------------------
   02 – KOL802 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','CAMILO CASTAÑO','KOL802','20736 20758 19033','9553 7001','MANIZALES','GERMAN GALVEZ',1,
 1,0,'-',
 8860859,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 51,NULL,'TYM'),

/* -----------------------------------------------------------------
   03 – WFV015 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','YONNI VALENCIA','WFV015','20759','9554','MANIZALES','CRISTIAN OSPINA',1,
 1,0,'-',
 6453072,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 56,NULL,'TYM'),

/* -----------------------------------------------------------------
   04 – EYY183 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','RUBEN','EYY183','20760 19034','9555','MANIZALES','JUAN ALEJANDRO',1,
 1,0,'-',
 6133230,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 62,NULL,'TYM'),

/* -----------------------------------------------------------------
   05 – SLI587 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','MIGUEL GONZALES','SLI587','20741 20761 19035','9556 9550','MANIZALES','MILTON OSORIO, ADRIAN MARTINEZ',2,
 2,0,'-',
 8295759,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MANIZALES' LIMIT 1) + 0,
 52,NULL,'TYM'),

/* -----------------------------------------------------------------
   06 – WGZ876 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','RICARDO PINEDA','WGZ876','20762','9557','SUPIA','JUAN DELGADO, MATEO VILLALBA',2,
 2,0,'-',
 8290320,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA' LIMIT 1) + 0,
 38,NULL,'TYM'),

/* -----------------------------------------------------------------
   07 – EYX091 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','CARLOS GOMEZ','EYX091','20742','9560','SUPIA RIOSUCIO','VICTOR PULGARIN, JUAN COCOMA',2,
 2,0,'-',
 7594089,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SUPIA RIOSUCIO' LIMIT 1) + 0,
 11,NULL,'TYM'),

/* -----------------------------------------------------------------
   08 – SMH182 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','JUAN DAVID','SMH182','20763 19036','9559','CHINCHINA','BRANDON BAEZ',1,
 1,0,'-',
 6542491,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CHINCHINA' LIMIT 1) + 0,
 59,NULL,'TYM'),

/* -----------------------------------------------------------------
   09 – SPU120 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','OSWALDO','SPU120','20737 20764','9601 7009','ARMENIA','YEISON RENDON',1,
 1,0,'-',
 6961164,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
 52,NULL,'TYM'),

/* -----------------------------------------------------------------
   10 – VZD334 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','JULIAN CUELLAR','VZD334','20743 20765','9602 7010','ARMENIA','SEBASTIAN VILLADA',1,
 1,0,'-',
 7630324,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
 63,NULL,'TYM'),

/* -----------------------------------------------------------------
   11 – EQY944 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','GOBER CRISTANCHO','EQY944','20766 19025','9603','CALARCA','ALEXANDER COSTAIN',1,
 1,0,'-',
 5911041,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CALARCA' LIMIT 1) + 0,
 58,NULL,'TYM'),

/* -----------------------------------------------------------------
   12 – SXF257 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','FABIO RUIZ','SXF257','20705 20767 19037','9604 7010','MONTENEGRO','CAMILO CONTRERAS, CAMILO SUAREZ',2,
 2,0,'-',
 8444388,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='MONTENEGRO' LIMIT 1) + 0,
 61,NULL,'TYM'),

/* -----------------------------------------------------------------
   13 – WLS478 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','HUMBERTO RINCON','WLS478','20744 19038','9605','TEBAIDA','CRISTIAN CAICEDO',1,
 1,0,'-',
 4811858,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='TEBAIDA' LIMIT 1) + 0,
 38,NULL,'TYM'),

/* -----------------------------------------------------------------
   14 – TTL256 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','ANDRES QUINTERO','TTL256','20745','9606','CIRCASIA','CRISTIAN CAMACHO',1,
 1,0,'-',
 2787545,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CIRCASIA' LIMIT 1) + 0,
 31,NULL,'TYM'),

/* -----------------------------------------------------------------
   15 – SMO183 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','GABRIEL PEREZ','SMO183','20748','9453','PEREIRA','JUAN QUINTERO',1,
 1,0,'-',
 6919874,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 59,NULL,'TYM'),

/* -----------------------------------------------------------------
   16 – LUM993 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','PABLO RAMIREZ','LUM993','20749','9454','PEREIRA','ANDRES PINEDA',1,
 1,0,'-',
 6903427,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 49,NULL,'TYM'),

/* -----------------------------------------------------------------
   17 – TMZ674 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','RICARDO LOPEZ','TMZ674','20750','9455','PEREIRA','ANDRES RIOS, CAMILO MUÑOZ',2,
 2,0,'-',
 6452127,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 61,NULL,'TYM'),

/* -----------------------------------------------------------------
   18 – SPQ814 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','CARLOS VELASCO','SPQ814','20751','9456','SANTA ROSA','SANTIAGO HENAO',1,
 1,0,'-',
 5116630,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTA ROSA' LIMIT 1) + 0,
 54,NULL,'TYM'),

/* -----------------------------------------------------------------
   19 – WHM317 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','HUMBERTO PARRA','WHM317','20752','9457','PEREIRA','ESTEBAN GALLEGO',1,
 1,0,'-',
 6858408,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 57,NULL,'TYM'),

/* -----------------------------------------------------------------
   20 – PEK019 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','MIGUEL TABARES','PEK019','20753','9458','PEREIRA','JHON GIRALDO',1,
 1,0,'-',
 6197527,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 55,NULL,'TYM'),

/* -----------------------------------------------------------------
   21 – WHM896 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','ALEXANDER CUELLAR','WHM896','20754','9459','PEREIRA','CAMILO PEÑA',1,
 1,0,'-',
 7704509,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 66,NULL,'TYM'),

/* -----------------------------------------------------------------
   22 – WLC133 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','JULIAN','WLC133','20755','9460','PEREIRA','EDWIN GOMEZ, JUAN CONTRERAS',2,
 2,0,'-',
 11507791,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 70,NULL,'TYM'),

/* -----------------------------------------------------------------
   23 – TNH494 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','ADALBERTO MEJIA','TNH494','20756','9461','CARTAGO','DIORLAN FLOREZ',1,
 1,0,'-',
 5651581,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='CARTAGO' LIMIT 1) + 0,
 56,NULL,'TYM'),

/* -----------------------------------------------------------------
   24 – WTN748 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','DIEGO RATIVA','WTN748','20768','7004','PEREIRA','BRAHIAN VALENCIA',1,
 1,0,'-',
 8299539,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='PEREIRA' LIMIT 1) + 0,
 64,NULL,'TYM'),

/* -----------------------------------------------------------------
   25 – MAT480 – **ADICIONAL $30.000**
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','ELKIN AGUIRRE','MAT480','20769','7005','CAIRO ARGELIA','CESAR CASTILLO',1,
 1,30000,'MAT480 VALOR DE FLETE $400.000',
 9160374,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='ARGELIA EL CAIRO' LIMIT 1) + 30000,
 35,NULL,'TYM'),

/* -----------------------------------------------------------------
   26 – ERK303 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','JORGE ALARCON','ERK303','20746 20739 19032 19039','7006 9450','SANTUARIO VIRGINIA','ROBINSON TORRES, JOHAN MUÑOZ',2,
 2,0,'-',
 11214071,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='SANTUARIO VIRGINIA' LIMIT 1) + 0,
 47,NULL,'TYM'),

/* -----------------------------------------------------------------
   27 – JVM223 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','ALPINA','WILMAR CARDONA','JVM223','20747 20740','7007 9451','BELEN DE UMBRIA','OSCAR RESTREPO, JOHN MORENO',2,
 2,0,'-',
 10176999,
 (SELECT precio FROM precios_fletes WHERE lista_id='ALPINA' AND UPPER(poblacion)='BELEN DE UMBRIA' LIMIT 1) + 0,
 59,NULL,'TYM'),

/* -----------------------------------------------------------------
   28 – SQB119 – sin adicional
   ----------------------------------------------------------------- */
('2026-06-02','Martes','FLEISCHMANN','CARLOS CASTAÑO','SQB119','19024 19031','FLEISCHMANN','ARMENIA','DIEGO FRANCO',1,
 1,0,'-',
 6332026,
 (SELECT precio FROM precios_fletes WHERE lista_id='FLEISCHMANN' AND UPPER(poblacion)='ARMENIA' LIMIT 1) + 0,
 44,NULL,'TYM');

/* -------------------------------------------------
   3️⃣  Verificación rápida (opcional)
   ------------------------------------------------- */
SELECT fecha,
       placa,
       precio                AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion   AS motivo,
       proveedor
FROM fletes
WHERE fecha = '2026-06-02'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
