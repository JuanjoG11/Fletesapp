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

        // Redirect if on forbidden tab
        const activeTab = document.querySelector('.nav-item.active')?.dataset.tab;
        if (['admin-crear'].includes(activeTab)) {
            document.querySelector('[data-tab="inicio"]')?.click();
        }
    } else {
        // PERFIL OPERARIO (AHORA CREA FLETES Y VE ESTADÍSTICAS)
        if (navFletes) navFletes.style.display = 'flex';
        if (navVehiculos) navVehiculos.style.display = 'none';
        if (navCrear) navCrear.style.display = 'flex';
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

    // Sanitizar placa: Mayúsculas, sin espacios, sin guiones
    const placa = placaInput.value.toUpperCase().replace(/[\s-]/g, '').trim();
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
    "AGUADAS": 690000,
    "AGUADAS-PACORA": 740000,
    "AGUILA-ANSERMA NUEVO": 317000,
    "ALCALA ULLOA": 235000,
    "ANSERMA": 332000,
    "ANSERMA NUEVO": 280000,
    "APIA- PUEBLO RICO": 320000,
    "ARABIA - ALTAGRACIA": 230000,
    "ARANZAZU FILADELFIA": 425000,
    "ARGELIA EL CAIRO": 335000,
    "ARGELIA-EL CAIRO": 338000,
    "ARMENIA": 295000,
    "BALBOA LA CELIA": 350000,
    "BELAL RDA SJOSE": 320000,
    "BELEN": 305000,
    "BELEN MISTRATO": 425000,
    "CAICEDONIA": 336000,
    "CAIMO BARCELONA": 315000,
    "CALARCA": 312000,
    "CARTAGO": 250000,
    "CHINCHINA": 250000,
    "CIRCASIA": 294000,
    "CORDOBA PIJAO BVISTA": 350000,
    "CUBA": 200000,
    "DOSQUEBRADAS": 208000,
    "EL AGUILA": 305000,
    "EL AGUILA - VILLANUEVA": 330000,
    "FILANDIA": 350000,
    "GENOVA": 385000,
    "GUATICA": 368000,
    "IRRA LA FELISA LA MERCED": 445000,
    "LA VIRGINIA": 230000,
    "LA VIRGINA -BELALCAZAR": 282000,
    "MANIZALES": 245000,
    "MANIZALES - VILLAMARIA": 305000,
    "MANIZALES-DESDE PEREIRA-CARGA EXTRA": 295000,
    "MARMATO": 499000,
    "MARSELLA": 259000,
    "MISTRATO": 362000,
    "MONTENEGRO": 260000,
    "MONTENEGRO - P TAPAO": 275000,
    "NEIRA": 340000,
    "PACORA": 670000,
    "PALESTINA ARAUCA LA PLATA": 280000,
    "PEREIRA": 208000,
    "PUEBLO RICO": 305000,
    "QUIMBAYA": 245000,
    "QUINCHIA": 439000,
    "RIOSUCIO": 545000,
    "SANTA CECILIA": 368000,
    "SANTA ROSA": 212000,
    "SANTUARIO": 284000,
    "SANTUARIO APIA": 284000,
    "SUPIA": 505000,
    "SUPIA-MARMATO": 590000,
    "TEBAIDA": 305000,
    "VITERBO": 323000
};

const COSTO_ADICIONAL = 60000;
const COSTO_POR_AUXILIAR = 30000; // Costo adicional por cada auxiliar

