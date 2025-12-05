// ==========================================================
// 🚀 DATA INICIAL — FLOTA DE VEHÍCULOS
// ==========================================================
const FLOTA_VEHICULOS = [
    { placa: "ABC-123", modelo: "Camión Pesado", capacidad: "20 Toneladas" },
    { placa: "DEF-456", modelo: "Furgón Mediano", capacidad: "8 Toneladas" },
    { placa: "GHI-789", modelo: "Tractomula", capacidad: "35 Toneladas" },
    { placa: "JKL-012", modelo: "Van de Reparto", capacidad: "2 Toneladas" }
];

// ==========================================================
// 📦 LOCAL STORAGE HELPERS
// ==========================================================
function save(key, value) { localStorage.setItem(key, JSON.stringify(value)); }
function load(key) { return JSON.parse(localStorage.getItem(key)) || []; }

// ==========================================================
// 🟢 TOASTS PROFESIONALES
// ==========================================================
function showToast(msg, type="info", duration=3000){
    const toast = document.createElement("div");
    toast.className = `toast ${type}`;
    toast.innerText = msg;
    document.getElementById("toastContainer").appendChild(toast);
    setTimeout(()=> toast.remove(), duration);
}

// ==========================================================
// 🌙 MODO OSCURO / CLARO
// ==========================================================
const themeToggle = document.getElementById("themeToggle");
function setTheme(theme){
    document.documentElement.setAttribute("data-theme", theme);
    localStorage.setItem("theme", theme);
}
if(localStorage.getItem("theme") === "light"){
    setTheme("light"); themeToggle.checked = true;
}
themeToggle.addEventListener("change", ()=>{
    setTheme(themeToggle.checked ? "light":"dark");
});

// ==========================================================
// 🔀 TABS
// ==========================================================
document.querySelectorAll(".tab-link").forEach(link=>{
    link.addEventListener("click", ()=>{
        document.querySelectorAll(".tab-link").forEach(l=>l.classList.remove("active"));
        link.classList.add("active");
        const tab = link.dataset.tab;
        document.querySelectorAll(".tab-content").forEach(tc=>tc.classList.remove("visible"));
        document.getElementById(tab).classList.add("visible");
        document.getElementById("pageTitle").innerText = link.innerText;

        // Recargar estadísticas si la pestaña de estadísticas está activa
        if(tab === 'estadisticas') generarEstadisticas();
    });
});

// ==========================================================
// 📝 CREAR FLETE - CORREGIDO
// ==========================================================
function crearFlete(){
    // Obtención de valores usando los IDs correctos del HTML
    const placa = document.getElementById("placa").value.trim();
    const contratista = document.getElementById("Contratista").value.trim();
    const zona = document.getElementById("zona").value;
    const dia = document.getElementById("Día").value;
    const poblacion = document.getElementById("Poblacíon").value; // Corregido acento
    const auxiliares = document.getElementById("Auxiliares").value.trim();
    const noAuxiliares = document.getElementById("No. Auxiliares").value;
    const noPedidos = parseInt(document.getElementById("NoPedi").value) || 0; 
    const valorRuta = parseFloat(document.getElementById("Valor Ruta").value) || 0; 
    const adicionales = document.getElementById("Adicionales?").value;
    
    // ID del input Total Flete es 'totalflete' (en minúsculas)
    const precio = parseFloat(document.getElementById("totalflete").value);

    // Validación simplificada
    if(!placa || !contratista || !zona || isNaN(precio) || precio <= 0){ 
        showToast("Completa los campos obligatorios y asegúrate que el precio sea válido.","error"); 
        return; 
    }

    const flete = {
        id: Date.now(),
        placa,
        contratista, // Este es el campo 'Cliente' en la tabla
        zona,
        precio,
        fecha: new Date().toISOString().split('T')[0],

        // Nuevos campos
        dia, 
        poblacion,
        auxiliares,
        noAuxiliares,
        noPedidos,
        valorRuta,
        adicionales
    };

    const fletes = load("fletes");
    fletes.push(flete);
    save("fletes", fletes);
    listarFletes();
    actualizarResumen();
    generarEstadisticas();
    showToast("Flete registrado ✔️","success");

    // limpiar inputs - Usa los IDs correctos
    document.getElementById("placa").value = "";
    document.getElementById("Contratista").value = "";
    document.getElementById("zona").selectedIndex = 0;
    document.getElementById("Día").selectedIndex = 0;
    document.getElementById("Poblacíon").selectedIndex = 0;
    document.getElementById("Auxiliares").value = "";
    document.getElementById("No. Auxiliares").selectedIndex = 0;
    document.getElementById("NoPedi").value = "";
    document.getElementById("Valor Ruta").value = "";
    document.getElementById("Adicionales?").selectedIndex = 0;
    document.getElementById("totalflete").value = "";
}

