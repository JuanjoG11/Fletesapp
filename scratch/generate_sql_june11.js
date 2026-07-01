const fs = require('fs');
const https = require('https');

const SUPABASE_URL = 'https://culezzzujkwjpdlalfzi.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN1bGV6enp1amt3anBkbGFsZnppIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYxNzQ2NTIsImV4cCI6MjA4MTc1MDY1Mn0.qKp2IrOQW0YaPvSmIsmSFxcnFB_vPd2D0A6VzZJAhe8';

// RAW DATA FOR JUNE 11, 2026
const RAW_DATA = `SYU652	JOHAN ECHEVERRY	9552	MANIZALES	EDWAR ZAPATA		41	 $ 5.305.413 	21031	1	 $ 40.919 	19166		42	 $ 5.346.332 	
KOL802	CAMILO CASTAÑO	9553	MANIZALES	CRISTIAN OSPINA		44	 $ 4.464.960 	21032	1	 $ 47.395 	19167		45	 $ 4.512.355 	
EYX091	CARLOS GOMEZ	9554	NEIRA	VICTOR PULGARIN	JUAN COCOMA	47	 $ 7.156.194 	21033	10	 $ 900.669 	19157		57	 $ 8.056.863 	
EYY183	RUBEN	9555	MANIZALES	JUAN ALEJANDRO		46	 $ 5.805.780 	21034	9	 $ 706.189 	19168 19161		55	 $ 6.511.969 	
SLI587	MIGUEL GONZALES	9556 9550	MANIZALES	MILTON OSORIO	ADRIAN MARTINEZ	46	 $ 8.405.666 	21015 21035	4	 $ 271.204 	19162 19169		50	 $ 8.676.870 	
WGZ876	RICARDO PINEDA	9557	RIOSUCIO	JUAN DELGADO	MATEO VILLALBA	51	 $ 9.549.417 	21036	1	 $ 198.943 	19148		52	 $ 9.748.360 	
SMH182	JUAN DAVID	9559	SAN JOSE BELALCAZAR	BRANDON BAEZ	CAMILO SUAREZ	49	 $ 9.806.855 	21038	4	 $ 375.647 	19171		53	 $ 10.182.502 	
  															
WFV015	YONNI VALENCIA	7008	CALARCA	JOHAN MUÑOZ		3	 $ 12.606.766 	21013					3	 $ 12.606.766 	
SPU120	OSWALDO	9601 7009	ARMENIA	YEISON RENDON		56	 $ 8.269.575 	21039 21014					56	 $ 8.269.575 	
EQN953	ORLANDO VASQUEZ	9602	ARMENIA	SEBASTIAN VILLADA		57	 $ 6.015.086 	21002 21047					57	 $ 6.015.086 	 EQN953 VALOR DE FLETE $350.000 
EQY944	GOBER CRISTANCHO	9603	ARMENIA	ALEXANDER COSTAIN		60	 $ 5.971.478 	21041				AP654914	60	 $ 5.971.478 	
SXF257	FABIO RUIZ	9604	ALCALA ULLOA	CAMILO CONTRERAS		40	 $ 6.285.345 	21042	8	 $ 519.864 	19172 19174		48	 $ 6.805.209 	
WLS478	HUMBERTO RINCON	9605	CAICEDONIA	CRISTIAN CAICEDO	JUAN CONTRERAS	45	 $ 11.420.767 	21021	4	 $ 740.271 	19175		49	 $ 12.161.038 	
TTL256	ANDRES QUINTERO	9606 9600	FILANDIA	CRISTIAN CAMACHO		34	 $ 7.134.262 	21010 21020	3	 $ 321.824 	19178		37	 $ 7.456.086 	
															
SMO183	GABRIEL PEREZ	9453	PEREIRA	JUAN QUINTERO		44	 $ 5.742.745 	21022					44	 $ 5.742.745 	
XVI496	PABLO RAMIREZ	9454	PEREIRA	ANDRES PINEDA		71	 $ 9.004.239 	20986TSS 21023	2	 $ 95.326 	19158		73	 $ 9.099.565 	
TMZ674	RICARDO LOPEZ	9455	PEREIRA	ANDRES RIOS		50	 $ 4.608.765 	21024					50	 $ 4.608.765 	
SPQ814	CARLOS VELASCO	9456 7002	SANTA ROSA	SANTIAGO HENAO		43	 $ 5.416.218 	21025 21012					43	 $ 5.416.218 	
WHM317	HUMBERTO PARRA	9457	PEREIRA	ESTEBAN GALLEGO		38	 $ 3.688.030 	21026	5	 $ 338.923 	19163		43	 $ 4.026.953 	
PEK019	MIGUEL TABARES	9458	PEREIRA	JHON GIRALDO		43	 $ 5.069.800 	21027					43	 $ 5.069.800 	
WLC133	JULIAN  	9459	PEREIRA	CAMILO PEÑA		43	 $ 9.264.338 	21028					43	 $ 9.264.338 	
WHM896	ALEXANDER CUELLAR	9460	PEREIRA	EDWIN GOMEZ		35	 $ 4.824.868 	21029					35	 $ 4.824.868 	
TNH494	ADALBERTO MEJIA	9461	CARTAGO	DIORLAN FLOREZ		52	 $ 6.382.711 	21030				AP656201	52	 $ 6.382.711 	
WTN748	DIEGO RATIVA	7004	MARSELLA	BRAHIAN VALENCIA	CAMILO MUÑOZ	45	 $ 8.977.611 	21043	4	 $ 293.186 	19159		49	 $ 9.270.797 	
															
EST067	JORGE RIVILLAS	7005	CARTAGO	CESAR CASTILLO		42	 $ 7.010.596 	21044				AP656183	42	 $ 7.010.596 	
ERK303	JORGE ALARCON	7006	APIA VIRGINIA	ROBINSON TORRES	GERMAN GALVEZ	45	 $ 8.037.616 	21018	5	 $ 403.221 	19160		50	 $ 8.440.837 	
JVM223	WILMAR CARDONA	7007 9451	VITERBO	OSCAR RESTREPO	JOHN MORENO	62	 $ 13.476.054 	21008 21019	2	 $ 136.416 	19177		64	 $ 13.612.470 	
 															
SQB119	CARLOS CASTAÑO	FLEISCHMANN	CUBA	DIEGO FRANCO					36	 $ 5.284.962 	19165 19176		36	 $ 5.284.962`;

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

