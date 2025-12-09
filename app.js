// ==========================================================
// 🚀 DATA INICIAL — FLOTA DE VEHÍCULOS
// ==========================================================
const FLOTA_VEHICULOS = [
    { placa: "ABC-123", modelo: "Camión Pesado", capacidad: "20 Toneladas" },
    { placa: "DEF-456", modelo: "Furgón Mediano", capacidad: "8 Toneladas" },
    { placa: "GHI-789", modelo: "Tractomula", capacidad: "35 Toneladas" },
    { placa: "JKL-012", modelo: "Van de Reparto", capacidad: "2 Toneladas" }
];

// Variable global para rastrear el ID del flete que se está editando
let ID_FLETE_EDITANDO = null;

// ==========================================================
// 📦 LOCAL STORAGE HELPERS
// ==========================================================
function save(key, value) { localStorage.setItem(key, JSON.stringify(value)); }
function load(key) { return JSON.parse(localStorage.getItem(key)) || []; }

// ==========================================================
// 🟢 TOASTS PROFESIONALES (Notificaciones pequeñas)
// ==========================================================
function showToast(msg, type="info", duration=3000){
    const toast = document.createElement("div");
    toast.className = `toast ${type}`;
    toast.innerText = msg;
    const container = document.getElementById("toastContainer");
    if (container) {
        container.appendChild(toast);
        setTimeout(()=> toast.remove(), duration);
    }
}

// ==========================================================
// 🛑 ALERTA BONITA (SIMULACIÓN DE MODAL) Y CONFIRMACIÓN
// ==========================================================
/**
 * Utiliza showModalAlert para confirmaciones de eliminación.
 * Usa un simple confirm() como fallback interactivo.
 */
function showModalAlert(title, msg, type = 'info', onConfirm = null, onCancel = null) {
    if (onConfirm) {
        // Para confirmación (Eliminar)
        if (confirm(`[${title} - ${type.toUpperCase()}]\n${msg}`)) {
            onConfirm();
        } else if (onCancel) {
            onCancel();
        }
    } else {
        // Para errores (Validación)
        alert(`[${title} - ${type.toUpperCase()}]\n${msg}`);
    }
}


/**
 * Utiliza showModalAlert para confirmaciones de eliminación.
 */
function confirmDeletion(callback) {
    showModalAlert(
        "Confirmar Eliminación", 
        "¿Estás seguro de que quieres eliminar este flete? Esta acción es irreversible.", 
        'warning', 
        callback, 
        () => showToast("Eliminación cancelada.", "info")
    );
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
    setTheme("light"); 
    if (themeToggle) themeToggle.checked = true;
}
if (themeToggle) {
    themeToggle.addEventListener("change", ()=>{
        setTheme(themeToggle.checked ? "light":"dark");
    });
}

// ==========================================================
// 🔀 TABS
// ==========================================================
document.querySelectorAll(".tab-link").forEach(link=>{
    link.addEventListener("click", ()=>{
        document.querySelectorAll(".tab-link").forEach(l=>l.classList.remove("active"));
        link.classList.add("active");
        const tab = link.dataset.tab;
        document.querySelectorAll(".tab-content").forEach(tc=>tc.classList.remove("visible"));
        
        const tabContent = document.getElementById(tab);
        if (tabContent) {
            tabContent.classList.add("visible");
        }
        
        const pageTitleEl = document.getElementById("pageTitle");
        if (pageTitleEl) {
            pageTitleEl.innerText = link.innerText;
        }

        // Recargar estadísticas si la pestaña de estadísticas está activa
        if(tab === 'estadisticas') generarEstadisticas();
    });
});

// ==========================================================
// 📝 GESTIONAR FLETE (CREAR/ACTUALIZAR)
// ==========================================================

