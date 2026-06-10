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
        console.log("Fetching ALPINA and FLEISCHMANN prices...");
        const prices = await get('precios_fletes?lista_id=in.("ALPINA","FLEISCHMANN")&select=lista_id,poblacion,precio');
        console.log(`Found ${prices.length} prices.`);
        console.log(JSON.stringify(prices, null, 2));

        console.log("\nFetching vehicles directly...");
        // If we get 0 vehicles due to RLS, let's see if we can get them by querying public tables, 
        // or check if we can query them with a filter or order.
        const vehicles = await get('vehiculos?select=id,placa,conductor,razon_social');
        console.log(`Found ${vehicles.length} vehicles.`);
        if (vehicles.length > 0) {
            console.log(JSON.stringify(vehicles, null, 2));
        }
    } catch (e) {
        console.error("Error:", e.message);
    }
}

main();
