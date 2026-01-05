// ==========================================================
// 📊 GRÁFICOS & KPIs
// ==========================================================

let myChart = null;
let myChart2 = null;

async function actualizarKPI() {
    // Obtener estadísticas desde SupabaseClient
    const stats = await SupabaseClient.fletes.getStats();

    // 1. Total Fletes
    const el = document.getElementById("cantFletes");
    if (el) el.innerText = stats.totalFletes;

    // 2. Registros Mes Actual
    const kpiRegistros = document.getElementById("kpiRegistros");
    if (kpiRegistros) kpiRegistros.innerText = moneyFormatter.format(stats.ingresosMes);

    // 3. Vehiculos Activos
    const kpiVehiculos = document.getElementById("kpiVehiculos");
    if (kpiVehiculos) kpiVehiculos.innerText = stats.vehiculosActivos;

    await generarGraficos();
}

async function generarGraficos() {
    const { session } = await SupabaseClient.auth.getSession();
    // Permitir a todos ver gráficos si están en la pestaña

    const ctx = document.getElementById("chartZonas");
    const ctx2 = document.getElementById("chartRegistros");
    if (!ctx) return;

    // Obtener estadísticas pre-calculadas (incluye suma de valores por zona y por día)
    const stats = await SupabaseClient.fletes.getEstadisticas();
    const { zonas, valoresZonas, ingresosPorDia } = stats;

    if (Object.keys(zonas).length === 0) {
        if (myChart) myChart.destroy();
        if (myChart2) myChart2.destroy();

        // Limpiar canvas manualmente por si acaso
        [ctx, ctx2].forEach(c => {
            if (!c) return;
            const context = c.getContext('2d');
            context.clearRect(0, 0, c.width, c.height);
        });

        // Si no hay datos, forzar el gráfico de barras a mostrar al menos el día de hoy con valor 0.
        const todayKey = new Date().toISOString().split('T')[0];
        const dayNames = ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'];
        const todayObj = new Date();
        const labelToday = `${todayObj.getDate().toString().padStart(2, '0')}/${(todayObj.getMonth() + 1).toString().padStart(2, '0')}`;

        // Para el gráfico de Dona (Zonas), simplemente mostrar mensaje
        const ctx1 = ctx.getContext('2d');
        ctx1.clearRect(0, 0, ctx.width, ctx.height);
        ctx1.fillStyle = '#94a3b8';
        ctx1.textAlign = 'center';
        ctx1.fillText('No hay datos por zona', ctx.width / 2, ctx.height / 2);

        // Para el gráfico de Barras (Registros), mostrar hoy en 0
        if (ctx2) {
            renderBarChart(ctx2, [labelToday], [0], [{
                date: `${todayObj.getDate()}/${todayObj.getMonth() + 1}/${todayObj.getFullYear()}`,
                dayName: dayNames[todayObj.getDay()],
                key: todayKey
            }]);
        }
        return;
    }

    if (myChart) myChart.destroy();
    if (myChart2) myChart2.destroy();

    // --- Chart 1: Fletes por Zona (VALOR TOTAL) ---

    const ctx1 = ctx.getContext("2d");
    if (ctx1) {
        // Revertir a mostrar TODAS las zonas, pero sin leyenda lateral
        const allZones = valoresZonas || {};
        // Ordenar por valor para que se vea ordenado en la rueda
        const sortedZones = Object.entries(allZones).sort(([, a], [, b]) => b - a);

        const chartLabels = sortedZones.map(item => item[0]);
        const chartData = sortedZones.map(item => item[1]);

        myChart = new Chart(ctx1, {
            type: 'doughnut',
            data: {
                labels: chartLabels,
                datasets: [{
                    data: chartData,
                    backgroundColor: [
                        '#3b82f6', '#10b981', '#f59e0b', '#ef4444', '#8b5cf6', '#06b6d4',
                        '#ec4899', '#6366f1', '#14b8a6', '#f97316', '#a855f7', '#d946ef',
                        '#0ea5e9', '#22c55e', '#eab308', '#f43f5e', '#84cc16', '#64748b'
                    ],
                    borderWidth: 0
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { display: false }, // Ocultar leyenda lateral
                    tooltip: {
                        callbacks: {
                            label: function (context) {
                                let label = context.label || '';
                                if (label) {
                                    label += ': ';
                                }
                                if (context.parsed !== null) {
                                    label += moneyFormatter.format(context.parsed);
                                }
                                return label;
                            }
                        }
                    }
                }
            }
        });
    }

    if (!ctx2) return;

    // --- Chart 2: Registros por Día (Optimized) ---
    // Usamos ingresosPorDia que ya viene pre-calculado del backend

    // Encontrar la fecha más antigua en los datos para empezar el gráfico
    const fechasConDatos = Object.keys(ingresosPorDia).sort();
    let minDate = new Date();

    if (fechasConDatos.length > 0) {
        const primeraFecha = new Date(fechasConDatos[0] + 'T00:00:00');
        if (primeraFecha < minDate) {
            minDate = primeraFecha;
        }
    }

    const labelsAll = [];
    const fullLabelsAll = [];
    const dayNames = ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'];

    const today = new Date();
    today.setHours(0, 0, 0, 0);

    let start = new Date(minDate);
    start.setHours(0, 0, 0, 0);



    let tempDate = new Date(start);
    while (tempDate <= today) {
        const day = tempDate.getDate().toString().padStart(2, '0');
        const month = (tempDate.getMonth() + 1).toString().padStart(2, '0');
        const year = tempDate.getFullYear();
        const isoKey = tempDate.toISOString().split('T')[0];

        labelsAll.push(`${day}/${month}`);
        fullLabelsAll.push({
            date: `${day}/${month}/${year}`,
            dayName: dayNames[tempDate.getDay()],
            key: isoKey
        });

        tempDate.setDate(tempDate.getDate() + 1);
    }

    // Usar el diccionario optimizado ingresosPorDia en lugar de registrosPorDia manual
    const dataVals = fullLabelsAll.map(l => ingresosPorDia[l.key] || 0);

    renderBarChart(ctx2, labelsAll, dataVals, fullLabelsAll);
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
