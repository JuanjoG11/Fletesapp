const fs = require('fs');
const path = require('path');

const RAW_DATA = `TMO981	JOHAN ECHEVERRY	9552 9550	MANIZALES	EDWAR ZAPATA		33	 $ 6.793.394 	20364 20375	5	 $ 359.249 	18843 18854 18851		38	 $ 7.152.643 	
KOL802	CAMILO CASTAÑO	9553	VILLAMARIA	GERMAN GALVEZ		54	 $ 7.686.742 	20376	1	 $ 40.264 	18852		55	 $ 7.727.006 	
WFV015	YONNI VALENCIA	9554 7000	MANIZALES	YEISON TABARES	CRISTIAN OSPINA	53	 $ 8.868.408 	20359 20378	2	 $ 123.863 	18853		55	 $ 8.992.271 	
EYY183	RUBEN	9555	MANIZALES	JUAN ALEJANDRO		49	 $ 6.807.144 	20379					49	 $ 6.807.144 	 EYY183 ADICIONAL $80.000 RETORNO DE CUBETAS 
SLI587	MIGUEL GONZALES	9556	MANIZALES	MILTON OSORIO	ADRIAN MARTINEZ	39	 $ 5.757.866 	20380	5	 $ 829.388 	18855		44	 $ 6.587.254 	
WGZ876	RICARDO PINEDA	9557	MARMATO LA MERCED	MATEO VILLALBA 		25	 $ 12.312.162 	20381					25	 $ 12.312.162 	 WGZ876 EXTRA $60.000 
EYX091	CARLOS GOMEZ	9558	AGUADAS	VICTOR PULGARIN	JUAN COCOMA	62	 $ 14.248.208 	20382			18849		62	 $ 14.248.208 	
SMH182	JUAN DAVID	9559	ARAUCA PALESTINA	BRANDON BAEZ		41	 $ 8.220.842 	20383	4	 $ 421.469 	18857		45	 $ 8.642.311 	 SMH182 EXTRA $60.000 
TRL186	RUBEN	7008	MONTENEGRO ARMENIA	YOVANI		3	 $ 4.804.175 	20363				AP634014 AP634943	3	 $ 4.804.175 	VALOR DE FLETE $380.000
SPU120	OSWALDO	9601 7009	ARMENIA	YEISON RENDON		54	 $ 9.962.601 	20361 20384					54	 $ 9.962.601 	
VZD334	JULIAN CUELLAR	9602	ARMENIA	SEBASTIAN VILLADA	AUXNUEVO	81	 $ 9.852.798 	20347TSS 20385					81	 $ 9.852.798 	 VZD334 ADICIONAL ALFLETE $150.000 ENTREGA DE NEGOCIACION COMFENALCO Y TSS 
EQY944	GOBER CRISTANCHO	9603	ARMENIA	ALEXANDER COSTAIN		60	 $ 9.653.034 	20348TSS 20386					60	 $ 9.653.034 	
SXF257	FABIO RUIZ	9604	QUIMBAYA	CAMILO CONTRERAS	AUXNUEVO	53	 $ 12.751.305 	20387				AP634018-019	53	 $ 12.751.305 	 SXF257 ADICIONAL AL FLETE $80.000 POR ENTREGA DE NEGOCIACION 
WLS478	HUMBERTO RINCON	9605	PIJAO CORDOBA	CRISTIAN CAICEDO		36	 $ 6.046.705 	20365	8	 $ 1.333.551 	18861 18860		44	 $ 7.380.256 	
TTL256	YIMERSON GARCIA	9606	SALENTO CIRCASIA	CRISTIAN CAMACHO		34	 $ 9.470.649 	20366	5	 $ 332.492 	18859 18850	AP634022-023	39	 $ 9.803.141 	TTL256 ADICIONAL AL FLETE $100.000 EXTRA Y ENTREGA DE FLEISCHMANN CIRCASIA
SMO183	GABRIEL PEREZ	9453	PEREIRA	JUAN QUINTERO		53	 $ 6.208.433 	20369					53	 $ 6.208.433 	
LUM993	PABLO RAMIREZ	9454	PEREIRA	ANDRES PINEDA		53	 $ 8.335.863 	20370	6	 $ 689.155 		FEP1184849-854-855-860-865-871	59	 $ 9.025.018 	
TMZ674	RICARDO LOPEZ	9455	PEREIRA	ANDRES RIOS		60	 $ 7.109.083 	20390					60	 $ 7.109.083 	TMZ674 EXTRA $60.000
SPQ814	CARLOS VELASCO	9456	SANTA ROSA	SANTIAGO HENAO		53	 $ 7.617.129 	20355					53	 $ 7.617.129 	
WHM317	HUMBERTO PARRA	9457	PEREIRA	CESAR CASTILLO		60	 $ 8.047.121 	20371					60	 $ 8.047.121 	
PEK019	MIGUEL TABARES	9458	PEREIRA	JHON GIRALDO		48	 $ 5.991.854 	20372					48	 $ 5.991.854 	
WHM896	ALEXANDER CUELLAR	9459	PEREIRA	CAMILO PEÑA		53	 $ 6.953.005 	20373					53	 $ 6.953.005 	
WLC133	JULIAN  	9460	PEREIRA	EDWIN GOMEZ	CAMILO MUÑOZ	67	 $ 6.524.271 	20391					67	 $ 6.524.271 	
TNH494	ADALBERTO MEJIA	9461 9450	CARTAGO	DIORLAN FLOREZ		51	 $ 8.665.972 	20356 20374					51	 $ 8.665.972 	
WTN748	DIEGO RATIVA	7004	PEREIRA	BRAHIAN VALENCIA		54	 $ 7.482.306 	20388	13	 $ 1.351.358 	18862		67	 $ 8.833.664 	
EST067	JORGE RIVILLAS	7005	CAIRO ARGELIA	ESTEBAN GALLEGO		32	 $ 9.727.794 	20389	2	 $ 1.361.652 	18846		34	 $ 11.089.446 	
ERK303	JORGE ALARCON	7006	BALBOA LA CELIA	ROBINSON TORRES		38	 $ 6.700.775 	20367	3	 $ 725.533 	18840		41	 $ 7.426.308 	
SNL038	MIGUEL MARTINEZ	7007 9451	ANSERMA	OSCAR RESTREPO	EXTRA MORENO	56	 $ 18.309.829 	20357 20368	2	 $ 256.240 	18847		58	 $ 18.566.069 	
SQB119	CARLOS CASTAÑO	FLEISCHMANN	PEREIRA	DIEGO FRANCO					61	 $ 6.605.204 	18839 18842		61	 $ 6.605.204 	`;

