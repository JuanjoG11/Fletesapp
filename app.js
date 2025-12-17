// ==========================================================
// 🚀 DATA INICIAL — FLOTA (Extendida con Conductores)
// ==========================================================
const FLOTA_VEHICULOS = [
    { placa: "ABC-123", conductor: "Juan Pérez", capacidad: "20 Ton", modelo: "Camión Pesado" },
    { placa: "DEF-456", conductor: "Carlos Ruiz", capacidad: "8 Ton", modelo: "Furgón Mediano" },
    { placa: "GHI-789", conductor: "Maria Diaz", capacidad: "35 Ton", modelo: "Tractomula" },
    { placa: "JKL-012", conductor: "Pedro Gomez", capacidad: "2 Ton", modelo: "Van de Reparto" }
];

let ID_FLETE_EDITANDO = null;

// ==========================================================
// 🛠️ UTILS & FORMATTERS
// ==========================================================

function save(key, value) { localStorage.setItem(key, JSON.stringify(value)); }
function load(key) { return JSON.parse(localStorage.getItem(key)) || []; }

// Formateador de Moneda (COP)
const moneyFormatter = new Intl.NumberFormat('es-CO', {
    style: 'currency',
    currency: 'COP',
    minimumFractionDigits: 0,
    maximumFractionDigits: 0
});

function parseMoney(amountStr) {
    if (!amountStr) return 0;
    // Elimina todo lo que no sea número o punto decimal (aunque en COP usamos coma, simplificamos)
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

    if (userRoleBadge) userRoleBadge.textContent = role === 'admin' ? 'Administrador' : 'Operario Logístico';

    if (role === 'operario') {
        // Ocultar Estadísticas y Botones Críticos
        document.getElementById("btnEstadisticas")?.style.display = 'none';

        // Si estamos en la página y tratamos de ver stats, redirigir
        const activeTab = document.querySelector('.nav-item.active')?.dataset.tab;
        if (activeTab === 'estadisticas') changeTab('inicio');
    }
}

function logout() {
    localStorage.removeItem("role");
    window.location.href = "index.html";
}

// ==========================================================
// 🚗 AUTO-FILL LOGIC
// ==========================================================
function buscarConductorPorPlaca(placaInputId, conductorInputId) {
    const placaInput = document.getElementById(placaInputId);
    const conductorInput = document.getElementById(conductorInputId);

    if (!placaInput || !conductorInput) return;

    placaInput.addEventListener("input", function () {
        const val = this.value.toUpperCase();
        const vehiculo = FLOTA_VEHICULOS.find(v => v.placa === val);

        if (vehiculo) {
            conductorInput.value = vehiculo.conductor;
            // Efecto visual de "encontrado"
            conductorInput.style.borderColor = "var(--secondary)";
        } else {
            conductorInput.value = "";
            conductorInput.style.borderColor = "var(--border-color)";
        }
    });
}

// ==========================================================
// 💰 CÁLCULO DE TOTALES
// ==========================================================
function calcularTotal(prefix = "") {
    const valorRutaEl = document.getElementById(prefix + "Valor Ruta");
    const adicionalesEl = document.getElementById(prefix + "Adicionales?");
    const totalEl = document.getElementById(prefix + "totalflete");

    if (!valorRutaEl || !totalEl) return;

    const base = parseMoney(valorRutaEl.value);
    const tieneAdicional = adicionalesEl?.value === "Si";
    const ADICIONAL_COSTO = 60000;

    let total = base;
    if (tieneAdicional) total += ADICIONAL_COSTO;

    totalEl.value = moneyFormatter.format(total); // Mostrar bonito
}

function setupCalculators(prefix = "") {
    const valorRutaId = prefix + "Valor Ruta";
    const adicionalesId = prefix + "Adicionales?";

    const inputRuta = document.getElementById(valorRutaId);
    const selectAdicional = document.getElementById(adicionalesId);

    if (inputRuta) {
        inputRuta.addEventListener("input", () => {
            // Solo formatear visualmente al salir del campo (blur) para no molestar, 
            // pero calcular en tiempo real si se desea. Aquí calculamos y formateamos after blur.
            calcularTotal(prefix);
        });
        inputRuta.addEventListener("blur", function () { formatMoneyInput(this); calcularTotal(prefix); });
    }
    if (selectAdicional) {
        selectAdicional.addEventListener("change", () => calcularTotal(prefix));
    }
}

// ==========================================================
// 📝 CRUD FLETES
// ==========================================================

