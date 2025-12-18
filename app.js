// ==========================================================
// 🚀 DATA INICIAL — FLOTA (Persistencia Storage + Defaults)
// ==========================================================
const FLOTA_DEFAULTS = [
    { placa: "ABC-123", conductor: "Juan Pérez", capacidad: "20 Ton", modelo: "Camión Pesado" },
    { placa: "DEF-456", conductor: "Carlos Ruiz", capacidad: "8 Ton", modelo: "Furgón Mediano" },
    { placa: "GHI-789", conductor: "Maria Diaz", capacidad: "35 Ton", modelo: "Tractomula" },
    { placa: "JKL-012", conductor: "Pedro Gomez", capacidad: "2 Ton", modelo: "Van de Reparto" }
];

// Cargar Flota de Storage o usar Defaults
let FLOTA_VEHICULOS = JSON.parse(localStorage.getItem("flota")) || FLOTA_DEFAULTS;

let ID_FLETE_EDITANDO = null;

// ==========================================================
// 🛠️ UTILS & FORMATTERS
// ==========================================================
function save(key, value) { localStorage.setItem(key, JSON.stringify(value)); }
function load(key) { return JSON.parse(localStorage.getItem(key)) || []; }

const moneyFormatter = new Intl.NumberFormat('es-CO', {
    style: 'currency', currency: 'COP', minimumFractionDigits: 0, maximumFractionDigits: 0
});

function parseMoney(amountStr) {
    if (!amountStr) return 0;
    return parseFloat(amountStr.toString().replace(/[^0-9]/g, '')) || 0;
}

function formatMoneyInput(input) {
    const val = parseMoney(input.value);
    if (val === 0) {
        input.value = "";
        return;
    }
    input.value = moneyFormatter.format(val);
}

// ==========================================================
// 🔐 ROLES & PERMISOS
// ==========================================================
function checkAuth() {
    const role = localStorage.getItem("role");
    const userRoleBadge = document.getElementById("userRoleBadge");

    if (!role) {
        window.location.href = "index.html";
        return;
    }

    if (userRoleBadge) {
        userRoleBadge.textContent = role === 'admin' ? 'Administrador' : 'Operario Logístico';
    }

    // Nav Items
    const navFletes = document.getElementById("navFletes");
    const navVehiculos = document.getElementById("navVehiculos");
    const navCrear = document.getElementById("navCrearFlete");
    const navStats = document.getElementById("navEstadisticas");

    if (role === 'operario') {
        // PERFIL OPERARIO
        if (navFletes) navFletes.style.display = 'flex';       // Puede ver lista
        if (navVehiculos) navVehiculos.style.display = 'flex'; // Puede registrar vehiculos
        if (navCrear) navCrear.style.display = 'none';         // No crea fletes
        if (navStats) navStats.style.display = 'none';         // No ve stats

        // Redirect if on forbidden tab
        const activeTab = document.querySelector('.nav-item.active')?.dataset.tab;
        if (['admin-crear', 'estadisticas'].includes(activeTab)) {
            document.querySelector('[data-tab="inicio"]')?.click();
        }
    } else {
        // PERFIL ADMIN
        if (navFletes) navFletes.style.display = 'flex';
        if (navVehiculos) navVehiculos.style.display = 'none'; // Admin usa Crear Flete
        if (navCrear) navCrear.style.display = 'flex';
        if (navStats) navStats.style.display = 'flex';
    }
}

function logout() {
    localStorage.removeItem("role");
    window.location.href = "index.html";
}

// ==========================================================
// 🚗 AUTO-FILL LOGIC & FLEET MANAGEMENT
// ==========================================================
function updateFleetStorage() {
    save("flota", FLOTA_VEHICULOS);
}

