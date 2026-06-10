const fs = require('fs');

const RAW_DATA = `TMO981	JOHAN ECHEVERRY	9552 7001	MANIZALES	EDWAR ZAPATA		49	 $ 7.782.938 	20444 20460	2	 $ 180.663 	18887		51	 $ 7.963.601 	 TMO981 ADICIONAL $20.000 ENTREGA SUPER EN VILLAMARIA 
KOL802	CAMILO CASTAÑO	9553 9550	VILLAMARIA	GERMAN GALVEZ		54	 $ 8.639.836 	20435 20461	7	 $ 564.780 	18888		61	 $ 9.204.616 	
WFV015	YONNI VALENCIA	9554 7000	MANIZALES	YEISON TABARES	CRISTIAN OSPINA	49	 $ 11.562.343 	20438 20462	2	 $ 155.576 	18889		51	 $ 11.717.919 	
EYY183	RUBEN	9555	MANIZALES	JUAN ALEJANDRO		59	 $ 7.624.660 	20464	5	 $ 343.518 	18890		64	 $ 7.968.178 	
SLI587	MIGUEL GONZALES	9556	MANIZALES	MILTON OSORIO	ADRIAN MARTINEZ	49	 $ 7.375.915 	20465	4	 $ 573.845 	18891		53	 $ 7.949.760 	
WGZ876	RICARDO PINEDA	9557	KM41 IRRA FELISA 	JUAN DELGADO		24	 $ 10.256.989 	20466	1	 $ 80.147 	18856 18858	 	25	 $ 10.337.136 	 WGZ876 EXTRA $60.000 
EYX091	CARLOS GOMEZ	9558	PACORA SALAMINA	VICTOR PULGARIN	JUAN COCOMA	65	 $ 10.390.928 	20467 20421			18885 18878		65	 $ 10.390.928 	
TUL630	JUAN DAVID	7002	CHINCHINA	JOHAN MUÑOZ		3	 $ 37.501.709 					AP636698 AP636770-771-768-769	3	 $ 37.501.709 	 TUL630 EXTRA $60.000 
TRL186	RUBEN	9560	SUPIA RIOSUCIO	MATEO VILLALBA		4	 $ 11.004.262 	20436					4	 $ 11.004.262 	
SMH182	JUAN DAVID	9559	CHINCHINA	BRANDON BAEZ		66	 $ 7.939.808 	20468	8	 $ 1.058.808 	18893		74	 $ 8.998.616 	 SMH182 EXTRA $60,000 
  															
SPU120	OSWALDO	9601	ARMENIA	YEISON RENDON		60	 $ 7.650.758 	20469					60	 $ 7.650.758 	
VZD334	JULIAN CUELLAR	9602	ARMENIA	SEBASTIAN VILLADA		47	 $ 6.036.414 	20470					47	 $ 6.036.414 	
EQY944	GOBER CRISTANCHO	9603	CALARCA	ALEXANDER COSTAIN		58	 $ 4.406.860 	20471	3	 $ 367.343 	18899 18895 18894		61	 $ 4.774.203 	
SXF257	FABIO RUIZ	9604	MONTENEGRO P/TAPAO	CAMILO CONTRERAS	CAMILO SUAREZ	51	 $ 6.942.615 	20472	8	 $ 689.152 	18880		59	 $ 7.631.767 	
WLS478	HUMBERTO RINCON	9605 7010	TEBAIDA	CRISTIAN CAICEDO	JUAN CONTRERAS	44	 $ 11.728.408 	20441 20445					44	 $ 11.728.408 	
TTL256	YIMERSON GARCIA	9606 9600	CIRCASIA	CRISTIAN CAMACHO		34	 $ 6.198.488 	20437 20446	6	 $ 425.940 	18898		40	 $ 6.624.428 	
															
SMO183	GABRIEL PEREZ	9453	PEREIRA	JUAN QUINTERO		57	 $ 6.885.269 	20451					57	 $ 6.885.269 	
LUM993	PABLO RAMIIREZ	9454	PEREIRA	ANDRES PINEDA		49	 $ 6.506.124 	20452					49	 $ 6.506.124 	
TMZ674	RICARDO LOPEZ	9455	PEREIRA	ANDRES RIOS		58	 $ 6.574.412 	20453					58	 $ 6.574.412 	
SPQ814	CARLOS VELASCO	9456	SANTA ROSA	SANTIAGO HENAO		49	 $ 6.305.438 	20454		   			49	 $ 6.305.438 	
WHM317	HUMBERTO PARRA	9457	PEREIRA	ESTEBAN GALLEGO		62	 $ 7.877.320 	20455					62	 $ 7.877.320 	
PEK019	MIGUEL TABARES	9458	PEREIRA	JHON GIRALDO		47	 $ 5.076.930 	20456					47	 $ 5.076.930 	
WHM896	ALEXANDER CUELLAR	9459	PEREIRA	CAMILO PEÑA		60	 $ 8.049.753 	20457					60	 $ 8.049.753 	
WLC133	JULIAN  	9460	PEREIRA	EDWIN GOMEZ	CAMILO MUÑOZ	77	 $ 12.927.394 	20458					77	 $ 12.927.394 	
TNH494	ADALBERTO MEJIA	9461	CARTAGO	DIORLAN FLOREZ		55	 $ 6.171.225 	20414TSS 20459					55	 $ 6.171.225 	
WTN748	DIEGO RATIVA	7004	PEREIRA	BRAHIAN VALENCIA		51	 $ 6.841.898 	20473					51	 $ 6.841.898 	
															
EST067	JORGE RIVILLAS	7005	CARTAGO	CESAR CASTILLO		44	 $ 5.688.146 	20474					44	 $ 5.688.146 	
ERK303	JORGE ALARCON	7006 9450	VIRGINIA	ROBINSON TORRES		55	 $ 9.054.846 	20433 20447	13	 $ 2.296.713 	18900 18896		68	 $ 11.351.559 	
JVM223	WILMAR CARDONA	7007 9451	BELEN MISTRATO	LUIS CADAVID	EXTRA MORENO	60	 $ 14.813.857 	20434 20448	6	 $ 1.197.207 	18897		66	 $ 16.011.064 	
															
SQB119	CARLOS CASTAÑO	FLEISCHMANN	ARMENIA	DIEGO FRANCO					68	 $ 6.914.369 	18886 18864		68	 $ 6.914.369 	`;