// DB Prices fetched from test_supabase
const PRICES_DB = {
  "ALPINA": {
    "AGUADAS PACORA": 800000,
    "ARANZAZU FILADELFIA": 460000,
    "NEIRA": 368000,
    "CHINCHINA": 272000,
    "PALESTINA ARAUCA": 303000,
    "QUINCHIA": 470000,
    "RIOSUCIO": 580000,
    "SUPIA": 550000,
    "MANIZALES VILLAMARIA": 330000,
    "ANSERMA": 360000,
    "BELEN DE UMBRIA": 360000,
    "GUATICA": 398000,
    "VITERBO": 295000,
    "GENOVA": 430000,
    "ARMENIA": 330000,
    "MONTENEGRO": 300000,
    "MONTENEGRO PTAPAO": 325000,
    "MONTENEGRO - P TAPAO": 325000,
    "QUIMBAYA": 275000,
    "FILANDIA": 300000,
    "SALENTO": 300000,
    "CIRCASIA": 300000,
    "CORDOBA PIJAO BVISTA": 379000,
    "CAICEDONIA": 398000,
    "TEBAIDA": 355000,
    "CALARCA": 345000,
    "ARGELIA EL CAIRO": 370000,
    "MISTRATO": 390000,
    "ANSERMA NUEVO": 302000,
    "ANSERMA NUEVO 2T": 302000,
    "CARTAGO": 290000,
    "CARTAGO 2T": 290000,
    "PEREIRA": 224000,
    "DOSQUEBRADAS": 224000,
    "PEREIRA - DOSQUEBRADAS": 224000,
    "SANTA ROSA": 238000,
    "MARSELLA": 290000,
    "ARABIA ALTAGRACIA": 235000,
    "SANTUARIO": 330000,
    "APIA": 330000,
    "BALBOA LA CELIA": 325000,
    "LA VIRGINIA": 255000,
    "PUEBLO RICO": 370000,
    "SANTA CECILIA": 450000,
    "MARMATO LA MERCED": 620000,
    "MARMATO": 565000,
    "PACORA SALAMINA": 725000
  },
  "FLEISCHMANN": {
    "PEREIRA - DOSQUEBRADAS": 224000,
    "PEREIRA": 224000,
    "DOSQUEBRADAS": 224000,
    "ANSERMA NUEVO": 302000,
    "ANSERMA NUEVO 2T": 302000,
    "CARTAGO": 290000,
    "CARTAGO 2T": 290000,
    "PACORA SALAMINA": 725000,
    "RDA S JOSE BELALCAZAR": 346000,
    "IRRA LA FELISA VER RIOSUCIO": 530000,
    "MARMATO LA MERCED": 620000,
    "MARMATO": 565000,
    "ALCALA ULLOA": 260000,
    "MONTENEGRO PTAPAO": 305000,
    "CAIMO BARCELONA": 340000,
    "AGUADAS PACORA": 800000,
    "ARANZAZU FILADELFIA": 460000,
    "NEIRA": 368000,
    "CHINCHINA": 272000,
    "PALESTINA ARAUCA": 303000,
    "QUINCHIA": 470000,
    "RIOSUCIO": 580000,
    "SUPIA": 550000,
    "MANIZALES VILLAMARIA": 330000,
    "MONTENEGRO": 282000,
    "QUIMBAYA": 265000,
    "SALENTO": 285000,
    "FILANDIA": 285000,
    "SANTA ROSA": 238000,
    "MARSELLA": 290000,
    "ARABIA ALTAGRACIA": 235000,
    "SANTUARIO": 330000,
    "APIA": 330000,
    "BALBOA LA CELIA": 325000,
    "LA VIRGINIA": 255000,
    "PUEBLO RICO": 370000,
    "SANTA CECILIA": 450000
  }
};

