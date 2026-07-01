const fs = require('fs');

const data = `PLACA	CONDUCTOR	ZONAS	POBLACION	AUXILIAR	AUXILIAR	PEDIDOS	VALOR RUTA	PLANILLA AP	PEDIDOS	VALOR RUTA	PLANILLA FEP	FAC ADICIONALES AP/FEP	T PEDIDOS	T VALOR	OBSERVACIONES
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
SQB119	CARLOS CASTAÑO	FLEISCHMANN	PEREIRA - DOSQUEBRADAS	DIEGO FRANCO					56	 $ 5.593.512 	19227 19235 19251		56	 $ 5.593.512 	`;

const lines = data.trim().split('\n');

let sqlOutput = "/* ==========================================================\n" +
"   🚛 SCRIPT DE PROGRAMACIÓN: MIERCOLES 17 JUNIO 2026\n" +
"   ========================================================== */\n\n" +
"/* -------------------------------------------------\n" +
"   1️⃣  Eliminar los fletes del día (evita duplicados)\n" +
"   ------------------------------------------------- */\n" +
"DELETE FROM fletes\n" +
"WHERE fecha = '2026-06-17'\n" +
"  AND proveedor IN ('ALPINA','FLEISCHMANN');\n\n" +
"/* -------------------------------------------------\n" +
"   2️⃣  Insertar los fletes del 17-Jun-2026\n" +
"   ------------------------------------------------- */\n" +
"INSERT INTO fletes (\n" +
"    fecha, dia, proveedor, contratista, placa, no_planilla,\n" +
"    zona, poblacion, auxiliares, no_auxiliares,\n" +
"    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,\n" +
"    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social\n" +
")\n" +
"VALUES\n";

const values = [];

lines.slice(1).forEach((line, i) => {
    const cols = line.split('\t');
    while (cols.length < 16) cols.push('');

    const placa = cols[0].trim();
    const conductor = cols[1].trim();
    const zona = cols[2].trim();
    let poblacion = cols[3].trim();

    let proveedor = 'ALPINA';
    if (zona === 'FLEISCHMANN') {
        proveedor = 'FLEISCHMANN';
    }

    const aux1 = cols[4].trim();
    const aux2 = cols[5].trim();
    const auxiliaresList = [];
    if (aux1) auxiliaresList.push(aux1);
    if (aux2) auxiliaresList.push(aux2);
    
    let strAuxiliares = auxiliaresList.join(', ');
    let noAuxiliares = auxiliaresList.length;
    let adicionales = noAuxiliares > 0 ? noAuxiliares : 0;

    if (placa === 'TJX795') {
        noAuxiliares = 0;
        adicionales = 0;
    }

    const planillaAp = cols[8].trim();
    const planillaFep = cols[11].trim();
    const planillas = [];
    if (planillaAp) planillas.push(planillaAp);
    if (planillaFep) planillas.push(planillaFep);
    const noPlanilla = planillas.join(' ');

    const obs = cols[15].trim();
    const razonAdicional = obs ? obs : '-';
    let valorAdicional = 0;

    if (obs.includes('EXTRA $')) {
        const match = obs.match(/EXTRA\s*\$([\d\.]+)/);
        if (match) valorAdicional = parseInt(match[1].replace(/\./g, ''));
    } else if (obs.includes('ADICIONAL AL FLETE $')) {
        const match = obs.match(/ADICIONAL AL FLETE\s*\$([\d\.]+)/);
        if (match) valorAdicional = parseInt(match[1].replace(/\./g, ''));
    }

    const valorRutaStr = cols[14].trim();
    const valorRuta = valorRutaStr ? parseInt(valorRutaStr.replace(/[^\d]/g, '')) : 0;

    const tPedidos = cols[13].trim();
    const noPedidos = tPedidos ? parseInt(tPedidos) : 0;

    let facAdicionales = cols[12].trim();
    facAdicionales = facAdicionales ? "'" + facAdicionales + "'" : 'NULL';

    const poblacionEscaped = poblacion.replace(/'/g, "''");
    const precioSql = "(SELECT precio FROM precios_fletes WHERE lista_id='" + proveedor + "' AND UPPER(poblacion)='" + poblacionEscaped + "' LIMIT 1) + " + valorAdicional;

    const adicionalText = valorAdicional > 0 ? "**ADICIONAL $" + valorAdicional.toLocaleString('de-DE') + "**" : 'sin adicional';

    let valStr = "  /* " + (i + 1).toString().padStart(2, '0') + " – " + placa + " – " + adicionalText + " */\n";
    valStr += "  ('2026-06-17','Miercoles','" + proveedor + "','" + conductor + "','" + placa + "','" + noPlanilla + "','" + zona + "','" + poblacionEscaped + "','" + strAuxiliares + "'," + noAuxiliares + ",\n";
    valStr += "   " + adicionales + "," + valorAdicional + ",'" + razonAdicional + "',\n";
    valStr += "   " + valorRuta + ",\n";
    valStr += "   " + precioSql + ",\n";
    valStr += "   " + noPedidos + "," + facAdicionales + ",'TYM')";

    values.push(valStr);
});

sqlOutput += values.join(',\n\n') + ';\n\n';

sqlOutput += "/* -------------------------------------------------\n" +
"   3️⃣  Verificación rápida (opcional)\n" +
"   ------------------------------------------------- */\n" +
"SELECT fecha,\n" +
"       placa,\n" +
"       precio                      AS precio_flete_con_adicional,\n" +
"       valor_adicional_negociacion AS extra,\n" +
"       razon_adicional_negociacion AS motivo,\n" +
"       proveedor\n" +
"FROM fletes\n" +
"WHERE fecha = '2026-06-17'\n" +
"  AND proveedor IN ('ALPINA','FLEISCHMANN')\n" +
"ORDER BY proveedor, placa;\n";

fs.writeFileSync('c:/Users/Juanjo/Documents/Fletesapp/insert_fletes_june17.sql', sqlOutput, 'utf8');
console.log("SQL file generated successfully!");
