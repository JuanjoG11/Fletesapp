import csv
import re

data = """PLACA	CONDUCTOR	ZONAS	POBLACION	AUXILIAR	AUXILIAR	PEDIDOS	VALOR RUTA	PLANILLA AP	PEDIDOS	VALOR RUTA	PLANILLA FEP	FAC ADICIONALES AP/FEP	T PEDIDOS	T VALOR	OBSERVACIONES
SYU652	JOHAN ECHEVERRY	9552	MANIZALES VILLAMARIA	JOHN EDWAR ZAPATA ACEVEDO		47	 $ 8.320.102 	21199	1	 $ 80.148 		FEP1187378 AP661618	48	 $ 8.400.250 	
KOL802	CAMILO CASTAÑO	9553 7001	MANIZALES VILLAMARIA	LUIS CARLOS CADAVID RESTREPO		56	 $ 10.297.063 	21177 21200	1	 $ 169.326 	19241	AP660928 AP660930	57	 $ 10.466.389 	
WFV015	YONNI VALENCIA	9554	MANIZALES VILLAMARIA	CAMILO SUAREZ GARCIA	CRISTIAN CAMILO OSPINA PARRA	57	 $ 8.342.192 	21201	3	 $ 461.298 	19242 19239	AP661619 AP661526 AP661002	60	 $ 8.803.490 	
EYY183	JOHN ARENAS	9555	MANIZALES VILLAMARIA	JUAN ALEJANDRO FRANCO MARIN	ELKIN GARCIA OCAMPO	50	 $ 7.169.106 	21202	2	 $ 214.458 	19243	FEP1187387	52	 $ 7.383.564 	
SLI587	MIGUEL GONZALES	9556	MANIZALES VILLAMARIA	MILTON GILMER OSORIO CALLE		41	 $ 4.451.316 	21203	4	 $ 915.276 	19244		45	 $ 5.366.592 	
WGZ876	RICARDO PINEDA	9557	MARMATO LA MERCED	JUAN MANUEL DELGADO NARVAEZ	ANDRES MATEO VILLALBA DIAZ	30	 $ 12.826.168 	21204					30	 $ 12.826.168 	
EYX091	CARLOS GOMEZ	9558	AGUADAS PACORA	VICTOR ALFONSO PULGARIN MEJIA	JUAN CAMILO COCOMA OROZCO	61	 $ 14.988.071 	21181	5	 $ 4.266.255 	19233		66	 $ 19.254.326 	
SMH182	JUAN DAVID	9559	PALESTINA ARAUCA	BRANDON STEVEN GIL BAEZ		45	 $ 9.360.402 	21205	3	 $ 468.779 	19246		48	 $ 9.829.181 	 SMH182 EXTRA $60.000 
TJX795	ANDRES QUINTERO	7010				3	 $ 17.109.840 					AP662997 AP662998 AP662999	3	 $ 17.109.840 	QUIMABAYA/MONTENEGRO/TEBAIDA VALOR DE FLETE $700.000 INCLUYE DESCARGUE
SPU120	OSWALDO	9601 7009	ARMENIA	YEISON DAVID RENDON SOTO		59	 $ 7.264.262 	21180 21206					59	 $ 7.264.262 	
VZD334	JULIAN CUELLAR	9602	ARMENIA	SEBASTIAN VILLADA VELASQUEZ	JOHAN STIVEN MUÑOZ RUIZ	63	 $ 8.725.457 	21207					63	 $ 8.725.457 	
EQY944	GOBER CRISTANCHO	9603	ARMENIA	JOSE ALEXANDER CONSTAIN PERLAZA	SANTIAGO HENAO MORALES	55	 $ 8.160.115 	21208				AP660294	55	 $ 8.160.115 	
SXF257	FABIO RUIZ	9604 7010	QUIMBAYA	CAMILO ANDRES CONTRERAS RIVAS	CESAR AUGUSTO CASTILLO LONDOÑO	51	 $ 13.429.082 	21178 21209					51	 $ 13.429.082 	 SXF257 ADICIONAL AL FLETE $100.000 SOBRECARGO 
WLS478	HUMBERTO RINCON	9605	CORDOBA PIJAO BVISTA	CHRISTIAN DAVID CAICEDO MONTAÑO		38	 $ 5.584.269 	21184	7	 $ 1.118.851 	19248 19249		45	 $ 6.703.120 	
TTL256	YIMERSON GARCIA	9606	SALENTO	CRISTIAN FABIAN CAMACHO MARTINEZ		33	 $ 8.329.916 	21185	4	 $ 768.867 	19247 19255	AP661623 AP661625	37	 $ 9.098.783 	
SMO183	GABRIEL PEREZ	9453	PEREIRA	JUAN DAVID QUINTERO GRAJALES		59	 $ 7.606.141 	21190					59	 $ 7.606.141 	SMO183 VALOR DE FLETE $300.000 ENTREGA LECHE EN LAS VIOLETAS
XVI496	PABLO RAMIREZ	9454	PEREIRA	CARLOS ANDRES PINEDA CANO		46	 $ 7.934.917 	21191	4	 $ 483.730 	19252		50	 $ 8.418.647 	
TMZ674	RICARDO LOPEZ	9455	PEREIRA	ANDRES FELIPE RIOS CAICEDO	ANDRES CAMILO MUÑOZ CAICEDO	63	 $ 8.676.576 	21192					63	 $ 8.676.576 	
SPQ814	CARLOS VELASCO	9456	SANTA ROSA	GERMAN GALVEZ CORTES		46	 $ 6.402.879 	21193					46	 $ 6.402.879 	
WHM317	HUMBERTO PARRA	9457	PEREIRA	JUAN ESTEBAN GALLEGO DIEZ		58	 $ 7.012.375 	21194					58	 $ 7.012.375 	
PEK019	MIGUEL TABARES	9458	PEREIRA	JHON WILSON GIRALDO CARVAJAL		53	 $ 5.934.562 	21195					53	 $ 5.934.562 	
WHM896	ALEXANDER CUELLAR	9459	PEREIRA	CAMILO LEANDRO GUECHE PEÑA		55	 $ 6.769.857 	21196					55	 $ 6.769.857 	
WLC133	JULIAN  	9460	PEREIRA	EDWIN MAURICIO GOMEZ GALINDO	JUAN JOSE CONTRERAS HERNANDEZ	68	 $ 6.820.547 	21197					68	 $ 6.820.547 	
TNH494	ADALBERTO MEJIA	9461 9450	CARTAGO	DIORLAN ANTONIO MESA FLOREZ		43	 $ 7.168.376 	21182 21198					43	 $ 7.168.376 	
WTN748	DIEGO RATIVA	7004	PEREIRA	BRAHIAN STIVEN VALENCIA IGLESIAS		53	 $ 7.786.538 	21210	10	 $ 1.266.676 	19253		63	 $ 9.053.214 	
EST067	JORGE RIVILLAS	7005	ARGELIA EL CAIRO	ARBEY DE JESUS LARGO LARGO		34	 $ 10.842.847 	21211	2	 $ 185.606 	19236		36	 $ 11.028.453 	
ERK303	JORGE ALARCON	7006	BALBOA LA CELIA	ROVINSON TORRES RIVERA		38	 $ 7.079.950 	21186	5	 $ 927.621 	19234		43	 $ 8.007.571 	
JVM223	WILMAR CARDONA	7007 9451	ANSERMA	OSCAR MAURICIO RESTREPO MORENO	JHON FREDY MORENO	53	 $ 15.841.428 	21187 21175	3	 $ 860.705 	19238		56	 $ 16.702.133 	
SQB119	CARLOS CASTAÑO	FLEISCHMANN	PEREIRA - DOSQUEBRADAS	DIEGO FRANCO					56	 $ 5.593.512 	19227 19235 19251		56	 $ 5.593.512 	"""

