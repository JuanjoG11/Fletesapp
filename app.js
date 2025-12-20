let FLOTA_VEHICULOS = [];
let ID_FLETE_EDITANDO = null;
let CURRENT_SESSION = null; // Cache para la sesión
let CACHED_FLETES = [];     // Cache para listados rápidos

// ==========================================================
// 🛠️ UTILS & FORMATTERS
// ==========================================================
// Nota: save y load ya no se usarán para datos de negocio, solo para UI/Tema
function saveUI(key, value) { localStorage.setItem(key, JSON.stringify(value)); }
function loadUI(key) { return JSON.parse(localStorage.getItem(key)) || null; }

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
async function checkAuth() {
    // Usar cache de sesión si existe y tiene el perfil
    if (!CURRENT_SESSION || !CURRENT_SESSION.profile) {
        const { session, user: profile } = await window.supabaseClient.obtenerSesionActual();
        if (session) {
            CURRENT_SESSION = { ...session, profile };
        }
    }
    const session = CURRENT_SESSION;

    if (!session) {
        window.location.href = "index.html";
        return;
    }

    const role = session.profile?.rol || session.user?.user_metadata?.rol || 'operario';

    const userRoleBadge = document.getElementById("userRoleBadge");
    if (userRoleBadge) {
        userRoleBadge.textContent = role === 'admin' ? 'Administrador' : 'Operario Logístico';
    }

    // Nav Items
    const navFletes = document.getElementById("navFletes");
    const navVehiculos = document.getElementById("navVehiculos");
    const navCrear = document.getElementById("navCrearFlete");
    const navStats = document.getElementById("navEstadisticas");

    if (role === 'admin') {
        // PERFIL ADMIN (AHORA GESTIONA VEHÍCULOS)
        if (navFletes) navFletes.style.display = 'flex';
        if (navVehiculos) navVehiculos.style.display = 'flex';
        if (navCrear) navCrear.style.display = 'none';
        if (navStats) navStats.style.display = 'none';

        // Redirect if on forbidden tab
        const activeTab = document.querySelector('.nav-item.active')?.dataset.tab;
        if (['admin-crear', 'estadisticas'].includes(activeTab)) {
            document.querySelector('[data-tab="inicio"]')?.click();
        }
    } else {
        // PERFIL OPERARIO (AHORA CREA FLETES Y VE ESTADÍSTICAS)
        if (navFletes) navFletes.style.display = 'flex';
        if (navVehiculos) navVehiculos.style.display = 'none';
        if (navCrear) navCrear.style.display = 'flex';
        if (navStats) navStats.style.display = 'flex';
    }
}

async function logout() {
    await SupabaseClient.auth.logout();
    CURRENT_SESSION = null;
    window.location.href = "index.html?logout=true";
}

// ==========================================================
// 🚗 AUTO-FILL LOGIC & FLEET MANAGEMENT
// ==========================================================
function buscarConductorPorPlaca(placaId, conductorId) {
    const placaInput = document.getElementById(placaId);
    const conductorInput = document.getElementById(conductorId);

    if (!placaInput || !conductorInput) return;

    placaInput.addEventListener("input", function () {
        const val = this.value.toUpperCase();
        if (val.length < 3) return;

        // Buscar en cache local primero
        const vehiculo = FLOTA_VEHICULOS.find(v => v.placa === val);

        if (vehiculo) {
            conductorInput.value = vehiculo.conductor;
            conductorInput.style.borderColor = "#10b981";
            conductorInput.style.boxShadow = "0 0 10px rgba(16, 185, 129, 0.2)";
        } else {
            // Si no está en cache, no borramos para dejar que el usuario escriba
            conductorInput.style.borderColor = "var(--glass-border)";
            conductorInput.style.boxShadow = "none";
        }
    });
}

async function listarVehiculos() {
    const tbody = document.getElementById("tablaVehiculos");
    if (!tbody) return;

    tbody.innerHTML = `<tr><td colspan="4" style="text-align:center"><i class="ri-loader-4-line rotate"></i> Cargando vehículos...</td></tr>`;

    const res = await SupabaseClient.vehiculos.getAll();
    FLOTA_VEHICULOS = res.success ? res.data : [];

    tbody.innerHTML = "";
    if (FLOTA_VEHICULOS.length === 0) {
        tbody.innerHTML = `<tr><td colspan="4" style="text-align:center">No hay vehículos registrados</td></tr>`;
        return;
    }

    FLOTA_VEHICULOS.forEach(v => {
        const tr = document.createElement("tr");
        tr.innerHTML = `
            <td><span class="badge-plate">${v.placa}</span></td>
            <td>${v.conductor}</td>
            <td style="color: var(--text-muted)">${v.modelo || 'N/A'}</td>
            <td class="actions-cell">
                <button class="btn-icon delete" onclick="eliminarVehiculo('${v.id}', '${v.placa}')" title="Eliminar Vehículo">
                    <i class="ri-delete-bin-line"></i>
                </button>
            </td>
        `;
        tbody.appendChild(tr);
    });
}

