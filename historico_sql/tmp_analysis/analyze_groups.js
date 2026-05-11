const XLSX = require('xlsx');
const workbook = XLSX.readFile('c:/Users/Juanjo/Downloads/RUTERO ALPINA - FLEISCHAMNN (1).xlsx');

const blocks = [
    { day: 'Lunes', col: 0 }, { day: 'Martes', col: 8 },
    { day: 'Miercoles', col: 0, rowOffset: 18 }, { day: 'Jueves', col: 8, rowOffset: 18 },
    { day: 'Viernes', col: 0, rowOffset: 36 }, { day: 'Sabado', col: 8, rowOffset: 36 }
];

console.log('--- ANALYSIS OF GROUPED ZONES ---');

workbook.SheetNames.forEach(sheetName => {
    const sheet = workbook.Sheets[sheetName];
    const rows = XLSX.utils.sheet_to_json(sheet, { header: 1 });

    blocks.forEach(block => {
        const start = block.rowOffset || 0;
        const blockRows = rows.slice(start + 2, start + 17); // Typical block size

        blockRows.forEach(row => {
            const alpZone = String(row[block.col] || '').trim();
            const flZone = String(row[block.col + 1] || '').trim();
            const muni = String(row[block.col + 2] || '').trim();

            if ((alpZone.includes('/') || flZone.includes('/')) && muni) {
                console.log(`[${block.day}] [${sheetName}] Alpina: ${alpZone} | Fleisch: ${flZone} -> Muni: ${muni}`);
            }
        });
    });
});