function buscarConductorPorPlaca(placaId, conductorId) {
    const placaInput = document.getElementById(placaId);
    const conductorInput = document.getElementById(conductorId);

    if (!placaInput || !conductorInput) return;

    placaInput.addEventListener("input", function () {
        const val = this.value.toUpperCase();
        // Recargar flota por si hubo cambios recientes
        FLOTA_VEHICULOS = JSON.parse(localStorage.getItem("flota")) || FLOTA_DEFAULTS;

        const vehiculo = FLOTA_VEHICULOS.find(v => v.placa === val);

        if (vehiculo) {
            conductorInput.value = vehiculo.conductor;
            conductorInput.style.borderColor = "#10b981";
            conductorInput.style.boxShadow = "0 0 10px rgba(16, 185, 129, 0.2)";
        } else {
            conductorInput.value = ""; // Clear if not found
            conductorInput.style.borderColor = "var(--glass-border)"; // Reset
            conductorInput.style.boxShadow = "none";
        }
    });
}

function listarVehiculos() {
    const tbody = document.getElementById("tablaVehiculos");
    if (!tbody) return;

    tbody.innerHTML = "";
    const flota = JSON.parse(localStorage.getItem("flota")) || FLOTA_DEFAULTS;

    flota.slice().reverse().forEach(v => {
        const tr = document.createElement("tr");
        tr.innerHTML = `
            <td><span class="badge-plate">${v.placa}</span></td>
            <td>${v.conductor}</td>
            <td style="color: var(--text-muted)">${v.modelo || 'N/A'}</td>
        `;
        tbody.appendChild(tr);
    });
}

// Función Operario: Registrar Vehículo
function registrarVehiculoOperario() {
    const placaInput = document.getElementById("op_placa");
    const condInput = document.getElementById("op_conductor");

    const placa = placaInput.value.toUpperCase().trim();
    const conductor = condInput.value.trim();

    if (!placa || !conductor) {
        return Swal.fire({ icon: 'warning', title: 'Faltan Datos', text: 'Ingrese Placa y Conductor', background: '#1a1a1a', color: '#fff' });
    }

    // Check existing
    const exists = FLOTA_VEHICULOS.find(v => v.placa === placa);
    if (exists) {
        return Swal.fire({ icon: 'info', title: 'Ya existe', text: `La placa ${placa} ya está registrada a ${exists.conductor}.`, background: '#1a1a1a', color: '#fff' });
    }

    FLOTA_VEHICULOS.push({ placa, conductor, capacidad: "N/A", modelo: "Estándar" });
    updateFleetStorage();
    listarVehiculos(); // Update table

    placaInput.value = "";
    condInput.value = "";

    Swal.fire({
        icon: 'success', title: 'Vehículo Registrado',
        text: 'Ahora el Administrador podrá ver este vehículo.',
        timer: 1500, showConfirmButton: false, background: '#1a1a1a', color: '#fff'
    });
}

// ==========================================================
// 💰 CÁLCULO DE TOTALES
// ==========================================================
function calcularTotal(prefix = "") {
    const rutaId = prefix + "valor_ruta";
    const adicId = prefix + "is_adicionales";
    const totalId = prefix + "total_flete";

    const valorRutaEl = document.getElementById(rutaId);
    const adicionalesEl = document.getElementById(adicId);
    const totalEl = document.getElementById(totalId);

    if (!valorRutaEl || !totalEl) return;

    const base = parseMoney(valorRutaEl.value);
    const tieneAdicional = adicionalesEl?.value === "Si";
    const ADICIONAL_COSTO = 60000;

    let total = base;
    if (tieneAdicional) total += ADICIONAL_COSTO;

    totalEl.value = moneyFormatter.format(total);
}

function setupCalculators(prefix = "") {
    const rutaId = prefix + "valor_ruta";
    const adicId = prefix + "is_adicionales";

    const inputRuta = document.getElementById(rutaId);
    const selectAdicional = document.getElementById(adicId);

    if (inputRuta) {
        inputRuta.addEventListener("input", () => calcularTotal(prefix));
        inputRuta.addEventListener("blur", function () {
            formatMoneyInput(this);
            calcularTotal(prefix);
        });
    }
    if (selectAdicional) {
        selectAdicional.addEventListener("change", () => calcularTotal(prefix));
    }
}

