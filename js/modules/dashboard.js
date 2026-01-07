// ==========================================================
// 📊 GRÁFICOS & KPIs
// ==========================================================

let myChart = null;
let myChart2 = null;

async function actualizarKPI() {
    // 1. Obtener TODOS los datos en una sola llamada optimizada
    const stats = await SupabaseClient.fletes.getDashboardData();

    // 2. Actualizar KPIs Numéricos
    const el = document.getElementById("cantFletes");
    if (el) el.innerText = stats.totalFletes || 0;

    const kpiRegistros = document.getElementById("kpiRegistros");
    if (kpiRegistros) kpiRegistros.innerText = moneyFormatter.format(stats.ingresosMes || 0);

    const kpiVehiculos = document.getElementById("kpiVehiculos");
    if (kpiVehiculos) kpiVehiculos.innerText = stats.vehiculosActivos || 0;

    // 3. Generar Gráficos con los mismos datos (sin volver a pedir)
    await generarGraficos(stats);
}

async function generarGraficos(statsData) {
    // Si no se pasaron datos (llamada manual), volver a pedirlos, pero idealmente vienen de actualizarKPI
    let stats = statsData;
    if (!stats) {
        stats = await SupabaseClient.fletes.getDashboardData();
    }

    const { zonas, ingresosPorDia } = stats;

    // Preparar Canvas
    const ctx = document.getElementById("chartZonas");
    const ctx2 = document.getElementById("chartRegistros");
    if (!ctx) return; // Si no estamos en la vista de dashboard

    // --- Limpieza Previa ---
    if (myChart) myChart.destroy();
    if (myChart2) myChart2.destroy();

    // Validar si hay datos
    const hasZonas = Object.keys(zonas || {}).length > 0;
    const hasDias = Object.keys(ingresosPorDia || {}).length > 0;

    if (!hasZonas && !hasDias) {
        renderEmptyCharts(ctx, ctx2);
        return;
    }

    // --- Chart 1: Fletes por Zona (Dona) ---
    if (ctx && hasZonas) {
        const sortedZones = Object.entries(zonas).sort(([, a], [, b]) => b - a);
        const labels = sortedZones.map(([k]) => k);
        const data = sortedZones.map(([, v]) => v);
        renderDoughnutChart(ctx, labels, data);
    } else if (ctx) {
        renderEmptyPlaceholder(ctx, "Sin datos de zona");
    }

    // --- Chart 2: Registros por Día (Barras) ---
    if (ctx2 && hasDias) {
        renderDailyChart(ctx2, ingresosPorDia);
    } else if (ctx2) {
        renderEmptyPlaceholder(ctx2, "Sin registros este mes");
    }
}

// --- Helpers de Renderizado para limpiar código ---

function renderEmptyCharts(ctx, ctx2) {
    renderEmptyPlaceholder(ctx, "No hay datos aún");
    renderEmptyPlaceholder(ctx2, "Esperando registros...");
}

function renderEmptyPlaceholder(canvas, text) {
    const ctx = canvas.getContext('2d');
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.fillStyle = document.documentElement.getAttribute("data-theme") === 'light' ? '#64748b' : '#94a3b8';
    ctx.font = "14px Inter";
    ctx.textAlign = 'center';
    ctx.fillText(text, canvas.width / 2, canvas.height / 2);
}

function renderDoughnutChart(canvas, labels, data) {
    const ctx = canvas.getContext("2d");
    myChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: labels,
            datasets: [{
                data: data,
                backgroundColor: [
                    '#3b82f6', '#10b981', '#f59e0b', '#ef4444', '#8b5cf6', '#06b6d4',
                    '#ec4899', '#6366f1', '#14b8a6', '#f97316', '#a855f7', '#d946ef'
                ],
                borderWidth: 0
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { display: false },
                tooltip: {
                    callbacks: {
                        label: function (context) {
                            let label = context.label || '';
                            if (label) label += ': ';
                            if (context.parsed !== null) label += moneyFormatter.format(context.parsed);
                            return label;
                        }
                    }
                }
            }
        }
    });
}