function calcularTotal(prefix = "") {
    const poblacionId = prefix + "poblacion";
    const adicId = prefix + "is_adicionales";
    const noAuxId = prefix + "no_auxiliares";
    const totalId = prefix + "total_flete";
    const rutaId = prefix + "valor_ruta";
    const porcId = prefix + "porcentaje_ruta";

    const poblacionEl = document.getElementById(poblacionId);
    const adicionalesEl = document.getElementById(adicId);
    const noAuxEl = document.getElementById(noAuxId);
    const totalEl = document.getElementById(totalId);
    const rutaEl = document.getElementById(rutaId);
    const porcEl = document.getElementById(porcId);

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

    // Lógica del 4% (Valor Ruta / Total Flete)
    if (rutaEl && porcEl) {
        const valorPedidos = parseMoney(rutaEl.value);
        if (total > 0 && valorPedidos > 0) {
            const porcentaje = (total / valorPedidos) * 100;
            porcEl.value = porcentaje.toFixed(1) + "%";

            if (porcentaje > 4) {
                porcEl.style.color = "#ff4d4d"; // Rojo vibrante
            } else {
                porcEl.style.color = "var(--secondary)"; // Verde esmeralda para valores correctos
            }
        } else {
            porcEl.value = "0%";
            porcEl.style.color = "inherit";
        }
    }
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
        inputRuta.addEventListener("input", () => calcularTotal(prefix));
        inputRuta.addEventListener("blur", function () {
            formatMoneyInput(this);
            calcularTotal(prefix);
        });
    }
}

// ==========================================================
// 📝 FLETES C.R.U.D
// ==========================================================
async function obtenerDatosFormulario(prefix = "") {
    const p = prefix;
    const val = (id) => document.getElementById(p + id)?.value || "";

    const placa = val("placa").toUpperCase().replace(/[\s-]/g, '').trim();
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
    const btn = document.getElementById("btnGestionarFlete");
    if (btn) btn.disabled = true;

    const { db, ui } = await obtenerDatosFormulario("");

    if (!ui.placa || !db.contratista || !db.zona || db.precio <= 0) {
        Swal.fire({
            icon: 'warning', title: 'Faltan Datos', text: 'Verifique Placa, Conductor, Zona y Valor.',
            background: '#1a1a1a', color: '#fff'
        });
        if (btn) btn.disabled = false;
        return;
    }

    // --- Optimistic UI Update ---
    // Guardamos una copia temporal para la UI
    const tempFlete = { ...db, id: 'temp-' + Date.now(), placa: ui.placa };
    CACHED_FLETES.unshift(tempFlete);
    renderTable(CACHED_FLETES);
    limpiarFormulario(""); // Limpiar inmediatamente

    const result = await SupabaseClient.fletes.create(db);

    if (result.success) {
        await listarFletes(true);
        actualizarKPI();

        Swal.fire({
            icon: 'success', title: 'Guardado', text: `Flete de ${ui.placa} registrado.`,
            timer: 1000, showConfirmButton: false, background: '#1a1a1a', color: '#fff'
        });
    } else {
        // Revertir cambio local si falla
        await listarFletes(true);
        Swal.fire({ icon: 'error', title: 'Error', text: 'No se pudo guardar: ' + (result.error || 'Error'), background: '#1a1a1a', color: '#fff' });
    }

    if (btn) btn.disabled = false;
}

async function guardarCambiosFlete() {
    const btn = document.getElementById("btnGuardarModal");
    if (btn) btn.disabled = true;

    const { db, ui } = await obtenerDatosFormulario("modal-");
    delete db.id; // IMPORTANTE: Supabase falla si intentas actualizar la PK 'id'

    if (!ui.placa || !db.contratista || !db.zona || db.precio <= 0) {
        if (btn) btn.disabled = false;
        return Swal.fire({ icon: 'warning', title: 'Faltan Datos', background: '#1a1a1a', color: '#fff' });
    }

    // Optimismo: Actualizar localmente inmediatamente
    const index = CACHED_FLETES.findIndex(f => f.id === ID_FLETE_EDITANDO);
    const oldFlete = index !== -1 ? { ...CACHED_FLETES[index] } : null;

    if (index !== -1) {
        CACHED_FLETES[index] = { ...CACHED_FLETES[index], ...db, placa: ui.placa };
        renderTable(CACHED_FLETES);
    }

    const idToUpdate = ID_FLETE_EDITANDO;
    ocultarModalEdicion();
    const result = await SupabaseClient.fletes.update(idToUpdate, db);

    if (result.success) {
        await listarFletes(true);
        actualizarKPI();
        Swal.fire({ icon: 'success', title: 'Actualizado', background: '#1a1a1a', color: '#fff', timer: 1000, showConfirmButton: false });
    } else {
        // Revertir
        if (oldFlete && index !== -1) CACHED_FLETES[index] = oldFlete;
        renderTable(CACHED_FLETES);
        console.error("Error al actualizar flete:", result.error);
        Swal.fire({ icon: 'error', title: 'Error', text: 'No se pudo actualizar: ' + (result.error || 'Error desconocido'), background: '#1a1a1a', color: '#fff' });
    }

    if (btn) btn.disabled = false;
}