// ==========================================================
// 📝 FLETES C.R.U.D
// ==========================================================
function obtenerDatosFormulario(prefix = "") {
    const p = prefix;
    const val = (id) => document.getElementById(p + id)?.value || "";

    const placa = val("placa").trim().toUpperCase();
    const contratista = val("contratista");
    const zona = val("zona");
    const dia = val("dia");
    const poblacion = val("poblacion");
    const auxiliares = val("auxiliares");
    const noAux = val("no_auxiliares");
    const noPedidos = val("no_pedidos");
    const adicionales = val("is_adicionales");

    const valorRutaRaw = val("valor_ruta");
    const precioRaw = val("total_flete");

    return {
        id: prefix.includes("modal") ? ID_FLETE_EDITANDO : Date.now(),
        placa, contratista, zona, dia, poblacion,
        valorRuta: parseMoney(valorRutaRaw),
        precio: parseMoney(precioRaw),
        adicionales, noPedidos, auxiliares, noAux,
        fecha: new Date().toISOString().split('T')[0]
    };
}

function crearFlete() {
    const data = obtenerDatosFormulario("");

    if (!data.placa || !data.contratista || !data.zona || data.precio <= 0) {
        Swal.fire({
            icon: 'warning', title: 'Faltan Datos', text: 'Verifique Placa, Conductor, Zona y Valor.',
            background: '#1a1a1a', color: '#fff'
        });
        return;
    }

    // Auto-save new fleet entry if admin manually typed a new one
    const exists = FLOTA_VEHICULOS.find(v => v.placa === data.placa);
    if (!exists) {
        FLOTA_VEHICULOS.push({ placa: data.placa, conductor: data.contratista, capacidad: "N/A", modelo: "N/A" });
        updateFleetStorage();
    }

    const fletes = load("fletes");
    fletes.push(data);
    save("fletes", fletes);

    limpiarFormulario("");
    listarFletes();
    actualizarKPI();

    Swal.fire({
        icon: 'success', title: 'Guardado', text: `Flete de ${data.placa} registrado.`,
        timer: 1500, showConfirmButton: false, background: '#1a1a1a', color: '#fff'
    });
}

function guardarCambiosFlete() {
    const data = obtenerDatosFormulario("modal_");
    let fletes = load("fletes");

    fletes = fletes.map(f => f.id === ID_FLETE_EDITANDO ? data : f);
    save("fletes", fletes);

    ocultarModalEdicion();
    listarFletes();
    actualizarKPI();

    Swal.fire({
        icon: 'success', title: 'Actualizado', background: '#1a1a1a', color: '#fff', timer: 1500, showConfirmButton: false
    });
}

function limpiarFormulario(prefix) {
    const inputs = document.querySelectorAll(`[id^="${prefix}"]`);
    inputs.forEach(i => {
        if (i.tagName === 'SELECT') i.selectedIndex = 0;
        else i.value = "";
    });
    const cond = document.getElementById(prefix + "contratista");
    if (cond) {
        cond.style.borderColor = "var(--glass-border)";
        cond.style.boxShadow = "none";
    }
}

// ==========================================================
// 📋 LISTADOS & ACCIONES
// ==========================================================
function listarFletes() {
    const fletes = load("fletes");
    const tbody = document.getElementById("tablaFletes");
    if (!tbody) return;

    tbody.innerHTML = "";
    const role = localStorage.getItem("role");

    // Filtros
    const q = document.getElementById("buscarFlete")?.value.toLowerCase() || "";
    const fZona = document.getElementById("filtroZona")?.value || "";
    const fFecha = document.getElementById("filtroFecha")?.value || "";

    const filtered = fletes.filter(f => {
        const matchQ = (f.placa.toLowerCase().includes(q) || f.contratista.toLowerCase().includes(q));
        const matchZ = fZona ? f.zona === fZona : true;
        const matchF = fFecha ? f.fecha === fFecha : true;
        return matchQ && matchZ && matchF;
    });

    filtered.reverse().slice(0, 50).forEach(f => {
        const tr = document.createElement("tr");
        const actions = role === 'admin' ? `
            <button class="btn-icon edit" onclick="editarFlete(${f.id})"><i class="ri-pencil-line"></i></button>
            <button class="btn-icon delete" onclick="eliminarFlete(${f.id})"><i class="ri-delete-bin-line"></i></button>
        ` : `<span style="font-size:0.8rem; opacity:0.7">Solo Lectura</span>`;

        // Datos reales completos
        tr.innerHTML = `
            <td>${f.fecha}</td>
            <td>${f.dia || '-'}</td>
            <td><strong>${f.contratista}</strong></td>
            <td><span class="badge-plate">${f.placa}</span></td>
            <td>${f.poblacion || 'Pereira'}</td>
            <td>${f.noAux || 0} (${f.auxiliares || '-'})</td>
             <td class="price-cell">${moneyFormatter.format(f.precio)}</td>
            <td class="actions-cell">${actions}</td>
        `;
        tbody.appendChild(tr);
    });
}

