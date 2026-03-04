const XLSX = require('xlsx');
const workbook = XLSX.readFile('c:/Users/Juanjo/Downloads/RUTERO ALPINA - FLEISCHAMNN (1).xlsx');

const groupMapping = {};

workbook.SheetNames.forEach(sheetName => {
    const sheet = workbook.Sheets[sheetName];
    const rows = XLSX.utils.sheet_to_json(sheet, { header: 1 });

    [{ col: 0, rOff: 0 }, { col: 8, rOff: 0 }, { col: 0, rOff: 18 }, { col: 8, rOff: 18 }, { col: 0, rOff: 36 }, { col: 8, rOff: 36 }].forEach(block => {
        rows.slice(block.rOff + 2, block.rOff + 17).forEach(row => {
            const alp = String(row[block.col] || '').trim();
            const fle = String(row[block.col + 1] || '').trim();
            if (!alp && !fle) return;

            const allZones = [];
            [alp, fle].forEach(zStr => {
                zStr.split('/').forEach(p => {
                    const z = p.trim().split(' ')[0];
                    if (z && z.length > 1 && z !== 'null') allZones.push(z);
                });
            });

            if (allZones.length > 1) {
                allZones.forEach(z => {
                    if (!groupMapping[z]) groupMapping[z] = [];
                    allZones.forEach(other => {
                        if (other !== z && !groupMapping[z].includes(other)) groupMapping[z].push(other);
                    });
                });
            }
        });
    });
});

console.log('const GRUPOS_ZONAS = ' + JSON.stringify(groupMapping, null, 2) + ';');
