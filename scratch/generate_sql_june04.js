const fs = require('fs');
const https = require('https');

const SUPABASE_URL = 'https://culezzzujkwjpdlalfzi.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN1bGV6enp1amt3anBkbGFsZnppIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYxNzQ2NTIsImV4cCI6MjA4MTc1MDY1Mn0.qKp2IrOQW0YaPvSmIsmSFxcnFB_vPd2D0A6VzZJAhe8';

// RAW DATA FOR JUNE 4, 2026
const RAW_DATA = `SYU652	JOHAN ECHEVERRY	9552	MANIZALES	EDWAR ZAPATA		48	 $ 6.160.077 	20840					48	 $ 6.160.077 	
KOL802	CAMILO CASTAÑO	9553	MANIZALES	CRISTIAN OSPINA		59	 $ 7.978.346 	20801TSS 20841	2	 $ 204.384 	19077		61	 $ 8.182.730 	
EYX091	CARLOS GOMEZ	9554	NEIRA	VICTOR PULGARIN	JUAN COCOMA	44	 $ 7.783.833 	20842					44	 $ 7.783.833 	
TRL186	RUBEN	9555	MANIZALES	JUAN ALEJANDRO		49	 $ 11.250.048 	20843	7	 $ 400.443 	19078 19071	AP648058	56	 $ 11.650.491 	
SLI587	MIGUEL GONZALES	9556 9550	MANIZALES	MILTON OSORIO	ADRIAN MARTINEZ	49	 $ 10.166.431 	20844 20820	3	 $ 280.553 	19079		52	 $ 10.446.984 	
WGZ876	RICARDO PINEDA	9557	RIOSUCIO	JUAN DELGADO	MATEO VILLALBA	55	 $ 12.696.371 	20845	2	 $ 1.312.631 	19080 19058		57	 $ 14.009.002 	
SMH182	JUAN DAVID	9559	SAN JOSE BELALCAZAR	BRANDON BAEZ	CAMILO SUAREZ	49	 $ 10.561.443 	20847	5	 $ 512.762 	19082		54	 $ 11.074.205 	
															
WFV015	YONNI VALENCIA	7008	CALARCA	YONNI VALENCIA		3	 $ 15.788.024 	20823					3	 $ 15.788.024 	 WFV015 ADICIONAL $100.000 INCLUYE DESCARGUE 
SPU120	OSWALDO	9601	ARMENIA	YEISON RENDON		58	 $ 6.648.848 	20848					58	 $ 6.648.848 	
VZD334	JULIAN CUELLAR	9602	ARMENIA	SEBASTIAN VILLADA		61	 $ 6.256.028 	20849	3	 $ 494.926 	19052 19069	AP648982	64	 $ 6.750.954 	
EQY944	GOBER CRISTANCHO	9603	ARMENIA	ALEXANDER COSTAIN		62	 $ 6.573.598 	20850				AP648053 AP648054	62	 $ 6.573.598 	
SXF257	FABIO RUIZ	9604 TSS	ALCALA ULLOA QUIMBAYA	CAMILO CONTRERAS		61	 $ 9.479.215 	20810TSS 20851	12	 $ 863.454 	19085		73	 $ 10.342.669 	 SXF257 ADICIONAL $80.000 ENTREGA TSS QUIMBAYA 
WLS478	HUMBERTO RINCON	9605	CAICEDONIA	CRISTIAN CAICEDO	JUAN CONTRERAS	58	 $ 8.951.709 	20825	9	 $ 1.108.678 	19086		67	 $ 10.060.387 	
TTL256	ANDRES QUINTERO	9606 9600	FILANDIA	CRISTIAN CAMACHO		38	 $ 11.743.937 	20826 20821	2	 $ 71.125 	19088		40	 $ 11.815.062 	
															
SMO183	GABRIEL PEREZ	9453	PEREIRA	JUAN QUINTERO		45	 $ 5.816.783 	20831					45	 $ 5.816.783 	
XVI496	PABLO RAMIREZ	9454	PEREIRA	ANDRES PINEDA		53	 $ 10.110.641 	20832	3	 $ 392.356 	19073 19072		56	 $ 10.502.997 	
TMZ674	RICARDO LOPEZ	9455	PEREIRA	ANDRES RIOS		51	 $ 5.831.577 	20833					51	 $ 5.831.577 	
SPQ814	CARLOS VELASCO	9456 7002	SANTA ROSA	CAMILO MUÑOZ		45	 $ 7.881.958 	20834 20822					45	 $ 7.881.958 	
WHM317	HUMBERTO PARRA	9457	PEREIRA	ESTEBAN GALLEGO		43	 $ 5.305.322 	20835	8	 $ 942.435 	19067		51	 $ 6.247.757 	
PEK019	MIGUEL TABARES	9458	PEREIRA	JHON GIRALDO		47	 $ 6.632.881 	20836					47	 $ 6.632.881 	
WHM896	ALEXANDER CUELLAR	9459	PEREIRA	CAMILO PEÑA		52	 $ 7.799.178 	20837					52	 $ 7.799.178 	
WLC133	JULIAN  	9460	PEREIRA	EDWIN GOMEZ		42	 $ 6.018.038 	20838					42	 $ 6.018.038 	
WTN748	DIEGO RATIVA	7004	MARSELLA	BRAHIAN VALENCIA		51	 $ 10.067.564 	20852	2	 $ 87.263 	19075	AP649164	53	 $ 10.154.827 	
															
JVM223	WILMAR CARDONA	7005	CARTAGO	CESAR CASTILLO		41	 $ 7.509.567 	20853				AP649395 AP649396	41	 $ 7.509.567 	
ERK303	JORGE ALARCON	7006	APIA VIRGINIA	ROBINSON TORRES	GERMAN GALVEZ	50	 $ 8.672.636 	20827	6	 $ 605.075 	19074 19070		56	 $ 9.277.711 	
TNH494	ADALBERTO MEJIA	7007 9451	VITERBO	JOHN MORENO	JOHAN MUÑOZ	63	 $ 14.507.865 	20819 20828	4	 $ 175.664 	19087		67	 $ 14.683.529 	 TNH494 ADICIONAL $50.000 SOBRECARGO 
 															
SQB119	CARLOS CASTAÑO	FLEISCHMANN	CUBA	DIEGO FRANCO					45	 $ 3.458.882 	19076		45	 $ 3.458.882 	`;

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
    if (target === "MANIZALES") return "MANIZALES VILLAMARIA";
    if (target === "VILLAMARIA") return "MANIZALES VILLAMARIA";
    if (target === "ALCALA ULLOA QUIMBAYA") return "QUIMBAYA";
    if (target === "PEREIRA") return "PEREIRA - DOSQUEBRADAS";
    if (target === "CARTAGO") return "CARTAGO 2T";
    return target;
}