function buscarFletes() { listarFletes(); }

window.editarFlete = function (id) {
    // Solo admins editan
    if (localStorage.getItem("role") === 'operario') return;

    ID_FLETE_EDITANDO = id;
    const f = load("fletes").find(x => x.id === id);
    if (!f) return;

    const set = (k, v) => {
        const el = document.getElementById("modal_" + k);
        if (el) el.value = v;
    };

    set("placa", f.placa);
    set("contratista", f.contratista);
    set("zona", f.zona);
    set("dia", f.dia);
    set("poblacion", f.poblacion);
    set("auxiliares", f.auxiliares);
    set("no_auxiliares", f.noAux);
    set("no_pedidos", f.noPedidos);

    set("valor_ruta", moneyFormatter.format(f.valorRuta));
    set("is_adicionales", f.adicionales);
    set("total_flete", moneyFormatter.format(f.precio));

    document.getElementById("modalEdicionFlete").classList.add("visible");
};

window.eliminarFlete = function (id) {
    if (localStorage.getItem("role") === 'operario') {
        Swal.fire({ icon: 'error', title: 'Acceso Denegado', background: '#1a1a1a', color: '#fff' });
        return;
    }
    Swal.fire({
        title: '¿Eliminar Flete?', icon: 'warning',
        showCancelButton: true, confirmButtonColor: '#d33', confirmButtonText: 'Eliminar',
        background: '#1a1a1a', color: '#fff'
    }).then((r) => {
        if (r.isConfirmed) {
            let fletes = load("fletes");
            fletes = fletes.filter(f => f.id !== id);
            save("fletes", fletes);
            listarFletes();
            actualizarKPI();
            Swal.fire({ title: 'Eliminado', icon: 'success', background: '#1a1a1a', color: '#fff', timer: 1000, showConfirmButton: false });
        }
    });
};

function ocultarModalEdicion() {
    document.getElementById("modalEdicionFlete").classList.remove("visible");
    limpiarFormulario("modal_");
    ID_FLETE_EDITANDO = null;
}

// ==========================================================
// 📊 KPI & DASHBOARD ENRICHMENT
// ==========================================================
function actualizarKPI() {
    const fletes = load("fletes");
    const flota = JSON.parse(localStorage.getItem("flota")) || FLOTA_DEFAULTS;

    // 1. Total Fletes
    const el = document.getElementById("cantFletes");
    if (el) el.innerText = fletes.length;

    // 2. Ingresos Mes Actual
    const now = new Date();
    const currentMonth = now.toISOString().substring(0, 7); // YYYY-MM
    const totalMes = fletes
        .filter(f => f.fecha.startsWith(currentMonth))
        .reduce((sum, f) => sum + f.precio, 0);

    const kpiIngresos = document.getElementById("kpiIngresos");
    if (kpiIngresos) kpiIngresos.innerText = moneyFormatter.format(totalMes);

    // 3. Vehiculos Activos
    const kpiVehiculos = document.getElementById("kpiVehiculos");
    if (kpiVehiculos) kpiVehiculos.innerText = flota.length;

    generarGraficos();
}