// Función para obtener los valores de un formulario (principal o modal)
function obtenerValoresFormulario(prefix = "") {
    const placa = document.getElementById(prefix + "placa")?.value.trim() || '';
    const contratista = document.getElementById(prefix + "Contratista")?.value.trim() || '';
    const zona = document.getElementById(prefix + "zona")?.value || '';
    const dia = document.getElementById(prefix + "Día")?.value || '';
    const poblacion = document.getElementById(prefix + "Poblacíon")?.value || ''; 
    const auxiliares = document.getElementById(prefix + "Auxiliares")?.value.trim() || '';
    const noAuxiliares = document.getElementById(prefix + "No. Auxiliares")?.value || '';
    const noPedidos = parseInt(document.getElementById(prefix + "NoPedi")?.value) || 0; 
    const valorRuta = parseFloat(document.getElementById(prefix + "Valor Ruta")?.value) || 0; 
    const adicionales = document.getElementById(prefix + "Adicionales?")?.value || '';
    const totalfleteEl = document.getElementById(prefix + "totalflete");
    const precio = parseFloat(totalfleteEl?.value) || 0;

    return { 
        placa, contratista, zona, dia, poblacion, auxiliares, noAuxiliares, noPedidos, valorRuta, adicionales, precio 
    };
}

// Función para limpiar el formulario, adaptada para funcionar con o sin prefijo
function limpiarFormulario(prefix = "") {
    const ids = ["placa", "Contratista", "zona", "Día", "Poblacíon", "Auxiliares", "No. Auxiliares", "NoPedi", "Valor Ruta", "Adicionales?", "totalflete"];
    
    ids.forEach(id => {
        const element = document.getElementById(prefix + id);
        if (element) {
            if (element.tagName === 'SELECT') {
                element.selectedIndex = 0;
            } else {
                element.value = "";
            }
        }
    });

    if (prefix === "") {
        ID_FLETE_EDITANDO = null;
        const btnGestionar = document.getElementById("btnGestionarFlete");
        if (btnGestionar) {
            btnGestionar.innerText = "Registrar Flete";
        }
    }
}

// Lógica principal de gestión (Crear/Actualizar)
function gestionarFlete(isModal = false){
    const prefix = isModal ? "modal-" : "";
    const data = obtenerValoresFormulario(prefix);
    const id = ID_FLETE_EDITANDO; // Se usa siempre la variable global, solo es diferente el prefijo para los inputs

    // Validación unificada
    if(!data.placa || !data.contratista || !data.zona || isNaN(data.precio) || data.precio <= 0){ 
        showModalAlert("Error de Formulario", "⚠️ Por favor, complete la Placa, Contratista, Zona y asegúrese de que el Precio sea un valor numérico válido.", "error"); 
        return; 
    }

    const fleteData = {
        id: id && isModal ? id : Date.now(), // Crea ID solo si estamos creando, o usa el ID global si estamos editando en el modal
        placa: data.placa,
        contratista: data.contratista, 
        zona: data.zona,
        precio: data.precio,
        fecha: new Date().toISOString().split('T')[0],
        dia: data.dia, 
        poblacion: data.poblacion,
        auxiliares: data.auxiliares,
        noAuxiliares: data.noAuxiliares,
        noPedidos: data.noPedidos,
        valorRuta: data.valorRuta,
        adicionales: data.adicionales
    };

    let fletes = load("fletes");
    let mensaje = "";

    if (id && isModal) {
        // Modo Edición: Reemplazar el flete existente
        fletes = fletes.map(f => f.id === id ? fleteData : f);
        mensaje = `Flete de ${data.contratista} actualizado ✔️`;
    } else {
        // Modo Creación: Añadir nuevo flete (isModal debe ser false)
        fletes.push(fleteData);
        mensaje = `Flete para ${data.contratista} registrado ✔️`;
    }

    save("fletes", fletes);
    
    // Limpiar y actualizar UI
    limpiarFormulario(prefix);
    
    if (isModal) {
        ocultarModalEdicion(); // Cierra el modal después de guardar
    }

    listarFletes();
    actualizarResumen();
    generarEstadisticas();
    showToast(mensaje,"success");
}

// Alias para el formulario principal (Crear)
function crearFlete() {
    gestionarFlete(false);
}

// Alias para el botón del modal de edición (Actualizar)
function guardarCambiosFlete() {
    gestionarFlete(true);
}


// ==========================================================
// ✏️ GESTIÓN DEL MODAL DE EDICIÓN
// ==========================================================

/**
 * Carga los datos en los campos del modal de edición.
 */