function obtenerDatosFormulario(prefix = "") {
    const placa = document.getElementById(prefix + "placa")?.value.trim().toUpperCase() || "";
    const contratista = document.getElementById(prefix + "Contratista")?.value || "";
    const zona = document.getElementById(prefix + "zona")?.value || "";
    const dia = document.getElementById(prefix + "Día")?.value || "";
    const poblacion = document.getElementById(prefix + "Poblacíon")?.value || "";
    const valorRutaRaw = document.getElementById(prefix + "Valor Ruta")?.value || "0";
    const precioRaw = document.getElementById(prefix + "totalflete")?.value || "0";

    const adicionales = document.getElementById(prefix + "Adicionales?")?.value || "No";
    const noPedidos = document.getElementById(prefix + "NoPedi")?.value || "0";
    const auxiliares = document.getElementById(prefix + "Auxiliares")?.value || "";
    const noAux = document.getElementById(prefix + "No. Auxiliares")?.value || "0";

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
            icon: 'error',
            title: 'Faltan Datos',
            text: 'Por favor ingrese Placa (válida), Zona y Valor de Ruta.',
            background: '#1a1a1a', color: '#fff'
        });
        return;
    }

    const fletes = load("fletes");
    fletes.push(data);
    save("fletes", fletes);

    limpiarFormulario("");
    listarFletes();
    actualizarKPI();

    Swal.fire({
        icon: 'success',
        title: 'Registrado',
        text: `Flete para ${data.placa} guardado exitosamente.`,
        timer: 2000, showConfirmButton: false,
        background: '#1a1a1a', color: '#fff'
    });
}

function guardarCambiosFlete() {
    const data = obtenerDatosFormulario("modal-");
    let fletes = load("fletes");

    fletes = fletes.map(f => f.id === data.id ? data : f);
    save("fletes", fletes);

    ocultarModalEdicion();
    listarFletes();
    actualizarKPI();

    Swal.fire({
        icon: 'success', title: 'Actualizado', text: 'El flete ha sido modificado.',
        timer: 1500, showConfirmButton: false,
        background: '#1a1a1a', color: '#fff'
    });
}

function eliminarFlete(id) {
    if (localStorage.getItem("role") === 'operario') {
        Swal.fire('Acceso Denegado', 'No tienes permiso para eliminar.', 'warning');
        return;
    }

    Swal.fire({
        title: '¿Estás seguro?', text: "No podrás revertir esto!", icon: 'warning',
        showCancelButton: true, confirmButtonColor: '#d33', cancelButtonColor: '#3085d6',
        confirmButtonText: 'Sí, eliminar', cancelButtonText: 'Cancelar',
        background: '#1a1a1a', color: '#fff'
    }).then((result) => {
        if (result.isConfirmed) {
            let fletes = load("fletes");
            fletes = fletes.filter(f => f.id !== id);
            save("fletes", fletes);
            listarFletes();
            actualizarKPI();
            Swal.fire({
                title: 'Eliminado!', text: 'El flete ha sido eliminado.', icon: 'success',
                background: '#1a1a1a', color: '#fff'
            });
        }
    });

}

// ==========================================================
// 📺 UI MANIPULATION
// ==========================================================

function limpiarFormulario(prefix) {
    const inputs = document.querySelectorAll(`[id^="${prefix}"]`);
    inputs.forEach(i => {
        if (i.tagName === 'SELECT') i.selectedIndex = 0;
        else i.value = "";
    });
}

function listarFletes() {
    const fletes = load("fletes"); // Filtros aplicados abajo en buscar
    const tbody = document.getElementById("tablaFletes");
    if (!tbody) return;

    tbody.innerHTML = "";
    const role = localStorage.getItem("role");

    // Aplicar filtros visuales
    const q = document.getElementById("buscarFlete")?.value.toLowerCase() || "";
    const fZona = document.getElementById("filtroZona")?.value || "";
    const fFecha = document.getElementById("filtroFecha")?.value || "";

    const filtered = fletes.filter(f => {
        const matchQ = (f.placa.toLowerCase().includes(q) || f.contratista.toLowerCase().includes(q));
        const matchZ = fZona ? f.zona === fZona : true;
        const matchF = fFecha ? f.fecha === fFecha : true;
        return matchQ && matchZ && matchF;
    });

    filtered.slice().reverse().slice(0, 50).forEach(f => {
        const tr = document.createElement("tr");
        const actions = role === 'admin' ? `
            <button class="btn-icon edit" onclick="editarFlete(${f.id})"><i class="ri-pencil-line"></i></button>
            <button class="btn-icon delete" onclick="eliminarFlete(${f.id})"><i class="ri-delete-bin-line"></i></button>
        ` : `<span class="badge-disabled">Solo Lectura</span>`;

        tr.innerHTML = `
            <td>${f.fecha}</td>
            <td><span class="highlight-text">${f.contratista}</span></td>
            <td><span class="badge-plate">${f.placa}</span></td>
            <td>${f.zona}</td>
            <td class="price-cell">${moneyFormatter.format(f.precio)}</td>
            <td class="actions-cell">${actions}</td>
        `;
        tbody.appendChild(tr);
    });
}

function buscarFletes() { listarFletes(); }

function actualizarKPI() {
    const fletes = load("fletes");
    document.getElementById("cantFletes").innerText = fletes.length;
    generarGraficos(); // Refresh charts
}

