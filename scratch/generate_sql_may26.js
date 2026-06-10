const fs = require('fs');
const https = require('https');

const SUPABASE_URL = 'https://culezzzujkwjpdlalfzi.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN1bGV6enp1amt3anBkbGFsZnppIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYxNzQ2NTIsImV4cCI6MjA4MTc1MDY1Mn0.qKp2IrOQW0YaPvSmIsmSFxcnFB_vPd2D0A6VzZJAhe8';

const RAW_DATA = `TMO981	JOHAN ECHEVERRY	9552	MANIZALES	EDWAR ZAPATA		57	 $ 6.753.416 	20544					57	 $ 6.753.416 	
KOL802	CAMILO CASTAÑO	9553 7001	MANIZALES	GERMAN GALVEZ		61	 $ 8.057.802 	20529 20545	1	 $ 126.220 	18932		62	 $ 8.184.022 	
WFV015	YONNI VALENCIA	9554	MANIZALES	YEISON TABARES	CRISTIAN OSPINA	52	 $ 8.111.713 	20546					52	 $ 8.111.713 	
EYY183	RUBEN	9555	MANIZALES	JUAN ALEJANDRO		58	 $ 7.256.480 	20547	3	 $ 168.970 	18933		61	 $ 7.425.450 	
SLI587	MIGUEL GONZALES	9556 9550	MANIZALES	MILTON OSORIO	ADRIAN MARTINEZ	45	 $ 8.914.770 	20548 20526	2	 $ 204.382 	18934		47	 $ 9.119.152 	
WGZ876	RICARDO PINEDA	9557	SUPIA	JUAN DELGADO	MATEO VILLALBA	45	 $ 14.148.604 	20549	2	 $ 434.371 	18935		47	 $ 14.582.975 	
EYX091	CARLOS GOMEZ	9560	SUPIA RIOSUCIO	VICTOR PULGARIN	JUAN COCOMA	12	 $ 15.341.791 	20527					12	 $ 15.341.791 	
SMH182	JUAN DAVID	9559 7002	CHINCHINA	BRANDON BAEZ		63	 $ 8.099.771 	20551 20530	4	 $ 271.424 	18936	AP636699 AP636697	67	 $ 8.371.195 	
  															
SPU120	OSWALDO	9601 LA50	ARMENIA	YEISON RENDON		58	 $ 8.341.177 	20552				AP636700	58	 $ 8.341.177 	
VZD334	JULIAN CUELLAR	9602 PATRIA	ARMENIA	JOHAN MUÑOZ		61	 $ 7.806.225 	20485 20553					61	 $ 7.806.225 	
EQY944	GOBER CRISTANCHO	9603 7008	CALARCA	ALEXANDER COSTAIN		51	 $ 10.328.617 	20554 20531	12	 $ 777.207 	18937 18938 18940 18941 18942		63	 $ 11.105.824 	
SXF257	FABIO RUIZ	9604	MONTENEGRO	CAMILO CONTRERAS	CAMILO SUAREZ	51	 $ 8.087.554 	20555	13	 $ 1.185.979 	18931 18946	AP639536 AP639537	64	 $ 9.273.533 	
WLS478	HUMBERTO RINCON	9605	TEBAIDA	CRISTIAN CAICEDO		42	 $ 4.908.655 	20556	7	 $ 640.350 	18939		49	 $ 5.549.005 	
TTL256	YIMERSON GARCIA	9606	CIRCASIA	CRISTIAN CAMACHO		42	 $ 3.620.559 	20557	2	 $ 76.070 	18944 18945		44	 $ 3.696.629 	
															
SMO183	GABRIEL PEREZ	9453	PEREIRA	JUAN QUINTERO		58	 $ 7.429.527 	20535					58	 $ 7.429.527 	
LUM993	PABLO RAMIREZ	9454	PEREIRA	ANDRES PINEDA		48	 $ 7.123.452 	20536					48	 $ 7.123.452 	
TMZ674	RICARDO LOPEZ	9455	PEREIRA	ANDRES RIOS	JUAN CONTRERAS	66	 $ 7.961.510 	20537					66	 $ 7.961.510 	
SPQ814	CARLOS VELASCO	9456	SANTA ROSA	SANTIAGO HENAO		53	 $ 7.321.833 	20538					53	 $ 7.321.833 	
WHM317	HUMBERTO PARRA	9457	PEREIRA	ESTEBAN GALLEGO		53	 $ 9.664.572 	20539					53	 $ 9.664.572 	
PEK019	MIGUEL TABARES	9458	PEREIRA	JHON GIRALDO		50	 $ 7.046.404 	20540					50	 $ 7.046.404 	
WHM896	ALEXANDER CUELLAR	9459	PEREIRA	CAMILO PEÑA		73	 $ 10.136.973 	20541					73	 $ 10.136.973 	
WLC133	JULIAN  	9460	PEREIRA	EDWIN GOMEZ	CAMILO MUÑOZ	59	 $ 11.276.169 	20542					59	 $ 11.276.169 	
TNH494	ADALBERTO MEJIA	9461	CARTAGO	DIORLAN FLOREZ		64	 $ 6.678.884 	20543					64	 $ 6.678.884 	
WTN748	DIEGO RATIVA	7004	PEREIRA	BRAHIAN VALENCIA		66	 $ 9.091.634 	20558					66	 $ 9.091.634 	
															
TRL186	RUBEN	9450	VIRGINIA	JOHN		3	 $ 8.634.785 	20524					3	 $ 8.634.785 	
EST067	JORGE RIVILLAS	7005	CAIRO ARGELIA	CESAR CASTILLO		32	 $ 9.575.432 	20559					32	 $ 9.575.432 	
ERK303	JORGE ALARCON	7006	SANTUARIO VIRGINIA	ROBINSON TORRES		43	 $ 12.257.210 	20560	6	 $ 473.987 	18943		49	 $ 12.731.197 	ERK303 EXTRA $60.000
JVM223	WILMAR CARDONA	7007 9451	BELEN DE UMBRIA	OSCAR RESTREPO	EXTRA MORENO	65	 $ 10.694.523 	20525 20561					65	 $ 10.694.523 	
															
SQB119	CARLOS CASTAÑO	FLEISCHMANN	ARMENIA	DIEGO FRANCO					51	 $ 7.667.443 	18929		51	 $ 7.667.443 	`;

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
    if (target === "CAIRO ARGELIA") {
        return "ARGELIA EL CAIRO";
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

            // Handle ALPINA and FLEISCHMANN values
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

            // Combined planillas
            let planillas = [];
            if (planilla1 && planilla1 !== '-') planillas.push(planilla1);
            if (planilla2 && planilla2 !== '-') planillas.push(planilla2);
            const combinedPlanilla = planillas.join(' ').replace(/\s+/g, ' ').trim() || '-';

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

            // Adicional/Negotiation
            let valAdicional = 0;
            let razonAdicional = '-';
            if (obs) {
                const hasExtraOrAdic = obs.toUpperCase().includes('EXTRA') || obs.toUpperCase().includes('ADICIONAL');
                if (hasExtraOrAdic) {
                    const moneyMatch = obs.replace(/[\.,]/g, '').match(/\$\s*([0-9]+)/);
                    if (moneyMatch) {
                        valAdicional = parseInt(moneyMatch[1]) || 0;
                        razonAdicional = obs;
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
('2026-05-26','Martes','${provider}','${conductor}','${placa}','${combinedPlanilla || '-'}','${combinedZonas}','${poblacionRaw}','${auxiliaresString}',${noAuxiliares},
 ${adicionalesVal},${valAdicional},'${razonAdicional}',
 ${tVal},
 (SELECT precio FROM precios_fletes WHERE lista_id='${provider}' AND UPPER(poblacion)='${subqueryPob}' LIMIT 1) + ${valAdicional},
 ${tPed},${facAdic ? `'${facAdic}'` : 'NULL'},'TYM')`;

            valuesSql.push(valuesStr);
            index++;
        }

        const sql = `/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 26 MAYO 2026
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-05-26'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 26‑May‑2026
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
WHERE fecha = '2026-05-26'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
`;

        fs.writeFileSync('insert_fletes_may26.sql', sql);
        console.log("\nSQL successfully written to c:/Users/Juanjo/Documents/Fletesapp/insert_fletes_may26.sql");
    } catch (e) {
        console.error("Error:", e.stack);
    }
}

main();