async function eliminarVehiculo(id, placa) {
    const { isConfirmed } = await Swal.fire({
        title: '¿Eliminar Vehículo?',
        text: `Se eliminará la placa ${placa} de la base de datos.`,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#ef4444',
        cancelButtonColor: '#64748b',
        confirmButtonText: 'Sí, eliminar',
        cancelButtonText: 'Cancelar',
        background: '#1e293b',
        color: '#f8fafc'
    });

    if (isConfirmed) {
        const result = await SupabaseClient.vehiculos.delete(id);
        if (result) {
            await listarVehiculos();
            await actualizarKPI();
            Swal.fire({
                title: 'Eliminado',
                icon: 'success',
                timer: 1500,
                showConfirmButton: false,
                background: '#1e293b',
                color: '#f8fafc'
            });
        } else {
            Swal.fire({ icon: 'error', title: 'Error', text: 'No se pudo eliminar el vehículo. Verifique sus permisos.', background: '#1e293b', color: '#f8fafc' });
        }
    }
}

async function registrarVehiculoOperario() {
    const placaInput = document.getElementById("op_placa");
    const condInput = document.getElementById("op_conductor");
    const modInput = document.getElementById("op_modelo");

    const placa = placaInput.value.toUpperCase().trim();
    const conductor = condInput.value.trim();
    const modelo = modInput.value.trim() || "Estándar";

    if (!placa || !conductor) {
        return Swal.fire({ icon: 'warning', title: 'Faltan Datos', text: 'Ingrese Placa y Conductor', background: '#1a1a1a', color: '#fff' });
    }

    const { user } = await SupabaseClient.auth.getSession();

    const result = await SupabaseClient.vehiculos.create({
        placa,
        conductor,
        modelo,
        created_by: user.id
    });

    if (result.success) {
        await listarVehiculos();
        placaInput.value = "";
        condInput.value = "";
        if (modInput) modInput.value = "";

        Swal.fire({
            icon: 'success', title: 'Vehículo Registrado',
            text: 'El vehículo ha sido guardado exitosamente.',
            timer: 1500, showConfirmButton: false, background: '#1a1a1a', color: '#fff'
        });
    } else {
        Swal.fire({ icon: 'error', title: 'Error', text: 'No se pudo registrar el vehículo: ' + (result.error || 'Placa duplicada'), background: '#1a1a1a', color: '#fff' });
    }
}

// ==========================================================
// 💰 CÁLCULO DE TOTALES BASADO EN POBLACIÓN
// ==========================================================

// Precios por población
const PRECIOS_POBLACION = {
    "Pereira": 320000,
    "Dosquebradas": 280000,
    "Manizales": 450000,
    "Armenia": 400000,
    "Cartago": 380000,
    "Cuba": 250000,
    "Parque Industrial": 300000,
    "Sta Rosa": 350000,
    "Quimbaya": 370000,
    "Viterbo": 420000,
    "Vereda": 200000
};

const COSTO_ADICIONAL = 60000;
const COSTO_POR_AUXILIAR = 30000; // Costo adicional por cada auxiliar

function calcularTotal(prefix = "") {
    const poblacionId = prefix + "poblacion";
    const adicId = prefix + "is_adicionales";
    const noAuxId = prefix + "no_auxiliares";
    const totalId = prefix + "total_flete";

    const poblacionEl = document.getElementById(poblacionId);
    const adicionalesEl = document.getElementById(adicId);
    const noAuxEl = document.getElementById(noAuxId);
    const totalEl = document.getElementById(totalId);

    if (!poblacionEl || !totalEl) return;

    const poblacion = poblacionEl.value;
    const precioBase = PRECIOS_POBLACION[poblacion] || 0;

    // Calcular Valor Flete (total a pagar) basado en población
    let total = precioBase;

    // Sumar costo de adicionales
    const tieneAdicional = adicionalesEl?.value === "Si";
    if (tieneAdicional) total += COSTO_ADICIONAL;

    // Sumar costo por auxiliares
    const numAuxiliares = parseInt(noAuxEl?.value || 0);
    total += (numAuxiliares * COSTO_POR_AUXILIAR);

    totalEl.value = moneyFormatter.format(total);
}

