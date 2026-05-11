const XLSX = require('xlsx');

const POBLACIONES_APP = [
    "QUIMBAYA", "MONTENEGRO", "MONTENEGRO - P TAPAO", "ALCALÁ ULLOA", "CAICEDONIA",
    "TEBAIDA", "CORDOBA PIJAO BVISTA", "GENOVA", "CIRCASIA", "SALENTO", "FILANDIA",
    "CALARCA", "CAIMO BARCELONA", "ARMENIA", "BALBOA LA CELIA", "SANTUARIO APIA",
    "SANTA CECILIA", "PUEBLO RICO", "LA VIRGINIA", "ARGELIA EL CAIRO", "EL AGUILA",
    "EL AGUILA - VILLANUEVA", "MARSELLA", "ARABIA - ALTAGRACIA", "ANSERMA", "BELEN",
    "MISTRATO", "GUATICA", "VITERBO", "CARTAGO", "CARTAGO 2T", "ANSERMA NUEVO",
    "ANSERMA NUEVO 2T", "SANTA ROSA", "DOSQUEBRADAS", "PEREIRA", "PEREIRA-DOSQUEBRADAS",
    "CUBA", "SUPIA", "RIOSUCIO", "MARMATO", "SUPIA-MARMATO", "QUINCHIA",
    "IRRA LA FELISA LA MERCED", "AGUADAS", "AGUADAS-PACORA", "PACORA",
    "ARANZAZU FILADELFIA", "BELAL RDA SJOSE", "CHINCHINA", "PALESTINA ARAUCA LA PLATA",
    "MANIZALES - VILLAMARIA", "NEIRA", "SAN JOSÉ-BELALCAZAR", "CAIRO ARGELIA"
];

const workbook = XLSX.readFile('c:/Users/Juanjo/Downloads/RUTERO ALPINA - FLEISCHAMNN (1).xlsx');

const blocks = [
    { day: 'Lunes', col: 0, rOff: 0 }, { day: 'Martes', col: 8, rOff: 0 },
    { day: 'Miercoles', col: 0, rOff: 18 }, { day: 'Jueves', col: 8, rOff: 18 },
    { day: 'Viernes', col: 0, rOff: 36 }, { day: 'Sabado', col: 8, rOff: 36 }
];

const normalize = (s) => s.toUpperCase().replace(/[\s-]/g, '').normalize("NFD").replace(/[\u0300-\u036f]/g, "");

const matchMuni = (muni) => {
    const m = normalize(muni || '');
    if (m.includes('MZALES') || m.includes('MANIZALES') || m.includes('VILLAMARIA')) return "MANIZALES - VILLAMARIA";
    if (m.includes('PEREIRA')) return "PEREIRA";
    if (m.includes('DOSQUEBRADAS')) return "DOSQUEBRADAS";
    if (m.includes('ARMENIA')) return "ARMENIA";
    if (m.includes('CHINCHINA')) return "CHINCHINA";
    if (m.includes('CARTAGO')) return "CARTAGO";
    if (m.includes('SANTAROSA')) return "SANTA ROSA";
    if (m.includes('VIRGINIA')) return "LA VIRGINIA";
    if (m.includes('VITERBO')) return "VITERBO";
    if (m.includes('QUINCHIA')) return "QUINCHIA";
    if (m.includes('RIOSUCIO')) return "RIOSUCIO";
    if (m.includes('SUPIA')) return "SUPIA";
    if (m.includes('ANSERMA')) return "ANSERMA";
    if (m.includes('CALARCA')) return "CALARCA";
    if (m.includes('CIRCASIA')) return "CIRCASIA";
    if (m.includes('TEBAIDA')) return "TEBAIDA";
    if (m.includes('QUIMBAYA')) return "QUIMBAYA";
    if (m.includes('MONTENEGRO')) return "MONTENEGRO";
    if (m.includes('GENOVA')) return "GENOVA";
    if (m.includes('SALENTO')) return "SALENTO";
    if (m.includes('PACORA')) return "PACORA";
    if (m.includes('AGUADAS')) return "AGUADAS";
    if (m.includes('BELEN')) return "BELEN";
    if (m.includes('MISTRATO')) return "MISTRATO";
    if (m.includes('FILANDIA')) return "FILANDIA";
    if (m.includes('BALBOA')) return "BALBOA LA CELIA";
    if (m.includes('SANTUARIO')) return "SANTUARIO APIA";
    if (m.includes('PUEBLORICO')) return "PUEBLO RICO";
    if (m.includes('GUATICA')) return "GUATICA";
    if (m.includes('ARGELIA') || m.includes('CAIRO')) return "ARGELIA EL CAIRO";

    const found = POBLACIONES_APP.find(p => m.includes(normalize(p)) || normalize(p).includes(m));
    return found || null;
};

let totalZones = 0;
let errors = [];

blocks.forEach(block => {
    workbook.SheetNames.forEach(sheetName => {
        const sheet = workbook.Sheets[sheetName];
        const rows = XLSX.utils.sheet_to_json(sheet, { header: 1 });
        const blockRows = rows.slice(block.rOff + 2, block.rOff + 17);

        blockRows.forEach((row, idx) => {
            const alpZoneRaw = String(row[block.col] || '').trim();
            const fleischZoneRaw = String(row[block.col + 1] || '').trim();
            const muniRaw = String(row[block.col + 2] || '').trim();

            if (!muniRaw || muniRaw.toLowerCase() === 'null') return;

            const expectedMuni = matchMuni(muniRaw);

            [alpZoneRaw, fleischZoneRaw].forEach(zRaw => {
                if (!zRaw || zRaw.toLowerCase() === 'null') return;

                zRaw.split('/').forEach(part => {
                    const zone = part.trim().split(' ')[0];
                    if (zone && zone.length > 1 && zone !== 'null') {
                        totalZones++;
                        if (!expectedMuni) {
                            errors.push(`[${block.day}] [${sheetName}] Zona: ${zone} tiene municipio "${muniRaw}" pero no sé a cuál de la App corresponde.`);
                        }
                    }
                });
            });
        });
    });
});

console.log(`Zonas procesadas: ${totalZones}`);
if (errors.length > 0) {
    console.log('--- DISCREPANCIAS ENCONTRADAS ---');
    errors.forEach(e => console.log(e));
} else {
    console.log('100% de las zonas analizadas coinciden con los municipios de la App.');
}
