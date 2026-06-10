const fs = require('fs');
const https = require('https');

const SUPABASE_URL = 'https://culezzzujkwjpdlalfzi.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN1bGV6enp1amt3anBkbGFsZnppIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYxNzQ2NTIsImV4cCI6MjA4MTc1MDY1Mn0.qKp2IrOQW0YaPvSmIsmSFxcnFB_vPd2D0A6VzZJAhe8';

/*
  ============================================================
  DATA: VIERNES 29 MAYO 2026
  Columnas (0-indexed):
    0  PLACA
    1  CONDUCTOR
    2  ZONAS
    3  POBLACION
    4  AUXILIAR
    5  AUXILIAR2
    6  PEDIDOS AP
    7  VALOR RUTA AP
    8  PLANILLA AP
    9  PEDIDOS FEP
   10  VALOR RUTA FEP
   11  PLANILLA FEP
   12  FAC ADICIONALES
   13  T PEDIDOS
   14  T VALOR
   15  OBSERVACIONES
  ============================================================
*/

// Rows manually transcribed from the table (all 30 vehicles)
// Format: [placa, conductor, zonas, poblacion, aux1, aux2, ped1, val1, plan1, ped2, val2, plan2, facAdic, tPed, tVal, obs]
const ROWS = [
  // ── MANIZALES ──────────────────────────────────────────────────────────────
  ['SNL038','MIGUEL',          '7002',         'CHINCHINA NEGOCIACION','',              '',               1,  20263700,'',            0,        0,'',            'AP643677',         1,  20263700,'VALOR DE FLETE $650.000 INCLUYE DESCARGUE'],
  ['SYU652','JOHAN ECHEVERRY', '9552',         'MANIZALES',            'EDWAR ZAPATA',  '',              46,  10324247,'20675',        2,   130571,'',            'FEP1185774 FEP1185779 AP643733', 48, 10454818,''],
  ['KOL802','CAMILO CASTAÑO',  '9553 9550 7001','VILLAMARIA',          'GERMAN GALVEZ', 'CRISTIAN OSPINA',49,10630901,'20654 20658 20676', 6, 285298,'18991',     '',                 55, 10916199,''],
  ['WFV015','YONNI VALENCIA',  '9554',         'MANIZALES',            'YEISON TABARES','',              47,   8809473,'20677',        6,   816791,'18989 18992', 'AP643734',         53,  9626264,''],
  ['EYY183','RUBEN',           '9555',         'MANIZALES',            'JUAN ALEJANDRO','',              56,   6769815,'20678',        2,   121067,'18993',       '',                 58,  6890882,''],
  ['SLI587','MIGUEL GONZALES', '9556',         'MANIZALES',            'ADRIAN MARTINEZ','',             43,   6102834,'20679',        6,   511245,'18995 18994', 'FEP1185776',       49,  6614079,''],
  ['WGZ876','RICARDO PINEDA',  '9557 9560',    'KM41 IRRA FELISA SUPIA RIOSUCIO','JUAN DELGADO','MATEO VILLALBA', 37,15032867,'20655 20680', 0,0,'','',           37, 15032867,'WGZ876 ADICIONAL AL FLETE $150.000 ENTREGA DE SUPERMERCADOS'],
  ['EYX091','CARLOS GOMEZ',    '9558',         'PACORA SALAMINA',      'VICTOR PULGARIN','JUAN COCOMA',  67,  11139211,'20662 20642',  0,       0,'18973',       '',                 67, 11139211,''],
  ['TRL186','RUBEN',           '7002',         'CHINCHINA',            'MILTON OSORIO', '',               5,  17462374,'20659',        0,       0,'',            'AP636699TSS',       5, 17462374,''],
  ['SMH182','JUAN DAVID',      '9559',         'CHINCHINA',            'BRANDON BAEZ',  '',              73,   9031828,'20681',        5,   833537,'18998',       '',                 78,  9865365,'SMH182 EXTRA $60.000'],

  // ── ARMENIA / QUINDIO ──────────────────────────────────────────────────────
  ['SPU120','OSWALDO',           '9601',       'ARMENIA',              'YEISON RENDON', '',              59,   7732968,'20682',        0,       0,'',            'AP643742',         59,  7732968,''],
  ['VZD334','JULIAN CUELLAR',    '9602',       'ARMENIA',              'JOHAN MUÑOZ',   '',              49,   7253750,'20683',        0,       0,'',            'AP643741',         49,  7253750,''],
  ['EQY944','GOBER CRISTANCHO',  '9603',       'CALARCA',              'ALEXANDER COSTAIN','',           51,   3650238,'20684',        2,  1649490,'19001 19000', '',                53,  5299728,''],
  ['SXF257','FABIO RUIZ',        '9604',       'MONTENEGRO P/TAPAO',   'CAMILO CONTRERAS','',            57,   7038259,'20685',        8,   889497,'18977',      'AP643746',         65,  7927756,''],
  ['WLS478','HUMBERTO RINCON',   '9605',       'TEBAIDA',              'CRISTIAN CAICEDO','CAMILO SUAREZ',43,11884589,'20686',         1,  2495068,'19002',      'AP643743-744-745', 44, 14379657,''],
  ['TTL256','YIMERSON GARCIA',   '9606 9600',  'CIRCASIA',             'CRISTIAN CAMACHO','',            47,   7548665,'20687 20656',  6,   253775,'19003',      '',                 53,  7802440,''],

  // ── PEREIRA / RISARALDA ───────────────────────────────────────────────────
  ['SMO183','GABRIEL PEREZ',    '9453',        'PEREIRA',              'JUAN QUINTERO',  '',             53,   5833174,'20666',        0,       0,'',            '',                 53,  5833174,''],
  ['LUM993','PABLO RAMIIREZ',   '9454',        'PEREIRA',              'ANDRES PINEDA',  '',             44,   5777842,'20667',        0,       0,'',            '',                 44,  5777842,''],
  ['TMZ674','RICARDO LOPEZ',    '9455',        'PEREIRA',              'ANDRES RIOS',    '',             50,   6235143,'20668',        0,       0,'',            '',                 50,  6235143,'TMZ674 EXTRA $60.000'],
  ['SPQ814','CARLOS VELASCO',   '9456',        'SANTA ROSA',           'SANTIAGO HENAO', '',             51,   5361192,'20669',        0,       0,'',            '',                 51,  5361192,''],
  ['WHM317','HUMBERTO PARRA',   '9457',        'PEREIRA',              'ESTEBAN GALLEGO','',             56,   6796766,'20670',        0,       0,'',            '',                 56,  6796766,''],
  ['PEK019','MIGUEL TABARES',   '9458',        'PEREIRA',              'JHON GIRALDO',   '',             47,   4748044,'20671',        0,       0,'',            '',                 47,  4748044,''],
  ['WHM896','ALEXANDER CUELLAR','9459',        'PEREIRA',              'CAMILO PEÑA',    '',             64,   7767215,'20672',        0,       0,'',            '',                 64,  7767215,''],
  ['WLC133','JULIAN',           '9460',        'PEREIRA',              'EDWIN GOMEZ',    'JUAN CONTRERAS',66,10625814,'20673',        0,       0,'',            '',                 66, 10625814,''],
  ['JVM223','WILMAR CARDONA',   '9461',        'CARTAGO',              'DIORLAN FLOREZ', '',             59,   7489958,'20674',        0,       0,'',            '',                 59,  7489958,''],
  ['WTN748','DIEGO RATIVA',     '7004',        'PEREIRA',              'BRAHIAN VALENCIA','',            50,   6931156,'20688',        0,       0,'',            '',                 50,  6931156,'WTN748 EXTRA $60.000'],

  // ── RESTO ─────────────────────────────────────────────────────────────────
  ['EST067','JORGE RIVILLAS',   '7005',        'CARTAGO',              'CESAR CASTILLO', '',             40,   4583099,'20689',        0,       0,'',            '',                 40,  4583099,''],
  ['ERK303','JORGE ALARCON',    '7006 9450',   'VIRGINIA',             'ROBINSON TORRES','',             54,   8669989,'20690 20652', 15,  1874353,'19005 19004', '',                69, 10544342,'ERK303 EXTRA $60.000'],
  ['TNH494','ADALBERTO MEJIA',  '7007 9451',   'BELEN MISTRATO',       'CAMILO MUÑOZ',   'EXTRA MORENO', 59, 14410392,'20653 20691',  8,  1768394,'19006',      '',                 67, 16178786,''],

  // ── FLEISCHMANN ───────────────────────────────────────────────────────────
  ['SQB119','CARLOS CASTAÑO',   'FLEISCHMANN', 'ARMENIA',              'DIEGO FRANCO',   '',              0,         0,'',           47,  8140889,'18999',      'FEP1185843 FEP1185852', 47, 8140889,''],
];

