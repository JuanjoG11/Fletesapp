const fs = require('fs');
const https = require('https');

const SUPABASE_URL = 'https://culezzzujkwjpdlalfzi.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN1bGV6enp1amt3anBkbGFsZnppIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYxNzQ2NTIsImV4cCI6MjA4MTc1MDY1Mn0.qKp2IrOQW0YaPvSmIsmSFxcnFB_vPd2D0A6VzZJAhe8';

// RAW DATA FOR JUNE 10, 2026
const RAW_DATA = `SYU652	JOHAN ECHEVERRY	9552	MANIZALES	EDWAR ZAPATA		42	 $ 5.299.601 	20994					42	 $ 5.299.601 	
KOL802	CAMILO CASTAÑO	9553 7001	VILLAMARIA	GERMAN GALVEZ		49	 $ 13.262.180 	20934 20995	1	 $ 84.662 	19146		50	 $ 13.346.842 	
WFV015	YONNI VALENCIA	9554	MANIZALES	CRISTIAN OSPINA		52	 $ 7.008.457 	20996	4	 $ 739.095 	19140 19143	FEP1186670	56	 $ 7.747.552 	
TRL186	WILLIAM	9555TSS	MANIZALES	ADRIAN MARTINEZ		49	 $ 4.401.808 	20956	3	 $ 168.970 	19127		52	 $ 4.570.778 	
EYY183	JOHN ARENAS	9555 7001	MANIZALES	ALEJANDRO MARIN		47	 $ 6.415.557 	20973 20997	1	 $ 47.395 	19144		48	 $ 6.462.952 	
SLI587	MIGUEL GONZALES	9556	MANIZALES	MILTON OSORIO		38	 $ 4.180.719 	20998	2	 $ 618.155 		FEP1186668 FEP1186671	40	 $ 4.798.874 	
WGZ876	RICARDO PINEDA	9557	MARMATO LA MERCED	JUAN DELGADO	MATEO VILLALBA	36	 $ 15.439.071 	20999					36	 $ 15.439.071 	 WGZ876 ADICIONAL AL FLETE $100.000 ENTREGA DE SUPER Y MAYORISTA DE FLEISCHMANN P 
EYX091	CARLOS GOMEZ	9558	AGUADAS	VICTOR PULGARIN	JUAN COCOMA	55	 $ 12.078.945 	20980	1	 $ 92.408 	19136		56	 $ 12.171.353 	
SMH182	JUAN DAVID	9559	ARAUCA PALESTINA	BRANDON BAEZ		43	 $ 9.467.372 	21000	3	 $ 773.488 	19147		46	 $ 10.240.860 	
  															
SPU120	OSWALDO	9601	ARMENIA	YEISON RENDON		51	 $ 6.150.151 	21001					51	 $ 6.150.151 	
EQY944	GOBER CRISTANCHO	9603	ARMENIA	ALEXANDER COSTAIN	JOHAN MUÑOZ	52	 $ 8.235.576 	21003					52	 $ 8.235.576 	
SXF257	FABIO RUIZ	9604 7010	QUIMBAYA	CAMILO CONTRERAS	CAMILO SUAREZ	39	 $ 7.210.166 	20974 21004					39	 $ 7.210.166 	
WLS478	HUMBERTO RINCON	9605	PIJAO CORDOBA	CRISTIAN CAICEDO		39	 $ 6.298.889 	20976	7	 $ 1.375.927 	19151		46	 $ 7.674.816 	
TTL256	YIMERSON GARCIA	9606	SALENTO	CRISTIAN CAMACHO		33	 $ 9.244.445 	20977	4	 $ 578.862 	19150	AP654912 AP654913	37	 $ 9.823.307 	
															
SMO183	GABRIEL PEREZ	9453	PEREIRA	JUAN QUINTERO		46	 $ 5.680.737 	20985					46	 $ 5.680.737 	
XVI496	PABLO RAMIREZ	9454	PEREIRA	SEBASTIAN VILLADA		48	 $ 7.305.169 	20986	5	 $ 739.486 	19153		53	 $ 8.044.655 	
TMZ674	RICARDO LOPEZ	9455	PEREIRA	ANDRES RIOS		52	 $ 6.418.959 	20987					52	 $ 6.418.959 	
SPQ814	CARLOS VELASCO	9456	SANTA ROSA	SANTIAGO HENAO		54	 $ 7.530.712 	20988					54	 $ 7.530.712 	
WHM317	HUMBERTO PARRA	9457	PEREIRA	CAMILO MUÑOZ		59	 $ 6.651.293 	20989					59	 $ 6.651.293 	
PEK019	MIGUEL TABARES	9458	PEREIRA	JHON GIRALDO		53	 $ 5.370.941 	20990					53	 $ 5.370.941 	
WHM896	ALEXANDER CUELLAR	9459	PEREIRA	CAMILO PEÑA		58	 $ 7.172.058 	20991					58	 $ 7.172.058 	
WLC133	JULIAN  	9460	PEREIRA	EDWIN GOMEZ	JUAN CONTRERAS	69	 $ 6.696.034 	20992					69	 $ 6.696.034 	
TNH494	ADALBERTO MEJIA	9461 9450	CARTAGO	DIORLAN FLOREZ		51	 $ 9.233.638 	20993 20982					51	 $ 9.233.638 	
WTN748	DIEGO RATIVA	7004	PEREIRA	BRAHIAN VALENCIA		54	 $ 7.091.665 	21005	12	 $ 1.605.056 	19155 19152		66	 $ 8.696.721 	
															
EST067	JORGE RIVILLAS	7005	CAIRO ARGELIA	CESAR CASTILLO		31	 $ 8.472.885 	21006				AP653357-359-360 AP653533	31	 $ 8.472.885 	
ERK303	JORGE ALARCON	7006	BALBOA LA CELIA	ROBINSON TORRES		37	 $ 6.416.150 	20978	5	 $ 903.099 	19138		42	 $ 7.319.249 	
JVM223	WILMAR CARDONA	7007 9451	ANSERMA CALDAS	OSCAR RESTREPO	JOHN MORENO	51	 $ 16.663.177 	20971 20979	2	 $ 486.871 	19141		53	 $ 17.150.048 	
															
SQB119	CARLOS CASTAÑO	FLEISCHMANN	PEREIRA	DIEGO FRANCO					55	 $ 5.794.969 	19137		55	 $ 5.794.969`;

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
    
    // New mappings for June 10
    if (target === "AGUADAS") return "AGUADAS PACORA";
    if (target === "ARAUCA PALESTINA") return "PALESTINA ARAUCA";
    if (target === "PIJAO CORDOBA") return "CORDOBA PIJAO BVISTA";
    if (target === "CAIRO ARGELIA") return "ARGELIA EL CAIRO";
    if (target === "ANSERMA CALDAS") return "ANSERMA";
    
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
  ('2026-06-10','Miércoles','${provider}','${conductor}','${placa}','${combinedPlanilla || '-'}','${combinedZonas}','${subqueryPob}','${auxiliaresString}',${noAuxiliares},
   ${adicionalesVal},${valAdicional},'${razonAdicional}',
   ${tVal},
   ${precioExpr},
   ${tPed},${facAdic ? `'${facAdic}'` : 'NULL'},'TYM')`;

            valuesSql.push(valuesStr);
            index++;
        }

        const sql = `/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MIÉRCOLES 10 JUNIO 2026
   Generado: ${new Date().toISOString()}
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-10'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 10‑Jun‑2026
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
WHERE fecha = '2026-06-10'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
`;

        fs.writeFileSync('insert_fletes_june10.sql', sql);
        console.log("\nSQL successfully written to c:/Users/Juanjo/Documents/Fletesapp/insert_fletes_june10.sql");
        
        // Generate the delete script too
        const deleteSql = `/* ==========================================================
   🚮 SCRIPT: Eliminar fletes 10‑Jun‑2026
   Generado: ${new Date().toISOString()}
   Uso: ejecutar en la BD (psql/supervisor) para eliminar los
          registros de ALPINA y FLEISCHMANN del 2026-06-10.
   ========================================================== */

BEGIN;

SELECT COUNT(*) AS registros_a_eliminar
FROM fletes
WHERE fecha = '2026-06-10'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

DELETE FROM fletes
WHERE fecha = '2026-06-10'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
RETURNING id, placa, contratista, proveedor, fecha, precio;

COMMIT;
`;
        fs.writeFileSync('delete_fletes_june10.sql', deleteSql);
        console.log("SQL successfully written to c:/Users/Juanjo/Documents/Fletesapp/delete_fletes_june10.sql");
    } catch (e) {
        console.error("Error:", e.stack);
    }
}

main();