function cargarDatosModal(flete) {
    document.getElementById("modal-placa").value = flete.placa || "";
    document.getElementById("modal-Contratista").value = flete.contratista || "";
    document.getElementById("modal-zona").value = flete.zona || "";
    document.getElementById("modal-Día").value = flete.dia || "";
    document.getElementById("modal-Poblacíon").value = flete.poblacion || "";
    document.getElementById("modal-Auxiliares").value = flete.auxiliares || "";
    document.getElementById("modal-No. Auxiliares").value = flete.noAuxiliares || "";
    document.getElementById("modal-NoPedi").value = flete.noPedidos || "";
    document.getElementById("modal-Valor Ruta").value = flete.valorRuta || "";
    document.getElementById("modal-Adicionales?").value = flete.adicionales || "";
    document.getElementById("modal-totalflete").value = flete.precio || "";
}

/**
 * Muestra el modal de edición y establece la variable de edición.
 */
function mostrarModalEdicion(id) {
    const fletes = load("fletes");
    const flete = fletes.find(f => f.id === id);

    if (!flete) {
        showToast("Flete no encontrado para editar.","error");
        return;
    }

    ID_FLETE_EDITANDO = id; // Establece el ID global

    cargarDatosModal(flete);
    
    const modal = document.getElementById("modalEdicionFlete");
    if (modal) {
        modal.classList.add("visible"); // Mostrar modal
        showToast(`Editando flete ${flete.placa} en ventana emergente...`,"info");
    }
}

/**
 * Oculta el modal de edición y resetea la variable de edición.
 */
function ocultarModalEdicion() {
    ID_FLETE_EDITANDO = null;
    const modal = document.getElementById("modalEdicionFlete");
    if (modal) {
        modal.classList.remove("visible"); // Ocultar modal
        limpiarFormulario("modal-"); // Limpia los campos del modal
    }
}

// Función que se llama desde el botón de la tabla
function cargarFleteParaEdicion(id) {
    mostrarModalEdicion(id);
}

// ==========================================================
// 🗑 ELIMINAR FLETE 
// ==========================================================
function eliminarFlete(id) {
    confirmDeletion(
        () => {
            let fletes = load("fletes");
            fletes = fletes.filter(f => f.id !== id);
            save("fletes", fletes);
            // Si el flete que se elimina estaba abierto en el modal, se cierra.
            if (ID_FLETE_EDITANDO === id) {
                ocultarModalEdicion(); 
            }
            listarFletes();
            actualizarResumen();
            generarEstadisticas();
            showToast("Flete eliminado correctamente.","danger");
        }
    );
}

// ==========================================================
// 📋 LISTAR FLETES (con botones EDITAR y ELIMINAR)
// ==========================================================
function listarFletes(){
    const fletes = load("fletes");
    const tbody = document.getElementById("tablaFletes");
    if (!tbody) return;
    tbody.innerHTML = "";

    fletes.slice(-50).reverse().forEach(f=>{
        const tr = document.createElement("tr");
        tr.innerHTML = `
            <td>${f.fecha}</td>
            <td>${f.contratista || 'N/A'}</td> 
            <td>${f.placa}</td>
            <td>${f.zona}</td>
            <td>$${f.precio.toLocaleString()}</td>
            <td class="table-actions">
                <button 
                    class="btn btn-primary btn-sm" 
                    onclick="cargarFleteParaEdicion(${f.id})" 
                    title="Editar Flete">
                    ✏️ Editar
                </button>
                <button 
                    class="btn btn-danger btn-sm" 
                    onclick="eliminarFlete(${f.id})" 
                    title="Eliminar Flete">
                    ❌ Eliminar
                </button>
            </td>
        `;
        tbody.appendChild(tr);
    });
}

// ==========================================================
// 🔍 BUSCADOR Y FILTRO FLETES
// ==========================================================
function buscarFletes(){
    const q = document.getElementById("buscarFlete")?.value.toLowerCase() || '';
    const zona = document.getElementById("filtroZona")?.value || '';
    const fecha = document.getElementById("filtroFecha")?.value || '';

    const fletes = load("fletes").filter(f=>{
        const matchQuery = (f.contratista?.toLowerCase().includes(q) || f.placa?.toLowerCase().includes(q)); 
        const matchZona = zona ? f.zona===zona : true;
        const matchFecha = fecha ? f.fecha===fecha : true;
        return matchQuery && matchZona && matchFecha;
    });

    const tbody = document.getElementById("tablaFletes");
    if (!tbody) return;
    
    tbody.innerHTML = "";
    fletes.slice(-50).reverse().forEach(f=>{
        const tr = document.createElement("tr");
        tr.innerHTML = `
            <td>${f.fecha}</td>
            <td>${f.contratista || 'N/A'}</td>
            <td>${f.placa}</td>
            <td>${f.zona}</td>
            <td>$${f.precio.toLocaleString()}</td>
            <td class="table-actions">
                <button 
                    class="btn btn-primary btn-sm" 
                    onclick="cargarFleteParaEdicion(${f.id})" 
                    title="Editar Flete">
                    ✏️ Editar
                </button>
                <button 
                    class="btn btn-danger btn-sm" 
                    onclick="eliminarFlete(${f.id})" 
                    title="Eliminar Flete">
                    ❌ Eliminar
                </button>
            </td>
        `;
        tbody.appendChild(tr);
    });
}