function getSubqueryPoblacion(poblacionRaw, obs) {
    let target = poblacionRaw.trim().toUpperCase();
    
    // Supermarket check
    if (obs && obs.toUpperCase().includes("SUPERMERCADO")) {
        if (target === "SUPIA RIOSUCIO") return "RIOSUCIO-SUPIA SUPERMERCADO";
        if (target === "CHINCHINA") return "CHINCHINA SUPERMERCADO";
    }
    
    if (target === "MANIZALES") return "MANIZALES VILLAMARIA";
    if (target === "VILLAMARIA") return "MANIZALES VILLAMARIA";
    if (target === "MONTENEGRO P/TAPAO" || target === "MONTENEGRO P TAPAO") return "MONTENEGRO PTAPAO";
    if (target === "PEREIRA") return "PEREIRA - DOSQUEBRADAS";
    if (target === "CARTAGO") return "CARTAGO 2T";
    if (target === "BELEN MISTRATO") return "BELEN DE UMBRIA";
    if (target === "VIRGINIA") return "VIRGINIA";
    if (target === "KM41 IRRA FELISA") return "IRRA LA FELISA VER RIOSUCIO";
    
    if (target === "AGUADAS") return "AGUADAS PACORA";
    if (target === "ARAUCA PALESTINA") return "PALESTINA ARAUCA";
    if (target === "PIJAO CORDOBA") return "CORDOBA PIJAO BVISTA";
    if (target === "CAIRO ARGELIA") return "ARGELIA EL CAIRO";
    if (target === "ANSERMA CALDAS") return "ANSERMA";
    
    // New mappings for June 11
    if (target === "SAN JOSE BELALCAZAR") return "RDA S JOSE BELALCAZAR";
    
    return target;
}

