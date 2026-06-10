const fs = require('fs');
const https = require('https');

const SUPABASE_URL = 'https://culezzzujkwjpdlalfzi.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN1bGV6enp1amt3anBkbGFsZnppIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYxNzQ2NTIsImV4cCI6MjA4MTc1MDY1Mn0.qKp2IrOQW0YaPvSmIsmSFxcnFB_vPd2D0A6VzZJAhe8';

// RAW DATA FOR JUNE 5, 2026
const RAW_DATA = `SYU652	JOHAN ECHEVERRY	9552	MANIZALES	EDWAR ZAPATA		52	 $ 5.747.027 	20877	3	 $ 169.506 		FEP1186345-350-352	55	 $ 5.916.533 	
KOL802	CAMILO CASTAÑO	9553 9550	VILLAMARIA	GERMAN GALVEZ		53	 $ 9.248.338 	20860 20878	6	 $ 384.202 	19094		59	 $ 9.632.540 	
WFV015	YONNI VALENCIA	9554	MANIZALES	CRISTIAN OSPINA		47	 $ 10.700.116 	20879	1	 $ 113.505 	19095	AP650818	48	 $ 10.813.621 	
TRL186	RUBEN	9555 TSS	MANIZALES	JUAN ALEJANDRO	MILTON OSORIO	65	 $ 8.092.206 	20880	3	 $ 165.296 	19096		68	 $ 8.257.502 	
SLI587	MIGUEL GONZALES	9556	MANIZALES	ADRIAN MARTINEZ		49	 $ 6.112.433 	20881	8	 $ 958.881 	19091 19097	FEP1186342-344	57	 $ 7.071.314 	
WGZ876	RICARDO PINEDA	9557	KM41 IRRA FELISA	JUAN DELGADO		30	 $ 10.252.307 	20882					30	 $ 10.252.307 	 WGZ876 EXTRA $60.000 
EYX091	CARLOS GOMEZ	9558	PACORA SALAMINA	VICTOR PULGARIN	JUAN COCOMA	74	 $ 10.746.608 	20846 20867			19081		74	 $ 10.746.608 	
TUL630	JUAN DAVID	9560	SUPIA RIOSUCIO	MATEO VILLALBA		8	 $ 9.471.118 	20861					8	 $ 9.471.118 	 PAGAR FLETE CON VALOR DE SUPERMERCADO 
TJX795	ANDRES QUINTERO	7002	CHINCHINA	BIBIANA	BLADIMIR	6	 $ 15.653.588 	20864					6	 $ 15.653.588 	 PAGAR FLETE CON VALOR DE SUPERMERCADO 
SMH182	JUAN DAVID	9559	CHINCHINA	BRANDON BAEZ		70	 $ 7.997.955 	20883	4	 $ 1.453.262 	19100		74	 $ 9.451.217 	 SMH182 EXTRA $60.000 
  															
SPU120	OSWALDO	9601 7009	ARMENIA	YEISON RENDON		67	 $ 9.906.550 	20824 20884					67	 $ 9.906.550 	
VZD334	JULIAN CUELLAR	9602	ARMENIA	SEBASTIAN VILLADA		52	 $ 7.877.448 	20885				AP650824	52	 $ 7.877.448 	
EQY944	GOBER CRISTANCHO	9603	CALARCA	ALEXANDER COSTAIN		56	 $ 3.823.704 	20886	1	 $ 17.828 	19101		57	 $ 3.841.532 	
SXF257	FABIO RUIZ	9604	MONTENEGRO P/TAPAO	CAMILO CONTRERAS	CAMILO SUAREZ	53	 $ 7.139.237 	20810TSS 20887	11	 $ 983.552 	19083 19084		64	 $ 8.122.789 	
WLS478	HUMBERTO RINCON	9605 7010	TEBAIDA	CRISTIAN CAICEDO	JOHAN MUÑOZ	45	 $ 13.379.248 	20866 20888					45	 $ 13.379.248 	
TTL256	ANDRES QUINTERO	9606 9600	CIRCASIA	CRISTIAN CAMACHO		48	 $ 9.787.273 	20862 20889	6	 $ 336.975 	19102		54	 $ 10.124.248 	
															
SMO183	GABRIEL PEREZ	9453	PEREIRA	JUAN QUINTERO		59	 $ 7.878.909 	20868					59	 $ 7.878.909 	
XVI496	PABLO RAMIIREZ	9454	PEREIRA	ANDRES PINEDA		52	 $ 7.804.979 	20869					52	 $ 7.804.979 	
TMZ674	RICARDO LOPEZ	9455	PEREIRA	ANDRES RIOS		58	 $ 6.627.126 	20870				AP648216	58	 $ 6.627.126 	 TMZ674 EXTRA $60.000 
SPQ814	CARLOS VELASCO	9456	SANTA ROSA	CARLOS VELASCO		50	 $ 5.509.590 	20871					50	 $ 5.509.590 	 SPQ814 ADICIONAR AL FLETE $100.000 CONDUCTOR/ENTREGADOR 
WHM317	HUMBERTO PARRA	9457	PEREIRA	ESTEBAN GALLEGO		63	 $ 7.647.363 	20872					63	 $ 7.647.363 	
PEK019	MIGUEL TABARES	9458	PEREIRA	JHON GIRALDO		56	 $ 7.395.907 	20873					56	 $ 7.395.907 	
WHM896	ALEXANDER CUELLAR	9459	PEREIRA	CAMILO PEÑA		62	 $ 7.890.105 	20874					62	 $ 7.890.105 	
WLC133	JULIAN  	9460	PEREIRA	EDWIN GOMEZ	JUAN CONTRERAS	67	 $ 11.243.589 	20875					67	 $ 11.243.589 	
TNH494	ADALBERTO MEJIA	9461TSS	CARTAGO	DIORLAN FLOREZ		62	 $ 10.165.929 	20839				AP649397	62	 $ 10.165.929 	
WTN748	DIEGO RATIVA	7004	PEREIRA	BRAHIAN VALENCIA		54	 $ 6.349.806 	20890					54	 $ 6.349.806 	 WTN748 EXTRA $60.000 SE DEBIA DE AYER 
															
EQN953	ORLANDO VASQUEZ	7005	CARTAGO	CESAR CASTILLO		53	 $ 6.564.131 	20853TSS 20891					53	 $ 6.564.131 	 EQN953 VALOR DE FLETE $340.000 
ERK303	JORGE ALARCON	7006	APIA VIRGINIA	ROBINSON TORRES	GERMAN GALVEZ	52	 $ 7.836.858 	20858 20892	17	 $ 2.154.923 	19103		69	 $ 9.991.781 	
JVM223	WILMAR CARDONA	7007 9451	BELEN MISTRATO	OSCAR RESTREPO	JOHN MORENO	64	 $ 16.055.961 	20893 20859	7	 $ 1.066.231 	19104		71	 $ 17.122.192 	
															
SQB119	CARLOS CASTAÑO	FLEISCHMANN	ARMENIA	DIEGO FRANCO					64	 $ 7.757.808 	19090		64	 $ 7.757.808 	`;

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
    if (target === "MONTENEGRO P/TAPAO") return "MONTENEGRO PTAPAO";
    if (target === "PEREIRA") return "PEREIRA - DOSQUEBRADAS";
    if (target === "CARTAGO") return "CARTAGO 2T";
    if (target === "BELEN MISTRATO") return "BELEN DE UMBRIA";
    if (target === "VIRGINIA") return "VIRGINIA";
    if (target === "KM41 IRRA FELISA") return "IRRA LA FELISA VER RIOSUCIO";
    
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
            const commentAdicional = valAdicional > 0 ? `**ADICIONAL $${valAdicional.toLocaleString('de-DE')}**` : 'sin adicional';

            const valuesStr = `  /* ${formattedIndex} – ${placa} – ${commentAdicional} */
  ('2026-06-05','Viernes','${provider}','${conductor}','${placa}','${combinedPlanilla || '-'}','${combinedZonas}','${poblacionRaw}','${auxiliaresString}',${noAuxiliares},
   ${adicionalesVal},${valAdicional},'${razonAdicional}',
   ${tVal},
   ${precioExpr},
   ${tPed},${facAdic ? `'${facAdic}'` : 'NULL'},'TYM')`;

            valuesSql.push(valuesStr);
            index++;
        }

        const sql = `/* ==========================================================
   Brief: 🚛 SCRIPT DE PROGRAMACIÓN: VIERNES 5 JUNIO 2026
   Generado: ${new Date().toISOString()}
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-05'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 05‑Jun‑2026
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
WHERE fecha = '2026-06-05'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
`;

        fs.writeFileSync('insert_fletes_june05.sql', sql);
        console.log("\nSQL successfully written to c:/Users/Juanjo/Documents/Fletesapp/insert_fletes_june05.sql");
        
        // Generate the delete script too
        const deleteSql = `/* ==========================================================
   🚮 SCRIPT: Eliminar fletes 05‑Jun‑2026
   Generado: ${new Date().toISOString()}
   Uso: ejecutar en la BD (psql/supervisor) para eliminar los
         registros de ALPINA y FLEISCHMANN del 2026-06-05.
   ========================================================== */

BEGIN;

SELECT COUNT(*) AS registros_a_eliminar
FROM fletes
WHERE fecha = '2026-06-05'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

DELETE FROM fletes
WHERE fecha = '2026-06-05'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
RETURNING id, placa, contratista, proveedor, fecha, precio;

COMMIT;
`;
        fs.writeFileSync('delete_fletes_june05.sql', deleteSql);
        console.log("SQL successfully written to c:/Users/Juanjo/Documents/Fletesapp/delete_fletes_june05.sql");
    } catch (e) {
        console.error("Error:", e.stack);
    }
}

main();