// ==========================================================
// 📊 ACTUALIZAR RESUMEN, PROGRAMACIONES, ESTADÍSTICAS, ETC.
// ==========================================================
function actualizarResumen(){
    const fletes = load("fletes");
    const totalFletes = fletes.length;
    const cantFletesEl = document.getElementById("cantFletes");
    if (cantFletesEl) {
        cantFletesEl.innerText = totalFletes.toLocaleString();
    }
}
function crearProgramacion() { showToast("Función 'crearProgramacion' no implementada.","info"); }
function listarProgramaciones() { /* Aquí iría la lógica de programaciones */ }
function buscarProgramaciones() { showToast("Función 'buscarProgramaciones' no implementada.","info"); }
function cargarFlotaParaProgramacion() { /* Aquí iría la lógica de flota */ }
function exportarExcel(){ /* Aquí iría la lógica de exportar */ }

// --- FUNCIONES DE REPORTE PDF CORREGIDAS Y DEFINIDAS ---

/**
 * Genera el contenido HTML para el reporte de fletes con una columna de firma.
 * @param {Array} fletes Lista de fletes a incluir en el reporte.
 * @returns {string} El contenido HTML para la impresión.
 */
function generarContenidoReporte(fletes) {
    // Genera las filas de la tabla, incluyendo la celda de firma
    const filasTabla = fletes.map(f => `
        <tr>
            <td>${f.fecha}</td>
            <td>${f.contratista || 'N/A'}</td> 
            <td>${f.placa}</td>
            <td>${f.zona}</td>
            <td>$${f.precio.toLocaleString()}</td>
            <td>${f.dia || 'N/A'}</td>
            <td>${f.poblacion || 'N/A'}</td>
            <td class="firma-celda"></td> </tr>
    `).join('');

    // Calcula el total de la suma de los precios
    const totalFletes = fletes.reduce((sum, f) => sum + f.precio, 0);
    const totalFormateado = totalFletes.toLocaleString();

    // Estilos básicos para la impresión
    const estilos = `
        <style>
            body { font-family: Arial, sans-serif; margin: 20px; }
            h2 { text-align: center; color: #333; }
            .reporte-container { width: 100%; max-width: 900px; margin: 0 auto; }
            table { width: 100%; border-collapse: collapse; margin-top: 20px; }
            th, td { border: 1px solid #ddd; padding: 8px; text-align: left; font-size: 10px; }
            th { background-color: #f2f2f2; }
            .total-row td { font-weight: bold; background-color: #e0f7fa; }
            
            /* Estilo para la columna de la firma */
            .firma-celda {
                min-width: 120px; /* Ancho suficiente para una firma */
                height: 30px; /* Alto suficiente para una firma */
            }
            
            /* Ocultar elementos que no queremos imprimir */
            @media print {
                .no-print { display: none !important; }
                body { margin: 0; }
                .reporte-container { max-width: none; }
            }
        </style>
    `;

    // Estructura completa del HTML
    return `
        <html>
        <head>
            <title>Reporte de Fletes - ${new Date().toLocaleDateString()}</title>
            ${estilos}
        </head>
        <body>
            <div class="reporte-container">
                <h2>📋 Reporte de Últimos Fletes para Confirmación</h2>
                <p>Generado el: ${new Date().toLocaleString()}</p>
                <table>
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Contratista</th>
                            <th>Placa</th>
                            <th>Zona</th>
                            <th>Precio</th>
                            <th>Día</th>
                            <th>Población</th>
                            <th>✍️ Firma del Conductor</th> 
                        </tr>
                    </thead>
                    <tbody>
                        ${filasTabla}
                        <tr class="total-row">
                            <td colspan="4" style="text-align: right;">TOTAL GENERAL:</td>
                            <td>$${totalFormateado}</td>
                            <td colspan="3"></td> </tr>
                    </tbody>
                </table>
                
            </div>
        </body>
        </html>
    `;
}