// ==========================================================
// ✏️ MODAL
// ==========================================================
function editarFlete(id) {
    ID_FLETE_EDITANDO = id;
    const f = load("fletes").find(x => x.id === id);
    if (!f) return;

    // Llenar campos modal
    document.getElementById("modal-placa").value = f.placa;
    document.getElementById("modal-Contratista").value = f.contratista;
    document.getElementById("modal-zona").value = f.zona;
    document.getElementById("modal-Día").value = f.dia;
    document.getElementById("modal-Poblacíon").value = f.poblacion;
    document.getElementById("modal-Auxiliares").value = f.auxiliares;
    document.getElementById("modal-No. Auxiliares").value = f.noAux;
    document.getElementById("modal-NoPedi").value = f.noPedidos;
    document.getElementById("modal-Valor Ruta").value = moneyFormatter.format(f.valorRuta);
    document.getElementById("modal-Adicionales?").value = f.adicionales;
    document.getElementById("modal-totalflete").value = moneyFormatter.format(f.precio);

    document.getElementById("modalEdicionFlete").classList.add("visible");
}
function ocultarModalEdicion() {
    document.getElementById("modalEdicionFlete").classList.remove("visible");
    limpiarFormulario("modal-");
}

// ==========================================================
// 📂 EXPORTS (EXCEL & PDF)
// ==========================================================
function exportarExcel() {
    const fletes = load("fletes");
    if (fletes.length === 0) return Swal.fire("Sin datos", "No hay nada que exportar", "info");

    const ws = XLSX.utils.json_to_sheet(fletes);
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, "Fletes");
    XLSX.writeFile(wb, "Reporte_Fletes.xlsx");
}

function generarPDFReporte() {
    const fletes = load("fletes");
    if (fletes.length === 0) return Swal.fire("Sin datos", "No hay nada que exportar", "info");

    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();

    doc.text("Reporte de Fletes - FletesApp", 14, 20);

    // Preparar Body
    const tableBody = fletes.map(f => [
        f.fecha, f.placa, f.contratista, f.zona, moneyFormatter.format(f.precio)
    ]);

    doc.autoTable({
        head: [['Fecha', 'Placa', 'Conductor', 'Zona', 'Valor']],
        body: tableBody,
        startY: 30,
    });

    doc.save("Reporte_Fletes.pdf");
}

// ==========================================================
// 📊 CHARTS
// ==========================================================
let chartIng = null, chartZon = null;
function generarGraficos() {
    if (localStorage.getItem("role") === 'operario') return;

    const fletes = load("fletes");
    const ctx1 = document.getElementById("chartIngresos")?.getContext("2d");
    const ctx2 = document.getElementById("chartZonas")?.getContext("2d");

    if (!ctx1 || !ctx2) return;

    // Agrupar datos (Simple)
    const zonas = {};
    fletes.forEach(f => zonas[f.zona] = (zonas[f.zona] || 0) + 1);

    if (chartZon) chartZon.destroy();
    chartZon = new Chart(ctx2, {
        type: 'doughnut',
        data: {
            labels: Object.keys(zonas),
            datasets: [{
                data: Object.values(zonas),
                backgroundColor: ['#3b82f6', '#10b981', '#f59e0b', '#ef4444', '#8b5cf6']
            }]
        },
        options: { responsive: true, maintainAspectRatio: false }
    });

    // Dummy chart 2 for visual complete
    if (chartIng) chartIng.destroy();
    chartIng = new Chart(ctx1, {
        type: 'line',
        data: {
            labels: ['Ene', 'Feb', 'Mar'],
            datasets: [{ label: 'Ingresos', data: [0, 0, 0], borderColor: '#3b82f6' }]
        },
        options: { responsive: true, maintainAspectRatio: false }
    });
}

// ==========================================================
// 🚀 INITIALIZATION
// ==========================================================
document.addEventListener("DOMContentLoaded", () => {
    checkAuth();

    // TABS
    document.querySelectorAll(".nav-item").forEach(btn => {
        btn.addEventListener("click", () => {
            document.querySelectorAll(".nav-item").forEach(b => b.classList.remove("active"));
            document.querySelectorAll(".tab-content").forEach(t => t.classList.remove("visible"));

            btn.classList.add("active");
            document.getElementById(btn.dataset.tab).classList.add("visible");

            if (btn.dataset.tab === 'estadisticas') generarGraficos();
        });
    });

    // Validations & Setup
    setupCalculators("");
    setupCalculators("modal-");
    buscarConductorPorPlaca("placa", "Contratista");
    buscarConductorPorPlaca("modal-placa", "modal-Contratista");

    listarFletes();
    actualizarKPI();

    // Toggle Menu
    const toggle = document.getElementById("menuToggleBtn");
    const side = document.querySelector(".sidebar");
    if (toggle) toggle.onclick = () => side.classList.toggle("open");
});