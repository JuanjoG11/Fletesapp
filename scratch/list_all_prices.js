const https = require('https');
const fs = require('fs');

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
        console.log("Fetching database prices...");
        const dbPricesList = await get('precios_fletes?lista_id=in.("ALPINA","FLEISCHMANN")&select=lista_id,poblacion,precio');
        
        console.log("Total records:", dbPricesList.length);
        
        // Write to a temporary file for analysis
        fs.writeFileSync('scratch/all_db_prices.json', JSON.stringify(dbPricesList, null, 2));
        console.log("Dumped all prices to scratch/all_db_prices.json");

        // Print unique populations
        const uniquePobs = [...new Set(dbPricesList.map(x => `${x.lista_id}::${x.poblacion.toUpperCase().trim()}`))].sort();
        console.log("\nList of all unique provider::populations in DB:");
        uniquePobs.forEach(p => console.log("  -", p));

    } catch (e) {
        console.error("Error:", e.stack);
    }
}

main();
