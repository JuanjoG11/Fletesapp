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

// Map of spelling variations to clean canonical names
const CANONICAL_MAP = {
    "ADRIAN MARTIENEZ": "ADRIAN FELIPE MARTINEZ ORTEGON",
    "ADRIAN MARTINEZ": "ADRIAN FELIPE MARTINEZ ORTEGON",
    "ADRIAN FELIPE MARTINEZ ORTEGON": "ADRIAN FELIPE MARTINEZ ORTEGON",
    
    "ALEJANDRO VALERO": "GABRIEL ALEJANDRO GAMEZ VALERO",
    "GABRIEL ALEJANDRO GAMEZ VALERO": "GABRIEL ALEJANDRO GAMEZ VALERO",
    
    "ALEXANDER COSTAIN": "JOSE ALEXANDER CONSTAIN PERLAZA",
    "JOSE ALEXANDER CONSTAIN PERLAZA": "JOSE ALEXANDER CONSTAIN PERLAZA",
    
    "ANDRES FELIPE RIOS CAICEDO": "ANDRES FELIPE RIOS CAICEDO",
    
    "ANDRES FELIPE VILLA OSORIO": "ANDRES FELIPE VILLA OSORIO",
    "ANDRES VILLA": "ANDRES FELIPE VILLA OSORIO",
    "ANDRÉS VILLA": "ANDRES FELIPE VILLA OSORIO",
    
    "ANDRES PIDENA": "CARLOS ANDRES PINEDA CANO",
    "ANDRES PINEDA": "CARLOS ANDRES PINEDA CANO",
    "CARLOS ANDRES PINEDA CANO": "CARLOS ANDRES PINEDA CANO",
    
    "ARBEY DE JESUS LARGO LARGO": "ARBEY DE JESUS LARGO LARGO",
    "ARBEY LARGO": "ARBEY DE JESUS LARGO LARGO",
    
    "ARNULFO STERLING PELAEZ": "ARNULFO STERLING PELAEZ",
    
    "BRAHIAN STIVEN VALENCIA IGLESIAS": "BRAHIAN STIVEN VALENCIA IGLESIAS",
    "BRAHIAN VALENCIA": "BRAHIAN STIVEN VALENCIA IGLESIAS",
    "BRAYAN VALENCIA": "BRAHIAN STIVEN VALENCIA IGLESIAS",
    
    "BRANDON BAEZ": "BRANDON STEVEN GIL BAEZ",
    "BRANDON STEVEN GIL BAEZ": "BRANDON STEVEN GIL BAEZ",
    
    "CAMILO ANDRES CONTRERAS RIVAS": "CAMILO ANDRES CONTRERAS RIVAS",
    "CAMILO CONTRERAS": "CAMILO ANDRES CONTRERAS RIVAS",
    
    "CHRISTIAN DAVID CAICEDO MONTAÑO": "CHRISTIAN DAVID CAICEDO MONTAÑO",
    "CHRISTIAN DAVID CAICEDO MONTAO": "CHRISTIAN DAVID CAICEDO MONTAÑO",
    "CRISTIAN CAICEDO": "CHRISTIAN DAVID CAICEDO MONTAÑO",
    
    "CRISTIAN CAMILO OSPINA PARRA": "CRISTIAN CAMILO OSPINA PARRA",
    "CRISTIAN OSPINA": "CRISTIAN CAMILO OSPINA PARRA",
    
    "CRISTIAN FABIAN CAMACHO MARTINEZ": "CRISTIAN FABIAN CAMACHO MARTINEZ",
    
    "DIORLAN": "DIORLAN ANTONIO MESA FLOREZ",
    "DIORLAN ANTONIO MESA FLORES": "DIORLAN ANTONIO MESA FLOREZ",
    "DIORLAN ANTONIO MESA FLOREZ": "DIORLAN ANTONIO MESA FLOREZ",
    
    "EDUARD": "JOHN EDWAR ZAPATA ACEVEDO",
    "EDUARD ZAPATA": "JOHN EDWAR ZAPATA ACEVEDO",
    "EDWAR ZAPATA": "JOHN EDWAR ZAPATA ACEVEDO",
    "JOHN EDWAR ZAPATA ACEVEDO": "JOHN EDWAR ZAPATA ACEVEDO",
    
    "EDWIN GOMEZ": "EDWIN MAURICIO GOMEZ GALINDO",
    "EDWIN MAURICIO GOMEZ GALINDO": "EDWIN MAURICIO GOMEZ GALINDO",
    
    "ESTIVEN GUTIERREZ": "ESTIVEN GUTIERREZ SALAZAR",
    "ESTIVEN GUTIERREZ SALAZAR": "ESTIVEN GUTIERREZ SALAZAR",
    "STEVEN GUTIERREZ": "ESTIVEN GUTIERREZ SALAZAR",
    "STEVEN GUTIRREZ": "ESTIVEN GUTIERREZ SALAZAR",
    
    "JEISON MARIN": "JEISON MARIN",
    "YEISON MARIN": "JEISON MARIN",
    
    "JHON FREDY MORENO": "JHON FREDY MORENO",
    "JHON MORENO": "JHON FREDY MORENO",
    "JIHON MORENO": "JHON FREDY MORENO",
    "JOHN MORENO": "JHON FREDY MORENO",
    
    "JHON GIRALDO": "JHON WILSON GIRALDO CARVAJAL",
    "JOHN GIRALDO": "JHON WILSON GIRALDO CARVAJAL",
    "JHON WILSON GIRALDO": "JHON WILSON GIRALDO CARVAJAL",
    "JHON WILSON GIRALDO CARVAJAL": "JHON WILSON GIRALDO CARVAJAL",
    
    "JUAN ALEJANDRO": "JUAN ALEJANDRO FRANCO MARIN",
    "JUAN ALEJANDRO FRANCO MARIN": "JUAN ALEJANDRO FRANCO MARIN",
    
    "JUAN CAMILO COCOMA OROZCO": "JUAN CAMILO COCOMA OROZCO",
    "JUAN COCOMA": "JUAN CAMILO COCOMA OROZCO",
    
    "JUAN DAVID QUINTERO": "JUAN DAVID QUINTERO GRAJALES",
    "JUAN DAVID QUINTERO GRAJALES": "JUAN DAVID QUINTERO GRAJALES",
    "JUAN QUINTERO": "JUAN DAVID QUINTERO GRAJALES",
    
    "JUAN DELGADO": "JUAN MANUEL DELGADO NARVAEZ",
    "JUAN MANUEL DELGADO NARVAEZ": "JUAN MANUEL DELGADO NARVAEZ",
    
    "JUAN DIEGO FRANCO": "JUAN DIEGO FRANCO VERGARA",
    "JUAN DIEGO FRANCO VERGARA": "JUAN DIEGO FRANCO VERGARA",
    
    "JUAN ESTEBAN ALZATE VASQUEZ": "JUAN ESTEBAN ALZATE VASQUEZ",
    "JUAN ESTEBAN ALZATE VAZQUEZ": "JUAN ESTEBAN ALZATE VASQUEZ",
    
    "JULIAN CORTES-ALEJANDRO RIVERA": "JULIAN CORTES & ALEJANDRO RIVERA",
    "JULIAN CORTEZ": "JULIAN CORTEZ",
    
    "LUIS CADAVID": "LUIS CARLOS CADAVID RESTREPO",
    "LUIS CARLOS CADAVID RESTREPO": "LUIS CARLOS CADAVID RESTREPO",
    
    "MAICOL HENAO": "MICHAEL STEVEN HENAO RODRIGUEZ",
    "MICHAEL STEVEN HENAO RODRIGUEZ": "MICHAEL STEVEN HENAO RODRIGUEZ",
    "MICHEL HENAO": "MICHAEL STEVEN HENAO RODRIGUEZ",
    
    "NELSON ZULUAGA": "NELSON ZULUAGA",
    
    "OSCAR MAURICIO RESTREPO MORENO": "OSCAR MAURICIO RESTREPO MORENO",
    "OSCAR RESTREPO": "OSCAR MAURICIO RESTREPO MORENO",
    
    "ROBINSON TORRES": "ROVINSON TORRES RIVERA",
    "ROVINSON TORRES RIVERA": "ROVINSON TORRES RIVERA",
    
    "RONALD ADOLFO ANGULO MACUASE": "RONALD ADOLFO ANGULO MACUASE",
    "RONALD ANGULO": "RONALD ADOLFO ANGULO MACUASE",
    
    "SEBASTIAN VILLADA": "SEBASTIAN VILLADA VELASQUEZ",
    "SEBASTIAN VILLADA VELASQUEZ": "SEBASTIAN VILLADA VELASQUEZ",
    "SEBASTIÁN VILLADA": "SEBASTIAN VILLADA VELASQUEZ",
    
    "VICTOR ALFONSO PULGARIN MEJIA": "VICTOR ALFONSO PULGARIN MEJIA",
    "VICTOR PULGARIN": "VICTOR ALFONSO PULGARIN MEJIA",
    
    "YEISON DAVID RENDON SOTO": "YEISON DAVID RENDON SOTO",
    "YEISON RENDON": "YEISON DAVID RENDON SOTO"
};