function extractExtra(obs) {
  if (!obs) return 0;
  const upper = obs.toUpperCase();
  if (!upper.includes('EXTRA') && !upper.includes('ADICIONAL') && !upper.includes('ADICIONAR') && !upper.includes('SOBRECARGO')) return 0;
  // Match $NNN.NNN or $NNN,NNN
  const m = obs.match(/\$\s*([\d\.]+)/);
  if (!m) return 0;
  return parseInt(m[1].replace(/\./g, '')) || 0;
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
            if (parts.length < 15) {
                console.log(`Skipping line with ${parts.length} parts: ${line}`);
                continue;
            }

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

            const subqueryPob = getSubqueryPoblacion(poblacionRaw, obs);
            const lookupKey = `${provider}::${subqueryPob.toUpperCase()}`;
            const dbPrice = dbPrices[lookupKey];

            // Adicional/Negotiation
            let valAdicional = extractExtra(obs);
            let razonAdicional = valAdicional > 0 ? obs.trim() : '-';

            // Check for fixed flete
            if (obs && obs.toUpperCase().includes("VALOR DE FLETE")) {
                const fixedMatch = obs.toUpperCase().match(/VALOR\s+DE\s+FLETE\s+\$?\s*([0-9\.,]+)/);
                if (fixedMatch) {
                    const targetTotal = parseInt(fixedMatch[1].replace(/[\.,]/g, '')) || 0;
                    if (dbPrice) {
                        valAdicional = targetTotal - dbPrice;
                        razonAdicional = obs.trim();
                    } else {
                        valAdicional = 0;
                        razonAdicional = obs.trim();
                    }
                }
            }

            let precioExpr;
            if (dbPrice !== undefined) {
                precioExpr = `(SELECT precio FROM precios_fletes WHERE lista_id='${provider}' AND UPPER(poblacion)='${subqueryPob}' LIMIT 1) + ${valAdicional}`;
                console.log(`✅ MATCHED: ${placa} (${provider} - ${subqueryPob}) -> DB Price: ${dbPrice} + Extra: ${valAdicional} = Total Flete: ${dbPrice + valAdicional}`);
            } else {
                precioExpr = `0`; // Fallback
                console.error(`❌ ERROR: Population "${subqueryPob}" (from raw "${poblacionRaw}") with provider "${provider}" not found in DB!`);
            }

            const adicionalesVal = noAuxiliares;
            const formattedIndex = String(index).padStart(2, '0');
            const commentAdicional = valAdicional !== 0 ? `**AJUSTE ADICIONAL $${valAdicional.toLocaleString('de-DE')}**` : 'sin adicional';

            const valuesStr = `  /* ${formattedIndex} – ${placa} – ${commentAdicional} */
  ('2026-06-11','Jueves','${provider}','${conductor}','${placa}','${combinedPlanilla || '-'}','${combinedZonas}','${subqueryPob}','${auxiliaresString}',${noAuxiliares},
   ${adicionalesVal},${valAdicional},'${razonAdicional}',
   ${tVal},
   ${precioExpr},
   ${tPed},${facAdic ? `'${facAdic}'` : 'NULL'},'TYM')`;

            valuesSql.push(valuesStr);
            index++;
        }

        const sql = `/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 11 JUNIO 2026
   Generado: ${new Date().toISOString()}
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-11'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 11‑Jun‑2026
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
       precio                      AS precio_flete_con_adicional,
       valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo,
       proveedor
FROM fletes
WHERE fecha = '2026-06-11'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
`;

        fs.writeFileSync('insert_fletes_june11.sql', sql);
        console.log("\nSQL successfully written to c:/Users/Juanjo/Documents/Fletesapp/insert_fletes_june11.sql");
        
        // Generate the delete script too
        const deleteSql = `/* ==========================================================
   🚮 SCRIPT: Eliminar fletes 11‑Jun‑2026
   Generado: ${new Date().toISOString()}
   Uso: ejecutar en la BD (psql/supervisor) para eliminar los
          registros de ALPINA y FLEISCHMANN del 2026-06-11.
   ========================================================== */

BEGIN;

SELECT COUNT(*) AS registros_a_eliminar
FROM fletes
WHERE fecha = '2026-06-11'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

DELETE FROM fletes
WHERE fecha = '2026-06-11'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
RETURNING id, placa, contratista, proveedor, fecha, precio;

COMMIT;
`;
        fs.writeFileSync('delete_fletes_june11.sql', deleteSql);
        console.log("SQL successfully written to c:/Users/Juanjo/Documents/Fletesapp/delete_fletes_june11.sql");
    } catch (e) {
        console.error("Error:", e.stack);
    }
}

main();