function fetchPrices() {
  return new Promise((resolve, reject) => {
    const url = `${SUPABASE_URL}/rest/v1/precios_fletes?lista_id=in.("ALPINA","FLEISCHMANN")&select=lista_id,poblacion,precio`;
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
          reject(new Error(`HTTP ${res.statusCode}: ${data}`));
        }
      });
    });
    req.on('error', reject);
  });
}

// Normalize a population name for DB lookup
function normalize(s) {
  return s.trim().toUpperCase()
    .replace(/\s+/g, ' ')
    .replace(/P\/TAPAO/g, 'P/TAPAO');
}

// Extract extra amount from observation string
function extractExtra(obs) {
  if (!obs) return 0;
  const upper = obs.toUpperCase();
  if (!upper.includes('EXTRA') && !upper.includes('ADICIONAL')) return 0;
  // Match $NNN.NNN or $NNN,NNN
  const m = obs.match(/\$\s*([\d\.]+)/);
  if (!m) return 0;
  return parseInt(m[1].replace(/\./g, '')) || 0;
}

// Extract "VALOR DE FLETE $NNN.NNN" from observation
function extractValorFlete(obs) {
  if (!obs) return null;
  const m = obs.match(/VALOR\s+DE\s+FLETE\s+\$\s*([\d\.]+)/i);
  if (!m) return null;
  return parseInt(m[1].replace(/\./g, '')) || null;
}

