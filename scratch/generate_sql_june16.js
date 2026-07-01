const fs = require('fs');
const https = require('https');

const SUPABASE_URL = 'https://culezzzujkwjpdlalfzi.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN1bGV6enp1amt3anBkbGFsZnppIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYxNzQ2NTIsImV4cCI6MjA4MTc1MDY1Mn0.qKp2IrOQW0YaPvSmIsmSFxcnFB_vPd2D0A6VzZJAhe8';

// RAW DATA FOR JUNE 16, 2026
const RAW_DATA = `SYU652	JOHAN ECHEVERRY	9552	MANIZALES	EDWAR ZAPATA		56	 $ 5.747.293 	21158	3	 $ 100.708 	19216 19212		59	 $ 5.848.001 	
KOL802	CAMILO CASTAÑO	9553	MANIZALES	LUIS CADAVID		47	 $ 4.708.790 	21159	2	 $ 210.243 	19213		49	 $ 4.919.033 	
WFV015	YONNI VALENCIA	9554	MANIZALES	CRISTIAN OSPINA		49	 $ 5.855.469 	21160	4	 $ 392.939 	19231 19214		53	 $ 6.248.408 	
EYY183	JOHN ARENAS	9555	MANIZALES	ALEJANDRO MARIN		56	 $ 5.238.722 	21161	2	 $ 67.730 	19215		58	 $ 5.306.452 	
SLI587	MIGUEL GONZALES	9556 9550	MANIZALES	MILTON OSORIO	ADRIAN MARTINEZ	48	 $ 6.602.468 	21137 21162					48	 $ 6.602.468 	
WGZ876	RICARDO PINEDA	9557	SUPIA	JUAN DELGADO		32	 $ 6.766.353 	21163					32	 $ 6.766.353 	 WGZ876 EXTRA $60.000 
EYX091	CARLOS GOMEZ	9558	FILADELFIA ARANZAZU	VICTOR PULGARIN	JUAN COCOMA	24	 $ 5.340.637 	21119	6	 $ 1.058.698 	19217		30	 $ 6.399.335 	
SMH182	JUAN DAVID	9559	CHINCHINA	BRANDON BAEZ		52	 $ 4.876.110 	21164	2	 $ 80.505 	19218		54	 $ 4.956.615 	
TRL186	WILLIAM	9560	SUPIA RIOSUCIO	MATEO VILLALBA		9	 $ 11.339.538 	21173				AP656190	9	 $ 11.339.538 	
SNL038	MIGUEL	7008	N CALARCA	CESAR CASTILLO		2	 $ 12.372.020 	21134					2	 $ 12.372.020 	 VALOR DE FLETE $550.000 
SPU120	OSWALDO	9601 7009	ARMENIA	YEISON RENDON		51	 $ 6.649.976 	21135 21165					51	 $ 6.649.976 	
VZD334	JULIAN CUELLAR	9602	ARMENIA	SEBASTIAN VILLADA		56	 $ 6.903.352 	21174	1	 $ 40.918 	19230	AP660301	57	 $ 6.944.270 	
EQY944	GOBER CRISTANCHO	9603 7008	CALARCA	ALEXANDER COSTAIN		53	 $ 9.643.134 	21144 21167	5	 $ 449.969 	19224 19222 19221		58	 $ 10.093.103 	
TTL256	ANDRES QUINTERO	9604	MONTENEGRO	CAMILO CONTRERAS	CAMILO SUAREZ	53	 $ 6.052.274 	21168	11	 $ 1.390.806 	19220	AP660295 AP660296	64	 $ 7.443.080 	
WLS478	HUMBERTO RINCON	9605	TEBAIDA	CRISTIAN CAICEDO		42	 $ 4.057.475 	21140	3	 $ 247.286 	19223		45	 $ 4.304.761 	
MAT480	ELKIN AGUIRRE	9606	CIRCASIA	CRISTIAN CAMACHO		32	 $ 2.614.531 	21141	1	 $ 40.918 	19225		33	 $ 2.655.449 	
SMO183	GABRIEL PEREZ	9453	PEREIRA	JUAN QUINTERO		50	 $ 6.450.912 	21147					50	 $ 6.450.912 	
XVI496	PABLO RAMIREZ	9454	PEREIRA	ANDRES PINEDA		49	 $ 6.541.063 	21149	1	 $ 415.959 	19228	AP659114	50	 $ 6.957.022 	
TMZ674	RICARDO LOPEZ	9455	PEREIRA	ANDRES RIOS		64	 $ 5.649.589 	21150					64	 $ 5.649.589 	
SPQ814	CARLOS VELASCO	9456	SANTA ROSA	GERMAN GALVEZ		49	 $ 4.923.793 	21151					49	 $ 4.923.793 	
WHM317	HUMBERTO PARRA	9457	PEREIRA	ESTEBAN GALLEGO		47	 $ 5.549.481 	21152					47	 $ 5.549.481 	
PEK019	MIGUEL TABARES	9458	PEREIRA	JHON GIRALDO		48	 $ 6.069.798 	21153					48	 $ 6.069.798 	
WHM896	ALEXANDER CUELLAR	9459	PEREIRA	CAMILO PEÑA	SANTIAGO HENAO	64	 $ 7.620.580 	21154					64	 $ 7.620.580 	
WLC133	JULIAN  	9460	PEREIRA	EDWIN GOMEZ	JUAN CONTRERAS	56	 $ 7.547.094 	21155					56	 $ 7.547.094 	
TNH494	ADALBERTO MEJIA	9461	CARTAGO	DIORLAN FLOREZ		62	 $ 4.721.251 	21156				AP659476-485-490-495 AP660241	62	 $ 4.721.251 	
WTN748	DIEGO RATIVA	7004	PEREIRA	BRAHIAN VALENCIA		53	 $ 7.410.528 	21169					53	 $ 7.410.528 	WTN748 EXTRA $60.000
EST067	JORGE RIVILLAS	7005	ANSERMA NUEVO	ARBEY LARGO		32	 $ 5.244.769 	21143					32	 $ 5.244.769 	
ERK303	JORGE ALARCON	7006 9450	SANTUARIO VIRGINIA	ROBINSON TORRES	JOHAN MUÑOZ	40	 $ 10.779.480 	21132 21157	7	 $ 932.741 	19226 19229		47	 $ 11.712.221 	
JVM223	WILMAR CARDONA	7007 9451	BELEN DE UMBREA	OSCAR RESTREPO	JOHN MORENO	57	 $ 8.838.957 	21133 21142					57	 $ 8.838.957 	
SQB119	CARLOS CASTAÑO	FLEISCHMANN	ARMENIA	DIEGO FRANCO					44	 $ 6.488.669 	19219		44	 $ 6.488.669`;

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
    let target = poblacionRaw.trim().toUpperCase()
      .replace(/\s+/g, ' ');
    
    // Supermarket check
    if (obs && obs.toUpperCase().includes("SUPERMERCADO")) {
        if (target === "SUPIA RIOSUCIO") return "RIOSUCIO-SUPIA SUPERMERCADO";
        if (target === "CHINCHINA") return "CHINCHINA SUPERMERCADO";
    }
    
    if (target === "MANIZALES") return "MANIZALES VILLAMARIA";
    if (target === "FILADELFIA ARANZAZU") return "ARANZAZU FILADELFIA";
    if (target === "CHINCHINA") return "CHINCHINA";
    if (target === "SUPIA RIOSUCIO") return "RIOSUCIO";
    if (target === "N CALARCA") return "CALARCA";
    if (target === "ARMENIA") return "ARMENIA";
    if (target === "CALARCA") return "CALARCA";
    if (target === "MONTENEGRO") return "MONTENEGRO";
    if (target === "TEBAIDA") return "TEBAIDA";
    if (target === "CIRCASIA") return "CIRCASIA";
    if (target === "PEREIRA") return "PEREIRA-DOSQUEBRADAS";
    if (target === "SANTA ROSA") return "SANTA ROSA";
    if (target === "CARTAGO") return "CARTAGO 2T";
    if (target === "ANSERMA NUEVO") return "ANSERMA NUEVO 2T";
    if (target === "SANTUARIO VIRGINIA") return "SANTUARIO APIA";
    if (target === "BELEN DE UMBRIA" || target === "BELEN DE UMBREA") return "BELEN";
    
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
  ('2026-06-16','Martes','${provider}','${conductor}','${placa}','${combinedPlanilla || '-'}','${combinedZonas}','${subqueryPob}','${auxiliaresString}',${noAuxiliares},
   ${adicionalesVal},${valAdicional},'${razonAdicional}',
   ${tVal},
   ${precioExpr},
   ${tPed},${facAdic ? `'${facAdic}'` : 'NULL'},'TYM')`;

            valuesSql.push(valuesStr);
            index++;
        }

        const sql = `/* ==========================================================
   🚛 SCRIPT DE PROGRAMACIÓN: MARTES 16 JUNIO 2026
   Generado: ${new Date().toISOString()}
   ✅ Nombres de población corregidos según tabla precios_fletes
   ========================================================== */

