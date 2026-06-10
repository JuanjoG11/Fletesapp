@echo off
REM Exportar fletes ALPINA sin registro en `vehiculos` a CSV
REM Uso: export_alpina_missing_to_csv.bat [YYYY-MM-DD] [salida.csv]
REM Requiere `psql` en PATH o variables de entorno PGHOST/PGUSER/PGDATABASE configuradas.

SET FECHA=%1
IF "%FECHA%"=="" SET FECHA=2026-05-29

SET OUTFILE=%2
IF "%OUTFILE%"=="" SET OUTFILE=check_alpina_missing_vehiculos_%FECHA%.csv

psql -c "\copy (SELECT f.fecha, f.placa, f.contratista, f.proveedor, f.precio, f.no_pedidos FROM fletes f LEFT JOIN vehiculos v ON f.placa = v.placa WHERE f.proveedor = 'ALPINA' AND v.placa IS NULL AND f.fecha = '%FECHA%') TO '%OUTFILE%' CSV HEADER"

IF %ERRORLEVEL% EQU 0 (
  echo CSV generado: %OUTFILE%
) ELSE (
  echo Error ejecutando psql. Verifica conexión y que psql esté en PATH.
)