// ==========================================================
// 🎨 TEMA (Dark/Light)
// ==========================================================
function setupTheme() {
    const toggle = document.getElementById("themeToggle");
    const storedTheme = localStorage.getItem("theme") || "dark";

    // Apply initial
    document.documentElement.setAttribute("data-theme", storedTheme);
    if (toggle) toggle.checked = storedTheme === "light"; // Checkbox true if light

    if (toggle) {
        toggle.addEventListener("change", (e) => {
            const newTheme = e.target.checked ? "light" : "dark";
            document.documentElement.setAttribute("data-theme", newTheme);
            localStorage.setItem("theme", newTheme);
        });
    }
}

// ==========================================================
// 📂 EXPORTS
// ==========================================================
function exportarExcel() {
    const fletes = load("fletes");
    if (fletes.length === 0) return Swal.fire("Info", "Sin datos para exportar", "info");
    const ws = XLSX.utils.json_to_sheet(fletes);
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, "Fletes");
    XLSX.writeFile(wb, "Reporte_Fletes.xlsx");
}

async function generarPDF() {
    const fletes = load("fletes");
    if (fletes.length === 0) return Swal.fire("Info", "Sin datos para exportar", "info");

    const data = fletes.map(f => [
        f.fecha, f.placa, f.contratista, f.zona,
        moneyFormatter.format(f.precio), f.noPedidos
    ]);

    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();

    // LOGO INTEGRATION
    const imgEl = document.querySelector(".logo-img");
    if (imgEl) {
        // Simple way: create canvas, draw img, get b64
        const canvas = document.createElement("canvas");
        canvas.width = imgEl.naturalWidth;
        canvas.height = imgEl.naturalHeight;
        const ctx = canvas.getContext("2d");
        ctx.drawImage(imgEl, 0, 0);
        try {
            const imgData = canvas.toDataURL("image/png");
            doc.addImage(imgData, 'PNG', 14, 10, 30, 0); // x, y, w, h(auto)
        } catch (e) {
            console.warn("No se pudo cargar logo al PDF (CORS/Format)", e);
        }
    }

    doc.setFontSize(18);
    // Adjust Text Y based on logo
    doc.text("Planilla de Despacho - FletesApp", 50, 20);
    doc.setFontSize(11);
    doc.text(`Fecha de Impresión: ${new Date().toLocaleDateString()} `, 50, 28);

    doc.autoTable({
        head: [['Fecha', 'Placa', 'Conductor', 'Zona', 'Valor', 'Pedidos']],
        body: data,
        startY: 45, // Lower start Y to avoid logo overlap
        theme: 'grid',
        styles: { fontSize: 10, cellPadding: 3 },
    });

    let finalY = doc.lastAutoTable.finalY + 40;
    if (finalY > 250) { doc.addPage(); finalY = 40; }

    doc.setLineWidth(0.5);
    doc.line(20, finalY, 80, finalY);
    doc.text("Entregado por (Conductor)", 20, finalY + 10);

    doc.line(120, finalY, 180, finalY);
    doc.text("Recibido por (Operaciones)", 120, finalY + 10);

    doc.save("Reporte_Fletes.pdf");
}

window.generarPDFReporte = generarPDF; // Alias for HTML button

// ==========================================================
// 📊 GRÁFICOS (COLORFUL)
// ==========================================================
let myChart = null;
let myChart2 = null;