/* -------------------------------------------------
   1️⃣  Eliminar los fletes del día (evita duplicados)
   ------------------------------------------------- */
DELETE FROM fletes
WHERE fecha = '2026-06-16'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* -------------------------------------------------
   2️⃣  Insertar los fletes del 16‑Jun‑2026
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
WHERE fecha = '2026-06-16'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
`;

        fs.writeFileSync('insert_fletes_june16.sql', sql);
        console.log("\nSQL successfully written to c:/Users/Juanjo/Documents/Fletesapp/insert_fletes_june16.sql");
        
        // Generate the delete script too
        const deleteSql = `/* ==========================================================
   🚮 SCRIPT: Eliminar fletes 16‑Jun‑2026
   Generado: ${new Date().toISOString()}
   Uso: ejecutar en la BD (psql/supervisor) para eliminar los
          registros de ALPINA y FLEISCHMANN del 2026-06-16.
   ========================================================== */

BEGIN;

SELECT COUNT(*) AS registros_a_eliminar
FROM fletes
WHERE fecha = '2026-06-16'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

DELETE FROM fletes
WHERE fecha = '2026-06-16'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
RETURNING id, placa, contratista, proveedor, fecha, precio;

COMMIT;
`;
        fs.writeFileSync('delete_fletes_june16.sql', deleteSql);
        console.log("SQL successfully written to c:/Users/Juanjo/Documents/Fletesapp/delete_fletes_june16.sql");
    } catch (e) {
        console.error("Error:", e.stack);
    }
}

main();