async function main() {
  console.log('Fetching prices from DB...');
  const pricesList = await fetchPrices();

  // Build lookup map: "LISTA_ID::POBLACION_UPPER" -> precio
  const pricesMap = {};
  for (const p of pricesList) {
    const key = `${p.lista_id}::${normalize(p.poblacion)}`;
    pricesMap[key] = p.precio;
  }

  console.log(`Loaded ${pricesList.length} prices from DB.`);

  const values = [];
  let idx = 1;

  for (const row of ROWS) {
    const [placa, conductor, zonas, poblacion, aux1, aux2,
           ped1, val1, plan1, ped2, val2, plan2, facAdic, tPed, tVal, obs] = row;

    // Provider
    const provider = (zonas.toUpperCase() === 'FLEISCHMANN' || poblacion.toUpperCase() === 'FLEISCHMANN')
      ? 'FLEISCHMANN' : 'ALPINA';

    // Auxiliares
    let auxiliares = 'NO APLICA';
    let noAux = 0;
    if (aux1) { auxiliares = aux1; noAux = 1; }
    if (aux2) { auxiliares = `${aux1}, ${aux2}`; noAux = 2; }

    // Planilla combinada
    const planillas = [plan1, plan2].filter(Boolean).join(' ').trim() || '-';

    // Total valor ruta real (from the table)
    const totalValorRuta = val1 + val2;

    // Extra / adicional
    const valFlete = extractValorFlete(obs); // e.g. SNL038: VALOR DE FLETE $650.000
    let valAdicional = extractExtra(obs);
    let razonAdicional = valAdicional > 0 ? obs.trim() : '-';

    // DB price lookup
    const pobKey = `${provider}::${normalize(poblacion)}`;
    let dbPrecio = pricesMap[pobKey];

    let precioExpr;

    if (valFlete !== null) {
      // Special case: observation specifies fixed flete total
      // valor_adicional_negociacion = flete - base_price
      if (dbPrecio !== undefined) {
        valAdicional = valFlete - dbPrecio;
        razonAdicional = obs.trim();
        precioExpr = `${valFlete}`;
      } else {
        // We don't have the base price; use valFlete directly as precio
        valAdicional = 0;
        razonAdicional = obs.trim();
        precioExpr = `${valFlete}`;
        console.warn(`⚠️  ${placa}: no base price found for "${normalize(poblacion)}" — using VALOR DE FLETE $${valFlete} directly`);
      }
    } else if (dbPrecio !== undefined) {
      precioExpr = `(SELECT precio FROM precios_fletes WHERE lista_id='${provider}' AND UPPER(poblacion)='${normalize(poblacion)}' LIMIT 1) + ${valAdicional}`;
    } else {
      // Derive base from tVal - extra
      const derivedBase = tVal - valAdicional;
      precioExpr = `${derivedBase + valAdicional}`;
      console.warn(`⚠️  ${placa}: no price in DB for "${normalize(poblacion)}" (${provider}) — derived precio = ${derivedBase + valAdicional}`);
    }

    const facAdicSQL = facAdic ? `'${facAdic}'` : 'NULL';
    const adicionalesCol = (valAdicional > 0 || facAdic) ? noAux : noAux;

    values.push(
`  /* ${String(idx).padStart(2,'0')} – ${placa} */
  ('2026-05-29','Viernes','${provider}','${conductor}','${placa}',
   '${planillas}','${zonas}','${poblacion}',
   '${auxiliares}',${noAux},
   ${noAux},${valAdicional},'${razonAdicional}',
   ${tVal},
   ${precioExpr},
   ${tPed},${facAdicSQL},'TYM')`
    );

    idx++;
  }

  const sql = `/* ==============================================================
   PROGRAMACION VIERNES 29 MAYO 2026
   Generado: ${new Date().toISOString()}
   ============================================================== */

/* 1. Limpiar registros del día para evitar duplicados */
DELETE FROM fletes
WHERE fecha = '2026-05-29'
  AND proveedor IN ('ALPINA','FLEISCHMANN');

/* 2. Insertar fletes */
INSERT INTO fletes (
  fecha, dia, proveedor, contratista, placa,
  no_planilla, zona, poblacion,
  auxiliares, no_auxiliares,
  adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
  valor_ruta, precio,
  no_pedidos, facturas_adicionales, razon_social
)
VALUES
${values.join(',\n\n')};

/* 3. Verificación */
SELECT placa, proveedor, precio, valor_adicional_negociacion AS extra,
       razon_adicional_negociacion AS motivo, no_pedidos
FROM fletes
WHERE fecha = '2026-05-29'
  AND proveedor IN ('ALPINA','FLEISCHMANN')
ORDER BY proveedor, placa;
`;

  fs.writeFileSync('insert_fletes_may29.sql', sql, 'utf8');
  console.log('\n✅  insert_fletes_may29.sql generado correctamente.');
}

main().catch(e => console.error('ERROR:', e.message));