function generarGraficos() {
    // Si rol operario, no renderizar
    if (localStorage.getItem("role") === 'operario') return;

    // Validar existencia elementos
    const ctx = document.getElementById("chartZonas");
    const ctx2 = document.getElementById("chartIngresos");

    if (!ctx) return; // Si no estamos en tab stats

    const fletes = load("fletes");

    // --- Chart 1: Zonas ---
    const count = {};
    fletes.forEach(f => count[f.zona] = (count[f.zona] || 0) + 1);

    if (myChart) myChart.destroy();

    myChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: Object.keys(count),
            datasets: [{
                data: Object.values(count),
                // 🎨 VIBRANT PALETTE
                backgroundColor: ['#3b82f6', '#10b981', '#f59e0b', '#ef4444', '#8b5cf6', '#06b6d4'],
                borderWidth: 0
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { position: 'right', labels: { color: '#94a3b8' } } }
        }
    });

    // --- Chart 2: Ingresos por Mes (Real Data) ---
    if (!ctx2) return;

    // Agrupar ingresos por mes (YY-MM)
    const ingresosPorMes = {};
    fletes.forEach(f => {
        // f.fecha is YYYY-MM-DD
        const mesKey = f.fecha.substring(0, 7); // "2023-10"
        ingresosPorMes[mesKey] = (ingresosPorMes[mesKey] || 0) + f.precio;
    });

    // Ordenar cronológicamente
    const labels = Object.keys(ingresosPorMes).sort();
    const dataVals = labels.map(k => ingresosPorMes[k]);

    if (myChart2) myChart2.destroy();

    myChart2 = new Chart(ctx2, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Ingresos Mensuales',
                data: dataVals,
                backgroundColor: '#3b82f6',
                borderRadius: 4
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: { beginAtZero: true, ticks: { color: '#94a3b8' }, grid: { color: '#1e293b' } },
                x: { ticks: { color: '#94a3b8' }, grid: { display: false } }
            },
            plugins: { legend: { labels: { color: '#94a3b8' } } }
        }
    });
}


// ==========================================================
// 🚀 INIT - DOM LOADED
// ==========================================================
document.addEventListener("DOMContentLoaded", () => {
    try {
        console.log("🚀 FletesApp Inicializando...");

        setupTheme(); // Init Theme
        checkAuth();  // Init Auth & Role UI
        listarVehiculos(); // List Fleet (Operario)

        // 1. Navigation
        const tabs = document.querySelectorAll(".nav-item");
        tabs.forEach(t => {
            t.addEventListener("click", () => {
                const target = t.dataset.tab;

                // Prevent operario entering statistics
                if (localStorage.getItem("role") === 'operario' && target === 'estadisticas') return;

                document.querySelectorAll(".tab-content").forEach(c => c.classList.remove("visible"));
                document.querySelectorAll(".nav-item").forEach(n => n.classList.remove("active"));

                document.getElementById(target).classList.add("visible");
                t.classList.add("active");
                if (target === 'estadisticas') generarGraficos();
            });
        });

        // 2. Botones Principales
        document.getElementById("btnGestionarFlete")?.addEventListener("click", crearFlete);
        document.getElementById("btnRegistrarVehiculo")?.addEventListener("click", registrarVehiculoOperario); // NEW BOTON

        document.getElementById("btnGuardarModal")?.addEventListener("click", guardarCambiosFlete);
        document.getElementById("btnCancelarModal")?.addEventListener("click", ocultarModalEdicion);
        document.getElementById("btnCloseModal")?.addEventListener("click", ocultarModalEdicion);
        document.getElementById("btnLogout")?.addEventListener("click", logout);

        // 3. Exportaciones
        document.getElementById("btnExportarExcel")?.addEventListener("click", exportarExcel);
        document.getElementById("btnExportarPDF")?.addEventListener("click", generarPDF);

        // 4. Filtros
        document.getElementById("buscarFlete")?.addEventListener("keyup", buscarFletes);
        document.getElementById("filtroZona")?.addEventListener("change", buscarFletes);
        document.getElementById("filtroFecha")?.addEventListener("change", buscarFletes);

        // 5. Configuración Lógica
        buscarConductorPorPlaca("placa", "contratista");
        buscarConductorPorPlaca("modal_placa", "modal_contratista");

        setupCalculators("");
        setupCalculators("modal_");

        // 6. Carga Inicial
        listarFletes();
        actualizarKPI();

        // 7. Menu Mobile
        document.getElementById("menuToggleBtn")?.addEventListener("click", () => {
            document.querySelector(".sidebar").classList.toggle("open");
        });

    } catch (error) {
        console.error("❌ Error Crítico:", error);
    }
});