function limpiarFormulario(prefix) {
    const fields = [
        "placa", "contratista", "zona", "dia", "poblacion",
        "auxiliares", "no_auxiliares", "no_pedidos",
        "valor_ruta", "is_adicionales", "total_flete",
        "porcentaje_ruta", "fecha"
    ];

    fields.forEach(f => {
        const el = document.getElementById(prefix + f);
        if (!el) return;

        if (el.tagName === 'SELECT') {
            el.selectedIndex = 0;
            // Solo disparar change si no es el total (para evitar bucles)
            if (f !== "total_flete") el.dispatchEvent(new Event('change'));
        } else {
            el.value = "";
        }
    });

    // Limpiar estilos específicos
    const cond = document.getElementById(prefix + "contratista");
    if (cond) {
        cond.style.borderColor = "var(--glass-border)";
        cond.style.boxShadow = "none";
    }

    const porc = document.getElementById(prefix + "porcentaje_ruta");
    if (porc) {
        porc.style.color = "inherit";
        porc.value = "0%";
    }
}

// ==========================================================
// 📋 LISTADOS & ACCIONES
// ==========================================================
async function listarFletes(silencioso = false) {
    const tbody = document.getElementById("tablaFletes");
    if (!tbody) return;

    if (!silencioso && CACHED_FLETES.length === 0) {
        tbody.innerHTML = `<tr><td colspan="9" style="text-align:center"><i class="ri-loader-4-line rotate"></i> Cargando...</td></tr>`;
    }

    const { data, error } = await SupabaseClient.supabase
        .from('vista_fletes_completos')
        .select('*')
        .order('created_at', { ascending: false });

    if (!error && data) {
        CACHED_FLETES = data;
        renderTable(CACHED_FLETES);
    }
}

