const fs = require('fs');
const https = require('https');

const SUPABASE_URL = 'https://culezzzujkwjpdlalfzi.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN1bGV6enp1amt3anBkbGFsZnppIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYxNzQ2NTIsImV4cCI6MjA4MTc1MDY1Mn0.qKp2IrOQW0YaPvSmIsmSFxcnFB_vPd2D0A6VzZJAhe8';

const RAW_DATA = `SYU652	JOHAN ECHEVERRY	9552	MANIZALES	EDWAR ZAPATA	CRISTIAN OSPINA	44	 $ 7.118.656 	20637 20594TSS	2	 $ 81.839 	18967		46	 $ 7.200.495 	
KOL802	CAMILO CASTAÑO	9553	MANIZALES	GERMAN GALVEZ		45	 $ 5.003.101 	20638	4	 $ 137.359 	18968		49	 $ 5.140.460 	
EYX091	CARLOS GOMEZ	9554	NEIRA	VICTOR PULGARIN	JUAN COCOMA	47	 $ 7.974.945 	20650			18969 18986		47	 $ 7.974.945 	
EYY183	RUBEN	9555	MANIZALES	JUAN ALEJANDRO		49	 $ 6.481.147 	20639	6	 $ 299.812 	18970		55	 $ 6.780.959 	
SLI587	MIGUEL GONZALES	9556 9550	MANIZALES	MILTON OSORIO	ADRIAN MARTINEZ	51	 $ 10.403.037 	20612 20640	4	 $ 499.426 	18971		55	 $ 10.902.463 	
WGZ876	RICARDO PINEDA	9557	RIOSUCIO	JUAN DELGADO	MATEO VILLALBA	51	 $ 11.567.183 	20641	2	 $ 175.218 	18972		53	 $ 11.742.401 	 WGZ876 EXTRA $60.000 SE LE DEBIA 
SMH182	JUAN DAVID	9559	SAN JOSE BELALCAZAR	BRANDON BAEZ	YEISON TABARES	50	 $ 12.225.943 	20643	2	 $ 209.030 	18974		52	 $ 12.434.973 	
  															
WFV015	YONNI VALENCIA	7008	CALARCA	CAMILO MUÑOZ		3	 $ 11.895.058 	20615					3	 $ 11.895.058 	 ADICIONAL AL FLETE $120.000 POR DESCARGUE POR PARTE DE CONDUCTORES 
SPU120	OSWALDO	9601 7009	ARMENIA	YEISON RENDON		59	 $ 8.898.182 	20616 20644	1	 $ 306.845 	18976		60	 $ 9.205.027 	
VZD334	JULIAN CUELLAR	9602	ARMENIA	JOHAN MUÑOZ	CAMILO SUAREZ	81	 $ 7.597.791 	20645 20602TSS					81	 $ 7.597.791 	 ADICIONAL AL FLETE $100.000 ENTREGA DE TSS 
EQY944	GOBER CRISTANCHO	9603	ARMENIA	ALEXANDER COSTAIN		59	 $ 6.881.584 	20646				AP641018 AP641019	59	 $ 6.881.584 	
SXF257	FABIO RUIZ	9604	ALCALA ULLOA	CAMILO CONTRERAS		44	 $ 6.021.464 	20647	5	 $ 300.479 	18978		49	 $ 6.321.943 	
WLS478	HUMBERTO RINCON	9605	CAICEDONIA	CRISTIAN CAICEDO	JUAN CONTRERAS	51	 $ 9.880.070 	20620	4	 $ 706.915 	18979		55	 $ 10.586.985 	
TTL256	YIMERSON GARCIA	9606 9600	FILANDIA	CRISTIAN CAMACHO		39	 $ 9.458.537 	20613 20621 20626	1	 $ 167.140 	18984		40	 $ 9.625.677 	
															
TRL186	RUBEN	A/COLON GALERIA	CALARCA			2	 $ 10.822.241 	20617					2	 $ 10.822.241 	 TRL186 VALOR DE FLETE $400.000 
SNL038	MIGUEL	LA50 P/ESPEJO	ARMENIA			2	 $ 13.646.388 	20566					2	 $ 13.646.388 	 VALOR DE FLETE $600.000 INCLUYE DESCARGUE 
TJX795	ANDRES	LA19 M/TEBAIDA	ARMENIA TEBAIDA			2	 $ 19.906.751 	20618 20574					2	 $ 19.906.751 	 VALOR DE FLETE $700.000 INCLUYE DESCARGUE 
															
SMO183	GABRIEL PEREZ	9453	PEREIRA	JUAN QUINTERO		52	 $ 5.856.958 	20628					52	 $ 5.856.958 	
XVI496	PABLO RAMIREZ	9454	PEREIRA	ANDRES PINEDA		53	 $ 9.701.175 	20629	4	 $ 191.469 	18980		57	 $ 9.892.644 	
TMZ674	RICARDO LOPEZ	9455	PEREIRA	ANDRES RIOS		51	 $ 5.640.680 	20630					51	 $ 5.640.680 	 TMZ674 EXTRA $60.000 
SPQ814	CARLOS VELASCO	9456	SANTA ROSA	SANTIAGO HENAO		47	 $ 6.767.658 	20631				AP642340	47	 $ 6.767.658 	
WHM317	HUMBERTO PARRA	9457	PEREIRA	ESTEBAN GALLEGO		46	 $ 4.513.358 	20632	4	 $ 359.955 		FEP1185686-701-692-685	50	 $ 4.873.313 	
PEK019	MIGUEL TABARES	9458	PEREIRA	JHON GIRALDO		41	 $ 5.242.117 	20633					41	 $ 5.242.117 	
WHM896	ALEXANDER CUELLAR	9459	PEREIRA	CAMILO PEÑA		45	 $ 5.181.234 	20634					45	 $ 5.181.234 	
WLC133	JULIAN  	9460	PEREIRA	EDWIN GOMEZ		41	 $ 5.539.799 	20635					41	 $ 5.539.799 	
TNH494	ADALBERTO MEJIA	9461	CARTAGO	DIORLAN FLOREZ		55	 $ 10.655.340 	20636				AP642334 AP642335	55	 $ 10.655.340 	
WTN748	DIEGO RATIVA	7004	MARSELLA	BRAHIAN VALENCIA		42	 $ 10.045.261 	20648	3	 $ 142.535 	18982		45	 $ 10.187.796 	 WTN748 ADICONAL $50.000 ENTREGA TSS AEROPUERTO 
															
EST067	JORGE RIVILLAS	7005	CARTAGO	CESAR CASTILLO		43	 $ 7.301.658 	20649				AP642332 AP642333	43	 $ 7.301.658 	
ERK303	JORGE ALARCON	7006	APIA VIRGINIA	ROBINSON TORRES		43	 $ 10.032.100 	20622	3	 $ 215.691 	18981		46	 $ 10.247.791 	 ERK303 EXTRA $60.000 
JVM223	WILMAR CARDONA	7007 9451	VITERBO	OSCAR RESTREPO	EXTRA MORENO	57	 $ 10.077.989 	20611 20623	3	 $ 139.765 	18983		60	 $ 10.217.754 	
															
SQB119	CARLOS CASTAÑO	FLEISCHMANN	CUBA	DIEGO FRANCO					38	 $ 3.434.809 	18975		38	 $ 3.434.809 	`;