lines = data.strip().split('\n')
headers = lines[0].split('\t')

sql_output = f\"\"\"/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIERCOLES 17 JUNIO 2026
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-17'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 17-Jun-2026
   ------------------------------------------------- */
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES
\"\"\"

values = []
for i, line in enumerate(lines[1:]):
    cols = line.split('\t')
    if len(cols) < 16:
        cols += [''] * (16 - len(cols))
    
    placa = cols[0].strip()
    conductor = cols[1].strip()
    zona = cols[2].strip()
    poblacion = cols[3].strip()
    
    if zona == 'FLEISCHMANN':
        proveedor = 'FLEISCHMANN'
    else:
        proveedor = 'ALPINA'
        
    aux1 = cols[4].strip()
    aux2 = cols[5].strip()
    
    auxiliares = []
    if aux1: auxiliares.append(aux1)
    if aux2: auxiliares.append(aux2)
    str_auxiliares = ", ".join(auxiliares) if auxiliares else ""
    no_auxiliares = len(auxiliares)
    adicionales = no_auxiliares if no_auxiliares > 0 else 0
    if not str_auxiliares:
        str_auxiliares = ""
        
    # TJX795 is a special case
    if placa == 'TJX795':
        no_auxiliares = 0
        adicionales = 0

    planilla_ap = cols[8].strip()
    planilla_fep = cols[11].strip()
    planillas = []
    if planilla_ap: planillas.append(planilla_ap)
    if planilla_fep: planillas.append(planilla_fep)
    no_planilla = " ".join(planillas)
    
    obs = cols[15].strip()
    razon_adicional = obs if obs else '-'
    valor_adicional = 0
    
    if 'EXTRA $' in obs:
        match = re.search(r'EXTRA\s*\$([\d\.]+)', obs)
        if match:
            valor_adicional = int(match.group(1).replace('.', ''))
    elif 'ADICIONAL AL FLETE $' in obs:
        match = re.search(r'ADICIONAL AL FLETE\s*\$([\d\.]+)', obs)
        if match:
            valor_adicional = int(match.group(1).replace('.', ''))
            
    # if total value specified, put 0 as extra, as I don't know the base
    # I'll just write it as 0 and the user can update if needed
            
    valor_ruta_str = cols[14].strip()
    valor_ruta = int(re.sub(r'[^\d]', '', valor_ruta_str)) if valor_ruta_str else 0
    
    t_pedidos = cols[13].strip()
    no_pedidos = int(t_pedidos) if t_pedidos else 0
    
    fac_adicionales = cols[12].strip()
    if not fac_adicionales:
        fac_adicionales = "NULL"
    else:
        fac_adicionales = f"'{fac_adicionales}'"
        
    lista_id = proveedor
    poblacion_escaped = poblacion.replace("'", "''")
    precio_sql = f"(SELECT precio FROM precios_fletes WHERE lista_id='{lista_id}' AND UPPER(poblacion)='{poblacion_escaped}' LIMIT 1) + {valor_adicional}"
    
    adicional_text = f"**ADICIONAL ${valor_adicional:,.0f}**".replace(',', '.') if valor_adicional > 0 else "sin adicional"
    
    val_str = f"  /* {i+1:02d} - {placa} - {adicional_text} */\n"
    val_str += f"  ('2026-06-17','Miercoles','{proveedor}','{conductor}','{placa}','{no_planilla}','{zona}','{poblacion_escaped}','{str_auxiliares}',{no_auxiliares},\n"
    val_str += f"   {adicionales},{valor_adicional},'{razon_adicional}',\n"
    val_str += f"   {valor_ruta},\n"
    val_str += f"   {precio_sql},\n"
    val_str += f"   {no_pedidos},{fac_adicionales},'TYM')"
    
    values.append(val_str)
    
sql_output += ",\n\n".join(values) + ";\n\n"

sql_output += \"\"\"/* -------------------------------------------------
   3️⃣  Verificación rápida (opcional)
   ------------------------------------------------- */
SELECT fecha,
       placa,
       precio                      AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       proveedor
FROM fletes
WHERE fecha = '2026-06-17'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
\"\"\"

with open('c:/Users/Juanjo/Documents/Fletesapp/insert_fletes_june17.sql', 'w', encoding='utf-8') as f:
    f.write(sql_output)

print("SQL file generated successfully!")
