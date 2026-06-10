const https = require('https');

const SUPABASE_URL = 'https://culezzzujkwjpdlalfzi.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN1bGV6enp1amt3anBkbGFsZnppIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYxNzQ2NTIsImV4cCI6MjA4MTc1MDY1Mn0.qKp2IrOQW0YaPvSmIsmSFxcnFB_vPd2D0A6VzZJAhe8';

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

function getSubqueryPoblacion(poblacionRaw) {
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
    return subqueryPoblacion;
}

async function main() {
    try {
        console.log("Fetching precios_fletes from DB...");
        const dbPricesList = await get('precios_fletes?lista_id=in.("ALPINA","FLEISCHMANN")&select=lista_id,poblacion,precio');
        
        // Build a dictionary for fast lookup
        const dbPrices = {};
        for (const item of dbPricesList) {
            const key = `${item.lista_id}::${item.poblacion.toUpperCase().trim()}`;
            dbPrices[key] = item.precio;
        }

        const lines = RAW_DATA.trim().split('\n');
        let index = 1;
        let missingCount = 0;

        console.log("\nChecking each programming route against DB prices:");
        for (const line of lines) {
            if (!line.trim()) continue;
            const parts = line.split('\t');
            if (parts.length < 15) continue;

            const placa = parts[0].trim();
            const zonasRaw = parts[2].trim();
            const poblacionRaw = parts[3].trim();
            
            let provider = "ALPINA";
            if (poblacionRaw === "FLEISCHMANN" || zonasRaw === "FLEISCHMANN") {
                provider = "FLEISCHMANN";
            }

            const targetPob = getSubqueryPoblacion(poblacionRaw).toUpperCase().trim();
            const lookupKey = `${provider}::${targetPob}`;
            const dbPrice = dbPrices[lookupKey];

            if (dbPrice === undefined) {
                console.error(`❌ MISSING PRICE: Row #${index} (${placa}) -> Provider: ${provider}, Population: "${targetPob}" (Raw: "${poblacionRaw}")`);
                missingCount++;
            } else {
                console.log(`✅ OK: Row #${index} (${placa}) -> Provider: ${provider}, Population: "${targetPob}" -> DB Price: ${dbPrice}`);
            }
            index++;
        }

        console.log(`\nVerification finished. Missing prices: ${missingCount}`);
    } catch (e) {
        console.error("Error:", e.stack);
    }
}

main();
