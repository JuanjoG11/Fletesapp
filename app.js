// ==========================================================
// 🚀 DATA INICIAL — FLOTA DE VEHÍCULOS (NO MODIFICADO)
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
// 📦 LOCAL STORAGE HELPERS (NO MODIFICADO)
// ==========================================================
function save(key, value) { localStorage.setItem(key, JSON.stringify(value)); }
function load(key) { return JSON.parse(localStorage.getItem(key)) || []; }

// ==========================================================
// 🟢 TOASTS PROFESIONALES (NO MODIFICADO)
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
// 🛑 ALERTA BONITA Y CONFIRMACIÓN (NO MODIFICADO)
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
 * Utiliza showModalAlert para confirmaciones de eliminación. (NO MODIFICADO)
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
// 🌙 MODO OSCURO / CLARO (NO MODIFICADO)
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
// 🔀 TABS (NO MODIFICADO)
// ==========================================================
document.querySelectorAll(".tab-link").forEach(link=>{
    link.addEventListener("click", ()=>{
        document.querySelectorAll(".tab-link").forEach(l=>l.classList.remove("active"));
        link.classList.add("active");
        const tab = link.dataset.tab;
        
        // 1. Ocultar todos
        document.querySelectorAll(".tab-content").forEach(tc=>tc.classList.remove("visible"));
        
        // 2. Mostrar el seleccionado
        const tabContent = document.getElementById(tab);
        if (tabContent) {
            tabContent.classList.add("visible");
        }
        
        const pageTitleEl = document.getElementById("pageTitle");
        if (pageTitleEl) {
            pageTitleEl.innerText = link.innerText;
        }

        // CORRECCIÓN CLAVE PARA CHART.JS:
        if(tab === 'estadisticas') {
            setTimeout(generarEstadisticas, 100); 
        }
    });
});

// ==========================================================
// 💰 CÁLCULO DE TOTAL DE FLETE (NUEVA LÓGICA)
// ==========================================================

/**
 * Calcula automáticamente el Total Flete basándose en Valor Ruta y Adicionales.
 * @param {string} prefix - Prefijo de los IDs ('modal-' o '')
 */
function calcularTotalFlete(prefix = "") {
    const valorRutaEl = document.getElementById(prefix + "Valor Ruta");
    const adicionalesEl = document.getElementById(prefix + "Adicionales?");
    const totalFleteEl = document.getElementById(prefix + "totalflete");

    if (!valorRutaEl || !adicionalesEl || !totalFleteEl) return;

    // Usar parseFloat para manejar decimales
    const valorRuta = parseFloat(valorRutaEl.value) || 0;
    const adicionales = adicionalesEl.value;

    let total = valorRuta;
    const ADICIONAL_COP = 60000;

    if (adicionales === "Si") {
        total += ADICIONAL_COP;
    }

    // Actualiza el campo Total Flete, permitiendo decimales
    totalFleteEl.value = total.toFixed(2); 
}

// ==========================================================
// 📝 GESTIONAR FLETE (CREAR/ACTUALIZAR)
// ==========================================================

// Función para obtener los valores de un formulario (principal o modal)
function obtenerValoresFormulario(prefix = "") {
    const placa = document.getElementById(prefix + "placa")?.value.trim() || '';
    // NOTA: Se mantiene el ID "Contratista" pero la semántica es "Conductor"
    const contratista = document.getElementById(prefix + "Contratista")?.value.trim() || ''; 
    const zona = document.getElementById(prefix + "zona")?.value || '';
    const dia = document.getElementById(prefix + "Día")?.value || '';
    const poblacion = document.getElementById(prefix + "Poblacíon")?.value || ''; 
    const auxiliares = document.getElementById(prefix + "Auxiliares")?.value.trim() || '';
    const noAuxiliares = document.getElementById(prefix + "No. Auxiliares")?.value || '';
    const noPedidos = parseInt(document.getElementById(prefix + "NoPedi")?.value) || 0; 
    
    // Usar parseFloat para Valor Ruta y Total Flete
    const valorRuta = parseFloat(document.getElementById(prefix + "Valor Ruta")?.value) || 0; 
    const adicionales = document.getElementById(prefix + "Adicionales?")?.value || '';
    const totalfleteEl = document.getElementById(prefix + "totalflete");
    const precio = parseFloat(totalfleteEl?.value) || 0; // Usar el valor calculado o ingresado

    return { 
        placa, contratista, zona, dia, poblacion, auxiliares, noAuxiliares, noPedidos, valorRuta, adicionales, precio 
    };
}