// Extract extra amount from observation string
function extractExtra(obs) {
  if (!obs) return 0;
  const upper = obs.toUpperCase();
  if (!upper.includes('EXTRA') && !upper.includes('ADICIONAL') && !upper.includes('SOBRECARGO')) return 0;
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

            const subqueryPob = getSubqueryPoblacion(poblacionRaw);
            const lookupKey = `${provider}::${subqueryPob.toUpperCase()}`;
            const dbPrice = dbPrices[lookupKey];

            // Adicional/Negotiation
            let valAdicional = extractExtra(obs);
            let razonAdicional = valAdicional > 0 ? obs.trim() : '-';

            let precioExpr;
            if (dbPrice !== undefined) {
                precioExpr = `(SELECT precio FROM precios_fletes WHERE lista_id='${provider}' AND UPPER(poblacion)='${subqueryPob}' LIMIT 1) + ${valAdicional}`;
                console.log(`✅ MATCHED: ${placa} (${provider} - ${subqueryPob}) -> DB Price: ${dbPrice} + Extra: ${valAdicional} = Total Flete: ${dbPrice + valAdicional}`);
            } else {
                precioExpr = `0`; // Fallback
                console.error(`❌ ERROR: Population "${subqueryPob}" (from raw "${poblacionRaw}") with provider "${provider}" not found in DB!`);
            }

            // adicionales column receives noAuxiliares in standard sql generator
            const adicionalesVal = noAuxiliares;
            const formattedIndex = String(index).padStart(2, '0');
            const commentAdicional = valAdicional > 0 ? `**ADICIONAL $${valAdicional.toLocaleString('de-DE')}**` : 'sin adicional';

            const valuesStr = `  /* ${formattedIndex} – ${placa} – ${commentAdicional} */
  ('2026-06-04','Jueves','${provider}','${conductor}','${placa}','${combinedPlanilla || '-'}','${combinedZonas}','${poblacionRaw}','${auxiliaresString}',${noAuxiliares},
   ${adicionalesVal},${valAdicional},'${razonAdicional}',
   ${tVal},
   ${precioExpr},
   ${tPed},${facAdic ? `'${facAdic}'` : 'NULL'},'TYM')`;

            valuesSql.push(valuesStr);
            index++;
        }

        const sql = `/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: JUEVES 4 JUNIO 2026
   Generado: ${new Date().toISOString()}
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-04'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 04‑Jun‑2026
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
WHERE fecha = '2026-06-04'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
`;

        fs.writeFileSync('insert_fletes_june04.sql', sql);
        console.log("\nSQL successfully written to c:/Users/Juanjo/Documents/Fletesapp/insert_fletes_june04.sql");
    } catch (e) {
        console.error("Error:", e.stack);
    }
}

main();
