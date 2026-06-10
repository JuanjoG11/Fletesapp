const https = require('https');

const SUPABASE_URL = 'https://culezzzujkwjpdlalfzi.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN1bGV6enp1amt3anBkbGFsZnppIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYxNzQ2NTIsImV4cCI6MjA4MTc1MDY1Mn0.qKp2IrOQW0YaPvSmIsmSFxcnFB_vPd2D0A6VzZJAhe8';

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

async function main() {
    try {
        console.log("Querying database prices...");
        const dbPricesList = await get('precios_fletes?lista_id=in.("ALPINA","FLEISCHMANN")&select=lista_id,poblacion,precio');
        
        const targets = ["MANIZALES", "NEIRA", "RIOSUCIO", "SAN JOSE", "CALARCA", "ARMENIA", "QUIMBAYA", "CAICEDONIA", "FILANDIA", "PEREIRA", "SANTA ROSA", "MARSELLA", "CARTAGO", "APIA", "VIRGINIA", "VITERBO", "CUBA"];
        
        console.log("ALPINA matches:");
        dbPricesList.filter(x => x.lista_id === 'ALPINA').forEach(x => {
            const upob = x.poblacion.toUpperCase();
            if (targets.some(t => upob.includes(t))) {
                console.log(`  - "${x.poblacion}": ${x.precio}`);
            }
        });
        
        console.log("\nFLEISCHMANN matches:");
        dbPricesList.filter(x => x.lista_id === 'FLEISCHMANN').forEach(x => {
            const upob = x.poblacion.toUpperCase();
            if (targets.some(t => upob.includes(t))) {
                console.log(`  - "${x.poblacion}": ${x.precio}`);
            }
        });
    } catch (e) {
        console.error("Error:", e.stack);
    }
}

main();
