const XLSX = require('xlsx');

const poblaciones = [
    { n: 1,  poblacion: "AGUADAS PACORA",              precio: 800000 },
    { n: 2,  poblacion: "ARANZAZU FILADELFIA",          precio: 460000 },
    { n: 3,  poblacion: "PACORA SALAMINA",              precio: 725000 },
    { n: 4,  poblacion: "NEIRA",                        precio: 368000 },
    { n: 5,  poblacion: "CHINCHINA",                    precio: 272000 },
    { n: 6,  poblacion: "RDA S JOSE BELALCAZAR",        precio: 346000 },
    { n: 7,  poblacion: "PALESTINA ARAUCA",             precio: 303000 },
    { n: 8,  poblacion: "IRRA LA FELISA VER RIOSUCIO",  precio: 530000 },
    { n: 9,  poblacion: "QUINCHIA",                     precio: 470000 },
    { n: 10, poblacion: "RIOSUCIO",                     precio: 580000 },
    { n: 11, poblacion: "MARMATO LA MERCED",            precio: 620000 },
    { n: 12, poblacion: "MARMATO",                      precio: 565000 },
    { n: 13, poblacion: "SUPIA",                        precio: 550000 },
    { n: 14, poblacion: "MANIZALES VILLAMARIA",         precio: 330000 },
    { n: 15, poblacion: "ALCALA ULLOA",                 precio: 275000 },
    { n: 16, poblacion: "MONTENEGRO",                   precio: 300000 },
    { n: 17, poblacion: "MONTENEGRO PTAPAO",            precio: 325000 },
    { n: 18, poblacion: "QUIMBAYA",                     precio: 275000 },
    { n: 19, poblacion: "CAIMO BARCELONA",              precio: 360000 },
    { n: 20, poblacion: "FILANDIA",                     precio: 300000 },
    { n: 21, poblacion: "SALENTO",                      precio: 300000 },
    { n: 22, poblacion: "CIRCASIA",                     precio: 300000 },
    { n: 23, poblacion: "CORDOBA PIJAO BVISTA",         precio: 379000 },
    { n: 24, poblacion: "CAICEDONIA",                   precio: 398000 },
    { n: 25, poblacion: "TEBAIDA",                      precio: 355000 },
    { n: 26, poblacion: "GENOVA",                       precio: 430000 },
    { n: 27, poblacion: "ARMENIA",                      precio: 330000 },
    { n: 28, poblacion: "CALARCA",                      precio: 345000 },
    { n: 29, poblacion: "ANSERMA",                      precio: 360000 },
    { n: 30, poblacion: "BELEN DE UMBRIA",              precio: 360000 },
    { n: 31, poblacion: "GUATICA",                      precio: 398000 },
    { n: 32, poblacion: "VITERBO",                      precio: 295000 },
    { n: 33, poblacion: "MISTRATO",                     precio: 390000 },
    { n: 34, poblacion: "ANSERMA NUEVO 2T",             precio: 302000 },
    { n: 35, poblacion: "ARGELIA EL CAIRO",             precio: 370000 },
    { n: 36, poblacion: "EL AGUILA",                    precio: 335000 },
    { n: 37, poblacion: "EL AGUILA VILLA NUEVA",        precio: 360000 },
    { n: 38, poblacion: "BALBOA LA CELIA",              precio: 325000 },
    { n: 39, poblacion: "LA VIRGINIA",                  precio: 255000 },
    { n: 40, poblacion: "PUEBLO RICO",                  precio: 370000 },
    { n: 41, poblacion: "SANTA CECILIA",                precio: 450000 },
    { n: 42, poblacion: "SANTUARIO",                    precio: 330000 },
    { n: 43, poblacion: "APIA",                         precio: 330000 },
    { n: 44, poblacion: "SANTA ROSA",                   precio: 238000 },
    { n: 45, poblacion: "PEREIRA-DOSQUEBRADAS",         precio: 224000 },
    { n: 46, poblacion: "CARTAGO",                      precio: 290000 },
    { n: 47, poblacion: "MARSELLA",                     precio: 290000 },
    { n: 48, poblacion: "ARABIA ALTAGRACIA",            precio: 235000 },
    { n: 49, poblacion: "ARMENIA FLEISCHMANN",          precio: 350000 },
    { n: 50, poblacion: "SANTA ROSA FLEISCHMANN",       precio: 300000 },
    { n: 51, poblacion: "PEREIRA FLEISCHMANN",          precio: 230000 },
    { n: 52, poblacion: "CHINCHINA SUPERMERCADO",       precio: 320000 },
    { n: 53, poblacion: "RIOSUCIO-SUPIA SUPERMERCADO",  precio: 625000 },
    { n: 54, poblacion: "ARMENIA SUPERMERCADO",         precio: 350000 },
    { n: 55, poblacion: "CALARCA SUPERMERCADO",         precio: 370000 },
    { n: 56, poblacion: "MANIZALES SUPERMERCADO",       precio: 365000 },
];

// Crear workbook y hoja
const wb = XLSX.utils.book_new();

// Encabezados
const wsData = [
    ['#', 'POBLACIÓN / CIUDAD', 'VALOR FLETE BASE', 'TOTAL HORAS EXTRAS']
];

// Filas de datos
poblaciones.forEach(p => {
    wsData.push([
        p.n,
        p.poblacion,
        p.precio,
        ''   // columna vacía para llenar
    ]);
});

const ws = XLSX.utils.aoa_to_sheet(wsData);

// Anchos de columna
ws['!cols'] = [
    { wch: 5 },   // #
    { wch: 35 },  // Población
    { wch: 22 },  // Valor flete
    { wch: 22 },  // Horas extras
];

// Formato moneda para columna C (fila 2 en adelante)
poblaciones.forEach((_, i) => {
    const cellRef = `C${i + 2}`;
    if (ws[cellRef]) {
        ws[cellRef].z = '$#,##0';
    }
});

XLSX.utils.book_append_sheet(wb, ws, 'Poblaciones ALPINA');
XLSX.writeFile(wb, 'poblaciones_alpina_horas_extra.xlsx');
console.log('✅ Excel generado: poblaciones_alpina_horas_extra.xlsx');