async function main() {
    try {
        console.log("Querying Supabase...");
        const data = await get('fletes?select=auxiliares&proveedor=eq.ALPINA&limit=1000');
        
        // Count frequencies of raw database names
        const rawFrequencies = {};
        data.forEach(row => {
            if (row.auxiliares && typeof row.auxiliares === 'string') {
                row.auxiliares.split(',').forEach(name => {
                    const clean = name.trim().toUpperCase();
                    if (clean && clean !== 'NO APLICA' && clean !== 'EXTRA' && clean !== 'EXTRA NEGOCIADO' && clean !== 'N/A') {
                        rawFrequencies[clean] = (rawFrequencies[clean] || 0) + 1;
                    }
                });
            }
        });
        
        // Map raw names to canonical/cleaned names and aggregate frequencies
        const canonicalFrequencies = {};
        const canonicalToRaw = {};
        
        Object.keys(rawFrequencies).forEach(rawName => {
            const canon = CANONICAL_MAP[rawName] || rawName;
            
            canonicalFrequencies[canon] = (canonicalFrequencies[canon] || 0) + rawFrequencies[rawName];
            
            if (!canonicalToRaw[canon]) {
                canonicalToRaw[canon] = new Set();
            }
            canonicalToRaw[canon].add(rawName);
        });
        
        // Prepare list for sheet 1: Consolidated/Cleaned list
        const consolidatedRows = Object.keys(canonicalFrequencies).sort().map(name => {
            return {
                "Nombre Auxiliar (Limpio)": name,
                "Frecuencia (Viajes)": canonicalFrequencies[name],
                "Variaciones en DB": Array.from(canonicalToRaw[name]).join(', ')
            };
        });
        
        // Prepare list for sheet 2: Raw data exactly as registered
        const rawRows = Object.keys(rawFrequencies).sort().map(rawName => {
            return {
                "Nombre en Base de Datos (Raw)": rawName,
                "Frecuencia (Viajes)": rawFrequencies[rawName],
                "Nombre Consolidado Asignado": CANONICAL_MAP[rawName] || "IGUAL / SIN MAPEAR"
            };
        });
        
        // Load xlsx dynamically
        console.log("Loading 'xlsx' library...");
        const XLSX = require('xlsx');
        
        // Create workbook
        const wb = XLSX.utils.book_new();
        
        // Create sheets
        const wsConsolidated = XLSX.utils.json_to_sheet(consolidatedRows);
        const wsRaw = XLSX.utils.json_to_sheet(rawRows);
        
        // Add sheets to workbook
        XLSX.utils.book_append_sheet(wb, wsConsolidated, "Auxiliares Consolidados");
        XLSX.utils.book_append_sheet(wb, wsRaw, "Nombres en DB (Raw)");
        
        // Write workbook
        const outputPath = 'c:/Users/Juanjo/Documents/Fletesapp/auxiliares_alpina.xlsx';
        XLSX.writeFile(wb, outputPath);
        console.log(`Excel file successfully created at: ${outputPath}`);
        
    } catch (e) {
        console.error("Error creating Excel file:", e.stack);
    }
}

main();
