const fs = require('fs');
const https = require('https');

const SUPABASE_URL = 'https://culezzzujkwjpdlalfzi.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN1bGV6enp1amt3anBkbGFsZnppIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYxNzQ2NTIsImV4cCI6MjA4MTc1MDY1Mn0.qKp2IrOQW0YaPvSmIsmSFxcnFB_vPd2D0A6VzZJAhe8';

const RAW_DATA = `SYU652	JOHAN ECHEVERRY	9552	MANIZALES	EDWAR ZAPATA		49	 $ 6.005.024 	20757					49	 $ 6.005.024 	
KOL802	CAMILO CASTAÑO	9553 7001	MANIZALES	GERMAN GALVEZ		50	 $ 8.814.636 	20736 20758	1	 $ 46.223 	19033		51	 $ 8.860.859 	
WFV015	YONNI VALENCIA	9554	MANIZALES	CRISTIAN OSPINA		56	 $ 6.453.072 	20759					56	 $ 6.453.072 	
EYY183	RUBEN	9555	MANIZALES	JUAN ALEJANDRO		60	 $ 6.065.500 	20760	2	 $ 67.730 	19034		62	 $ 6.133.230 	
SLI587	MIGUEL GONZALES	9556 9550	MANIZALES	MILTON OSORIO	ADRIAN MARTINEZ	50	 $ 8.091.377 	20741 20761	2	 $ 204.382 	19035		52	 $ 8.295.759 	
WGZ876	RICARDO PINEDA	9557	SUPIA	JUAN DELGADO	MATEO VILLALBA	38	 $ 8.290.320 	20762					38	 $ 8.290.320 	
EYX091	CARLOS GOMEZ	9560	SUPIA RIOSUCIO	VICTOR PULGARIN	JUAN COCOMA	11	 $ 7.594.089 	20742					11	 $ 7.594.089 	
SMH182	JUAN DAVID	9559	CHINCHINA	BRANDON BAEZ		55	 $ 6.120.767 	20763	4	 $ 421.724 	19036		59	 $ 6.542.491 	
															
SPU120	OSWALDO	9601 7009	ARMENIA	YEISON RENDON		52	 $ 6.961.164 	20737 20764					52	 $ 6.961.164 	
VZD334	JULIAN CUELLAR	9602 7010	ARMENIA	SEBASTIAN VILLADA		63	 $ 7.630.324 	20743 20765					63	 $ 7.630.324 	
EQY944	GOBER CRISTANCHO	9603	CALARCA	ALEXANDER COSTAIN		55	 $ 5.683.907 	20766	3	 $ 227.134 	19025		58	 $ 5.911.041 	
SXF257	FABIO RUIZ	9604 7010	MONTENEGRO	CAMILO CONTRERAS	CAMILO SUAREZ	48	 $ 6.697.498 	20705 20767	13	 $ 1.746.890 	19037		61	 $ 8.444.388 	
WLS478	HUMBERTO RINCON	9605	TEBAIDA	CRISTIAN CAICEDO		35	 $ 4.405.412 	20744	3	 $ 406.446 	19038		38	 $ 4.811.858 	
TTL256	ANDRES QUINTERO	9606	CIRCASIA	CRISTIAN CAMACHO		31	 $ 2.787.545 	20745					31	 $ 2.787.545 	
															
SMO183	GABRIEL PEREZ	9453	PEREIRA	JUAN QUINTERO		59	 $ 6.919.874 	20748					59	 $ 6.919.874 	
LUM993	PABLO RAMIREZ	9454	PEREIRA	ANDRES PINEDA		49	 $ 6.903.427 	20749					49	 $ 6.903.427 	
TMZ674	RICARDO LOPEZ	9455	PEREIRA	ANDRES RIOS	CAMILO MUÑOZ	61	 $ 6.452.127 	20750					61	 $ 6.452.127 	
SPQ814	CARLOS VELASCO	9456	SANTA ROSA	SANTIAGO HENAO		54	 $ 5.116.630 	20751					54	 $ 5.116.630 	
WHM317	HUMBERTO PARRA	9457	PEREIRA	ESTEBAN GALLEGO		57	 $ 6.858.408 	20752					57	 $ 6.858.408 	
PEK019	MIGUEL TABARES	9458	PEREIRA	JHON GIRALDO		55	 $ 6.197.527 	20753					55	 $ 6.197.527 	
WHM896	ALEXANDER CUELLAR	9459	PEREIRA	CAMILO PEÑA		66	 $ 7.704.509 	20754					66	 $ 7.704.509 	
WLC133	JULIAN  	9460	PEREIRA	EDWIN GOMEZ	JUAN CONTRERAS	70	 $ 11.507.791 	20755					70	 $ 11.507.791 	
TNH494	ADALBERTO MEJIA	9461	CARTAGO	DIORLAN FLOREZ		56	 $ 5.651.581 	20756					56	 $ 5.651.581 	
WTN748	DIEGO RATIVA	7004	PEREIRA	BRAHIAN VALENCIA		64	 $ 8.299.539 	20768					64	 $ 8.299.539 	
															
MAT480	ELKIN AGUIRRE	7005	CAIRO ARGELIA	CESAR CASTILLO		35	 $ 9.160.374 	20769					35	 $ 9.160.374 	MAT480 VALOR DE FLETE $400.000
ERK303	JORGE ALARCON	7006 9450	SANTUARIO VIRGINIA	ROBINSON TORRES	JOHAN MUÑOZ	41	 $ 10.406.980 	20746 20739	6	 $ 807.091 	19032 19039		47	 $ 11.214.071 	
JVM223	WILMAR CARDONA	7007 9451	BELEN DE UMBRIA	OSCAR RESTREPO	JOHN MORENO	59	 $ 10.176.999 	20747 20740					59	 $ 10.176.999 	
															
SQB119	CARLOS CASTAÑO	FLEISCHMANN	ARMENIA	DIEGO FRANCO					44	 $ 6.332.026 	19024 19031		44	 $ 6.332.026 	`;

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
                    } else {
                        valAdicional = 0;
                        razonAdicional = obs.trim();
                        console.warn(`⚠️ ${placa}: No base price found for "${subqueryPob}" in DB. Using flete $${targetTotal} directly.`);
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

            let precioExpr;
            if (dbPrice !== undefined) {
                precioExpr = `(SELECT precio FROM precios_fletes WHERE lista_id='${provider}' AND UPPER(poblacion)='${subqueryPob}' LIMIT 1) + ${valAdicional}`;
                console.log(`✅ MATCHED: ${placa} (${provider} - ${subqueryPob}) -> DB Price: ${dbPrice} + Extra: ${valAdicional} = Total Flete: ${dbPrice + valAdicional}`);
            } else {
                // If there's a target flete specified, we use it directly
                const fixedMatch = obs ? obs.toUpperCase().match(/VALOR\s+DE\s+FLETE\s+\$?\s*([0-9\.,]+)/) : null;
                if (fixedMatch && obs.toUpperCase().includes('VALOR DE FLETE')) {
                    const targetTotal = parseInt(fixedMatch[1].replace(/[\.,]/g, '')) || 0;
                    precioExpr = `${targetTotal}`;
                } else {
                    precioExpr = `0`; // Fallback
                }
                console.error(`❌ ERROR: Population "${subqueryPob}" (from raw "${poblacionRaw}") with provider "${provider}" not found in DB!`);
            }

            const adicionalesVal = noAuxiliares;
            const formattedIndex = String(index).padStart(2, '0');
            const commentAdicional = valAdicional > 0 ? `**ADICIONAL $${valAdicional.toLocaleString('de-DE')}**` : 'sin adicional';

            const valuesStr = `/* -----------------------------------------------------------------
   ${formattedIndex} – ${placa} – ${commentAdicional}
   ----------------------------------------------------------------- */
('2026-06-02','Martes','${provider}','${conductor}','${placa}','${combinedPlanilla || '-'}','${combinedZonas}','${poblacionRaw}','${auxiliaresString}',${noAuxiliares},
 ${adicionalesVal},${valAdicional},'${razonAdicional}',
 ${tVal},
 ${precioExpr},
 ${tPed},${facAdic ? `'${facAdic}'` : 'NULL'},'TYM')`;

            valuesSql.push(valuesStr);
            index++;
        }

        const sql = `/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 2 JUNIO 2026
   Generado: ${new Date().toISOString()}
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
WHERE fecha = '2026-06-02'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
`;

        fs.writeFileSync('insert_fletes_june02.sql', sql);
        console.log("\nSQL successfully written to c:/Users/Juanjo/Documents/Fletesapp/insert_fletes_june02.sql");
    } catch (e) {
        console.error("Error:", e.stack);
    }
}

main();