function renderDailyChart(canvas, ingresosPorDia) {
    // Preparar datos cronológicos
    const sortedDates = Object.keys(ingresosPorDia).sort();
    // Rellenar huecos de días vacíos si es necesario? No, mostremos solo lo que hay para ser más limpio o rellenar?
    // Mejor rellenamos para ver la tendencia del mes completo hasta hoy

    // Lógica simplificada: Usar lo que devuelve SQL (ya trae días con datos)
    // Si queremos rellenar huecos, tendríamos que hacerlo aquí. Por rendimiento, mostraremos días con actividad.

    const labels = [];
    const dataVals = [];
    const fullInfo = [];
    const dayNames = ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'];

    sortedDates.forEach(dateStr => {
        const dateObj = new Date(dateStr + 'T00:00:00'); // Asegurar zona horaria local
        const day = dateObj.getDate().toString().padStart(2, '0');
        const month = (dateObj.getMonth() + 1).toString().padStart(2, '0');

        labels.push(`${day}/${month}`);
        dataVals.push(ingresosPorDia[dateStr]);
        fullInfo.push({
            date: `${day}/${month}/${dateObj.getFullYear()}`,
            dayName: dayNames[dateObj.getDay()]
        });
    });

    renderBarChart(canvas, labels, dataVals, fullInfo);
}

function renderBarChart(canvas, labels, data, fullInfo) {
    const theme = document.documentElement.getAttribute("data-theme") || "dark";
    const darkNeonPalette = ['#FF3D71', '#3366FF', '#00D68F', '#FFAA00', '#FF8918', '#8F00FF', '#00E096'];
    const lightHarmonyPalette = ['#3b82f6', '#f59e0b', '#60a5fa', '#fbbf24', '#2563eb', '#f97316', '#34d399'];
    const activePalette = theme === 'light' ? lightHarmonyPalette : darkNeonPalette;
    const textColor = theme === 'light' ? '#64748b' : '#94a3b8';
    const gridColor = theme === 'light' ? 'rgba(0, 0, 0, 0.05)' : 'rgba(148, 163, 184, 0.05)';

    if (myChart2) myChart2.destroy();

    const ctx = canvas.getContext('2d');
    const backgroundColors = labels.map((_, i) => {
        const color = activePalette[i % activePalette.length];
        const g = ctx.createLinearGradient(0, 0, 0, 300);
        g.addColorStop(0, color);
        g.addColorStop(1, color + (theme === 'light' ? '99' : '66'));
        return g;
    });
    const borderColors = labels.map((_, i) => activePalette[i % activePalette.length]);

    myChart2 = new Chart(canvas, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Fletes Registrados',
                data: data,
                backgroundColor: backgroundColors,
                borderColor: borderColors,
                borderWidth: 1,
                borderRadius: 8,
                borderSkipped: false,
                hoverBorderColor: theme === 'light' ? '#334155' : '#fff',
                hoverBorderWidth: 3,
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            layout: { padding: { top: 30 } },
            plugins: {
                legend: { display: false },
                tooltip: {
                    backgroundColor: theme === 'light' ? 'rgba(255, 255, 255, 0.95)' : 'rgba(15, 23, 42, 0.95)',
                    titleColor: theme === 'light' ? '#0f172a' : '#fff',
                    titleFont: { family: 'Inter', size: 14, weight: 'bold' },
                    bodyColor: theme === 'light' ? '#0f172a' : '#fff',
                    bodyFont: { family: 'Inter', size: 13 },
                    padding: 15,
                    borderColor: theme === 'light' ? 'rgba(0,0,0,0.1)' : 'rgba(255, 255, 255, 0.1)',
                    borderWidth: 1,
                    cornerRadius: 12,
                    displayColors: true,
                    boxPadding: 6,
                    callbacks: {
                        title: function (context) {
                            const idx = context[0].dataIndex;
                            const info = fullInfo[idx];
                            return `${info.dayName}, ${info.date}`;
                        },
                        label: function (context) {
                            return ' 📝 Total: ' + moneyFormatter.format(context.raw);
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    title: { display: false },
                    ticks: {
                        color: textColor,
                        font: { family: 'Inter', size: 11, weight: '600' },
                        callback: function (value) {
                            return value.toLocaleString();
                        }
                    },
                    grid: { color: gridColor, drawBorder: false }
                },
                x: {
                    ticks: {
                        color: textColor,
                        font: { family: 'Inter', size: 10, weight: '600' },
                        maxRotation: labels.length > 7 ? 45 : 0
                    },
                    grid: { display: false }
                }
            }
        }
    });
}

// Exportar funciones
window.actualizarKPI = actualizarKPI;
window.generarGraficos = generarGraficos;
window.renderBarChart = renderBarChart;