// Función para limpiar el formulario, adaptada para funcionar con o sin prefijo (NO MODIFICADO)
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
    
    // Asegurarse de que el cálculo se haya realizado justo antes de guardar
    calcularTotalFlete(prefix); 

    const data = obtenerValoresFormulario(prefix);
    const id = isModal ? ID_FLETE_EDITANDO : null; // Solo se usa ID_FLETE_EDITANDO si es el modal

    // Validación unificada
    if(!data.placa || !data.contratista || !data.zona || isNaN(data.precio) || data.precio <= 0){ 
        showModalAlert("Error de Formulario", "⚠️ Por favor, complete la Placa, Conductor, Zona y asegúrese de que el Precio Total sea un valor numérico válido y mayor que cero.", "error"); 
        return; 
    }

    const fleteData = {
        id: id ? id : Date.now(), 
        placa: data.placa.toUpperCase(), // Estándar: Placa en mayúsculas
        contratista: data.contratista, // Sigue guardado como 'contratista' pero es el conductor
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

    if (id) {
        // Modo Edición (Modal): Reemplazar el flete existente
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

// Alias para el formulario principal (Crear) (NO MODIFICADO)
function crearFlete() {
    gestionarFlete(false);
}

// Alias para el botón del modal de edición (Actualizar) (NO MODIFICADO)
function guardarCambiosFlete() {
    gestionarFlete(true);
}


// ==========================================================
// ✏️ GESTIÓN DEL MODAL DE EDICIÓN (NO MODIFICADO)
// ==========================================================

/**
 * Carga los datos en los campos del modal de edición. (NO MODIFICADO)
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
    
    // Usar toFixed(2) para asegurar la visualización de decimales
    document.getElementById("modal-Valor Ruta").value = (flete.valorRuta || 0).toFixed(2); 
    document.getElementById("modal-Adicionales?").value = flete.adicionales || "";
    document.getElementById("modal-totalflete").value = (flete.precio || 0).toFixed(2);
    
    // Se agregan los listeners al modal para el cálculo interactivo
    const modalValorRuta = document.getElementById("modal-Valor Ruta");
    const modalAdicionales = document.getElementById("modal-Adicionales?");

    modalValorRuta?.addEventListener("input", () => calcularTotalFlete("modal-"));
    modalAdicionales?.addEventListener("change", () => calcularTotalFlete("modal-"));
}

/**
 * Muestra el modal de edición y establece la variable de edición. (NO MODIFICADO)
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
 * Oculta el modal de edición y resetea la variable de edición. (NO MODIFICADO)
 */
function ocultarModalEdicion() {
    ID_FLETE_EDITANDO = null;
    const modal = document.getElementById("modalEdicionFlete");
    if (modal) {
        modal.classList.remove("visible"); // Ocultar modal
        limpiarFormulario("modal-"); // Limpia los campos del modal
    }
}

// Función que se llama desde el botón de la tabla (NO MODIFICADO)
function cargarFleteParaEdicion(id) {
    mostrarModalEdicion(id);
}

// ==========================================================
// 🗑 ELIMINAR FLETE (NO MODIFICADO)
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
// 📋 LISTAR FLETES (NO MODIFICADO EN FUNCIÓN DE LISTADO)
// ==========================================================
function listarFletes(){
    const fletes = load("fletes");
    const tbody = document.getElementById("tablaFletes");
    if (!tbody) return;
    tbody.innerHTML = "";

    fletes.slice(-50).reverse().forEach(f=>{
        const tr = document.createElement("tr");
        // Formatea el precio con separadores de miles y decimales
        const precioFormateado = parseFloat(f.precio).toLocaleString('es-CO', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
        
        tr.innerHTML = `
            <td>${f.fecha}</td>
            <td>${f.contratista || 'N/A'}</td> 
            <td>${f.placa}</td>
            <td>${f.zona}</td>
            <td>$${precioFormateado}</td>
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
// 🔍 BUSCADOR Y FILTRO FLETES (NO MODIFICADO EN FUNCIÓN DE FILTRADO)
// ==========================================================
function buscarFletes(){
    const q = document.getElementById("buscarFlete")?.value.toLowerCase() || '';
    const zona = document.getElementById("filtroZona")?.value || '';
    const fecha = document.getElementById("filtroFecha")?.value || '';

    const fletes = load("fletes").filter(f=>{
        // Busca por placa o por el valor guardado en 'contratista' (el conductor)
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
        const precioFormateado = parseFloat(f.precio).toLocaleString('es-CO', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
        
        tr.innerHTML = `
            <td>${f.fecha}</td>
            <td>${f.contratista || 'N/A'}</td> <td>${f.placa}</td>
            <td>${f.zona}</td>
            <td>$${precioFormateado}</td>
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
// 📊 ACTUALIZAR RESUMEN Y EXPORTAR (Ajustado formato de precio en Excel/PDF)
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

function exportarFletesAExcel() {
    const fletes = load("fletes");

    if (fletes.length === 0) {
        showModalAlert("Error", "No hay fletes registrados para exportar.", "warning");
        return;
    }

    // 1. Crear el contenido de la tabla HTML con todos los datos
    let tablaHTML = `
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Fecha</th>
                    <th>Conductor</th> <th>Placa</th>
                    <th>Zona</th>
                    <th>Población</th>
                    <th>Día</th>
                    <th>Valor Ruta</th>
                    <th>Adicionales?</th>
                    <th>No. Pedidos</th>
                    <th>Auxiliares</th>
                    <th>No. Auxiliares</th>
                    <th>Precio Final ($)</th>
                </tr>
            </thead>
            <tbody>
    `;

    fletes.forEach(f => {
        // Se asegura que los valores se pasen como string para el Excel, manteniendo los decimales.
        const precio = (f.precio || 0).toFixed(2); 
        const valorRuta = (f.valorRuta || 0).toFixed(2);
        const noPedidos = f.noPedidos || 0;

        tablaHTML += `
            <tr>
                <td>${f.id}</td>
                <td>${f.fecha || 'N/A'}</td>
                <td>${f.contratista || 'N/A'}</td>
                <td>${f.placa || 'N/A'}</td>
                <td>${f.zona || 'N/A'}</td>
                <td>${f.poblacion || 'N/A'}</td>
                <td>${f.dia || 'N/A'}</td>
                <td>${valorRuta}</td>
                <td>${f.adicionales || 'N/A'}</td>
                <td>${noPedidos}</td>
                <td>${f.auxiliares || 'N/A'}</td>
                <td>${f.noAuxiliares || 'N/A'}</td>
                <td>${precio}</td>
            </tr>
        `;
    });

    tablaHTML += `
            </tbody>
        </table>
    `;

    const uri = 'data:application/vnd.ms-excel;charset=utf-8,' + encodeURIComponent(tablaHTML);
    const link = document.createElement("a");
    link.href = uri;
    link.style.display = 'none';
    const today = new Date().toISOString().split('T')[0];
    link.download = `Reporte_Fletes_${today}.xls`;

    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);

    showToast("Exportación de fletes completada. Archivo generado.", "success");
}

function exportarExcel() { 
    exportarFletesAExcel(); 
}


// --- FIN FUNCIONES DE REPORTE PDF ---


// ... (El resto de funciones como generarEstadisticas, etc., no se modifican ya que operan sobre los datos ya guardados) ...

// ==========================================================
// 📱 RESPONSIVIDAD Y CIERRE DE MENÚ AUTOMÁTICO (NO MODIFICADO)
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
// ⏱ INIT (AJUSTADO PARA AÑADIR LISTENERS DE CÁLCULO)
// ==========================================================

function setupEventListeners() {
    // 1. Listeners para el formulario principal (Crear Flete)
    const valorRutaEl = document.getElementById("Valor Ruta");
    const adicionalesEl = document.getElementById("Adicionales?");

    if (valorRutaEl && adicionalesEl) {
        // Ejecutar cálculo al cambiar el Valor Ruta
        valorRutaEl.addEventListener("input", () => calcularTotalFlete(""));
        // Ejecutar cálculo al cambiar Adicionales
        adicionalesEl.addEventListener("change", () => calcularTotalFlete(""));
        
        // Ejecutar cálculo inicial por si hay valores prellenados al cargar
        calcularTotalFlete("");
    }
}


window.addEventListener("load", ()=>{
    listarFletes();
    listarProgramaciones();
    actualizarResumen();
    cargarFlotaParaProgramacion();
    setupEventListeners(); // Llama a la nueva función de listeners
    
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
// ==========================================================
// 📈 GRÁFICAS CON CHART.JS (corregido para reiniciar canvas)
// ==========================================================
let chartZona = null;
let chartContratista = null;

function generarEstadisticas(){
    const data = load("fletes");
    if (!data || data.length === 0) return;

    // ----- Recalcular datos -----
    const porZona = {};
    const porContratista = {};

    data.forEach(f=>{
        porZona[f.zona] = (porZona[f.zona] || 0) + (parseFloat(f.precio)||0);
        porContratista[f.contratista] = (porContratista[f.contratista] || 0) + (parseFloat(f.precio)||0);
    });

    // ----- Reset canvases si existen -----
    const canvasZona = document.getElementById("chartZona");
    const canvasContratista = document.getElementById("chartContratista");

    if (chartZona) chartZona.destroy();
    if (chartContratista) chartContratista.destroy();

    // ----- Crear gráficas -----
    chartZona = new Chart(canvasZona,{
        type:"pie",
        data:{
            labels:Object.keys(porZona),
            datasets:[{ data:Object.values(porZona) }]
        }
    });

    chartContratista = new Chart(canvasContratista,{
        type:"bar",
        data:{
            labels:Object.keys(porContratista),
            datasets:[{ data:Object.values(porContratista) }]
        },
        options:{ responsive:true }
    });
}

// Inicializar gráficos si hay tab abierto 'estadisticas' if (document.querySelector(".tab-link.active")?.dataset?.tab === 'estadisticas') { setTimeout(generarEstadisticas, 150); } else { // En segundo plano, prepara charts vacíos para evitar errores al mostrarlos por primera vez setTimeout(()=>{ generarEstadisticas(); }, 500); } });