// Population mapping from Raw name to standard DB name
const POBLACION_MAPPING = {
  "MANIZALES": "MANIZALES VILLAMARIA",
  "VILLAMARIA": "MANIZALES VILLAMARIA",
  "MARMATO LA MERCED": "MARMATO LA MERCED",
  "AGUADAS": "AGUADAS PACORA",
  "ARAUCA PALESTINA": "PALESTINA ARAUCA",
  "MONTENEGRO ARMENIA": "MONTENEGRO",
  "ARMENIA": "ARMENIA",
  "QUIMBAYA": "QUIMBAYA",
  "PIJAO CORDOBA": "CORDOBA PIJAO BVISTA",
  "SALENTO CIRCASIA": "CIRCASIA", // Map to CIRCASIA or SALENTO
  "PEREIRA": "PEREIRA - DOSQUEBRADAS",
  "SANTA ROSA": "SANTA ROSA",
  "CARTAGO": "CARTAGO 2T",
  "CAIRO ARGELIA": "ARGELIA EL CAIRO",
  "BALBOA LA CELIA": "BALBOA LA CELIA",
  "ANSERMA": "ANSERMA"
};

function parseMoney(str) {
  if (!str) return 0;
  return parseInt(str.replace(/[\$\s\.\,\']/g, '')) || 0;
}

function parsePlanilla(str) {
  if (!str) return '';
  return str.trim();
}

function run() {
  const lines = RAW_DATA.trim().split('\n');
  const valuesSql = [];

  for (const line of lines) {
    if (!line.trim()) continue;
    const parts = line.split('\t');
    
    // Check parts length
    if (parts.length < 15) {
      console.log("Skipping invalid line:", line);
      continue;
    }

    const placa = parts[0].trim();
    const conductor = parts[1].trim();
    const zonasRaw = parts[2].trim();
    const poblacionRaw = parts[3].trim();
    const aux1 = parts[4].trim();
    const aux2 = parts[5].trim();
    
    // Orders & values from blue section
    const ped1 = parseInt(parts[6].trim()) || 0;
    const val1 = parseMoney(parts[7].trim());
    const planilla1 = parsePlanilla(parts[8]);
    
    // Orders & values from orange section
    const ped2 = parseInt(parts[9].trim()) || 0;
    const val2 = parseMoney(parts[10].trim());
    const planilla2 = parsePlanilla(parts[11]);
    
    // Extra bills / observations
    const facAdic = parts[12].trim() || null;
    const tPed = parseInt(parts[13].trim()) || 0;
    const tVal = parseMoney(parts[14].trim());
    const obs = parts[15] ? parts[15].trim() : '';

    // Provider determination
    let provider = "ALPINA";
    if (poblacionRaw === "FLEISCHMANN" || zonasRaw === "FLEISCHMANN") {
      provider = "FLEISCHMANN";
    }

    // Map population
    let standardPoblacion = POBLACION_MAPPING[poblacionRaw] || poblacionRaw;
    if (provider === "FLEISCHMANN" && standardPoblacion === "PEREIRA") {
      standardPoblacion = "PEREIRA - DOSQUEBRADAS";
    }

    // Get Base Price
    const provPrices = PRICES_DB[provider] || {};
    let basePrice = provPrices[standardPoblacion] || 0;

    // Handle extra values
    let valAdicional = 0;
    let razonAdicional = '-';
    let overridesBasePrice = null;

    // Parse observations for additionals or custom freight prices
    if (obs) {
      // 1. Check for specific custom flete values like "VALOR DE FLETE $380.000"
      const customFleteMatch = obs.match(/VALOR(?:\s+DE)?\s+FLETE\s*\$?\s*([0-9\.\s]+)/i);
      if (customFleteMatch) {
        const customVal = parseMoney(customFleteMatch[1]);
        if (!basePrice) {
          // If we have an extra amount and a total route value (column 8), derive the base price
          const totalRuta = parseMoney(parts[8]);
          if (valAdicional > 0 && totalRuta > 0) {
            const derivedBase = totalRuta - valAdicional;
            console.warn(`⚠️ Derived base price for ${placa}: ${derivedBase}`);
            basePrice = derivedBase;
          } else {
            console.error(`❌ MISSING PRICE and cannot derive base for ${placa}`);
          }
        }
        overridesBasePrice = customVal;
      }

      // 2. Check for any money amounts in observations that indicate EXTRA or ADICIONAL
      const hasExtraOrAdic = obs.toUpperCase().includes('EXTRA') || obs.toUpperCase().includes('ADICIONAL');
      if (hasExtraOrAdic) {
        const moneyMatch = obs.match(/\$\s*([0-9\.\s]+)/);
        if (moneyMatch) {
          valAdicional = parseMoney(moneyMatch[1]);
          razonAdicional = obs;
        }
      }
    }

    // Base price overrides if specified in observation (e.g. TRL186 custom freight value)
    let finalBasePrice = (overridesBasePrice !== null) ? overridesBasePrice : (basePrice || 0);

    // Total price is final base price (which is basePrice + valAdicional)
    let totalPrice = finalBasePrice + valAdicional;

    // Auxiliares concatenation
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

    // Planilla union
    let planillas = [];
    if (planilla1 && planilla1 !== '-') planillas.push(planilla1);
    if (planilla2 && planilla2 !== '-') planillas.push(planilla2);
    const combinedPlanilla = planillas.join(' ').replace(/\s+/g, ' ').trim() || '-';

    // Zonas union
    const combinedZonas = zonasRaw.replace(/\s+/g, ' ').trim();

    // Additional status
    const adicionalesStatus = (valAdicional > 0 || facAdic) ? 'Si' : 'No';

    // Orders and values sum
    const totalPedidos = ped1 + ped2;
    const totalValorRuta = val1 + val2;
    
    const subqueryPob = standardPoblacion.replace("'", "''");
    const finalPriceExpr = typeof basePrice === 'number' ? (basePrice + valAdicional) : `(SELECT precio FROM precios_fletes WHERE lista_id='${provider}' AND UPPER(poblacion)='${subqueryPob}' LIMIT 1) + ${valAdicional}`;

    const valuesStr = `('2026-05-20', 'Miercoles', '${provider}', '${conductor}', '${placa}', '${combinedPlanilla}', '${combinedZonas}', '${standardPoblacion}', '${auxiliaresString}', ${noAuxiliares}, '${adicionalesStatus}', ${valAdicional}, '${razonAdicional}', ${totalValorRuta}, ${finalPriceExpr}, ${totalPedidos}, ${facAdic ? `'${facAdic}'` : 'null'}, 'TYM')`;
    
    valuesSql.push(valuesStr);
  }

  // Generate SQL output
  const sql = `-- ==========================================================
-- 🚛 SCRIPT DE PROGRAMACIÓN: MIERCOLES 20 MAYO 2026
-- ==========================================================

-- 1. Limpiar registros de hoy para evitar duplicados
DELETE FROM fletes WHERE fecha = '2026-05-20' AND proveedor IN ('ALPINA', 'FLEISCHMANN');

-- 2. Insertar fletes
INSERT INTO fletes (
    fecha, dia, proveedor, contratista, placa, no_planilla,
    zona, poblacion, auxiliares, no_auxiliares,
    adicionales, valor_adicional_negociacion, razon_adicional_negociacion,
    valor_ruta, precio, no_pedidos, facturas_adicionales, razon_social
)
VALUES
${valuesSql.join(',\n')};

-- 🔍 Verificación Final (Deben aparecer los totales sumados)
SELECT fecha, placa, precio AS total_flete, valor_adicional_negociacion AS extra, razon_adicional_negociacion AS motivo
FROM fletes
WHERE fecha = '2026-05-20' AND proveedor IN ('ALPINA', 'FLEISCHMANN')
ORDER BY proveedor, placa;
`;

  fs.writeFileSync('insert_fletes_may20.sql', sql);
  console.log("SQL generated and saved to insert_fletes_may20.sql");
}

run();
