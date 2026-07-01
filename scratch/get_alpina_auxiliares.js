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
        console.log("Querying auxiliaries for ALPINA from DB...");
        // Get up to 1000 records
        const data = await get('fletes?select=auxiliares&proveedor=eq.ALPINA&limit=1000');
        
        const auxSet = new Set();
        data.forEach(row => {
            if (row.auxiliares && typeof row.auxiliares === 'string') {
                row.auxiliares.split(',').forEach(name => {
                    const clean = name.trim().toUpperCase();
                    if (clean && clean !== 'NO APLICA' && clean !== 'EXTRA' && clean !== 'EXTRA NEGOCIADO') {
                        auxSet.add(clean);
                    }
                });
            }
        });
        
        const sortedAux = Array.from(auxSet).sort();
        console.log("Found", sortedAux.length, "unique auxiliaries for ALPINA:");
        console.log(JSON.stringify(sortedAux, null, 2));
    } catch (e) {
        console.error("Error:", e.stack);
    }
}

main();