function renderTable(fletes) {
    const tbody = document.getElementById("tablaFletes");
    if (!tbody) return;

    // Filtros sobre cache (Instantáneo)
    const q = document.getElementById("buscarFlete")?.value.toLowerCase() || "";
    const fZona = document.getElementById("filtroZona")?.value || "";
    const fFecha = document.getElementById("filtroFecha")?.value || "";

    const session = CURRENT_SESSION;
    const role = session?.profile?.rol || session?.user?.user_metadata?.rol || 'operario';
    const currentUserId = session?.user?.id;

    const filtered = fletes.filter(f => {
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
        if (f.id && f.id.toString().startsWith('temp-')) tr.style.opacity = "0.5";

        const canEdit = role === 'operario' && f.user_id === currentUserId;

        const actions = canEdit ? `
            <button class="btn-icon edit" onclick="editarFlete('${f.id}')" title="Editar"><i class="ri-edit-line"></i></button>
            <button class="btn-icon delete" onclick="eliminarFlete('${f.id}')" title="Eliminar"><i class="ri-delete-bin-line"></i></button>
        ` : `<span style="font-size:0.7rem; opacity:0.5">${role === 'admin' ? 'Solo Lectura' : 'No Propietario'}</span>`;

        tr.innerHTML = `
            <td>${f.fecha}</td>
            <td>${f.dia || '-'}</td>
            <td><strong>${f.contratista}</strong></td>
            <td><span class="badge-plate">${f.placa}</span></td>
            <td>${f.zona || '-'}</td>
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

    set("fecha", f.fecha);
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

    calcularTotal("modal-"); // Calcular porcentaje inicial en el modal

    document.getElementById("modalEdicionFlete").classList.add("visible");
};

window.eliminarFlete = async function (id) {
    const { session } = await SupabaseClient.auth.getSession();
    if (session?.user?.user_metadata?.rol === 'admin') {
        Swal.fire({ icon: 'error', title: 'Acceso Denegado', background: '#1a1a1a', color: '#fff' });
        return;
    }

    const { isConfirmed } = await Swal.fire({
        title: '¿Eliminar?', icon: 'warning', showCancelButton: true,
        confirmButtonColor: '#d33', confirmButtonText: 'Eliminar', background: '#1a1a1a', color: '#fff'
    });

    if (isConfirmed) {
        // Optimismo: Eliminar localmente
        const index = CACHED_FLETES.findIndex(f => f.id === id);
        const removed = index !== -1 ? CACHED_FLETES[index] : null;

        if (index !== -1) {
            CACHED_FLETES.splice(index, 1);
            renderTable(CACHED_FLETES);
        }

        const result = await SupabaseClient.fletes.delete(id);
        if (result) {
            actualizarKPI();
            Swal.fire({ title: 'Eliminado', icon: 'success', background: '#1a1a1a', color: '#fff', timer: 1000, showConfirmButton: false });
        } else {
            // Revertir
            if (removed) CACHED_FLETES.splice(index, 0, removed);
            renderTable(CACHED_FLETES);
            Swal.fire({ icon: 'error', title: 'Error', background: '#1a1a1a', color: '#fff' });
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
            // Re-generar gráficos para aplicar nuevos colores de tema
            generarGraficos();
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

    let totalRuta = 0;
    let totalFletes = 0;
    let totalPedidosCount = 0;

    const data = fletes.map(f => {
        const vRuta = f.valor_ruta || 0;
        const vFlete = f.precio || 0;
        const numPed = f.no_pedidos || 0;

        totalRuta += vRuta;
        totalFletes += vFlete;
        totalPedidosCount += numPed;

        const participacion = vRuta > 0 ? ((vFlete / vRuta) * 100).toFixed(1) + '%' : '0%';

        return [
            f.zona || '',
            f.placa,
            f.contratista,
            f.auxiliares || '',
            numPed,
            moneyFormatter.format(vRuta),
            f.poblacion || '',
            moneyFormatter.format(vFlete),
            participacion,
            ''
        ];
    });

    // Añadir fila de totales
    data.push([
        { content: 'TOTALES', colSpan: 4, styles: { fontStyle: 'bold', fillColor: [240, 240, 240] } },
        { content: totalPedidosCount, styles: { fontStyle: 'bold', fillColor: [240, 240, 240] } },
        { content: moneyFormatter.format(totalRuta), styles: { fontStyle: 'bold', fillColor: [240, 240, 240] } },
        { content: '', styles: { fillColor: [240, 240, 240] } },
        { content: moneyFormatter.format(totalFletes), styles: { fontStyle: 'bold', fillColor: [240, 240, 240] } },
        { content: (totalRuta > 0 ? (totalFletes / totalRuta * 100).toFixed(1) + '%' : '0%'), styles: { fontStyle: 'bold', fillColor: [240, 240, 240] } },
        { content: '', styles: { fillColor: [240, 240, 240] } }
    ]);

    const { jsPDF } = window.jspdf;

    const doc = new jsPDF({
        orientation: 'l',
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
            doc.addImage(imgData, 'PNG', 10, 10, 20, 0);
        } catch (e) {
            console.warn("Error con el logo", e);
        }
    }

    // CABECERA SEGÚN MUESTRA
    const fechaActual = new Date().toLocaleDateString();
    const title = `PLANILLA FLETES TIENDAS Y MARCAS EJE CAFETERO NIT 9009739329 - ${fechaActual}`;
    doc.setFontSize(14);
    doc.setFont(undefined, 'bold');
    doc.text(title, doc.internal.pageSize.getWidth() / 2, 18, { align: 'center' });

    doc.setFontSize(9);
    doc.setFont(undefined, 'normal');

    // 3. TABLA AUTOMÁTICA (Match exacto con imagen)
    doc.autoTable({
        head: [['RUTA', 'PLACA', 'CONDUCTOR', 'AUXILIAR', '# PEDIDO', 'VR. PEDIDO', 'POBLACIÓN', 'VALOR FLETE', 'PARTICIPACION', 'FIRMA CONDUCTOR']],
        body: data,
        startY: 30,
        theme: 'grid',
        styles: { fontSize: 7.5, cellPadding: 1.5 },
        headStyles: { fillColor: [220, 220, 220], textColor: [0, 0, 0], fontStyle: 'bold' },
        columnStyles: {
            9: { cellWidth: 30 } // Espacio firma
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

    // --- Chart 2: Ingresos por Día (Desde el primer flete registrado) ---
    if (!ctx2) return;

    if (fletes.length === 0) return;

    // Agrupar ingresos por dia y encontrar la fecha mas antigua
    const ingresosPorDia = {};
    let minDate = new Date(); // Por defecto hoy

    fletes.forEach(f => {
        const dayKey = f.fecha; // YYYY-MM-DD
        ingresosPorDia[dayKey] = (ingresosPorDia[dayKey] || 0) + parseFloat(f.precio);

        const currentFleteDate = new Date(dayKey + 'T00:00:00'); // Asegurar local time
        if (currentFleteDate < minDate) {
            minDate = currentFleteDate;
        }
    });

    const labelsAll = [];
    const fullLabelsAll = [];
    const dayNames = ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'];

    // Generar días desde la fecha mínima hasta hoy
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    const start = new Date(minDate);
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

    // Si hay demasiados días (ej: mas de 14), limitamos a los últimos 14 para mantener estética, 
    // o dejamos que el usuario vea todo si prefiere. Por ahora, mostramos todo desde el inicio.
    // Pero si es mucho, Chart.js lo manejará.

    const dataVals = fullLabelsAll.map(l => ingresosPorDia[l.key] || 0);

    const theme = document.documentElement.getAttribute("data-theme") || "dark";

    // Paletas según el tema
    const darkNeonPalette = ['#FF3D71', '#3366FF', '#00D68F', '#FFAA00', '#FF8918', '#8F00FF', '#00E096'];
    const lightHarmonyPalette = ['#3b82f6', '#f59e0b', '#60a5fa', '#fbbf24', '#2563eb', '#f97316', '#34d399'];

    const activePalette = theme === 'light' ? lightHarmonyPalette : darkNeonPalette;
    const textColor = theme === 'light' ? '#64748b' : '#94a3b8';
    const gridColor = theme === 'light' ? 'rgba(0, 0, 0, 0.05)' : 'rgba(148, 163, 184, 0.05)';

    if (myChart2) myChart2.destroy();

    const ctxTemp = ctx2.getContext('2d');
    const backgroundColors = fullLabelsAll.map((_, i) => {
        const color = activePalette[i % activePalette.length];
        const g = ctxTemp.createLinearGradient(0, 0, 0, 300);
        g.addColorStop(0, color);
        g.addColorStop(1, color + (theme === 'light' ? '99' : '66')); // Ajuste opacidad según fondo
        return g;
    });
    const borderColors = fullLabelsAll.map((_, i) => activePalette[i % activePalette.length]);

    myChart2 = new Chart(ctx2, {
        type: 'bar',
        data: {
            labels: labelsAll,
            datasets: [{
                label: 'Ingresos Diarios',
                data: dataVals,
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
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: false
                    },
                    ticks: {
                        color: textColor,
                        font: { family: 'Inter', size: 11, weight: '600' },
                        callback: function (value) {
                            return moneyFormatter.format(value);
                        }
                    },
                    grid: { color: gridColor, drawBorder: false }
                },
                x: {
                    ticks: {
                        color: textColor,
                        font: { family: 'Inter', size: 10, weight: '600' },
                        maxRotation: labelsAll.length > 7 ? 45 : 0
                    },
                    grid: { display: false }
                }
            },
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
                            const info = fullLabelsAll[idx];
                            return `${info.dayName}, ${info.date}`;
                        },
                        label: function (context) {
                            return ' 💰 Ingresos: ' + moneyFormatter.format(context.raw) + ' COP';
                        }
                    }
                }
            }
        }
    });
}


// ==========================================================
// 📂 IMPORTACIÓN MASIVA DESDE EXCEL
// ==========================================================
async function procesarExcelVehiculos(event) {
    const file = event.target.files[0];
    if (!file) return;

    Swal.fire({
        title: 'Procesando Excel...',
        text: 'Estamos validando y cargando tus vehículos',
        allowOutsideClick: false,
        didOpen: () => {
            Swal.showLoading();
        },
        background: '#1e293b',
        color: '#fff'
    });

    const reader = new FileReader();
    reader.onload = async (e) => {
        try {
            const data = new Uint8Array(e.target.result);
            const workbook = XLSX.read(data, { type: 'array' });
            const firstSheet = workbook.Sheets[workbook.SheetNames[0]];
            const jsonData = XLSX.utils.sheet_to_json(firstSheet);

            if (jsonData.length === 0) {
                throw new Error("El archivo Excel está vacío.");
            }

            // Normalizar y mapear datos
            const mapVehiculos = new Map();

            jsonData.forEach(row => {
                // Buscamos columnas que se parezcan a Placa, Conductor, Modelo
                let placaRaw = row.Placa || row.PLACA || row.placa || Object.values(row)[0];
                let conductor = row.Conductor || row.CONDUCTOR || row.conductor || Object.values(row)[1];
                let modelo = row.Modelo || row.MODELO || row.modelo || Object.values(row)[2];

                if (placaRaw && conductor) {
                    // Sanitizar placa: Mayúsculas, sin espacios, sin guiones
                    const placa = placaRaw.toString().toUpperCase().replace(/[\s-]/g, '');

                    // Guardar en Map (si la placa ya existe, se sobrescribe con la última del Excel)
                    mapVehiculos.set(placa, {
                        placa,
                        conductor: conductor.toString().trim(),
                        modelo: (modelo || 'Estándar').toString().trim()
                    });
                }
            });

            const vehiculosArr = Array.from(mapVehiculos.values());

            if (vehiculosArr.length === 0) {
                throw new Error("No se encontraron vehículos válidos. Asegúrate de tener al menos las columnas Placa y Conductor.");
            }

            const result = await SupabaseClient.vehiculos.importar(vehiculosArr);

            if (result.success) {
                await listarVehiculos();
                await actualizarKPI();
                Swal.fire({
                    icon: 'success',
                    title: '¡Importación Exitosa!',
                    text: `Se han registrado ${result.count} vehículos correctamente.`,
                    background: '#1e293b',
                    color: '#fff'
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Error en la Importación',
                    text: result.error,
                    background: '#1e293b',
                    color: '#fff'
                });
            }
        } catch (error) {
            console.error("Error procesando Excel:", error);
            Swal.fire({
                icon: 'error',
                title: 'Error de Lectura',
                text: error.message || 'Verifica el formato del archivo Excel.',
                background: '#1e293b',
                color: '#fff'
            });
        } finally {
            event.target.value = ''; // Limpiar input
        }
    };
    reader.readAsArrayBuffer(file);
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

                if (role === 'admin' && target === 'estadisticas') return; // Fallback removal logic

                document.querySelectorAll(".tab-content").forEach(c => c.classList.remove("visible"));
                document.querySelectorAll(".nav-item").forEach(n => n.classList.remove("active"));

                document.getElementById(target).classList.add("visible");
                t.classList.add("active");
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