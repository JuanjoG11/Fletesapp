#!/usr/bin/env python3
"""Convert a CSV file to XLSX (Excel) without pandas.

Usage:
  python scripts/csv_to_xlsx.py input.csv output.xlsx

Requires: openpyxl
  pip install openpyxl
"""
import sys
import csv
from openpyxl import Workbook


def csv_to_xlsx(csv_path, xlsx_path):
    wb = Workbook()
    ws = wb.active
    with open(csv_path, newline='', encoding='utf-8') as f:
        reader = csv.reader(f)
        for r, row in enumerate(reader, start=1):
            for c, val in enumerate(row, start=1):
                ws.cell(row=r, column=c, value=val)
    wb.save(xlsx_path)


def main():
    if len(sys.argv) < 3:
        print("Usage: python scripts/csv_to_xlsx.py input.csv output.xlsx")
        sys.exit(1)
    csv_path = sys.argv[1]
    xlsx_path = sys.argv[2]
    csv_to_xlsx(csv_path, xlsx_path)
    print(f"Saved: {xlsx_path}")


if __name__ == '__main__':
    main()