// ==========================================================
// 📋 LISTAR FLETES - CORREGIDO PARA USAR CONTRATISTA
// ==========================================================
function listarFletes(){
    const fletes = load("fletes");
    const tbody = document.getElementById("tablaFletes");
    tbody.innerHTML = "";

    // Muestra los últimos 50 fletes
    fletes.slice(-50).reverse().forEach(f=>{
        const tr = document.createElement("tr");
        tr.innerHTML = `
            <td>${f.fecha}</td>
            <td>${f.contratista || 'N/A'}</td> 
            <td>${f.placa}</td>
            <td>${f.zona}</td>
            <td>$${f.precio.toLocaleString()}</td>
        `;
        tbody.appendChild(tr);
    });
}

// ==========================================================
// 🔍 BUSCADOR Y FILTRO FLETES - CORREGIDO PARA USAR CONTRATISTA
// ==========================================================
function buscarFletes(){
    const q = document.getElementById("buscarFlete").value.toLowerCase();
    const zona = document.getElementById("filtroZona").value;
    const fecha = document.getElementById("filtroFecha").value;

    const fletes = load("fletes").filter(f=>{
        // Ahora busca en Contratista (antes Cliente) y Placa
        const matchQuery = (f.contratista?.toLowerCase().includes(q) || f.placa?.toLowerCase().includes(q)); 
        const matchZona = zona ? f.zona===zona : true;
        const matchFecha = fecha ? f.fecha===fecha : true;
        return matchQuery && matchZona && matchFecha;
    });

    const tbody = document.getElementById("tablaFletes");
    tbody.innerHTML = "";
    fletes.slice(-50).reverse().forEach(f=>{
        const tr = document.createElement("tr");
        tr.innerHTML = `
            <td>${f.fecha}</td>
            <td>${f.contratista || 'N/A'}</td>
            <td>${f.placa}</td>
            <td>${f.zona}</td>
            <td>$${f.precio.toLocaleString()}</td>
        `;
        tbody.appendChild(tr);
    });
}

// ==========================================================
// 📊 ACTUALIZAR RESUMEN - FUNCIÓN AÑADIDA
// ==========================================================
function actualizarResumen(){
    const fletes = load("fletes");
    const totalFletes = fletes.length;
    const totalIngresos = fletes.reduce((sum, f) => sum + f.precio, 0);

    // Si tienes un elemento con id="totalIngresos" en el HTML
    // document.getElementById("totalIngresos").innerText = `$${totalIngresos.toLocaleString()}`;

    // Actualizar el KPI de Total Fletes
    const cantFletesEl = document.getElementById("cantFletes");
    if (cantFletesEl) {
        cantFletesEl.innerText = totalFletes.toLocaleString();
    }
}


// El resto del código se mantiene igual ya que las funciones de Programación y Estadísticas
// (cargarFlotaParaProgramacion, crearProgramacion, listarProgramaciones, buscarProgramaciones, generarEstadisticas, exportarExcel, generarPDF)
// no dependían de los IDs de los campos de registro de fletes.


// ==========================================================
// 🛣 PROGRAMACIONES
// ==========================================================



// ==========================================================
// 📋 LISTAR PROGRAMACIONES
// ==========================================================


// ==========================================================
// 🔍 BUSCADOR Y FILTRO PROGRAMACIONES
// ==========================================================


// ==========================================================
// 📊 ESTADÍSTICAS CHART.JS MEJORADAS
// ==========================================================
let chartIngresos, chartZonas, chartProgramaciones;

