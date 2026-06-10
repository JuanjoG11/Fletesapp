from pathlib import Path
import re
from openpyxl import Workbook

sql_path = Path('update_prices_alpina_2026.sql')
entries = []
if sql_path.exists():
    text = sql_path.read_text(encoding='utf-8', errors='ignore')
    for m in re.finditer(r"\('([^']+)',\s*'([^']+)',\s*(\d+)\)", text):
        proveedor, poblacion, precio = m.groups()
        if proveedor in ('ALPINA', 'FLEISCHMANN'):
            entries.append((proveedor, poblacion, int(precio)))

special_path = Path('insert_pereira_fleischmann_may20.sql')
if special_path.exists():
    special_text = special_path.read_text(encoding='utf-8', errors='ignore')
    for m in re.finditer(r"\('([^']+)',\s*'([^']+)',\s*(\d+)\)", special_text):
        proveedor, poblacion, precio = m.groups()
        if proveedor in ('ALPINA', 'FLEISCHMANN'):
            entry = (proveedor, poblacion, int(precio))
            if entry not in entries:
                entries.append(entry)

entries.sort(key=lambda x: (x[0], x[1]))

wb = Workbook()
ws = wb.active
ws.title = 'Precios Alpina Fleischmann'
ws.append(['Proveedor', 'Población', 'Precio'])
for proveedor, poblacion, precio in entries:
    ws.append([proveedor, poblacion, precio])

output = Path('listado_precios_alpina_fleischmann.xlsx')
wb.save(output)
print('CREATED', output.resolve())