function parseMoney(str) {
  if (!str) return 0;
  return parseInt(str.replace(/[\$\s\.\,\']/g, '')) || 0;
}

function parsePlanilla(str) {
  if (!str) return '';
  return str.trim();
}

function run() {
  const lines = RAW_DATA.trim().split('\n');
  const valuesSql = [];
  let index = 1;

  for (const line of lines) {
    if (!line.trim()) continue;
    const parts = line.split('\t');
    
    if (parts.length < 15) {
      continue;
    }

    const placa = parts[0].trim();
    // Normalize conductor name
    let conductor = parts[1].trim();
    if (conductor === "PABLO RAMIIREZ") {
      conductor = "PABLO RAMIREZ";
    }
    const zonasRaw = parts[2].trim();
    const poblacionRaw = parts[3].trim();
    const aux1 = parts[4].trim();
    const aux2 = parts[5] ? parts[5].trim() : '';
    
    const ped1 = parseInt(parts[6].trim()) || 0;
    const val1 = parseMoney(parts[7].trim());
    const planilla1 = parsePlanilla(parts[8]);
    
    const ped2 = parseInt(parts[9].trim()) || 0;
    const val2 = parseMoney(parts[10].trim());
    const planilla2 = parsePlanilla(parts[11]);
    
    const facAdic = parts[12] ? parts[12].trim() : '';
    const tPed = parseInt(parts[13].trim()) || 0;
    const tVal = parseMoney(parts[14].trim());
    const obs = parts[15] ? parts[15].trim() : '';

    // Provider determination
    let provider = "ALPINA";
    if (poblacionRaw === "FLEISCHMANN" || zonasRaw === "FLEISCHMANN") {
      provider = "FLEISCHMANN";
    }

    // Combined Planilla
    let planillas = [];
    if (planilla1 && planilla1 !== '-') planillas.push(planilla1);
    if (planilla2 && planilla2 !== '-') planillas.push(planilla2);
    const combinedPlanilla = planillas.join(' ').replace(/\s+/g, ' ').trim() || '-';

    // Zonas union
    const combinedZonas = zonasRaw.replace(/\s+/g, ' ').trim();

    // Auxiliares concatenation
    let auxiliaresString = 'NO APLICA';
    let noAuxiliares = 0;
    if (aux1 && aux1 !== '-') {
      auxiliaresString = aux1;
      noAuxiliares = 1;
      if (aux2 && aux2 !== '-') {
        auxiliaresString = `${aux1}, ${aux2}`;
        noAuxiliares = 2;
      }
    }

    // Additional parsing
    let valAdicional = 0;
    let razonAdicional = '-';
    if (obs) {
      // Look for custom adicional/extra values like "TMO981 ADICIONAL $20.000 ..."
      const hasExtraOrAdic = obs.toUpperCase().includes('EXTRA') || obs.toUpperCase().includes('ADICIONAL');
      if (hasExtraOrAdic) {
        const moneyMatch = obs.replace(/[\.,]/g, '').match(/\$\s*([0-9]+)/);
        if (moneyMatch) {
          valAdicional = parseInt(moneyMatch[1]) || 0;
          razonAdicional = obs;
        }
      }
    }

    // Special population maps for the Subquery
    let subqueryPoblacion = poblacionRaw;
    if (poblacionRaw === "KM41 IRRA FELISA") {
      subqueryPoblacion = "IRRA LA FELISA VER RIOSUCIO";
    } else if (poblacionRaw === "BELEN MISTRATO") {
      subqueryPoblacion = "BELEN DE UMBRIA";
    } else if (poblacionRaw === "VIRGINIA") {
      subqueryPoblacion = "VIRGINIA";
    } else if (poblacionRaw === "MONTENEGRO P/TAPAO") {
      subqueryPoblacion = "MONTENEGRO PTAPAO";
    }

    // In yesterday's reference query format:
    // "adicionales" matches the integer "no_auxiliares" value (either 1 or 2)
    const adicionalesVal = noAuxiliares;

    const formattedIndex = String(index).padStart(2, '0');
    const commentAdicional = valAdicional > 0 ? `**ADICIONAL $${valAdicional.toLocaleString('de-DE')}**` : 'sin adicional';

    const valuesStr = `/* -----------------------------------------------------------------
   ${formattedIndex} – ${placa} – ${commentAdicional}
   ----------------------------------------------------------------- */
('2026-05-22','Viernes','${provider}','${conductor}','${placa}','${combinedPlanilla || '-'}','${combinedZonas}','${poblacionRaw}','${auxiliaresString}',${noAuxiliares},
 ${adicionalesVal},${valAdicional},'${razonAdicional}',
 ${tVal},
 (SELECT precio FROM precios_fletes WHERE lista_id='${provider}' AND UPPER(poblacion)='${subqueryPoblacion}' LIMIT 1) + ${valAdicional},
 ${tPed},${facAdic ? `'${facAdic}'` : 'NULL'},'TYM')`;

    valuesSql.push(valuesStr);
    index++;
  }

  // Generate SQL output
  const sql = `/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-05-22'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 22‑May‑2026
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
${valuesSql.join(',\n\n')};

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
WHERE fecha = '2026-05-22'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
`;

  fs.writeFileSync('insert_fletes_may22.sql', sql);
  console.log("SQL generated successfully in insert_fletes_may22.sql");
}

run();