function generarEstadisticas() {
    const fletes = load("fletes");
    const programaciones = load("programaciones");

    // ---------- 1️⃣ Ingresos mensuales ----------
    const ingresosPorMes = Array(12).fill(0);
    fletes.forEach(f => {
        const m = new Date(f.fecha).getMonth();
        ingresosPorMes[m] += f.precio;
    });

    if(chartIngresos) chartIngresos.destroy();
    const ctx1 = document.getElementById("chartIngresos")?.getContext("2d");
    if (ctx1) {
        chartIngresos = new Chart(ctx1, {
            type: "bar",
            data: {
                labels: ["Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov","Dic"],
                datasets: [{
                    label: "Ingresos ($)",
                    data: ingresosPorMes,
                    backgroundColor: "var(--primary)",
                    borderRadius: 5
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { display: true },
                    tooltip: { mode: 'index', intersect: false }
                },
                scales: {
                    y: { beginAtZero: true }
                }
            }
        });
    }

    // ---------- 2️⃣ Fletes por zona ----------
    const zonas = {};
    fletes.forEach(f => zonas[f.zona] = (zonas[f.zona] || 0) + 1);
    if(chartZonas) chartZonas.destroy();
    const ctx2 = document.getElementById("chartZonas")?.getContext("2d");
    if (ctx2) {
        chartZonas = new Chart(ctx2, {
            type: "doughnut",
            data: {
                labels: Object.keys(zonas),
                datasets: [{
                    label: "Fletes",
                    data: Object.values(zonas),
                    backgroundColor: ["#3b82f6","#10b981","#f59e0b","#ef4444","#8b5cf6"]
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'right' },
                    tooltip: { callbacks: {
                        label: function(context) {
                            return `${context.label}: ${context.parsed} fletes`;
                        }
                    }}
                }
            }
        });
    }

    // ---------- 3️⃣ Programaciones por mes ----------
    const progPorMes = Array(12).fill(0);
    programaciones.forEach(p => {
        const m = new Date(p.fecha).getMonth();
        progPorMes[m]++;
    });
    if(chartProgramaciones) chartProgramaciones.destroy();
    const ctx3 = document.getElementById("chartProgramaciones")?.getContext("2d");
    if (ctx3) {
        chartProgramaciones = new Chart(ctx3, {
            type: "line",
            data: {
                labels: ["Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov","Dic"],
                datasets: [{
                    label: "Programaciones",
                    data: progPorMes,
                    borderColor: "var(--secondary)",
                    backgroundColor: "rgba(16,185,129,0.3)",
                    fill: true,
                    tension: 0.4,
                    pointRadius: 5,
                    pointBackgroundColor: "var(--secondary)"
                }]
            },
            options: {
                responsive: true,
                plugins: { legend: { display: true } },
                scales: {
                    y: { beginAtZero: true }
                }
            }
        });
    }
}

// ==========================================================
// 📱 RESPONSIVIDAD (TOGGLE MENÚ)
// ==========================================================
const menuToggleBtn = document.getElementById("menuToggleBtn");
const sidebar = document.querySelector(".sidebar");

if (menuToggleBtn && sidebar) {
    menuToggleBtn.addEventListener("click", () => {
        sidebar.classList.toggle("active");
    });
}
// ==========================================================
// 💾 EXPORTAR EXCEL
// ==========================================================
function exportarExcel(){
    const fletes = load("fletes");
    if(fletes.length===0){ showToast("No hay fletes para exportar","warning"); return; }
    // Incluir todos los nuevos campos en el CSV
    let csv = "Fecha,Contratista,Placa,Zona,Día,Población,Auxiliares,No. Auxiliares,No. Pedidos,Valor Ruta,Adicionales?,Precio\n";
    fletes.forEach(f=>{
        csv+=`${f.fecha},${f.contratista},${f.placa},${f.zona},${f.dia},${f.poblacion},${f.auxiliares},${f.noAuxiliares},${f.noPedidos},${f.valorRuta},${f.adicionales},${f.precio}\n`;
    });
    const blob = new Blob([csv], {type:"text/csv"});
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href=url;
    a.download="fletes.csv";
    a.click();
    URL.revokeObjectURL(url);
    showToast("Excel generado ✔️","success");
}

// ==========================================================
// 🖨 GENERAR PDF (Print)
function generarPDF(){
    window.print();
}

// ==========================================================
// ⏱ INIT
// ==========================================================
window.addEventListener("load", ()=>{
    listarFletes();
    listarProgramaciones();
    actualizarResumen();
    generarEstadisticas();
    cargarFlotaParaProgramacion();
    document.getElementById("fechaProg")?.addEventListener("change", cargarFlotaParaProgramacion);
});