function get(path) {
    return new Promise((resolve, reject) => {
        const url = `${SUPABASE_URL}/rest/v1/${path}`;
        const req = https.get(url, {
            headers: {
                'apikey': SUPABASE_ANON_KEY,
                'Authorization': `Bearer ${SUPABASE_ANON_KEY}`
            }
        }, (res) => {
            let data = '';
            res.on('data', chunk => data += chunk);
            res.on('end', () => {
                if (res.statusCode >= 200 && res.statusCode < 300) {
                    resolve(JSON.parse(data));
                } else {
                    reject(new Error(`Status: ${res.statusCode}, Body: ${data}`));
                }
            });
        });
        req.on('error', reject);
    });
}

function parseMoney(str) {
  if (!str) return 0;
  return parseInt(str.replace(/[\$\s\.\,\']/g, '')) || 0;
}

function parsePlanilla(str) {
  if (!str) return '';
  return str.trim();
}

function getSubqueryPoblacion(poblacionRaw) {
    let target = poblacionRaw.trim().toUpperCase();
    if (target === "ARMENIA TEBAIDA") {
        return "ARMENIA";
    }
    return target;
}

async function main() {
    try {
        console.log("Fetching database prices...");
        const dbPricesList = await get('precios_fletes?lista_id=in.("ALPINA","FLEISCHMANN")&select=lista_id,poblacion,precio');
        
        const dbPrices = {};
        for (const item of dbPricesList) {
            const key = `${item.lista_id}::${item.poblacion.toUpperCase().trim()}`;
            dbPrices[key] = item.precio;
        }

        const lines = RAW_DATA.trim().split('\n');
        const valuesSql = [];
        let index = 1;

        for (const line of lines) {
            if (!line.trim()) continue;
            const parts = line.split('\t');
            if (parts.length < 15) continue;

            const placa = parts[0].trim();
            const conductor = parts[1].trim();
            const zonasRaw = parts[2].trim();
            const poblacionRaw = parts[3].trim();
            const aux1 = parts[4].trim();
            const aux2 = parts[5] ? parts[5].trim() : '';

            // AP columns
            const ped1 = parseInt(parts[6].trim()) || 0;
            const val1 = parseMoney(parts[7].trim());
            const planilla1 = parsePlanilla(parts[8]);

            // FEP columns
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

            // Combined planillas
            let planillas = [];
            if (planilla1 && planilla1 !== '-') planillas.push(planilla1);
            if (planilla2 && planilla2 !== '-') planillas.push(planilla2);
            const combinedPlanilla = planillas.join(' ').replace(/\s+/g, ' ').trim() || '-';

            const combinedZonas = zonasRaw.replace(/\s+/g, ' ').trim();

            // Auxiliares
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

            const subqueryPob = getSubqueryPoblacion(poblacionRaw);
            const lookupKey = `${provider}::${subqueryPob.toUpperCase()}`;
            const dbPrice = dbPrices[lookupKey];

            // Adicional/Negotiation
            let valAdicional = 0;
            let razonAdicional = '-';
            
            if (obs) {
                // First check for fixed total flete format "VALOR DE FLETE $XXX.000" or similar
                const fixedMatch = obs.toUpperCase().match(/VALOR\s+DE\s+FLETE\s+\$?\s*([0-9\.,]+)/) ||
                                   obs.toUpperCase().match(/EXTRA\s+\$?\s*([0-9\.,]+)\s+SE\s+LE\s+DEBIA/);
                
                if (fixedMatch && obs.toUpperCase().includes('VALOR DE FLETE')) {
                    const targetTotal = parseInt(fixedMatch[1].replace(/[\.,]/g, '')) || 0;
                    if (dbPrice) {
                        valAdicional = targetTotal - dbPrice;
                        razonAdicional = obs.trim();
                    }
                } else {
                    // Regular extra or additional logic
                    const hasExtraOrAdic = obs.toUpperCase().includes('EXTRA') || obs.toUpperCase().includes('ADICIONAL') || obs.toUpperCase().includes('ADICONAL');
                    if (hasExtraOrAdic) {
                        const moneyMatch = obs.replace(/[\.,]/g, '').match(/\$\s*([0-9]+)/);
                        if (moneyMatch) {
                            valAdicional = parseInt(moneyMatch[1]) || 0;
                            razonAdicional = obs.trim();
                        }
                    }
                }
            }

            if (dbPrice === undefined) {
                console.error(`❌ ERROR: Population "${subqueryPob}" (from raw "${poblacionRaw}") with provider "${provider}" not found in DB!`);
            } else {
                console.log(`✅ MATCHED: ${placa} (${provider} - ${subqueryPob}) -> DB Price: ${dbPrice} + Extra: ${valAdicional} = Total Flete: ${dbPrice + valAdicional}`);
            }

            const adicionalesVal = noAuxiliares;
            const formattedIndex = String(index).padStart(2, '0');
            const commentAdicional = valAdicional > 0 ? `**ADICIONAL $${valAdicional.toLocaleString('de-DE')}**` : 'sin adicional';

            const valuesStr = `/* -----------------------------------------------------------------
   ${formattedIndex} – ${placa} – ${commentAdicional}
   ----------------------------------------------------------------- */
('2026-05-28','Jueves','${provider}','${conductor}','${placa}','${combinedPlanilla || '-'}','${combinedZonas}','${poblacionRaw}','${auxiliaresString}',${noAuxiliares},
 ${adicionalesVal},${valAdicional},'${razonAdicional}',
 ${tVal},
 (SELECT precio FROM precios_fletes WHERE lista_id='${provider}' AND UPPER(poblacion)='${subqueryPob}' LIMIT 1) + ${valAdicional},
 ${tPed},${facAdic ? `'${facAdic}'` : 'NULL'},'TYM')`;

            valuesSql.push(valuesStr);
            index++;
        }

        const sql = `/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 28 MAYO 2026
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-05-28'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 28‑May‑2026
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
WHERE fecha = '2026-05-28'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
`;

        fs.writeFileSync('insert_fletes_may28.sql', sql);
        console.log("\nSQL successfully written to c:/Users/Juanjo/Documents/Fletesapp/insert_fletes_may28.sql");
    } catch (e) {
        console.error("Error:", e.stack);
    }
}

main();
