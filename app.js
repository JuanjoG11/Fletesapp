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
    });
});

// ==========================================================
// 📝 CREAR FLETE
// ==========================================================
function crearFlete(){
    const cliente = document.getElementById("cliente").value.trim();
    const placa = document.getElementById("placa").value.trim();
    const zona = document.getElementById("zona").value;
    const precio = parseFloat(document.getElementById("precio").value);

    if(!cliente || !placa || !zona || !precio){ showToast("Completa todos los campos","error"); return; }

    const flete = {
        id: Date.now(),
        cliente, placa, zona,
        precio,
        fecha: new Date().toISOString().split('T')[0]
    };

    const fletes = load("fletes");
    fletes.push(flete);
    save("fletes", fletes);
    listarFletes();
    actualizarResumen();
    showToast("Flete registrado ✔️","success");

    // limpiar inputs
    document.getElementById("cliente").value="";
    document.getElementById("placa").value="";
    document.getElementById("zona").selectedIndex=0;
    document.getElementById("precio").value="";
}

// ==========================================================
// 📋 LISTAR FLETES
// ==========================================================
function listarFletes(){
    const fletes = load("fletes");
    const tbody = document.getElementById("tablaFletes");
    tbody.innerHTML = "";

    fletes.slice(-50).reverse().forEach(f=>{
        const tr = document.createElement("tr");
        tr.innerHTML = `
            <td>${f.fecha}</td>
            <td>${f.cliente}</td>
            <td>${f.placa}</td>
            <td>${f.zona}</td>
            <td>$${f.precio.toLocaleString()}</td>
        `;
        tbody.appendChild(tr);
    });
}

// ==========================================================
// 🔍 BUSCADOR Y FILTRO FLETES
// ==========================================================
function buscarFletes(){
    const q = document.getElementById("buscarFlete").value.toLowerCase();
    const zona = document.getElementById("filtroZona").value;
    const fecha = document.getElementById("filtroFecha").value;

    const fletes = load("fletes").filter(f=>{
        const matchQuery = f.cliente.toLowerCase().includes(q) || f.placa.toLowerCase().includes(q);
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
            <td>${f.cliente}</td>
            <td>${f.placa}</td>
            <td>${f.zona}</td>
            <td>$${f.precio.toLocaleString()}</td>
        `;
        tbody.appendChild(tr);
    });
}

// ==========================================================
// 🛣 PROGRAMACIONES
// ==========================================================
function cargarFlotaParaProgramacion(){
    const select = document.getElementById("vehiculoProg");
    if(!select) return;
    const fecha = document.getElementById("fechaProg").value;
    select.innerHTML = "<option value='' disabled selected>Seleccione Vehículo</option>";

    FLOTA_VEHICULOS.forEach(v=>{
        const ocupado = load("programaciones").some(p=>p.vehiculo===v.placa && p.fecha===fecha);
        const opt = document.createElement("option");
        opt.value=v.placa;
        opt.text=`${v.placa} - ${v.modelo} (${v.capacidad}) ${ocupado?"❌ OCUPADO":"✅ DISPONIBLE"}`;
        opt.disabled = ocupado;
        select.appendChild(opt);
    });
}

function crearProgramacion(){
    const fecha = document.getElementById("fechaProg").value;
    const vehiculo = document.getElementById("vehiculoProg").value;
    const destino = document.getElementById("destinoProg").value.trim();

    if(!fecha || !vehiculo || !destino){ showToast("Completa todos los campos","error"); return; }

    const programaciones = load("programaciones");
    programaciones.push({id:Date.now(), fecha, vehiculo, destino, estado:"Pendiente"});
    save("programaciones", programaciones);
    listarProgramaciones();
    actualizarResumen();
    showToast("Viaje programado ✔️","success");
    cargarFlotaParaProgramacion();

    document.getElementById("destinoProg").value="";
}

// ==========================================================
// 📋 LISTAR PROGRAMACIONES
// ==========================================================
function listarProgramaciones(){
    const prog = load("programaciones");
    const tbody = document.getElementById("tablaProg");
    tbody.innerHTML = "";

    prog.slice(-50).reverse().forEach(p=>{
        const vehiculoData = FLOTA_VEHICULOS.find(v=>v.placa===p.vehiculo) || {modelo:"N/A"};
        const tr = document.createElement("tr");
        tr.innerHTML = `
            <td>${p.fecha}</td>
            <td>${p.destino}</td>
            <td>${p.vehiculo} (${vehiculoData.modelo})</td>
            <td class="estado ${p.estado.toLowerCase().replace(" ","")}">${p.estado}</td>
        `;
        tbody.appendChild(tr);
    });
}

// ==========================================================
// 🔍 BUSCADOR Y FILTRO PROGRAMACIONES
// ==========================================================
function buscarProgramaciones(){
    const q = document.getElementById("buscarProg").value.toLowerCase();
    const fecha = document.getElementById("filtroFechaProg").value;
    const estado = document.getElementById("filtroEstadoProg").value;

    const programaciones = load("programaciones").filter(p=>{
        const matchQuery = p.destino.toLowerCase().includes(q);
        const matchFecha = fecha ? p.fecha===fecha : true;
        const matchEstado = estado ? p.estado===estado : true;
        return matchQuery && matchFecha && matchEstado;
    });

    const tbody = document.getElementById("tablaProg");
    tbody.innerHTML = "";
    programaciones.slice(-50).reverse().forEach(p=>{
        const vehiculoData = FLOTA_VEHICULOS.find(v=>v.placa===p.vehiculo) || {modelo:"N/A"};
        const tr = document.createElement("tr");
        tr.innerHTML = `
            <td>${p.fecha}</td>
            <td>${p.destino}</td>
            <td>${p.vehiculo} (${vehiculoData.modelo})</td>
            <td class="estado ${p.estado.toLowerCase().replace(" ","")}">${p.estado}</td>
        `;
        tbody.appendChild(tr);
    });
}

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
    const ctx1 = document.getElementById("chartIngresos").getContext("2d");
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

    // ---------- 2️⃣ Fletes por zona ----------
    const zonas = {};
    fletes.forEach(f => zonas[f.zona] = (zonas[f.zona] || 0) + 1);
    if(chartZonas) chartZonas.destroy();
    const ctx2 = document.getElementById("chartZonas").getContext("2d");
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

    // ---------- 3️⃣ Programaciones por mes ----------
    const progPorMes = Array(12).fill(0);
    programaciones.forEach(p => {
        const m = new Date(p.fecha).getMonth();
        progPorMes[m]++;
    });
    if(chartProgramaciones) chartProgramaciones.destroy();
    const ctx3 = document.getElementById("chartProgramaciones").getContext("2d");
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


// ==========================================================
// 💾 EXPORTAR EXCEL
// ==========================================================
function exportarExcel(){
    const fletes = load("fletes");
    if(fletes.length===0){ showToast("No hay fletes para exportar","warning"); return; }
    let csv = "Fecha,Cliente,Placa,Zona,Precio\n";
    fletes.forEach(f=>{
        csv+=`${f.fecha},${f.cliente},${f.placa},${f.zona},${f.precio}\n`;
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