/**
 * Genera el PDF (mediante impresión) con los últimos 10 fletes y la columna de firma.
 */
function generarPDF() { 
    const fletes = load("fletes");

    // Filtrar los últimos 10 fletes para el reporte
    const ultimosFletes = fletes.slice(-10).reverse(); // Muestra los 10 más recientes

    if (ultimosFletes.length === 0) {
        showModalAlert("Error", "No hay fletes registrados para generar el reporte.", "warning");
        return;
    }

    const contenidoHTML = generarContenidoReporte(ultimosFletes);

    // 1. Abrir una nueva ventana/pestaña
    const printWindow = window.open('', '_blank');
    if (!printWindow) {
        showModalAlert("Error", "El bloqueo de ventanas emergentes impide generar el reporte. Por favor, desactívelo.", "error");
        return;
    }

    // 2. Inyectar el contenido HTML
    printWindow.document.write(contenidoHTML);
    printWindow.document.close();

    // 3. Esperar un breve momento a que cargue el contenido y llamar a imprimir
    printWindow.onload = () => {
        printWindow.print();
        // Opcional: Cerrar la ventana después de la impresión
        // setTimeout(() => printWindow.close(), 1000); 
    };
} 

// --- FIN FUNCIONES DE REPORTE PDF ---


let chartIngresos, chartZonas, chartProgramaciones;
function generarEstadisticas() { 
    const fletes = load("fletes");
    const programaciones = load("programaciones") || [];

    const COLOR_AZUL = "#3b82f6"; // Variable CSS no accesible en JS, se usa color fijo.
    const COLOR_NARANJA = "#f97316";
    
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
                    backgroundColor: COLOR_NARANJA, 
                    borderRadius: 5
                }]
            },
            options: {
                responsive: true,
                plugins: { legend: { display: true }, tooltip: { mode: 'index', intersect: false } },
                scales: { y: { beginAtZero: true } }
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
                    backgroundColor: [COLOR_AZUL, COLOR_NARANJA, "#10b981", "#ef4444", "#8b5cf6"]
                }]
            },
            options: {
                responsive: true,
                plugins: { legend: { position: 'right' }, tooltip: { callbacks: { label: (c) => `${c.label}: ${c.parsed} fletes` } } }
            }
        });
    }

    // ---------- 3️⃣ Programaciones por mes (Placeholder) ----------
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
                    borderColor: COLOR_AZUL,
                    backgroundColor: "hsla(217, 91%, 65%, 0.3)", 
                    fill: true, tension: 0.4, pointRadius: 5, pointBackgroundColor: COLOR_AZUL
                }]
            },
            options: {
                responsive: true,
                plugins: { legend: { display: true } },
                scales: { y: { beginAtZero: true } }
            }
        });
    }
}
// Fin de la función generarEstadisticas

// ==========================================================
// 📱 RESPONSIVIDAD Y CIERRE DE MENÚ AUTOMÁTICO
// ==========================================================

const menuToggleBtn = document.getElementById("menuToggleBtn");
const sidebar = document.querySelector(".sidebar");
const sidebarLinks = document.querySelectorAll(".sidebar a");

if (menuToggleBtn && sidebar) {
    menuToggleBtn.addEventListener("click", () => {
        sidebar.classList.toggle("active");
    });
}

sidebarLinks.forEach(link => {
    link.addEventListener("click", () => {
        if (window.innerWidth <= 900) {
            if (sidebar) {
                sidebar.classList.remove("active");
            }
        }
    });
});

// ==========================================================
// ⏱ INIT
// ==========================================================
window.addEventListener("load", ()=>{
    listarFletes();
    listarProgramaciones();
    actualizarResumen();
    generarEstadisticas();
    cargarFlotaParaProgramacion();
    
    const fechaProgEl = document.getElementById("fechaProg");
    if (fechaProgEl) {
        fechaProgEl.addEventListener("change", cargarFlotaParaProgramacion);
    }

    // El botón principal del formulario ahora solo CREA
    const btnGestionar = document.getElementById("btnGestionarFlete");
    if (btnGestionar) {
        btnGestionar.onclick = crearFlete;
    }
});