function setupCalculators(prefix = "") {
    const poblacionId = prefix + "poblacion";
    const adicId = prefix + "is_adicionales";
    const noAuxId = prefix + "no_auxiliares";
    const rutaId = prefix + "valor_ruta";

    const selectPoblacion = document.getElementById(poblacionId);
    const selectAdicional = document.getElementById(adicId);
    const selectNoAux = document.getElementById(noAuxId);
    const inputRuta = document.getElementById(rutaId);

    if (selectPoblacion) {
        selectPoblacion.addEventListener("change", () => calcularTotal(prefix));
    }
    if (selectAdicional) {
        selectAdicional.addEventListener("change", () => calcularTotal(prefix));
    }
    if (selectNoAux) {
        selectNoAux.addEventListener("change", () => calcularTotal(prefix));
    }
    // Formatear valor ruta cuando el usuario lo ingresa manualmente
    if (inputRuta) {
        inputRuta.addEventListener("blur", function () {
            formatMoneyInput(this);
        });
    }
}

// ==========================================================
// 📝 FLETES C.R.U.D
// ==========================================================
async function obtenerDatosFormulario(prefix = "") {
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

    const { user } = await SupabaseClient.auth.getSession();

    // Buscar el ID del vehículo por placa
    let resV = await SupabaseClient.vehiculos.getByPlaca(placa);
    let vehiculo = resV.data;

    if (!vehiculo && placa && contratista) {
        // Opcional: registrar vehículo si no existe
        const res = await SupabaseClient.vehiculos.create({
            placa,
            conductor: contratista,
            modelo: 'Autocreado'
        });
        if (res.success) {
            vehiculo = res.data;
        }
    }

    const finalData = {
        // Campos para la Base de Datos
        db: {
            vehiculo_id: vehiculo?.id,
            user_id: user.id,
            contratista,
            zona,
            dia,
            poblacion,
            valor_ruta: parseMoney(valorRutaRaw),
            precio: parseMoney(precioRaw),
            adicionales,
            no_pedidos: parseInt(noPedidos || 0),
            auxiliares,
            no_auxiliares: parseInt(noAux || 0),
            fecha: val("fecha") || new Date().toISOString().split('T')[0]
        },
        // Campos para validación UI
        ui: {
            placa
        }
    };

    if (prefix.includes("modal")) {
        finalData.db.id = ID_FLETE_EDITANDO;
    }

    return finalData;
}

async function crearFlete() {
    const { db, ui } = await obtenerDatosFormulario("");

    if (!ui.placa || !db.contratista || !db.zona || db.precio <= 0) {
        Swal.fire({
            icon: 'warning', title: 'Faltan Datos', text: 'Verifique Placa, Conductor, Zona y Valor.',
            background: '#1a1a1a', color: '#fff'
        });
        return;
    }

    const result = await SupabaseClient.fletes.create(db);

    if (result.success) {
        limpiarFormulario("");
        await listarFletes();
        await actualizarKPI();

        Swal.fire({
            icon: 'success', title: 'Guardado', text: `Flete de ${ui.placa} registrado en la nube.`,
            timer: 1500, showConfirmButton: false, background: '#1a1a1a', color: '#fff'
        });
    } else {
        Swal.fire({ icon: 'error', title: 'Error', text: 'No se pudo guardar el flete: ' + (result.error || 'Error desconocido'), background: '#1a1a1a', color: '#fff' });
    }
}

