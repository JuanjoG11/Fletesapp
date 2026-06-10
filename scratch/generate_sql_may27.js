const fs = require('fs');
const https = require('https');

const SUPABASE_URL = 'https://culezzzujkwjpdlalfzi.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN1bGV6enp1amt3anBkbGFsZnppIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYxNzQ2NTIsImV4cCI6MjA4MTc1MDY1Mn0.qKp2IrOQW0YaPvSmIsmSFxcnFB_vPd2D0A6VzZJAhe8';

const RAW_DATA = `TMO981	JOHAN ECHEVERRY	9552 9550	MANIZALES	EDWAR ZAPATA		49	 $ 14.563.275 	20563 20594	3	 $ 251.161 	18948	FEP1185568	52	 $ 14.814.436 	 ADICIONAL ALFLETE $50.000 ENTREGA DE NEGOCIACION 
KOL802	CAMILO CASTAÑO	9553 7001	VILLAMARIA	GERMAN GALVEZ	MATEO VILLALBA	55	 $ 15.610.636 	20565 20595	3	 $ 248.324 	18949	FEP1185572 AP640126-134-138	58	 $ 15.858.960 	
WFV015	YONNI VALENCIA	9554 7000	MANIZALES	YEISON TABARES	CRISTIAN OSPINA	51	 $ 7.867.847 	20596 20564	4	 $ 384.325 	18950		55	 $ 8.252.172 	
EYY183	RUBEN	9555	MANIZALES	JUAN ALEJANDRO		51	 $ 6.919.768 	20597	2	 $ 577.917 	18951		53	 $ 7.497.685 	
TRL186	RUBEN	9556 7000	MANIZALES	MILTON OSORIO	ADRIAN MARTINEZ	42	 $ 9.316.678 	20528 20598	4	 $ 563.673 	18952		46	 $ 9.880.351 	
WGZ876	RICARDO PINEDA	9557	MARMATO LA MERCED	JUAN DELGADO		27	 $ 13.851.819 	20599					27	 $ 13.851.819 	 WGZ876 EXTRA $60.000 
EYX091	CARLOS GOMEZ	9558	AGUADAS	VICTOR PULGARIN	JUAN COCOMA	71	 $ 14.136.486 	20550 20570			18947		71	 $ 14.136.486 	
SMH182	JUAN DAVID	9559	ARAUCA PALESTINA	BRANDON BAEZ		42	 $ 8.563.241 	20600	3	 $ 484.628 	18954		45	 $ 9.047.869 	 SMH182 EXTRA $60.000 
  															
SPU120	OSWALDO	9601 7009	ARMENIA	YEISON RENDON		53	 $ 9.379.903 	20576 20601	1	 $ 306.845 	18955		54	 $ 9.686.748 	
VZD334	JULIAN CUELLAR	9602 7010	ARMENIA	JOHAN MUÑOZ		57	 $ 7.083.004 	20602 20609					57	 $ 7.083.004 	
EQY944	GOBER CRISTANCHO	9603	ARMENIA	ALEXANDER COSTAIN		61	 $ 9.248.755 	20603				AP639535	61	 $ 9.248.755 	
SLI587	MIGUEL GONZALES	9604 7010	QUIMBAYA	CAMILO CONTRERAS	CAMILO SUAREZ	45	 $ 10.922.100 	20575 20604					45	 $ 10.922.100 	
WLS478	HUMBERTO RINCON	9605	PIJAO CORDOBA	CRISTIAN CAICEDO		37	 $ 6.425.517 	20580	8	 $ 1.247.385 	18960		45	 $ 7.672.902 	
TTL256	YIMERSON GARCIA	9606	SALENTO	CRISTIAN CAMACHO		31	 $ 7.452.039 	20581	4	 $ 599.541 	18956	AP641020 AP641021	35	 $ 8.051.580 	
															
SMO183	GABRIEL PEREZ	9453	PEREIRA	JUAN QUINTERO		59	 $ 6.548.209 	20586					59	 $ 6.548.209 	
LUM993	PABLO RAMIREZ	9454	PEREIRA	ANDRES PINEDA		37	 $ 5.422.147 	20587	4	 $ 595.017 	18961		41	 $ 6.017.164 	
TMZ674	RICARDO LOPEZ	9455	PEREIRA	ANDRES RIOS	CAMILO MUÑOZ	66	 $ 9.316.077 	20588					66	 $ 9.316.077 	TMZ674 EXTRA $60.000 SE LE DEBIA
SPQ814	CARLOS VELASCO	9456	SANTA ROSA	SANTIAGO HENAO		53	 $ 7.241.716 	20585					53	 $ 7.241.716 	
WHM317	HUMBERTO PARRA	9457	PEREIRA	ESTEBAN GALLEGO		56	 $ 7.499.124 	20589					56	 $ 7.499.124 	
PEK019	MIGUEL TABARES	9458	PEREIRA	JHON GIRALDO		48	 $ 5.778.487 	20590					48	 $ 5.778.487 	
WHM896	ALEXANDER CUELLAR	9459	PEREIRA	CAMILO PEÑA		49	 $ 9.323.845 	20591					49	 $ 9.323.845 	
WLC133	JULIAN  	9460	PEREIRA	EDWIN GOMEZ	JUAN CONTRERAS	67	 $ 6.276.907 	20592					67	 $ 6.276.907 	
TNH494	ADALBERTO MEJIA	9461 9450	CARTAGO	DIORLAN FLOREZ		51	 $ 9.220.442 	20543TSS 20584 20593					51	 $ 9.220.442 	
WTN748	DIEGO RATIVA	7004	PEREIRA	BRAHIAN VALENCIA		65	 $ 10.257.126 	20558TSS 20605	9	 $ 962.386 	18962		74	 $ 11.219.512 	WTN748 EXTRA $60.000 
															
EST067	JORGE RIVILLAS	7005	ANSERMA NUEVO	CESAR CASTILLO		36	 $ 5.450.562 	20606	1	 $ 50.470 		FEP1185510	37	 $ 5.501.032 	
ERK303	JORGE ALARCON	7006	BALBOA LA CELIA	ROBINSON TORRES		38	 $ 7.733.050 	20582	4	 $ 704.867 	18957		42	 $ 8.437.917 	
JVM223	WILMAR CARDONA	7007 9451	ANSERMA	OSCAR RESTREPO	EXTRA MORENO	50	 $ 14.988.004 	20562 20583	1	 $ 323.408 		FEP1185515	51	 $ 15.311.412 	
															
SQB119	CARLOS CASTAÑO	FLEISCHMANN	PEREIRA	DIEGO FRANCO					30	 $ 5.366.411 	18965		30	 $ 5.366.411 	`;

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
    if (target === "ARAUCA PALESTINA") {
        return "PALESTINA ARAUCA";
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

            // Adicional/Negotiation
            let valAdicional = 0;
            let razonAdicional = '-';
            if (obs) {
                const hasExtraOrAdic = obs.toUpperCase().includes('EXTRA') || obs.toUpperCase().includes('ADICIONAL');
                if (hasExtraOrAdic) {
                    const moneyMatch = obs.replace(/[\.,]/g, '').match(/\$\s*([0-9]+)/);
                    if (moneyMatch) {
                        valAdicional = parseInt(moneyMatch[1]) || 0;
                        razonAdicional = obs.trim();
                    }
                }
            }

            const subqueryPob = getSubqueryPoblacion(poblacionRaw);
            const lookupKey = `${provider}::${subqueryPob.toUpperCase()}`;
            const dbPrice = dbPrices[lookupKey];

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
('2026-05-27','Miercoles','${provider}','${conductor}','${placa}','${combinedPlanilla || '-'}','${combinedZonas}','${poblacionRaw}','${auxiliaresString}',${noAuxiliares},
 ${adicionalesVal},${valAdicional},'${razonAdicional}',
 ${tVal},
 (SELECT precio FROM precios_fletes WHERE lista_id='${provider}' AND UPPER(poblacion)='${subqueryPob}' LIMIT 1) + ${valAdicional},
 ${tPed},${facAdic ? `'${facAdic}'` : 'NULL'},'TYM')`;

            valuesSql.push(valuesStr);
            index++;
        }

        const sql = `/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIERCOLES 27 MAYO 2026
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-05-27'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 27‑May‑2026
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
WHERE fecha = '2026-05-27'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
`;

        fs.writeFileSync('insert_fletes_may27.sql', sql);
        console.log("\nSQL successfully written to c:/Users/Juanjo/Documents/Fletesapp/insert_fletes_may27.sql");
    } catch (e) {
        console.error("Error:", e.stack);
    }
}

main();