async function guardarCambiosFlete() {
    const { db, ui } = await obtenerDatosFormulario("modal-");

    if (!ui.placa || !db.contratista || !db.zona || db.precio <= 0) {
        return Swal.fire({ icon: 'warning', title: 'Faltan Datos', background: '#1a1a1a', color: '#fff' });
    }

    const result = await SupabaseClient.fletes.update(ID_FLETE_EDITANDO, db);

    if (result.success) {
        ocultarModalEdicion();
        await listarFletes();
        await actualizarKPI();

        Swal.fire({
            icon: 'success', title: 'Actualizado', background: '#1a1a1a', color: '#fff', timer: 1500, showConfirmButton: false
        });
    } else {
        Swal.fire({ icon: 'error', title: 'Error', text: 'No se pudo actualizar el flete: ' + (result.error || 'Error desconocido'), background: '#1a1a1a', color: '#fff' });
    }
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
async function listarFletes(useCache = false) {
    const tbody = document.getElementById("tablaFletes");
    if (!tbody) return;

    if (!useCache) {
        tbody.innerHTML = `<tr><td colspan="9" style="text-align:center"><i class="ri-loader-4-line rotate"></i> Cargando fletes...</td></tr>`;
        const { data, error } = await SupabaseClient.supabase
            .from('vista_fletes_completos')
            .select('*')
            .order('fecha', { ascending: false });

        if (error) {
            console.error("Error cargando fletes:", error);
            tbody.innerHTML = `<tr><td colspan="9" style="text-align:center; color: #ef4444">Error al cargar datos</td></tr>`;
            return;
        }
        CACHED_FLETES = data;
    }

    // Filtros sobre cache (Instantáneo)
    const q = document.getElementById("buscarFlete")?.value.toLowerCase() || "";
    const fZona = document.getElementById("filtroZona")?.value || "";
    const fFecha = document.getElementById("filtroFecha")?.value || "";

    const session = CURRENT_SESSION;
    const role = session?.profile?.rol || session?.user?.user_metadata?.rol || 'operario';
    const currentUserId = session?.user?.id;

    const filtered = CACHED_FLETES.filter(f => {
        const contratista = f.contratista || '';
        const placa = f.placa || '';
        const matchQ = (placa.toLowerCase().includes(q) || contratista.toLowerCase().includes(q));
        const matchZ = fZona ? f.zona === fZona : true;
        const matchF = fFecha ? f.fecha === fFecha : true;
        return matchQ && matchZ && matchF;
    });

    tbody.innerHTML = "";
    if (filtered.length === 0) {
        tbody.innerHTML = `<tr><td colspan="9" style="text-align:center">No se encontraron fletes</td></tr>`;
        return;
    }

    filtered.forEach(f => {
        const tr = document.createElement("tr");
        const canEdit = role === 'operario' && f.user_id === currentUserId;

        const actions = canEdit ? `
            <button class="btn-icon edit" onclick="editarFlete('${f.id}')"><i class="ri-pencil-line"></i></button>
            <button class="btn-icon delete" onclick="eliminarFlete('${f.id}')"><i class="ri-delete-bin-line"></i></button>
        ` : `<span style="font-size:0.7rem; opacity:0.5">${role === 'admin' ? 'Solo Lectura' : 'No Propietario'}</span>`;

        tr.innerHTML = `
            <td>${f.fecha}</td>
            <td>${f.dia || '-'}</td>
            <td><strong>${f.contratista}</strong></td>
            <td><span class="badge-plate">${f.placa}</span></td>
            <td>${f.poblacion || 'N/A'}</td>
            <td>${f.no_auxiliares || 0} (${f.auxiliares || '-'})</td>
            <td class="price-cell">${moneyFormatter.format(f.valor_ruta || 0)}</td>
            <td class="price-cell">${moneyFormatter.format(f.precio)}</td>
            <td class="actions-cell">${actions}</td>
        `;
        tbody.appendChild(tr);
    });
}

function buscarFletes() { listarFletes(true); }

window.editarFlete = async function (id) {
    const { session } = await SupabaseClient.auth.getSession();
    if (session?.user?.user_metadata?.rol === 'admin') return;

    ID_FLETE_EDITANDO = id;

    // Obtener flete específico de la base de datos
    const { data: f, error } = await SupabaseClient.supabase
        .from('vista_fletes_completos')
        .select('*')
        .eq('id', id)
        .single();

    if (error || !f) return;

    const set = (k, v) => {
        const el = document.getElementById("modal-" + k);
        if (el) el.value = v;
    };

    set("placa", f.placa);
    set("contratista", f.contratista);
    set("zona", f.zona);
    set("dia", f.dia);
    set("poblacion", f.poblacion);
    set("auxiliares", f.auxiliares);
    set("no_auxiliares", f.no_auxiliares);
    set("no_pedidos", f.no_pedidos);

    set("valor_ruta", moneyFormatter.format(f.valor_ruta));
    set("is_adicionales", f.adicionales);
    set("total_flete", moneyFormatter.format(f.precio));

    document.getElementById("modalEdicionFlete").classList.add("visible");
};

window.eliminarFlete = async function (id) {
    const { session } = await SupabaseClient.auth.getSession();
    if (session?.user?.user_metadata?.rol === 'admin') {
        Swal.fire({ icon: 'error', title: 'Acceso Denegado', text: 'Solo los operarios pueden eliminar fletes.', background: '#1a1a1a', color: '#fff' });
        return;
    }

    const { isConfirmed } = await Swal.fire({
        title: '¿Eliminar Flete?', icon: 'warning',
        showCancelButton: true, confirmButtonColor: '#d33', confirmButtonText: 'Eliminar',
        background: '#1a1a1a', color: '#fff'
    });

    if (isConfirmed) {
        const result = await SupabaseClient.fletes.delete(id);
        if (result) {
            await listarFletes();
            await actualizarKPI();
            Swal.fire({ title: 'Eliminado', icon: 'success', background: '#1a1a1a', color: '#fff', timer: 1000, showConfirmButton: false });
        } else {
            Swal.fire({ icon: 'error', title: 'Error', text: 'No se pudo eliminar el flete. Verifique que sea el propietario.', background: '#1a1a1a', color: '#fff' });
        }
    }
};

function ocultarModalEdicion() {
    document.getElementById("modalEdicionFlete").classList.remove("visible");
    limpiarFormulario("modal-");
    ID_FLETE_EDITANDO = null;
}

// ==========================================================
// 📊 KPI & DASHBOARD ENRICHMENT
// ==========================================================
async function actualizarKPI() {
    // Obtener estadísticas desde SupabaseClient
    const stats = await SupabaseClient.fletes.getStats();

    // 1. Total Fletes
    const el = document.getElementById("cantFletes");
    if (el) el.innerText = stats.totalFletes;

    // 2. Ingresos Mes Actual
    const kpiIngresos = document.getElementById("kpiIngresos");
    if (kpiIngresos) kpiIngresos.innerText = moneyFormatter.format(stats.ingresosMes);

    // 3. Vehiculos Activos
    const kpiVehiculos = document.getElementById("kpiVehiculos");
    if (kpiVehiculos) kpiVehiculos.innerText = stats.vehiculosActivos;

    await generarGraficos();
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
async function exportarExcel() {
    const { data: fletes, error } = await SupabaseClient.supabase
        .from('vista_fletes_completos')
        .select('*');

    if (error || !fletes || fletes.length === 0) return Swal.fire("Info", "Sin datos para exportar", "info");

    const ws = XLSX.utils.json_to_sheet(fletes);
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, "Fletes");
    XLSX.writeFile(wb, "Reporte_Fletes.xlsx");
}

async function generarPDF() {
    const { data: fletes, error } = await SupabaseClient.supabase
        .from('vista_fletes_completos')
        .select('*');

    if (error || !fletes || fletes.length === 0) return Swal.fire("Info", "Sin datos para exportar", "info");

    const data = fletes.map(f => [
        f.fecha,
        f.placa,
        f.contratista,
        f.zona,
        moneyFormatter.format(f.valor_ruta || 0),
        moneyFormatter.format(f.precio),
        f.no_pedidos || 0,
        ''
    ]);

    const { jsPDF } = window.jspdf;

    // 1. INICIALIZACIÓN EN HORIZONTAL (landscape)
    const doc = new jsPDF({
        orientation: 'l', // 'l' es para landscape
        unit: 'mm',
        format: 'a4'
    });

    // LOGO INTEGRATION
    const imgEl = document.querySelector(".logo-img");
    if (imgEl) {
        const canvas = document.createElement("canvas");
        canvas.width = imgEl.naturalWidth;
        canvas.height = imgEl.naturalHeight;
        const ctx = canvas.getContext("2d");
        ctx.drawImage(imgEl, 0, 0);
        try {
            const imgData = canvas.toDataURL("image/png");
            doc.addImage(imgData, 'PNG', 14, 10, 30, 0);
        } catch (e) {
            console.warn("Error con el logo", e);
        }
    }

    // 2. AJUSTE DE TEXTOS (Ahora el ancho es 297mm)
    doc.setFontSize(18);
    doc.text("Planilla de Despacho - FletesApp", 50, 20);
    doc.setFontSize(11);
    doc.text(`Fecha de Impresión: ${new Date().toLocaleDateString()}`, 50, 28);

    // 3. TABLA AUTOMÁTICA
    doc.autoTable({
        head: [['Fecha', 'Placa', 'Conductor', 'Zona', 'Valor Ruta', 'Valor Flete', 'Pedidos', 'Firma Conductor']],
        body: data,
        startY: 45,
        theme: 'grid',
        styles: { fontSize: 10, cellPadding: 3 }, // Subí un poco el tamaño de fuente ya que hay más espacio
        // Opcional: ajustar anchos de columna para aprovechar el espacio horizontal
        columnStyles: {
            7: { cellWidth: 40 } // Más espacio para la firma
        }
    });

    doc.save("Reporte_Fletes.pdf");
}

window.generarPDFReporte = generarPDF; // Alias for HTML button

// ==========================================================
// 📊 GRÁFICOS (COLORFUL)
// ==========================================================
let myChart = null;
let myChart2 = null;

async function generarGraficos() {
    const { session } = await SupabaseClient.auth.getSession();
    // Permitir a todos ver gráficos si están en la pestaña

    const ctx = document.getElementById("chartZonas");
    const ctx2 = document.getElementById("chartIngresos");
    if (!ctx) return;

    // Obtener todos los fletes para graficar
    const { data: fletes, error } = await SupabaseClient.supabase.from('fletes').select('zona, precio, fecha');
    if (error || !fletes) return;

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

    // --- Chart 2: Ingresos por Mes ---
    if (!ctx2) return;
    const ingresosPorMes = {};
    fletes.forEach(f => {
        const mesKey = f.fecha.substring(0, 7);
        ingresosPorMes[mesKey] = (ingresosPorMes[mesKey] || 0) + parseFloat(f.precio);
    });

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
document.addEventListener("DOMContentLoaded", async () => {
    try {
        console.log("🚀 FletesApp Inicializando con Supabase...");

        setupTheme(); // Init Theme
        await checkAuth();  // Init Auth & Role UI (Async)

        // Carga inicial de datos en paralelo
        Promise.all([
            listarVehiculos(),
            listarFletes(),
            actualizarKPI()
        ]).then(() => console.log("✅ Datos cargados"));

        // 1. Navigation
        const tabs = document.querySelectorAll(".nav-item");
        tabs.forEach(t => {
            t.addEventListener("click", async () => {
                const target = t.dataset.tab;
                const session = CURRENT_SESSION;
                const role = session?.user?.user_metadata?.rol;

                if (role === 'admin' && target === 'estadisticas') return;

                document.querySelectorAll(".tab-content").forEach(c => c.classList.remove("visible"));
                document.querySelectorAll(".nav-item").forEach(n => n.classList.remove("active"));

                document.getElementById(target).classList.add("visible");
                t.classList.add("active");
                if (target === 'estadisticas') await generarGraficos();
            });
        });

        // 2. Event Listeners
        document.getElementById("btnGestionarFlete")?.addEventListener("click", async (e) => {
            e.preventDefault();
            await crearFlete();
        });

        document.getElementById("btnRegistrarVehiculo")?.addEventListener("click", registrarVehiculoOperario);
        document.getElementById("btnGuardarModal")?.addEventListener("click", guardarCambiosFlete);
        document.getElementById("btnCancelarModal")?.addEventListener("click", ocultarModalEdicion);
        document.getElementById("btnCloseModal")?.addEventListener("click", ocultarModalEdicion);
        document.getElementById("btnLogout")?.addEventListener("click", logout);

        // 3. Exportaciones
        document.getElementById("btnExportarExcel")?.addEventListener("click", async () => {
            await exportarExcel();
        });

        document.getElementById("btnExportarPDF")?.addEventListener("click", async () => {
            await generarPDF();
        });

        // 4. Filtros
        document.getElementById("buscarFlete")?.addEventListener("keyup", buscarFletes);
        document.getElementById("filtroZona")?.addEventListener("change", buscarFletes);
        document.getElementById("filtroFecha")?.addEventListener("change", buscarFletes);

        // 5. Configuración Lógica
        buscarConductorPorPlaca("placa", "contratista");
        buscarConductorPorPlaca("modal-placa", "modal-contratista");

        setupCalculators("");
        setupCalculators("modal-");

        // 7. Menu Mobile
        document.getElementById("menuToggleBtn")?.addEventListener("click", () => {
            document.querySelector(".sidebar").classList.toggle("open");
        });

    } catch (error) {
        console.error("❌ Error Crítico en inicialización:", error);
    }
});