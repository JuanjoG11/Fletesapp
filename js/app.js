let FLOTA_VEHICULOS = [];
let ID_FLETE_EDITANDO = null;
let CURRENT_SESSION = null; // Cache para la sesión
let CACHED_FLETES = [];     // Cache para listados rápidos
let CURRENT_RAZON_SOCIAL = null; // 'TYM' o 'TAT'

const MAPA_CONTRATISTAS = {
    "PEK019": "JOSE MIGUEL TABARES URIBE",
    "PEG541": "JORGE HERNAN RAMIREZ BUSTAMANTE",
    "EST067": "CARLOS ARTURO CAMPÍÑO",
    "TNH494": "ADALBERTO MEJIA AMARILES",
    "SPQ814": "CARLOS ALBERTO VELASCO MARIN",
    "ERK303": "ROSMIRA MEJIA AMARILES",
    "WHM896": "ALEXANDER CUELLAR ESCALANTE",
    "WHM317": "ANGIE GONZALEZ VASQUEZ",
    "SMH182": "ANDRES FELIPE QUINTERO PLAZA",
    "TTL256": "ANDRES FELIPE QUINTERO PLAZA",
    "TIJ795": "ANDRES FELIPE QUINTERO PLAZA",
    "SZD552": "ANDRES FELIPE QUINTERO PLAZA",
    "ZNN421": "ANDRES FELIPE QUINTERO PLAZA",
    "TMZ674": "RICARDO LOPEZ TORO",
    "WFV015": "DANIELA DIAZ LOPEZ",
    "SKP033": "DANIELA DIAZ LOPEZ",
    "TUL630": "DANIELA DIAZ LOPEZ",
    "ESU446": "ALEJANDRO PULGARIN RESTREPO",
    "XVI496": "CRISTIAN ANDRES GIRALDO GONZALEZ",
    "LUM993": "CRISTIAN ANDRES GIRALDO GONZALEZ",
    "EQY944": "GOVER CRISTANCHO VILLADA",
    "WTN748": "DIEGO ALEJANDRO RATIVA",
    "VZD334": "JULIAN CUELLAR",
    "WGZ876": "VALENTINA GUZMAN VALENCIA",
    "SRJ686": "VALENTINA GUZMAN VALENCIA",
    "SYU652": "VALENTINA GUZMAN VALENCIA",
    "SXF257": "ELIO FABIO RUIZ HINCAPIE",
    "WHN436": "JOHN MAURICIO DIAZ HIDALGO",
    "EYX091": "CARLOS ANDRES GOMEZ",
    "KOL802": "ADOLFO ENRIQUE OSPINO TREJOS",
    "WHU866": "GERMAN AUGUSTO BERNAL HOLGUIN",
    "CRZ810": "BLANCA INES HIDALGO DE DIAZ",
    "EYY183": "RUBEN DARIO ESCOBAR DELGADO",
    "TRL186": "RUBEN DARIO ESCOBAR DELGADO",
    "TDY481": "JHON SANDRO ZULUAGA BARRERA",
    "WLL481": "DAVID RAMIREZ BUENO",
    "SQB119": "CARLOS ARTURO CASTAÑO CHALARCA",
    "EST392": "JHON FREDY SUAREZ MONTOYA",
    "WLC133": "GABRIEL EDUARDO PEREZ REDONDO",
    "SMO183": "GABRIEL EDUARDO PEREZ REDONDO",
    "SJT873": "JUAN CARLOS ARANGO QUINTERO",
    "VBP660": "CARLOS ALBERTO MOLINA HERNANDEZ",
    "SPO480": "HERNANDO MONTES VELASQUEZ",
    "WHM622": "CARLOS ARTURO VELEZ HERRERA",
    "WHM489": "GILBERTO ANDRES CARDONA HERRERA",
    "SWN905": "LEONARDO ECHEVERRY RAMIREZ",
    "PED694": "LUIS DENIS RAMIREZ CEVEDO",
    "WHM895": "JAIRO RIVILLAS AGUDELO",
    "ZNX985": "ABSALON GALVEZ GIL",
    "MAT480": "HELGUIN AGUIRRE",
    "WHM930": "JOSE ORLANDO OSORIO",
    "BCS450": "CRISTIAN DAVID ZULUAGA BUITRAGO",
    "SPU120": "ANGEL OSWALDO IBARRA DIAZ",
    "ZOC960": "WILSON LEMOS",
    // También incluimos los previos por si acaso no estaban en la lista nueva
    "SQP463": "MAURICIO GIGANTE",
    "GAV540": "DANIELA MEILLY",
    "TAW611": "TRANS GIGANTE",
    "WDI215": "ALEXANDER GIGANTE",
    "SKT926": "JOSE MAURICIO PINZON",
    "ELV604": "DANIELA MEILLY",
    "TTX148": "JUAN CARLOS HENAO",
    "TLZ515": "WILIAM GIGANTE",
    "WDI370": "WILIAM GIGANTE",
    "WDI116": "WILMER GIGANTE",
    "WBL566": "MARIO GIGANTE",
    "TLY560": "DANIELA MEILLY",
    "SXP414": "YENNY HENAO",
    "SQD171": "JUAN CARLOS HENAO",
    "TLY775": "MARIO GIGANTE",
    // Vehículos TAT adicionales
    "DQA454": "MARTHA E SALDARRIAGA",
    "ZMN804": "ALEJANDRO VARGAS LONDOÑO",
    "SLJ329": "JOHN FREDY GIRALDO CUERVO",
    "PEQ714": "EDILBERTO MARIN NIETO",
    "EST590": "FREDDY HUMBERTO GALLEGO JIMENEZ",
    "WPP948": "LILIANA GARCIA GUTIERRREZ",
    "TRS860": "GONZALO ALBERTO CONTRERAS AMAYA",
    "VIK442": "DANY ARCILA SALGADO",
    "GTU624": "LUIS FELIPE VALLEJO",
    "ZNN771": "AUGUSTO ARIAS OSORIO",
    "VDX363": "JOSE OSNIDIO MARIN GALVIS",
    "WEF511": "IVAN RICARDO VERGARA LOAIZA",
    "ESK522": "CESAR AUGUSTO TABARES CARDONA",
    "TJQ665": "ALBEIRO RODRIGUEZ"
};

// Configuración específica para TAT
const CONFIG_TAT = {
    proveedores: ['UNILEVER', 'FAMILIA', 'POLAR'],
    zonas: {
        'UNILEVER': [
            { value: 'MXEJ1301', text: 'MXEJ1301' },
            { value: 'MXEJ1300', text: 'MXEJ1300' },
            { value: 'MNEJ1300-TSS', text: 'MNEJ1300-TSS' },
            { value: 'TEJ1300', text: 'TEJ1300' },
            { value: 'TEJ1301', text: 'TEJ1301' },
            { value: 'TEJ1302', text: 'TEJ1302' },
            { value: 'TEJ1303', text: 'TEJ1303' },
            { value: 'TEJ1304', text: 'TEJ1304' },
            { value: 'TEJ1305', text: 'TEJ1305' },
            { value: 'TEJ1306', text: 'TEJ1306' },
            { value: 'TEJ1307', text: 'TEJ1307' },
            { value: 'TEJ1308', text: 'TEJ1308' },
            { value: 'TEJ1400', text: 'TEJ1400' },
            { value: 'TEJ1401', text: 'TEJ1401' },
            { value: 'TEJ1402', text: 'TEJ1402' },
            { value: 'TEJ1403', text: 'TEJ1403' },
            { value: 'TEJ1404', text: 'TEJ1404' },
            { value: 'TEJ1405', text: 'TEJ1405' },
            { value: 'MXEJ1400', text: 'MXEJ1400' },
            { value: 'MNEJ1400', text: 'MNEJ1400' },
            { value: 'MNEJ1401', text: 'MNEJ1401' },
            { value: 'MXEJ1401', text: 'MXEJ1401' },
            { value: 'MXEJ1402', text: 'MXEJ1402' }
        ],
        'FAMILIA': [
            { value: 'FC01', text: 'FC01' },
            { value: 'FC02', text: 'FC02' },
            { value: 'FC03', text: 'FC03' },
            { value: 'FC04', text: 'FC04' }
        ],
        'POLAR': [
            { value: 'PC01', text: 'PC01' },
            { value: 'PC02', text: 'PC02' },
            { value: 'PC03', text: 'PC03' },
            { value: 'PQ01', text: 'PQ01' },
            { value: 'PQ02', text: 'PQ02' },
            { value: 'PQ03', text: 'PQ03' }
        ]
    },
    preciosPoblacion: {}
};

// ==========================================================
// 🛠️ UTILS & FORMATTERS
// ==========================================================
// Nota: save y load ya no se usarán para datos de negocio, solo para UI/Tema
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

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
    let value = input.value.replace(/[^0-9]/g, '');
    if (value === "") {
        input.value = "";
        return;
    }
    const amount = parseInt(value);
    input.value = moneyFormatter.format(amount);
}

// ==========================================================
// 🔐 ROLES & PERMISOS
// ==========================================================
async function checkAuth() {
    // Obtener sesión si no existe
    if (!CURRENT_SESSION) {
        const { session, user: profile } = await window.supabaseClient.obtenerSesionActual();
        if (session) {
            CURRENT_SESSION = { ...session, profile };
        }
    }

    const sessionData = CURRENT_SESSION;

    if (!sessionData) {
        console.warn("⚠️ Sesión no encontrada, redirigiendo a login...");
        window.location.href = "../index.html";
        return;
    }

    const userData = sessionData.profile || sessionData.user?.user_metadata;
    const role = (userData?.rol || 'operario').toLowerCase();
    const userName = userData?.nombre || 'Usuario';
    const razonSocialOrig = userData?.razon_social;
    if (!razonSocialOrig) {
        console.warn("⚠️ Usuario sin razon_social definida, contacte al admin.");
    }
    const razonSocial = (razonSocialOrig || 'TYM').toUpperCase();

    // Almacenar razón social globalmente
    CURRENT_RAZON_SOCIAL = razonSocial;
    // Almacenar razón social globalmente
    CURRENT_RAZON_SOCIAL = razonSocial;

    // Actualizar badge de rol
    const userRoleBadge = document.getElementById("userRoleBadge");
    if (userRoleBadge) {
        const roleText = role === 'admin' ? 'Administrador' : 'Operario Logístico';
        userRoleBadge.textContent = `${roleText} / ${userName}`;
    }

    // Actualizar badge de empresa
    const companyBadge = document.getElementById("companyBadge");
    if (companyBadge) {
        companyBadge.textContent = razonSocial;
        // NARANJA PARA AMBOS (TYM Y TAT)
        companyBadge.style.background = 'rgba(249, 115, 22, 0.15)';
        companyBadge.style.color = '#fb923c';
        companyBadge.style.borderColor = 'rgba(249, 115, 22, 0.3)';
    }

    // Nav Items
    const navFletes = document.getElementById("navFletes");
    const navVehiculos = document.getElementById("navVehiculos");
    const navCrear = document.getElementById("navCrearFlete");
    const navStats = document.getElementById("navEstadisticas");

    const headerAcciones = document.querySelector(".actions-col"); // Para tabla vehiculos
    const headerAccionesFletes = document.querySelector(".admin-actions-col"); // Para tabla fletes

    // Role is already declared above

    // role ya está declarado arriba

    // Control de botones de exportación según rol
    const btnExportarExcel = document.getElementById("btnExportarExcel");
    const btnExportarPDF = document.getElementById("btnExportarPDF");

    if (role === 'admin') {
        // PERFIL ADMIN (GESTIONA VEHÍCULOS Y FLETES)
        if (navFletes) navFletes.style.display = 'flex';
        if (navVehiculos) navVehiculos.style.display = 'flex';
        if (navCrear) navCrear.style.display = 'none';

        if (headerAcciones) headerAcciones.style.display = 'table-cell'; // Vehiculos
        if (headerAccionesFletes) headerAccionesFletes.style.display = 'table-cell'; // Fletes

        // Administradores ven ambos botones de exportación
        if (btnExportarExcel) btnExportarExcel.style.display = 'inline-flex';
        if (btnExportarPDF) btnExportarPDF.style.display = 'inline-flex';
    } else if (role === 'caja') {
        // PERFIL CAJA (SOLO DOWNLOADS, SIN NAVS, DASHBOARD ESPECIAL)
        // Hide Entire Sidebar and Header
        const sidebar = document.querySelector('.sidebar');
        const topbar = document.querySelector('.topbar');
        const mainContent = document.querySelector('.main-content'); // Fix layout

        if (sidebar) sidebar.style.display = 'none';
        if (topbar) topbar.style.display = 'none';

        // Remove sidebar margin from main content and center everything
        if (mainContent) {
            mainContent.style.marginLeft = '0';
            mainContent.style.width = '100%';
            mainContent.style.padding = '0';
            mainContent.style.display = 'flex';
            mainContent.style.alignItems = 'center';
            mainContent.style.justifyContent = 'center';
            mainContent.style.minHeight = '100vh';
        }

        // Hide specific navs (redundant if sidebar is hidden, but good for safety)
        if (navFletes) navFletes.style.display = 'none';
        if (navVehiculos) navVehiculos.style.display = 'none';
        if (navCrear) navCrear.style.display = 'none';

        // Hide standard dashboard grid, show special Caja View
        const inicioSection = document.getElementById("inicio");
        const cajaView = document.getElementById("caja-view");

        if (inicioSection) inicioSection.classList.remove("visible");
        if (cajaView) {
            cajaView.classList.add("visible");
            cajaView.style.display = "flex";
            // Ensure cajaView takes full space available in the centered main
            cajaView.style.width = "100%";
            cajaView.style.justifyContent = "center";
        }

        // Set Caja Header Name
        const cajaNameEl = document.getElementById("cajaUserName");
        if (cajaNameEl) cajaNameEl.textContent = userName;

        // Hide stats nav if exists
        if (navStats) navStats.style.display = 'none';

    } else {
        // PERFIL OPERARIO (GESTIONA FLETES SOLO CREACION)
        if (navFletes) navFletes.style.display = 'flex';
        if (navVehiculos) navVehiculos.style.display = 'none';
        if (navCrear) navCrear.style.display = 'flex';

        if (headerAcciones) headerAcciones.style.display = 'none';
        if (headerAccionesFletes) headerAccionesFletes.style.display = 'none';

        // Operarios solo ven el botón de PDF, NO el de Excel
        if (btnExportarExcel) btnExportarExcel.style.display = 'none';
        if (btnExportarPDF) btnExportarPDF.style.display = 'inline-flex';
    }

    // Explicitly show Dashboard for standard users (since we hid it by default in HTML)
    const inicioSection = document.getElementById("inicio");
    if (inicioSection && role !== 'caja') {
        inicioSection.classList.add("visible");
    }

    // Aplicar configuración según empresa
    aplicarConfiguracionEmpresa(razonSocial);
}

async function logout() {
    await SupabaseClient.auth.logout();
    CURRENT_SESSION = null;
    CURRENT_RAZON_SOCIAL = null;
    window.location.href = "../index.html?logout=true";
}

// ==========================================================
// 🏢 CONFIGURACIÓN POR EMPRESA
// ==========================================================
function aplicarConfiguracionEmpresa(razonSocial) {
    if (razonSocial === 'TAT') {
        // Actualizar proveedores en selectores
        actualizarProveedoresTAT();
    }
}

function actualizarProveedoresTAT() {
    // Actualizar selector principal
    const provSelect = document.getElementById('proveedor');
    if (provSelect) {
        provSelect.innerHTML = `
            <option value="" disabled selected>Seleccione...</option>
            <option>UNILEVER</option>
            <option>FAMILIA</option>
            <option>POLAR</option>
        `;
    }

    // Actualizar selector del modal
    const provSelectModal = document.getElementById('modal-proveedor');
    if (provSelectModal) {
        provSelectModal.innerHTML = `
            <option value="" disabled selected>Seleccione...</option>
            <option>UNILEVER</option>
            <option>FAMILIA</option>
            <option>POLAR</option>
        `;
    }
}


// ==========================================================
// 🚗 AUTO-FILL LOGIC & FLEET MANAGEMENT
// ==========================================================
function buscarConductorPorPlaca(placaId, conductorId) {
    const placaInput = document.getElementById(placaId);
    const conductorInput = document.getElementById(conductorId);

    if (!placaInput || !conductorInput) return;

    placaInput.addEventListener("input", function () {
        // Sanitizar input: Mayúsculas, sin espacios ni guiones
        const val = this.value.toUpperCase().replace(/[\s-]/g, '');
        if (val.length < 3) return;

        // Buscar en cache local
        const vehiculo = FLOTA_VEHICULOS.find(v =>
            v.placa.toUpperCase().replace(/[\s-]/g, '') === val
        );

        if (vehiculo) {
            conductorInput.value = vehiculo.conductor;
            conductorInput.style.borderColor = "#10b981";
            conductorInput.style.boxShadow = "0 0 10px rgba(16, 185, 129, 0.2)";
        } else {
            // Si no está en cache, buscar en servidor (Filtrado por Empresa actual)
            SupabaseClient.vehiculos.getByPlaca(val, CURRENT_RAZON_SOCIAL).then(res => {
                if (res.success && res.data) {
                    conductorInput.value = res.data.conductor;
                    conductorInput.style.borderColor = "#10b981";
                    conductorInput.style.boxShadow = "0 0 10px rgba(16, 185, 129, 0.2)";
                } else {
                    conductorInput.style.borderColor = "var(--glass-border)";
                    conductorInput.style.boxShadow = "none";
                }
            });
        }
    });
}

async function listarVehiculos() {
    const tbody = document.getElementById("tablaVehiculos");
    if (!tbody) return;

    // Elementos de Alertas
    const kpiVencidos = document.getElementById("kpi-vencidos");
    const countVencidos = document.getElementById("v_docs_vencidos");
    const panelAlertas = document.getElementById("panel-alertas");
    const listaAlertas = document.getElementById("lista-alertas");

    // Filtro de búsqueda
    const q = document.getElementById("buscarVehiculo")?.value.toLowerCase() || "";

    // Si no hay cache, cargamos de Supabase
    if (FLOTA_VEHICULOS.length === 0) {
        tbody.innerHTML = `<tr><td colspan="6" style="text-align:center"><i class="ri-loader-4-line rotate"></i> Cargando vehículos...</td></tr>`;
        const res = await SupabaseClient.vehiculos.getAll();
        FLOTA_VEHICULOS = res.success ? res.data : [];
    }

    // Filtrar localmente
    const filtered = FLOTA_VEHICULOS.filter(v => {
        const contratista = (v.contratista || '').toLowerCase();
        const conductor = (v.conductor || '').toLowerCase();
        const placa = (v.placa || '').toLowerCase();
        return placa.includes(q) || conductor.includes(q) || contratista.includes(q);
    });

    if (filtered.length === 0) {
        tbody.innerHTML = `<tr><td colspan="6" style="text-align:center">No se encontraron vehículos</td></tr>`;
        return;
    }

    const hoy = new Date();
    let totalVencidosGral = 0;
    let htmlAlertas = '';

    // OPTIMIZACIÓN: Usar DocumentFragment para minimizar reflujos del DOM
    const fragment = document.createDocumentFragment();

    filtered.forEach(v => {
        const tr = document.createElement("tr");
        const statusBadge = v.activo
            ? '<span class="status-badge-active" style="background: rgba(16, 185, 129, 0.1); color: #10b981; padding: 2px 8px; border-radius: 12px; font-size: 0.75rem;"><i class="ri-checkbox-circle-line"></i> Activo</span>'
            : '<span class="status-badge-inactive" style="background: rgba(239, 68, 68, 0.1); color: #ef4444; padding: 2px 8px; border-radius: 12px; font-size: 0.75rem;"><i class="ri-error-warning-line"></i> Inactivo</span>';

        // Helper para resaltar fechas vencidas
        const formatFecha = (fechaStr) => {
            if (!fechaStr) return '<span style="color:#94a3b8">N/A</span>';
            const venc = new Date(fechaStr);
            const vencido = venc < hoy;
            if (vencido) totalVencidosGral++; // Contar para el panel de alertas si es necesario
            const style = vencido ? 'color: #ef4444; font-weight: 700;' : '';
            return `<span style="${style}">${fechaStr}</span>`;
        };

        const contratista = v.contratista || MAPA_CONTRATISTAS[v.placa] || 'N/A';

        tr.innerHTML = `
            <td><span class="badge-plate">${v.placa}</span></td>
            <td>${v.proveedor || 'N/A'}</td>
            <td>${v.carroceria || 'N/A'}</td>
            <td>${v.capacidad || 'N/A'}</td>
            <td>${v.servicio || 'N/A'}</td>
            <td><span class="badge" style="background: ${v.contrato === 'SI' ? 'rgba(16, 185, 129, 0.1)' : 'rgba(239, 68, 68, 0.1)'}; color: ${v.contrato === 'SI' ? '#10b981' : '#ef4444'}; padding: 2px 8px; border-radius: 12px; font-size: 0.75rem;">${v.contrato || 'SI'}</span></td>
            <td>${contratista}</td>
            <td>${v.doc_contratista || 'N/A'}</td>
            <td>${v.titular_contrato || 'N/A'}</td>
            <td>${v.licencia_transito || 'N/A'}</td>
            <td>${v.conductor}</td>
            <td>${v.cedula_conductor || 'N/A'}</td>
            <td>${v.telefono_conductor || 'N/A'}</td>
            <td>${v.modelo || 'N/A'}</td>
            <td>${formatFecha(v.soat_vencimiento)}</td>
            <td>${formatFecha(v.tecnomecanica_vencimiento)}</td>
            <td>${formatFecha(v.inspeccion_sanitaria_vencimiento)}</td>
            <td>${formatFecha(v.fumigacion_vencimiento)}</td>
            <td>${formatFecha(v.carnet_bpm_vencimiento)}</td>
            <td>${formatFecha(v.licencia_conduccion_vencimiento)}</td>
            <td>${v.arl_afiliacion || 'N/A'}</td>
            <td>${v.eps_afiliacion || 'N/A'}</td>
            <td>${formatFecha(v.examenes_medicos_vencimiento)}</td>
            <td>${statusBadge}</td>
            <td class="actions-cell">
                <button class="btn-icon edit" onclick="abrirModalEditarVehiculo('${v.id}')" title="Editar Vehículo">
                    <i class="ri-edit-line"></i>
                </button>
                <button class="btn-icon ${v.activo ? 'delete' : 'edit'}" onclick="toggleEstadoVehiculo('${v.id}', ${v.activo}, '${v.placa}')" title="${v.activo ? 'Inactivar' : 'Activar'} Vehículo">
                    <i class="${v.activo ? 'ri-close-circle-line' : 'ri-checkbox-circle-line'}"></i>
                </button>
            </td>
        `;
        fragment.appendChild(tr);
    });

    tbody.innerHTML = "";
    tbody.appendChild(fragment);

    // Actualizar Panel de Alertas
    if (totalVencidosGral > 0) {
        if (kpiVencidos) kpiVencidos.style.display = 'flex';
        if (countVencidos) countVencidos.innerText = totalVencidosGral;
        if (panelAlertas) panelAlertas.style.display = 'block';
        if (listaAlertas) listaAlertas.innerHTML = htmlAlertas;
    } else {
        if (kpiVencidos) kpiVencidos.style.display = 'none';
        if (panelAlertas) panelAlertas.style.display = 'none';
    }
}

// Búsqueda de vehículos con Debounce para evitar lag al escribir
const buscarVehiculosDebounced = debounce(() => {
    listarVehiculos();
}, 300);

async function exportarVehiculosExcel() {
    try {
        Swal.fire({
            title: 'Preparando Excel...',
            text: 'Obteniendo base de datos de vehículos',
            allowOutsideClick: false,
            didOpen: () => Swal.showLoading(),
            background: '#1e293b',
            color: '#fff'
        });

        // Siempre exportamos lo que está en memoria (que es lo de la empresa actual)
        const data = FLOTA_VEHICULOS;

        if (!data || data.length === 0) {
            Swal.close();
            return Swal.fire({ icon: 'info', title: 'Sin datos', text: 'No hay vehículos para exportar.', background: '#1e293b', color: '#fff' });
        }

        // Mapear campos para Excel
        const datosMapeados = data.map(v => ({
            'Placa': v.placa,
            'Proveedor': v.proveedor || 'N/A',
            'Carrocería': v.carroceria || 'N/A',
            'Capacidad': v.capacidad || 'N/A',
            'Servicio': v.servicio || 'N/A',
            'Contrato': v.contrato || 'SI',
            'Conductor': v.conductor,
            'Cédula Conductor': v.cedula_conductor || 'N/A',
            'Teléfono': v.telefono_conductor || 'N/A',
            'Modelo': v.modelo || 'N/A',
            'Contratista': v.contratista || MAPA_CONTRATISTAS[v.placa] || 'N/A',
            'Doc. Contratista': v.doc_contratista || 'N/A',
            'Titular Contrato': v.titular_contrato || 'N/A',
            'Licencia Tránsito': v.licencia_transito || 'N/A',
            'SOAT Venc.': v.soat_vencimiento || 'N/A',
            'Tecnomecánica Venc.': v.tecnomecanica_vencimiento || 'N/A',
            'Inspec. Sanitaria Venc.': v.inspeccion_sanitaria_vencimiento || 'N/A',
            'Fumigación Venc.': v.fumigacion_vencimiento || 'N/A',
            'BPM Venc.': v.carnet_bpm_vencimiento || 'N/A',
            'Licencia Cond. Venc.': v.licencia_conduccion_vencimiento || 'N/A',
            'No. Licencia': v.num_licencia_conduccion || 'N/A',
            'ARL': v.arl_afiliacion || 'N/A',
            'EPS': v.eps_afiliacion || 'N/A',
            'Exámenes Médicos Venc.': v.examenes_medicos_vencimiento || 'N/A',
            'Estado': v.activo ? 'ACTIVO' : 'INACTIVO',
            'Empresa': v.razon_social || 'TYM'
        }));

        const wb = XLSX.utils.book_new();
        const ws = XLSX.utils.json_to_sheet(datosMapeados);

        // Ajustar anchos de columna básicos
        const wscols = [
            { wch: 10 }, { wch: 25 }, { wch: 15 }, { wch: 15 }, { wch: 15 },
            { wch: 25 }, { wch: 15 }, { wch: 25 }, { wch: 15 }, { wch: 15 },
            { wch: 15 }, { wch: 15 }, { wch: 15 }, { wch: 15 }, { wch: 15 }
        ];
        ws['!cols'] = wscols;

        XLSX.utils.book_append_sheet(wb, ws, "Vehiculos");

        const fechaStr = new Date().toISOString().split('T')[0];
        const nombreArchivo = `Reporte_Vehiculos_${CURRENT_RAZON_SOCIAL}_${fechaStr}.xlsx`;

        XLSX.writeFile(wb, nombreArchivo);

        Swal.fire({
            icon: 'success',
            title: '¡Éxito!',
            text: 'Archivo descargado correctamente.',
            timer: 2000,
            showConfirmButton: false,
            background: '#1e293b',
            color: '#fff'
        });

    } catch (error) {
        console.error('Error al exportar Excel:', error);
        Swal.fire({ icon: 'error', title: 'Error', text: 'No se pudo generar el Excel.', background: '#1e293b', color: '#fff' });
    }
}

async function abrirModalEditarVehiculo(id) {
    const v = FLOTA_VEHICULOS.find(veh => veh.id === id);
    if (!v) return;

    ID_VEHICULO_EDITANDO = id;

    // Poblar campos base
    document.getElementById("edit-vehiculo-placa").value = v.placa;
    document.getElementById("edit-vehiculo-conductor").value = v.conductor;
    document.getElementById("edit-vehiculo-proveedor").value = v.proveedor || "";
    document.getElementById("edit-vehiculo-cedula_conductor").value = v.cedula_conductor || "";
    document.getElementById("edit-vehiculo-telefono_conductor").value = v.telefono_conductor || "";
    document.getElementById("edit-vehiculo-modelo").value = v.modelo || "";
    document.getElementById("edit-vehiculo-carroceria").value = v.carroceria || "";
    document.getElementById("edit-vehiculo-capacidad").value = v.capacidad || "";
    document.getElementById("edit-vehiculo-servicio").value = v.servicio || "";
    document.getElementById("edit-vehiculo-contrato").value = v.contrato || "SI";
    document.getElementById("edit-vehiculo-contratista").value = v.contratista || MAPA_CONTRATISTAS[v.placa] || "";
    document.getElementById("edit-vehiculo-doc_contratista").value = v.doc_contratista || "";
    document.getElementById("edit-vehiculo-titular_contrato").value = v.titular_contrato || "";
    document.getElementById("edit-vehiculo-licencia_transito").value = v.licencia_transito || "";

    // Poblar fechas y documentos
    const camposFecha = [
        'soat_vencimiento', 'tecnomecanica_vencimiento', 'inspeccion_sanitaria_vencimiento',
        'fumigacion_vencimiento', 'carnet_bpm_vencimiento', 'licencia_conduccion_vencimiento',
        'examenes_medicos_vencimiento'
    ];

    camposFecha.forEach(f => {
        const el = document.getElementById(`edit-vehiculo-${f}`);
        if (el) el.value = v[f] || "";
    });

    // Poblar campos texto adicionales
    document.getElementById("edit-vehiculo-num_licencia_conduccion").value = v.num_licencia_conduccion || "";
    document.getElementById("edit-vehiculo-arl_afiliacion").value = v.arl_afiliacion || "";
    document.getElementById("edit-vehiculo-eps_afiliacion").value = v.eps_afiliacion || "";

    document.getElementById("modalEdicionVehiculo").classList.add("visible");
}

function ocultarModalVehiculo() {
    document.getElementById("modalEdicionVehiculo").classList.remove("visible");
}

async function guardarCambiosVehiculo() {
    const id = ID_VEHICULO_EDITANDO;
    const vData = {
        placa: document.getElementById("edit-vehiculo-placa").value.toUpperCase().replace(/[\s-]/g, '').trim(),
        conductor: document.getElementById("edit-vehiculo-conductor").value.trim(),
        proveedor: document.getElementById("edit-vehiculo-proveedor").value,
        cedula_conductor: document.getElementById("edit-vehiculo-cedula_conductor").value.trim(),
        telefono_conductor: document.getElementById("edit-vehiculo-telefono_conductor").value.trim(),
        modelo: document.getElementById("edit-vehiculo-modelo").value.trim(),
        carroceria: document.getElementById("edit-vehiculo-carroceria").value.trim(),
        capacidad: document.getElementById("edit-vehiculo-capacidad").value.trim(),
        servicio: document.getElementById("edit-vehiculo-servicio").value.trim(),
        contrato: document.getElementById("edit-vehiculo-contrato").value || "SI",
        contratista: document.getElementById("edit-vehiculo-contratista").value.trim(),
        doc_contratista: document.getElementById("edit-vehiculo-doc_contratista").value.trim(),
        titular_contrato: document.getElementById("edit-vehiculo-titular_contrato").value.trim(),
        licencia_transito: document.getElementById("edit-vehiculo-licencia_transito").value.trim(),
        soat_vencimiento: document.getElementById("edit-vehiculo-soat_vencimiento").value || null,
        tecnomecanica_vencimiento: document.getElementById("edit-vehiculo-tecnomecanica_vencimiento").value || null,
        inspeccion_sanitaria_vencimiento: document.getElementById("edit-vehiculo-inspeccion_sanitaria_vencimiento").value || null,
        fumigacion_vencimiento: document.getElementById("edit-vehiculo-fumigacion_vencimiento").value || null,
        carnet_bpm_vencimiento: document.getElementById("edit-vehiculo-carnet_bpm_vencimiento").value || null,
        licencia_conduccion_vencimiento: document.getElementById("edit-vehiculo-licencia_conduccion_vencimiento").value || null,
        num_licencia_conduccion: document.getElementById("edit-vehiculo-num_licencia_conduccion").value.trim(),
        arl_afiliacion: document.getElementById("edit-vehiculo-arl_afiliacion").value.trim(),
        examenes_medicos_vencimiento: document.getElementById("edit-vehiculo-examenes_medicos_vencimiento").value || null,
        eps_afiliacion: document.getElementById("edit-vehiculo-eps_afiliacion").value.trim()
    };

    if (!vData.placa || !vData.conductor) {
        return Swal.fire({ icon: 'warning', title: 'Atención', text: 'Placa y conductor son obligatorios', background: '#1e293b', color: '#fff' });
    }

    // Pre-check: ¿La placa ya existe en otro vehículo?
    const existePlaca = FLOTA_VEHICULOS.find(v => v.placa === vData.placa && v.id !== id);
    if (existePlaca) {
        return Swal.fire({
            icon: 'error',
            title: 'Placa Duplicada',
            text: `Ya existe otro vehículo registrado con la placa ${vData.placa}.`,
            background: '#1e293b',
            color: '#fff'
        });
    }

    Swal.fire({ title: 'Guardando...', allowOutsideClick: false, didOpen: () => Swal.showLoading(), background: '#1e293b', color: '#fff' });

    const result = await SupabaseClient.vehiculos.update(id, vData);

    if (result.success) {
        // OPTIMIZACIÓN: Actualizar cache local en lugar de recargar TODO
        const index = FLOTA_VEHICULOS.findIndex(v => v.id === id);
        if (index !== -1) {
            FLOTA_VEHICULOS[index] = { ...FLOTA_VEHICULOS[index], ...vData };
        }

        await listarVehiculos(); // Esto ahora usará el cache actualizado
        ocultarModalVehiculo();
        Swal.fire({ icon: 'success', title: 'Actualizado', text: 'Vehículo actualizado correctamente', timer: 1500, showConfirmButton: false, background: '#1e293b', color: '#fff' });
    } else {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'No se pudo actualizar el vehículo: ' + (result.error || 'Error desconocido'),
            background: '#1e293b',
            color: '#fff'
        });
    }
}

async function toggleEstadoVehiculo(id, estadoActual, placa) {
    const nuevoEstado = !estadoActual;
    const accion = nuevoEstado ? 'Activar' : 'Inactivar';

    const { isConfirmed } = await Swal.fire({
        title: `¿${accion} Vehículo?`,
        text: `El vehículo con placa ${placa} quedará ${nuevoEstado ? 'activo' : 'inactivo'}. ${nuevoEstado ? '' : 'No se podrán registrar nuevos fletes con este vehículo.'}`,
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: nuevoEstado ? '#10b981' : '#ef4444',
        cancelButtonColor: '#64748b',
        confirmButtonText: `Sí, ${accion.toLowerCase()}`,
        cancelButtonText: 'Cancelar',
        background: '#1e293b',
        color: '#f8fafc'
    });

    if (isConfirmed) {
        const result = await SupabaseClient.vehiculos.update(id, { activo: nuevoEstado });
        if (result.success) {
            FLOTA_VEHICULOS = []; // Reset cache
            await listarVehiculos();
            await actualizarKPI();
            Swal.fire({
                title: nuevoEstado ? 'Activado' : 'Inactivado',
                icon: 'success',
                timer: 1500,
                showConfirmButton: false,
                background: '#1e293b',
                color: '#f8fafc'
            });
        } else {
            Swal.fire({ icon: 'error', title: 'Error', text: 'No se pudo actualizar el estado del vehículo.', background: '#1e293b', color: '#f8fafc' });
        }
    }
}

async function registrarVehiculoOperario() {
    const getVal = (id) => document.getElementById(id)?.value?.trim() || "";

    const placa = getVal("op_placa").toUpperCase().replace(/[\s-]/g, '');
    const conductor = getVal("op_conductor");
    const proveedor = getVal("op_proveedor");
    const cedula_conductor = getVal("op_cedula_conductor");
    const telefono_conductor = getVal("op_telefono_conductor");
    const modelo = getVal("op_modelo") || "Estándar";
    const carroceria = getVal("op_carroceria");
    const capacidad = getVal("op_capacidad");
    const servicio = getVal("op_servicio");
    const contrato = getVal("op_contrato") || "SI";
    const contratista = getVal("op_contratista") || MAPA_CONTRATISTAS[placa] || "N/A";
    const doc_contratista = getVal("op_doc_contratista");
    const titular_contrato = getVal("op_titular_contrato");
    const licencia_transito = getVal("op_licencia_transito");

    // Datos Documentación
    const soat_vencimiento = getVal("op_soat_vencimiento") || null;
    const tecnomecanica_vencimiento = getVal("op_tecnomecanica_vencimiento") || null;
    const inspeccion_sanitaria_vencimiento = getVal("op_inspeccion_sanitaria_vencimiento") || null;
    const fumigacion_vencimiento = getVal("op_fumigacion_vencimiento") || null;
    const carnet_bpm_vencimiento = getVal("op_carnet_bpm_vencimiento") || null;
    const licencia_conduccion_vencimiento = getVal("op_licencia_conduccion_vencimiento") || null;
    const num_licencia_conduccion = getVal("op_num_licencia_conduccion");
    const arl_afiliacion = getVal("op_arl_afiliacion");
    const examenes_medicos_vencimiento = getVal("op_examenes_medicos_vencimiento") || null;
    const eps_afiliacion = getVal("op_eps_afiliacion");

    if (!placa || !conductor) {
        return Swal.fire({ icon: 'warning', title: 'Faltan Datos', text: 'Ingrese Placa y Conductor', background: '#1a1a1a', color: '#fff' });
    }

    const { user } = await SupabaseClient.auth.getSession();

    const result = await SupabaseClient.vehiculos.create({
        placa,
        conductor,
        proveedor,
        cedula_conductor,
        telefono_conductor,
        modelo,
        carroceria,
        capacidad,
        servicio,
        contrato,
        contratista,
        doc_contratista,
        titular_contrato,
        licencia_transito,
        soat_vencimiento,
        tecnomecanica_vencimiento,
        inspeccion_sanitaria_vencimiento,
        fumigacion_vencimiento,
        carnet_bpm_vencimiento,
        licencia_conduccion_vencimiento,
        num_licencia_conduccion,
        arl_afiliacion,
        examenes_medicos_vencimiento,
        eps_afiliacion,
        created_by: user.id
    });

    if (result.success) {
        FLOTA_VEHICULOS = []; // Forzar recarga completa para incluir el nuevo registro con ID
        await listarVehiculos();
        await actualizarKPI();

        // Limpiar campos manualmente
        const inputs = document.querySelectorAll('#operario-vehiculos .input-group input');
        inputs.forEach(i => i.value = "");

        Swal.fire({
            icon: 'success', title: 'Vehículo Registrado',
            text: 'El vehículo ha sido guardado exitosamente.',
            timer: 1500, showConfirmButton: false, background: '#1a1a1a', color: '#fff'
        });
    } else {
        Swal.fire({
            icon: 'error',
            title: 'Error de Registro',
            text: 'No se pudo registrar el vehículo: ' + (result.error || 'Asegúrate de haber ejecutado el SQL en Supabase.'),
            background: '#1a1a1a',
            color: '#fff'
        });
    }
}

// ==========================================================
// 💰 CÁLCULO DE TOTALES BASADO EN POBLACIÓN
// ==========================================================

// Precios por población
const PRECIOS_POBLACION = {
    "AGUADAS": 690000,
    "AGUADAS-PACORA": 728000,
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
    "PEREIRA-DOSQUEBRADAS": 230000,
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

// Precios BASE para TAT (Poblaciones comunes a UNILEVER y FAMILIA)
const PRECIOS_TAT_BASE = {
    'PEREIRA MM CARRO GRANDE': 230000,
    'PEREIRA-DOSQUEBRADAS': 230000,
    'PEREIRA': 195000,
    'DOSQUEBRADAS': 195000,
    'MANIZALES': 191000,
    'SANTA ROSA DE C': 210000,
    'LA VIRGINIA': 226000,
    'BELEN DE UMBRIA': 318000,
    'MISTRATO-VITERBO': 435000,
    'VITERBO': 238000,
    'BELALCAZAR-SAN JOSE': 290000,
    'BELALCAZAR-SAN JOSE-VITERBO': 369000,
    'MARSELLA': 226000,
    'BALBOA-LA CELIA': 277000,
    'SANTUARIO': 265000,
    'APIA': 265000,
    'SANTUARIO APIA': 350000,
    'PUEBLO RICO': 316000,
    'SANTA CECILIA': 395000,
    'PUEBLO RICO-SANTA CECILIA': 435000,
    'MANIZALES MM': 300000,
    'MANIZALES DESDE PEREIRA': 300000,
    'CHINCHINA': 250000,
    'CHINCHINA CON CROSDOQUI': 302000,
    'MANIZALES- LA PLATA- CHINCHINA': 400000,
    'PALESTINA': 226000,
    'ARAUCA': 260000,
    'PALESTINA-ARAUCA': 270000,
    'ARAUCA DESDE BODEGA': 377000,
    'MANIZALES- ARAUCA- QUINCHIA': 437000,
    'SUPIA': 490000,
    'SUPIA-SAN LORENZO': 500000,
    'RIOSUCIO-BONAFON': 550000,
    'ANSERMA': 437000,
    'QUINCHIA-IRRA-41': 408000,
    'PACORA-AGUADAS': 728000,
    'SALAMINA-ARANZASU-NEIRA MM': 487000,
    'MARMATO - LA MERCED-FILADELFIA': 474000,
    'NEIRA': 321000,
    'NEIRA- ARAUCA': 360000,
    'GUATICA-RISARALDA': 437000,
    'MANIZALES CROS': 191000,
};

// Precios ESPECIFICOS para TAT (Combinando base + mayoristas propios)
const PRECIOS_TAT_UNILEVER = {
    ...PRECIOS_TAT_BASE,
    'NEGOCIACIÓN MYMY 1-4 MILLONES': 80000,
    'NEGOCIACIÓN MY1-8 MILLONES': 200000,
    'NEGOCIACION 8-15 MILLONES': 250000,
    'NEGOCIACION MY +15 MILLONES': 300000
};

const PRECIOS_TAT_FAMILIA = {
    ...PRECIOS_TAT_BASE,
    'NEGOCIACIÓN MYMY 1-4 MILLONES': 80000,
    'NEGOCIACIÓN MY4-8 MILLONES': 120000,
    'NEGOCIACIÓN MY8-12 MILLONES': 160000,
    'NEGOCIACIÓN MYMY +12 MILLONES': 200000
};

// Mantenemos este para los reportes unificados
const PRECIOS_TAT_UNIFICADO = {
    ...PRECIOS_TAT_UNILEVER,
    ...PRECIOS_TAT_FAMILIA
};

// Precios ESPECIFICOS para ALPINA y FLEISCHMANN (Actualizado 2025 + 2T)
const PRECIOS_ALPINA = {
    "QUIMBAYA": 260000,
    "MONTENEGRO": 280000,
    "MONTENEGRO - P TAPAO": 305000,
    "ALCALÁ ULLOA": 260000,
    "CAICEDONIA": 336000,
    "TEBAIDA": 310000,
    "CORDOBA PIJAO BVISTA": 370000,
    "GENOVA": 399000,
    "CIRCASIA": 294000,
    "SALENTO": 285000,
    "FILANDIA": 350000,
    "CALARCA": 312000,
    "CAIMO BARCELONA": 340000,
    "ARMENIA": 320000,
    "BALBOA LA CELIA": 284000,
    "SANTUARIO APIA": 284000,
    "SANTA CECILIA": 368000,
    "PUEBLO RICO": 305000,
    "LA VIRGINIA": 230000,
    "ARGELIA EL CAIRO": 335000,
    "EL AGUILA": 305000,
    "EL AGUILA - VILLANUEVA": 330000,
    "MARSELLA": 280000,
    "ARABIA - ALTAGRACIA": 199000,
    "ANSERMA": 332000,
    "BELEN": 332000,
    "MISTRATO": 362000,
    "GUATICA": 368000,
    "VITERBO": 273000,
    "CARTAGO": 250000,
    "CARTAGO 2T": 280000, // 2 Toneladas
    "ANSERMA NUEVO": 250000,
    "ANSERMA NUEVO 2T": 280000, // 2 Toneladas
    "SANTA ROSA": 230000,
    "DOSQUEBRADAS": 190000,
    "PEREIRA": 200000,
    "PEREIRA-DOSQUEBRADAS": 230000,
    "CUBA": 200000,
    "SUPIA": 445000,
    "RIOSUCIO": 485000,
    "MARMATO": 499000,
    "SUPIA-MARMATO": 590000,
    "QUINCHIA": 439000,
    "IRRA LA FELISA LA MERCED": 445000,
    "AGUADAS": 690000,
    "AGUADAS-PACORA": 740000,
    "PACORA": 670000,
    "ARANZAZU FILADELFIA": 425000,
    "BELAL RDA SJOSE": 320000,
    "CHINCHINA": 250000,
    "PALESTINA ARAUCA LA PLATA": 280000,
    "MANIZALES - VILLAMARIA": 305000,
    "NEIRA": 340000,
    "SAN JOSÉ-BELALCAZAR": 320000,
    "CAIRO ARGELIA": 335000


};

// Precios ESPECIFICOS para ZENU
const PRECIOS_ZENU = {
    "SANTA ROSA": 212000,
    "CARTAGO": 270000,
    "PEREIRA": 208000,
    "PEREIRA-DOSQUEBRADAS": 230000,
    "DOSQUEBRADAS": 208000,
    "APIA- PUEBLO RICO": 320000,
    "BELEN": 305000,
    "ARGELIA-EL CAIRO": 338000,
    "SANTUARIO": 284000,
    "ARABIA-ALTAGRACIA": 230000,
    "MARSELLA": 259000,
    "BALBOA LA CELIA": 350000,
    "LA VIRGINA -BELALCAZAR": 282000,
    "BELEN MISTRATO": 425000,
    "AGUILA-ANSERMA NUEVO": 317000,
    "VITERBO": 323000
};

// Precios ESPECIFICOS para POLAR
const PRECIOS_POLAR = {
    "ARMENIA": 295000,
    "MANIZALES-DESDE PEREIRA-CARGA EXTRA": 300000,
    "MANIZALES": 205000,
    "PEREIRA-DOSQUEBRADAS": 230000
};

const COSTO_ADICIONAL = 60000;
const COSTO_POR_AUXILIAR = 30000; // Costo adicional por cada auxiliar

const ZONAS_RISARALDA = ["M9453", "M9454", "M9455", "M9456", "M9457", "M9458", "M9459", "M9460", "P7004", "P7005", "P7006", "P7007", "P7005B", "M9450", "M9451", "E7001-RISARALDA", "DOBLE F"];
const POBLACIONES_RISARALDA = [
    "PEREIRA", "DOSQUEBRADAS", "SANTA ROSA", "SANTA ROSA DE C", "LA VIRGINIA",
    "BELEN DE UMBRIA", "BELEN", "MISTRATO", "GUATICA", "QUINCHIA", "APIA",
    "SANTUARIO", "PUEBLO RICO", "SANTA CECILIA", "BALBOA LA CELIA", "BALBOA-LA CELIA",
    "MARSELLA", "SANTUARIO APIA", "APIA- PUEBLO RICO", "BELEN MISTRATO",
    "PUEBLO RICO-SANTA CECILIA", "GUATICA-RISARALDA", "PEREIRA-DOSQUEBRADAS",
    "PEREIRA MM CARRO GRANDE", "MANIZALES", "CARTAGO", "SAN JOSÉ-BELALCAZAR", "ANSERMA", "CAIRO ARGELIA"
];

const ZONAS_CALDAS = ["M9552", "M9553", "M9554", "M9555", "M9556", "M9557", "M9560", "M9558", "M9559", "P7002", "M9550", "P7000", "P7001", "E7001-CALDAS", "DOBLE F"];
const POBLACIONES_CALDAS = [
    "MANIZALES", "MANIZALES - VILLAMARIA", "CHINCHINA", "NEIRA", "PALESTINA ARAUCA LA PLATA",
    "ARANZAZU FILADELFIA", "RIOSUCIO", "SUPIA", "MARMATO", "PACORA", "AGUADAS",
    "AGUADAS-PACORA", "SUPIA-MARMATO", "IRRA LA FELISA LA MERCED", "ANSERMA",
    "BELEN", "VITERBO", "SAN JOSÉ-BELALCAZAR"
];

const ZONAS_QUINDIO = ["M9601", "M9602", "M9603", "M9604", "M9605", "M9606", "M9600", "P7008", "P7009", "P7010", "DOBLE F"];
const POBLACIONES_QUINDIO = [
    "ARMENIA", "ARMENIA 2T", "QUIMBAYA", "MONTENEGRO", "MONTENEGRO - P TAPAO",
    "CALARCA", "CIRCASIA", "LA TEBAIDA", "TEBAIDA", "FILANDIA", "SALENTO",
    "GENOVA", "PIJAO", "BUENAVISTA", "CORDOBA PIJAO BVISTA", "CAIMO BARCELONA", "CAICEDONIA", "ALCALÁ ULLOA"
];

// Master list storage
let MASTER_ZONAS = [];
let MASTER_ZONAS_MODAL = [];
// Cache para poblaciones
let MASTER_POBLACIONES = null;

function actualizarPoblaciones(prefix = "") {
    const provEl = document.getElementById(prefix + "proveedor");
    const pobEl = document.getElementById(prefix + "poblacion");

    if (!provEl || !pobEl) return;

    const proveedor = provEl.value;
    const isAlpinaDeptLogic = (proveedor === 'ALPINA' || proveedor === 'ALPINA-FLEISCHMANN');
    const zonaContainerId = prefix === "" ? "zona-container" : "modal-zona-container";
    const zonaContainer = document.getElementById(zonaContainerId);

    // Guardar lista maestra de poblaciones si no existe
    if (!MASTER_POBLACIONES || !MASTER_POBLACIONES.includes("PEREIRA-DOSQUEBRADAS")) {
        // Usamos las keys de PRECIOS_POBLACION como base general
        MASTER_POBLACIONES = Object.keys(PRECIOS_POBLACION).sort();
    }

    const isAlpinaLike = (proveedor === 'ALPINA' || proveedor === 'FLEISCHMANN' || proveedor === 'ALPINA-FLEISCHMANN');
    const isZenu = (proveedor === 'ZENU');
    const isPolar = (proveedor === 'POLAR');
    const isUnilever = (proveedor === 'UNILEVER');
    const isFamilia = (proveedor === 'FAMILIA');

    // Determinar qué lista usar
    let listaUsar = MASTER_POBLACIONES;
    if (isAlpinaLike) {
        listaUsar = Object.keys(PRECIOS_ALPINA).sort();
    } else if (isZenu) {
        listaUsar = Object.keys(PRECIOS_ZENU).sort();
    } else if (isPolar) {
        listaUsar = Object.keys(PRECIOS_POLAR).sort();
    } else if (proveedor === 'UNILEVER') {
        listaUsar = Object.keys(PRECIOS_TAT_UNILEVER).sort();
    } else if (proveedor === 'FAMILIA') {
        listaUsar = Object.keys(PRECIOS_TAT_FAMILIA).sort();
    }

    // --- Lógica Especial DOBLE F (SOLO ALPINA/ALPINA-FLEISCHMANN) ---
    // Si DOBLE F está seleccionado, mostrar TODAS las poblaciones de los 3 departamentos
    if (isAlpinaDeptLogic && zonaContainer) {
        const checked = Array.from(zonaContainer.querySelectorAll('input[type="checkbox"]:checked'));
        const selectedValues = checked.map(input => input.value);
        const hasDobleF = selectedValues.includes("DOBLE F");

        if (hasDobleF) {
            // Combinar todas las poblaciones de los 3 departamentos
            const todasPoblaciones = [
                ...POBLACIONES_RISARALDA,
                ...POBLACIONES_CALDAS,
                ...POBLACIONES_QUINDIO
            ];
            // Eliminar duplicados y ordenar
            const poblacionesUnicas = [...new Set(todasPoblaciones)].sort();
            // Filtrar para que solo contenga poblaciones que existan en PRECIOS_ALPINA
            listaUsar = listaUsar.filter(pob => poblacionesUnicas.includes(pob));

            // Si la lista queda vacía, usar todas las poblaciones únicas como fallback
            if (listaUsar.length === 0) {
                listaUsar = poblacionesUnicas;
            }
        }
    }

    // --- Lógica Especial Risaralda ---
    // Si hay zonas de Risaralda seleccionadas (pero NO DOBLE F), filtramos por poblaciones de Risaralda
    if (zonaContainer) {
        const checked = Array.from(zonaContainer.querySelectorAll('input[type="checkbox"]:checked'));
        const selectedValues = checked.map(input => input.value);
        const hasDobleF = selectedValues.includes("DOBLE F");
        const hasRisaraldaZone = selectedValues.some(v => ZONAS_RISARALDA.includes(v) && v !== "DOBLE F");

        if (hasRisaraldaZone && !hasDobleF) {
            // Filtrar la lista actual para que solo contenga poblaciones de Risaralda
            listaUsar = listaUsar.filter(pob => POBLACIONES_RISARALDA.includes(pob));

            // Si la lista queda vacía (porque el proveedor no tiene esas poblaciones), 
            // mostramos todas las de Risaralda como fallback
            if (listaUsar.length === 0) {
                listaUsar = POBLACIONES_RISARALDA.sort();
            }
        }
    }

    // --- Lógica Especial Caldas (SOLO ALPINA) ---
    if (isAlpinaDeptLogic && zonaContainer) {
        const checked = Array.from(zonaContainer.querySelectorAll('input[type="checkbox"]:checked'));
        const selectedValues = checked.map(input => input.value);
        const hasDobleF = selectedValues.includes("DOBLE F");
        const hasCaldasZone = selectedValues.some(v => ZONAS_CALDAS.includes(v) && v !== "DOBLE F");

        if (hasCaldasZone && !hasDobleF) {
            // Filtrar la lista de Alpina para que solo contenga poblaciones de Caldas
            listaUsar = listaUsar.filter(pob => POBLACIONES_CALDAS.includes(pob));

            // Fallback si por alguna razón la intersección es vacía
            if (listaUsar.length === 0) {
                listaUsar = POBLACIONES_CALDAS.sort();
            }
        }
    }
    // --- Lógica Especial Quindío (SOLO ALPINA) ---
    if (isAlpinaDeptLogic && zonaContainer) {
        const checked = Array.from(zonaContainer.querySelectorAll('input[type="checkbox"]:checked'));
        const selectedValues = checked.map(input => input.value);
        const hasDobleF = selectedValues.includes("DOBLE F");
        const hasQuindioZone = selectedValues.some(v => ZONAS_QUINDIO.includes(v) && v !== "DOBLE F");

        if (hasQuindioZone && !hasDobleF) {
            // Filtrar la lista de Alpina para que solo contenga poblaciones de Quindío
            listaUsar = listaUsar.filter(pob => POBLACIONES_QUINDIO.includes(pob));

            // Fallback si por alguna razón la intersección es vacía
            if (listaUsar.length === 0) {
                listaUsar = POBLACIONES_QUINDIO.sort();
            }
        }
    }
    // --------------------------------------------
    // --------------------------------

    // Guardar valor actual para intentar mantenerlo
    const currentVal = pobEl.value;

    // Repoblar
    pobEl.innerHTML = '<option value="" disabled selected>Seleccione Población</option>';
    listaUsar.forEach(pob => {
        const opt = document.createElement("option");
        opt.value = pob;
        opt.textContent = pob;
        pobEl.appendChild(opt);
    });

    // Restaurar valor si existe en la nueva lista
    if (listaUsar.includes(currentVal)) {
        pobEl.value = currentVal;
    }

    // Recalcular precio porque la población (o su precio base) puede haber cambiado
    calcularTotal(prefix);
}

function actualizarZonasPorProveedor(prefix = "") {
    const provEl = document.getElementById(prefix + "proveedor");
    // ID unified logic: "zona-container" vs "modal-zona-container"
    const zonaElId = prefix === "" ? "zona-container" : "modal-zona-container";
    const zonaEl = document.getElementById(zonaElId);
    // Fix: en dashboard.html puse ids: "zona-container" y "modal-zona-container"
    // asi que prefix + "zona-container" es correcto (modal-zona-container)

    if (!provEl || !zonaEl) return;

    const proveedor = provEl.value;

    // Listado Maestro de Zonas TYM (Hardcoded porque ya no existen en el HTML)
    const DEFAULT_ZONES = [
        { value: "M9450", text: "M9450" }, { value: "M9451", text: "M9451" }, { value: "M9453", text: "M9453" },
        { value: "M9454", text: "M9454" }, { value: "M9455", text: "M9455" }, { value: "M9456", text: "M9456" },
        { value: "M9457", text: "M9457" }, { value: "M9458", text: "M9458" }, { value: "M9459", text: "M9459" },
        { value: "M9460", text: "M9460" }, { value: "P7004", text: "P7004" }, { value: "P7005", text: "P7005" },
        { value: "P7005B", text: "P7005B" },
        { value: "P7006", text: "P7006" }, { value: "P7007", text: "P7007" },
        { value: "P7000", text: "P7000" }, { value: "P7001", text: "P7001" }, { value: "P7002", text: "P7002" },
        { value: "E7001-CALDAS", text: "E7001 CALDAS" }, { value: "E7001-RISARALDA", text: "E7001 RISARALDA" },
        { value: "M9550", text: "M9550" }, { value: "M9552", text: "M9552" },
        { value: "M9553", text: "M9553" }, { value: "M9554", text: "M9554" }, { value: "M9555", text: "M9555" },
        { value: "M9556", text: "M9556" }, { value: "M9557", text: "M9557" }, { value: "M9558", text: "M9558" },
        { value: "M9559", text: "M9559" }, { value: "M9560", text: "M9560" },
        { value: "M9600", text: "M9600" }, { value: "M9601", text: "M9601" }, { value: "M9602", text: "M9602" },
        { value: "M9603", text: "M9603" }, { value: "M9604", text: "M9604" }, { value: "M9605", text: "M9605" },
        { value: "M9606", text: "M9606" },
        { value: "P7008", text: "P7008" }, { value: "P7009", text: "P7009" }, { value: "P7010", text: "P7010" },
        { value: "25021", text: "25021" }, { value: "25022", text: "25022" },
        { value: "25023", text: "25023" }, { value: "25024", text: "25024" }, { value: "25025", text: "25025" },
        { value: "25026", text: "25026" }, { value: "25027", text: "25027" }, { value: "25028", text: "25028" },
        { value: "25029", text: "25029" }, { value: "FC01", text: "FC01" }, { value: "FC02", text: "FC02" },
        { value: "FC03", text: "FC03" }, { value: "FQ04", text: "FQ04" }, { value: "FQ05", text: "FQ05" },
        { value: "FQ06", text: "FQ06" }, { value: "FR07", text: "FR07" }, { value: "FR08", text: "FR08" },
        { value: "FR09", text: "FR09" }, { value: "DOBLE F", text: "DOBLE F" }
    ];

    // Usar la lista hardcoded en lugar de intentar leer el DOM vacío
    if (MASTER_ZONAS.length === 0) MASTER_ZONAS = DEFAULT_ZONES;
    if (MASTER_ZONAS_MODAL.length === 0) MASTER_ZONAS_MODAL = DEFAULT_ZONES;

    const master = prefix === "" ? MASTER_ZONAS : MASTER_ZONAS_MODAL;
    let filtered = [];

    if (!proveedor) {
        filtered = master;
    }
    // ====== PROVEEDORES TAT ======
    else if (proveedor === "UNILEVER") {
        filtered = CONFIG_TAT.zonas['UNILEVER'] || [];
    } else if (proveedor === "FAMILIA") {
        filtered = CONFIG_TAT.zonas['FAMILIA'] || [];
    } else if (proveedor === "POLAR" && CONFIG_TAT.zonas['POLAR']) { // Nueva condición para POLAR en TAT
        filtered = CONFIG_TAT.zonas['POLAR'];
    }
    // ====== PROVEEDORES TYM ======
    else if (proveedor === "ALPINA") {
        // Incluir zonas M (general), P7 (departamentos), E7001 (departamentos específicos), DOBLE F, y vacías
        filtered = master.filter(z => z.value.startsWith("M") || z.value.startsWith("P7") || z.value.startsWith("E7") || z.value === "DOBLE F" || z.value === "");
    } else if (proveedor === "ZENU") {
        filtered = master.filter(z => z.value.startsWith("250") || z.value === "");
    } else if (proveedor === "FLEISCHMANN") {
        const allowed = ["FC01", "FC02", "FC03", "FQ04", "FQ05", "FQ06", "FR07", "FR08", "FR09"];
        filtered = master.filter(z => allowed.includes(z.value) || z.value === "");
    } else if (proveedor === "ALPINA-FLEISCHMANN") {
        const fleischmannZones = ["FC01", "FC02", "FC03", "FQ04", "FQ05", "FQ06", "FR07", "FR08", "FR09"];
        // Incluir zonas de Alpina (M, P7, E7) + zonas de Fleischmann + DOBLE F
        filtered = master.filter(z => z.value.startsWith("M") || z.value.startsWith("P7") || z.value.startsWith("E7") || fleischmannZones.includes(z.value) || z.value === "DOBLE F" || z.value === "");
    } else {
        filtered = master;
    }

    // Repoblar con Checkboxes
    const currentValues = []; // No hay valor único
    zonaEl.innerHTML = "";

    if (filtered.length === 0) {
        zonaEl.innerHTML = '<div style="padding:10px; color:#666;">No hay zonas disponibles</div>';
        return;
    }

    filtered.forEach(z => {
        if (!z.value) return; // Skip empty option

        const label = document.createElement("label");
        label.className = "checkbox-item";

        const input = document.createElement("input");
        input.type = "checkbox";
        input.value = z.value;
        input.name = (prefix === "" ? "zona" : "modal-zona") + "[]";

        // Evento para recalcular precio y actualizar poblaciones (Risaralda logic)
        input.onchange = () => {
            actualizarPoblaciones(prefix);
            calcularTotal(prefix);
        };

        const span = document.createElement("span");
        span.textContent = z.text;

        label.appendChild(input);
        label.appendChild(span);
        zonaEl.appendChild(label);
    });
}

function calcularTotal(prefix = "") {
    const poblacionId = prefix + "poblacion";
    const adicId = prefix + "is_adicionales";
    const noAuxId = prefix + "no_auxiliares";
    const totalId = prefix + "total_flete";
    const rutaId = prefix + "valor_ruta";
    const porcId = prefix + "porcentaje_ruta";
    const provId = prefix + "proveedor";
    const adicNegociadoId = prefix + "valor_adicional"; // NUEVO

    const poblacionEl = document.getElementById(poblacionId);
    const adicionalesEl = document.getElementById(adicId);
    const noAuxEl = document.getElementById(noAuxId);
    const totalEl = document.getElementById(totalId);
    const rutaEl = document.getElementById(rutaId);
    const porcEl = document.getElementById(porcId);
    const provEl = document.getElementById(provId);
    const adicNegociadoEl = document.getElementById(adicNegociadoId); // NUEVO

    if (!poblacionEl || !totalEl) return;

    const poblacion = poblacionEl.value;
    const proveedor = provEl ? provEl.value : "";

    // Seleccionar lista de precios según proveedor
    let precioBase = 0;
    if (proveedor === 'ALPINA' || proveedor === 'FLEISCHMANN' || proveedor === 'ALPINA-FLEISCHMANN') {
        precioBase = PRECIOS_ALPINA[poblacion] || 0;
    } else if (proveedor === 'ZENU') {
        precioBase = PRECIOS_ZENU[poblacion] || 0;
    } else if (proveedor === 'POLAR') {
        precioBase = PRECIOS_POLAR[poblacion] || 0;
    } else if (proveedor === 'UNILEVER') {
        precioBase = PRECIOS_TAT_UNILEVER[poblacion] || 0;
    } else if (proveedor === 'FAMILIA') {
        precioBase = PRECIOS_TAT_FAMILIA[poblacion] || 0;
    } else {
        precioBase = PRECIOS_POBLACION[poblacion] || 0;
    }

    // Calcular Valor Flete (total a pagar) basado en población
    let total = precioBase;

    // Sumar costo de adicionales
    const tieneAdicional = adicionalesEl?.value === "Si";
    if (tieneAdicional) total += COSTO_ADICIONAL;

    // Sumar costo por auxiliares (DESACTIVADO por solicitud del usuario)
    // const numAuxiliares = parseInt(noAuxEl?.value || 0);
    // total += (numAuxiliares * COSTO_POR_AUXILIAR);

    // NUEVO: Sumar adicional por negociación
    const adicionalNegociado = adicNegociadoEl ? parseMoney(adicNegociadoEl.value) : 0;
    total += adicionalNegociado;

    totalEl.value = moneyFormatter.format(total);

    // Lógica del 4% (Valor Ruta / Total Flete)
    // El usuario pide que NO se cuente el adicional de 60k para el % de participación
    if (rutaEl && porcEl) {
        const valorPedidos = parseMoney(rutaEl.value);
        if (total > 0 && valorPedidos > 0) {
            const totalParaPorcentaje = tieneAdicional ? (total - COSTO_ADICIONAL - adicionalNegociado) : (total - adicionalNegociado);
            const porcentaje = (totalParaPorcentaje / valorPedidos) * 100;
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
        // Force update list on interaction to avoid "invalid option selected" issues from auto-fill
        selectPoblacion.addEventListener("focus", () => actualizarPoblaciones(prefix));
        selectPoblacion.addEventListener("mousedown", () => actualizarPoblaciones(prefix));
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
        inputRuta.addEventListener("input", function () {
            formatMoneyInput(this);
            calcularTotal(prefix);
        });
    }

    // LISTENER FALTANTE: Adicional negociado
    const adicNegociadoId = prefix + "valor_adicional";
    const inputAdicNegociado = document.getElementById(adicNegociadoId);
    if (inputAdicNegociado) {
        inputAdicNegociado.addEventListener("input", function () {
            formatMoneyInput(this);
            calcularTotal(prefix);
        });
    }

    const selectProveedor = document.getElementById(prefix + "proveedor");
    if (selectProveedor) {
        selectProveedor.addEventListener("change", () => {
            actualizarZonasPorProveedor(prefix);
            actualizarPoblaciones(prefix);
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
    const proveedor = val("proveedor");

    // ZONA MULTI-SELECT (CHECKBOXES)
    // Construct relevant ID: "zona-container" or "modal-zona-container"
    const zonaContainerId = p === "" ? "zona-container" : "modal-zona-container";
    const zonaContainer = document.getElementById(zonaContainerId);

    let zona = "";
    if (zonaContainer) {
        const checked = Array.from(zonaContainer.querySelectorAll('input[type="checkbox"]:checked'));
        zona = checked.map(input => input.value).join(", ");
    }

    let dia = val("dia");
    let fechaDetectada = null;

    if (prefix === "") {
        const now = new Date();
        // Fecha en formato YYYY-MM-DD para Colombia
        const bogotaFormatter = new Intl.DateTimeFormat('en-CA', {
            timeZone: 'America/Bogota',
            year: 'numeric',
            month: '2-digit',
            day: '2-digit'
        });
        fechaDetectada = bogotaFormatter.format(now);

        // Día de la semana en español (sin acentos para compatibilidad)
        const dayFormatter = new Intl.DateTimeFormat('en-US', {
            timeZone: 'America/Bogota',
            weekday: 'long'
        });
        const weekday = dayFormatter.format(now);
        const mapDias = {
            'Monday': 'Lunes', 'Tuesday': 'Martes', 'Wednesday': 'Miercoles',
            'Thursday': 'Jueves', 'Friday': 'Viernes', 'Saturday': 'Sabado', 'Sunday': 'Domingo'
        };
        dia = mapDias[weekday] || weekday;
    }
    const poblacion = val("poblacion");
    const auxiliares = val("auxiliares");
    const noAux = val("no_auxiliares");
    const noPedidos = val("no_pedidos");
    const adicionales = val("is_adicionales");

    // NUEVOS CAMPOS: Planilla y Facturas
    const noPlanilla = val("no_planilla");
    const facturasAdicionales = val("facturas_adicionales");

    // NUEVO: Adicionales por negociación
    const valorAdicional = val("valor_adicional");
    const razonAdicional = val("razon_adicional");

    const valorRutaRaw = val("valor_ruta");
    const precioRaw = val("total_flete");

    const { user } = await SupabaseClient.auth.getSession();

    const razonSocialActual = CURRENT_RAZON_SOCIAL || 'TYM';

    // Buscar el ID del vehículo por placa (Filtrado por Empresa)
    let resV = await SupabaseClient.vehiculos.getByPlaca(placa, razonSocialActual);
    let vehiculo = resV.data;

    if (!vehiculo && placa && contratista) {
        // SEGURIDAD: Ya no autocreamos vehículos globalmente sin validar que pertenezcan a la empresa
        // Si no existe en esta empresa, el operario debe crearlo manualmente o el admin asignarlo.
        /* 
        const res = await SupabaseClient.vehiculos.create({
            placa,
            conductor: contratista,
            modelo: 'Autocreado',
            activo: true
        });
        if (res.success) {
            vehiculo = res.data;
        }
        */
        console.warn(`⚠️ Vehículo ${placa} no existe en la empresa ${razonSocialActual}`);
    }

    // VALIDACIÓN: Vehículo inexistente o inactivo para la empresa actual
    if (!vehiculo) {
        Swal.fire({
            icon: 'error',
            title: 'Vehículo no registrado',
            text: `El vehículo con placa ${placa} no está registrado en ${razonSocialActual}. Por favor, regístrelo primero.`,
            background: '#1a1a1a',
            color: '#fff'
        });
        return null;
    }

    if (vehiculo.activo === false && razonSocialActual === 'TAT') {
        Swal.fire({
            icon: 'error',
            title: 'Vehículo Inactivo para TAT',
            text: `El vehículo ${placa} está inactivo en TAT y no puede registrar nuevos fletes.`,
            background: '#1a1a1a',
            color: '#fff'
        });
        return null;
    }

    const finalData = {
        // Campos para la Base de Datos
        db: {
            placa, // GUARDAR PLACA EN TABLA FLETES PARA BÚSQUEDA
            vehiculo_id: vehiculo?.id,
            user_id: user.id,
            razon_social: CURRENT_RAZON_SOCIAL || 'TYM', // Agregar empresa
            contratista,
            proveedor,
            zona,
            dia,
            poblacion,
            valor_ruta: parseMoney(valorRutaRaw),
            precio: parseMoney(precioRaw),
            adicionales,
            no_pedidos: parseInt(noPedidos || 0),
            auxiliares,
            no_auxiliares: parseInt(noAux || 0),
            fecha: val("fecha") || fechaDetectada || new Date().toISOString().split('T')[0],
            // NUEVOS CAMPOS
            no_planilla: noPlanilla,
            facturas_adicionales: facturasAdicionales,
            // NUEVO: Adicionales por negociación
            valor_adicional_negociacion: parseMoney(valorAdicional),
            razon_adicional_negociacion: razonAdicional || null
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

// Interceptar llamados para manejar el null de validación
async function crearFlete() {
    const btn = document.getElementById("btnGestionarFlete");
    if (btn) btn.disabled = true;

    const formData = await obtenerDatosFormulario("");
    if (!formData) {
        if (btn) btn.disabled = false;
        return;
    }
    const { db, ui } = formData;

    if (!ui.placa || !db.contratista || !db.zona || db.precio <= 0 || !db.no_planilla || !db.auxiliares || db.no_auxiliares === 0) {
        Swal.fire({
            icon: 'warning', title: 'Faltan Datos', text: 'Verifique Placa, Conductor, Zona, Valor, Auxiliares y No. Planilla.',
            background: '#1a1a1a', color: '#fff'
        });
        if (btn) btn.disabled = false;
        return;
    }

    // VALIDACIÓN: Motivo de Negociación Obligatorio
    if (db.valor_adicional_negociacion > 0 && !db.razon_adicional_negociacion) {
        Swal.fire({
            icon: 'warning', title: 'Falta Motivo',
            text: 'Debe especificar la razón del valor adicional negociado.',
            background: '#1a1a1a', color: '#fff'
        });
        if (btn) btn.disabled = false;
        return;
    }

    // Alerta de confirmación para Operarios
    const session = CURRENT_SESSION;
    const role = (session?.profile?.rol || session?.user?.user_metadata?.rol || 'operario').toLowerCase();

    if (role === 'operario') {
        const { isConfirmed } = await Swal.fire({
            title: '¿Confirmar Registro?',
            text: '¿Está seguro de ingresar este flete? Una vez guardado no podrá editarlo ni eliminarlo.',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3b82f6',
            cancelButtonColor: '#64748b',
            confirmButtonText: 'Sí, registrar',
            cancelButtonText: 'Revisar',
            background: '#1a1a1a',
            color: '#fff'
        });

        if (!isConfirmed) {
            if (btn) btn.disabled = false;
            return;
        }
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
            timer: 1500, showConfirmButton: false, background: '#1a1a1a', color: '#fff'
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

    const formData = await obtenerDatosFormulario("modal-");
    if (!formData) {
        if (btn) btn.disabled = false;
        return;
    }
    const { db, ui } = formData;
    delete db.id; // IMPORTANTE: Supabase falla si intentas actualizar la PK 'id'

    // VALIDACIÓN DETALLADA
    const camposFaltantes = [];
    if (!ui.placa) camposFaltantes.push("Placa");
    if (!db.contratista) camposFaltantes.push("Conductor/Contratista");
    if (!db.auxiliares) camposFaltantes.push("Nombres Auxiliares");
    if (db.no_auxiliares === 0) camposFaltantes.push("Cant. Auxiliares");
    // if (!db.zona) camposFaltantes.push("Zona"); // Deshabilitado temporalmente para permitir correcciones
    if (db.precio <= 0) camposFaltantes.push("Precio/Población (Total)");
    // if (!db.no_planilla) camposFaltantes.push("Número de Planilla"); // Deshabilitado para permitir guardado de antiguos

    if (camposFaltantes.length > 0) {
        if (btn) btn.disabled = false;
        return Swal.fire({
            icon: 'warning',
            title: 'Faltan Datos',
            text: `Por favor complete los siguientes campos: ${camposFaltantes.join(", ")}.`,
            background: '#1a1a1a',
            color: '#fff'
        });
    }

    // VALIDACIÓN: Motivo de Negociación Obligatorio (Modal)
    if (db.valor_adicional_negociacion > 0 && !db.razon_adicional_negociacion) {
        if (btn) btn.disabled = false;
        return Swal.fire({
            icon: 'warning', title: 'Falta Motivo',
            text: 'Debe especificar la razón del valor adicional negociado.',
            background: '#1a1a1a', color: '#fff'
        });
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
        "placa", "contratista", "proveedor", "zona", "dia", "poblacion",
        "auxiliares", "no_auxiliares", "no_pedidos",
        "valor_ruta", "is_adicionales", "total_flete",
        "porcentaje_ruta", "fecha", "no_planilla", "facturas_adicionales",
        // Campos de adicionales que faltaban
        "valor_adicional", "razon_adicional"
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

    // Limpiar Checkboxes de Zonas (Importante)
    const zonaContainerId = prefix === "" ? "zona-container" : "modal-zona-container";
    const zonaContainer = document.getElementById(zonaContainerId);
    if (zonaContainer) {
        const checkboxes = zonaContainer.querySelectorAll('input[type="checkbox"]');
        checkboxes.forEach(cb => cb.checked = false);
    }

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
// --- Variables de Paginación ---
let CURRENT_PAGE = 0;
const PAGE_SIZE = 50;
let TOTAL_RECORDS = 0;

async function listarFletes(reset = true) {
    const tbody = document.getElementById("tablaFletes");
    const btnCargarMas = document.getElementById("btnCargarMas");
    if (!tbody) return;

    if (reset) {
        CURRENT_PAGE = 0;
        CACHED_FLETES = []; // Limpiar cache visual al resetear (búsqueda o refresh)
        if (btnCargarMas) btnCargarMas.style.display = 'none';
        tbody.innerHTML = `<tr><td colspan="15" style="text-align:center"><i class="ri-loader-4-line rotate"></i> Cargando...</td></tr>`;
    } else {
        // Si no es reset, es "Cargar Más", aumentamos página
        CURRENT_PAGE++;
        if (btnCargarMas) btnCargarMas.innerHTML = `<i class="ri-loader-4-line rotate"></i> Cargando...`;
        if (btnCargarMas) btnCargarMas.disabled = true;
    }

    // Obtener valor de búsqueda actual
    const busqueda = document.getElementById("buscarFlete")?.value.trim() || "";
    const fZona = document.getElementById("filtroZona")?.value || "";
    const fFecha = document.getElementById("filtroFecha")?.value || "";

    // OPTIMIZACIÓN: Si NO hay búsqueda ni filtros, cargar solo fletes del mes actual
    // Si HAY búsqueda o filtros, no limitamos por fecha para encontrar registros antiguos
    const now = new Date();
    const fechaInicio = (!busqueda && !fZona && !fFecha)
        ? new Date(now.getFullYear(), now.getMonth(), 1).toISOString().split('T')[0]
        : null;

    // Params para Supabase
    const params = {
        busqueda,
        zona: fZona,
        fecha: fFecha,
        fechaInicio,
        page: CURRENT_PAGE,
        pageSize: PAGE_SIZE
    };

    // USAR getAll() DIRECTAMENTE en lugar de la vista para asegurar datos frescos
    const res = await SupabaseClient.fletes.getAll(params);

    if (res.success && res.data) {
        // Aplanar datos del vehículo para compatibilidad con el render
        const newFletes = res.data.map(f => ({
            ...f,
            placa: f.vehiculo?.placa || f.placa || 'N/A',
            conductor: f.vehiculo?.conductor || f.contratista || 'N/A'
        }));

        if (reset) {
            CACHED_FLETES = newFletes;
        } else {
            // Append
            CACHED_FLETES = [...CACHED_FLETES, ...newFletes];
        }

        TOTAL_RECORDS = res.count || 0; // Guardar total real de DB

        renderTable(CACHED_FLETES);

        // Controlar botón "Cargar Más"
        if (btnCargarMas) {
            btnCargarMas.disabled = false;
            btnCargarMas.innerHTML = `<i class="ri-loader-2-line"></i> Cargar más antiguos...`;
            // Si la cantidad mostrada es menor al total real, mostrar botón
            if (CACHED_FLETES.length < TOTAL_RECORDS) {
                btnCargarMas.style.display = 'inline-block';
            } else {
                btnCargarMas.style.display = 'none'; // Ya mostramos todo
            }
        }
    } else {
        if (!reset && btnCargarMas) {
            btnCargarMas.disabled = false;
            btnCargarMas.innerHTML = `Error al cargar. Intentar de nuevo.`;
        }
    }
}

function cargarMasFletes() {
    listarFletes(false); // false = no reset (append)
}

function renderTable(fletes) {
    const tbody = document.getElementById("tablaFletes");
    if (!tbody) return;

    // Filtros sobre cache (Instantáneo)
    const q = document.getElementById("buscarFlete")?.value.toLowerCase() || "";
    const fZona = document.getElementById("filtroZona")?.value || "";
    const fFecha = document.getElementById("filtroFecha")?.value || "";

    const session = CURRENT_SESSION;
    const role = (session?.profile?.rol || session?.user?.user_metadata?.rol || 'operario').toLowerCase();
    const currentUserId = session?.user?.id;

    const filtered = fletes; // El filtrado ahora viene del servidor

    if (filtered.length === 0) {
        tbody.innerHTML = `<tr><td colspan="15" style="text-align:center">No se encontraron fletes</td></tr>`;
        return;
    }

    // OPTIMIZACIÓN DE RENDIMIENTO: Construir el fragmento de una vez
    const fragment = document.createDocumentFragment();

    filtered.forEach(f => {
        const tr = document.createElement("tr");
        const opacity = (f.id && f.id.toString().startsWith('temp-')) ? 'opacity: 0.5;' : '';
        const esAdicional = f.adicionales === 'Si';

        tr.style = opacity;

        tr.innerHTML = `
            <td>${f.fecha}</td>
            <td>${f.dia || '-'}</td>
            <td><span class="badge" style="background: var(--accent-blue); font-size: 0.7rem; padding: 2px 6px;">${f.proveedor || '-'}</span></td>
            <td><strong>${f.conductor}</strong></td>
            <td><span class="badge-plate">${f.placa}</span></td>
            <td style="font-weight: 600; color: var(--accent-orange);">${f.no_planilla || '-'}</td>
            <td>${f.zona || '-'}</td>
            <td>${f.poblacion || 'N/A'}</td>
            <td>${f.no_auxiliares || 0} (${f.auxiliares || '-'})</td>
            <td><span class="badge" style="background: ${esAdicional ? 'rgba(16, 185, 129, 0.1)' : 'rgba(255,255,255,0.05)'}; color: ${esAdicional ? 'var(--secondary)' : 'inherit'}; border: ${esAdicional ? '1px solid var(--secondary)' : 'none'};">${f.adicionales || 'No'}</span></td>
            <td class="price-cell" style="color: var(--info);">${moneyFormatter.format(f.valor_adicional_negociacion || 0)}</td>
            <td style="font-size: 0.85rem; color: var(--text-muted); white-space: normal;" title="${f.razon_adicional_negociacion || ''}">${f.razon_adicional_negociacion || '-'}</td>
            <td class="price-cell">${moneyFormatter.format(f.valor_ruta || 0)}</td>
            <td class="price-cell">${moneyFormatter.format(f.precio)}</td>
            ${role === 'admin' ? `
            <td class="actions-cell">
                <button class="btn-icon edit" onclick="editarFlete('${f.id}')" title="Editar Costos"><i class="ri-pencil-line"></i></button>
                <button class="btn-icon delete" onclick="eliminarFlete('${f.id}')" title="Eliminar"><i class="ri-delete-bin-line"></i></button>
            </td>` : ''}
        `;
        fragment.appendChild(tr);
    });

    tbody.innerHTML = "";
    tbody.appendChild(fragment);
}

// Versión debounced de la búsqueda para no saturar Supabase
const buscarFletesDebounced = debounce(() => {
    listarFletes(true);
}, 400);

function buscarFletes() {
    buscarFletesDebounced();
}

window.editarFlete = async function (id) {
    // PERMISO: Verificar contra el perfil cargado que es más seguro
    const role = (CURRENT_SESSION?.profile?.rol || CURRENT_SESSION?.session?.user?.user_metadata?.rol || 'operario').toLowerCase();

    if (role !== 'admin') {
        return Swal.fire({ icon: 'error', title: 'Acceso Denegado', text: 'Solo administradores pueden editar.', background: '#1a1a1a', color: '#fff' });
    }

    // Mostrar loader mientras se obtienen los datos más frescos
    Swal.fire({
        title: 'Cargando datos...',
        allowOutsideClick: false,
        didOpen: () => Swal.showLoading(),
        background: '#1a1a1a',
        color: '#fff'
    });

    ID_FLETE_EDITANDO = id;

    // Obtener flete específico de la base de datos (datos más frescos desde TABLA)
    // CAMBIO: Usamos 'fletes' y join manual para asegurar que traiga columnas nuevas como no_planilla
    // que podrían faltar si la vista 'vista_fletes_completos' no se actualizó.
    const { data: fRaw, error } = await SupabaseClient.supabase
        .from('fletes')
        .select('*, vehiculo:vehiculos(placa, conductor)')
        .eq('id', id)
        .single();

    Swal.close();

    if (error || !fRaw) {
        return Swal.fire({ icon: 'error', title: 'Error', text: 'No se pudo cargar la información del flete.', background: '#1a1a1a', color: '#fff' });
    }

    // Aplanar objeto para compatibilidad con código existente
    const f = {
        ...fRaw,
        placa: fRaw.vehiculo?.placa || fRaw.placa || '',
        contratista: fRaw.vehiculo?.conductor || fRaw.contratista || ''
    };

    // Actualizar indicador de planilla en el título
    const infoTit = document.getElementById("modal-title-info");
    if (infoTit) {
        infoTit.innerHTML = `| Planilla: <span style="color: var(--accent-orange); font-weight: 800;">${f.no_planilla || 'N/A'}</span>`;
    }

    // Helper para establecer valores
    const set = (k, v) => {
        const el = document.getElementById("modal-" + k);
        if (el) el.value = v || "";
    };

    // PASO 1: Establecer SOLO el proveedor para disparar la actualización de dropdowns
    set("proveedor", f.proveedor);

    // PASO 2: Actualizar las listas dinámicas basadas en el proveedor
    actualizarZonasPorProveedor("modal-");
    actualizarPoblaciones("modal-");

    // PASO 3: Después de un delay, establecer TODOS LOS CAMPOS
    // Esto asegura que los dropdowns ya estén actualizados y no se sobrescriban los valores
    setTimeout(() => {
        // Campos básicos
        set("fecha", f.fecha);
        set("placa", f.placa);
        set("contratista", f.contratista);
        set("dia", f.dia);
        set("auxiliares", f.auxiliares);
        set("no_auxiliares", f.no_auxiliares);
        set("no_pedidos", f.no_pedidos);

        // Campos monetarios
        set("valor_ruta", moneyFormatter.format(f.valor_ruta || 0));
        set("is_adicionales", f.adicionales);

        // Campos de planilla y facturas
        set("no_planilla", f.no_planilla || "");
        set("facturas_adicionales", f.facturas_adicionales || "");

        // Adicionales por negociación
        if (f.valor_adicional_negociacion) {
            set("valor_adicional", moneyFormatter.format(f.valor_adicional_negociacion));
        } else {
            set("valor_adicional", "");
        }

        if (f.razon_adicional_negociacion) {
            set("razon_adicional", f.razon_adicional_negociacion);
        } else {
            set("razon_adicional", "");
        }

        // Establecer ZONAS (checkboxes)
        const zonaVals = (f.zona || '').split(',').map(s => s.trim()).filter(v => v);
        const zonaContainer = document.getElementById("modal-zona-container");
        if (zonaContainer) {
            const checkboxes = zonaContainer.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(chk => {
                chk.checked = zonaVals.includes(chk.value);
            });
        }

        // Establecer POBLACIÓN (después de que el dropdown se haya actualizado)
        set("poblacion", f.poblacion);

        // Recalcular total
        calcularTotal("modal-");

        // Mostrar modal DESPUÉS de poblar
        document.getElementById("modalEdicionFlete").classList.add("visible");
    }, 200);
};

window.eliminarFlete = async function (id) {
    // PERMISO: Verificar contra el perfil cargado
    const role = (CURRENT_SESSION?.profile?.rol || CURRENT_SESSION?.session?.user?.user_metadata?.rol || 'operario').toLowerCase();

    if (role !== 'admin') {
        Swal.fire({ icon: 'error', title: 'Acceso Denegado', text: 'Solo administradores pueden eliminar.', background: '#1a1a1a', color: '#fff' });
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
    // OPTIMIZACIÓN: Obtener TODOS los datos del dashboard en una sola petición RPC
    const stats = await SupabaseClient.fletes.getDashboardData();

    // 1. Total Fletes
    const el = document.getElementById("cantFletes");
    if (el) el.innerText = stats.totalFletes || 0;

    // 2. Registros Mes Actual
    const kpiRegistros = document.getElementById("kpiRegistros");
    if (kpiRegistros) kpiRegistros.innerText = moneyFormatter.format(stats.ingresosMes || 0);

    // 3. Vehiculos Activos
    const kpiVehiculos = document.getElementById("kpiVehiculos");
    if (kpiVehiculos) kpiVehiculos.innerText = stats.vehiculosActivos || 0;

    // Pasar los datos ya cargados a la función de gráficos para evitar segunda consulta
    await generarGraficos(stats);
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
    // Definir opciones según la empresa
    let opcionesProveedores = '';
    const esTAT = (CURRENT_RAZON_SOCIAL === 'TAT');
    const session = CURRENT_SESSION;
    const role = (session?.profile?.rol || session?.user?.user_metadata?.rol || 'operario').toLowerCase();

    // Helper para el modal
    window.toggleRangoFechasExcel = function () {
        const tipo = document.getElementById('excel-tipo')?.value;
        const finContainer = document.getElementById('excel-fin-container');
        if (finContainer) {
            finContainer.style.display = (tipo === 'rango') ? 'block' : 'none';
        }
    };

    // CAJA ve TODOS los proveedores
    if (role === 'caja') {
        opcionesProveedores = `
            <option value="UNILEVER-FAMILIA">TAT: UNILEVER-FAMILIA</option>
            <option value="POLAR">TAT: POLAR</option>
            <option value="ALPINA">TYM: ALPINA</option>
            <option value="ZENU">TYM: ZENU</option>
            <option value="FLEISCHMANN">TYM: FLEISCHMANN</option>
            <option value="ALPINA-FLEISCHMANN">TYM: ALPINA-FLEISCHMANN</option>
        `;
    } else if (esTAT) {
        opcionesProveedores = `
            <option value="UNILEVER-FAMILIA">UNILEVER-FAMILIA</option>
            <option value="POLAR">POLAR</option>
        `;
    } else {
        opcionesProveedores = `
            <option value="ALPINA">ALPINA</option>
            <option value="ZENU">ZENU</option>
            <option value="FLEISCHMANN">FLEISCHMANN</option>
            <option value="ALPINA-FLEISCHMANN">ALPINA-FLEISCHMANN</option>
        `;
    }

    const { value: formValues } = await Swal.fire({
        title: '📊 Exportar a Excel',
        html: `
            <div style="max-width: 350px; margin: 0 auto; padding: 20px 0;">
                <div style="margin-bottom: 22px;">
                    <label style="display: block; text-align: center; margin-bottom: 10px; font-weight: 600; font-size: 13px;">
                        Tipo de Periodo:
                    </label>
                    <select id="excel-tipo" class="swal2-input" onchange="toggleRangoFechasExcel()" style="width: 100%; margin: 0;">
                        <option value="dia">Un Día</option>
                        <option value="rango" selected>Rango de Fechas</option>
                    </select>
                </div>

                <div style="margin-bottom: 22px;">
                    <label id="label-inicio" style="display: block; text-align: center; margin-bottom: 10px; font-weight: 600; font-size: 13px;">
                        Fecha Inicio:
                    </label>
                    <input id="excel-inicio" type="date" class="swal2-input" value="${new Date(new Date().getFullYear(), new Date().getMonth(), 1).toISOString().split('T')[0]}" style="width: 100%; margin: 0;">
                </div>
                
                <div id="excel-fin-container" style="margin-bottom: 22px;">
                    <label style="display: block; text-align: center; margin-bottom: 10px; font-weight: 600; font-size: 13px;">
                        Fecha Fin:
                    </label>
                    <input id="excel-fin" type="date" class="swal2-input" value="${new Date().toISOString().split('T')[0]}" style="width: 100%; margin: 0;">
                </div>

                <div style="margin-bottom: 10px;">
                    <label for="excel-proveedor" style="display: block; text-align: center; margin-bottom: 10px; font-weight: 600; font-size: 13px;">
                        Proveedor:
                    </label>
                    <select id="excel-proveedor" class="swal2-input" style="width: 100%; margin: 0;">
                        <option value="">Todos los Proveedores</option>
                        ${opcionesProveedores}
                    </select>
                </div>
            </div>
        `,
        showCancelButton: true,
        confirmButtonText: 'Exportar Excel',
        cancelButtonText: 'Cancelar',
        background: '#1e293b',
        color: '#fff',
        width: '500px',
        didOpen: () => {
            window.toggleRangoFechasExcel();
        },
        preConfirm: () => {
            const tipo = document.getElementById('excel-tipo').value;
            const inicio = document.getElementById('excel-inicio').value;
            const fin = document.getElementById('excel-fin').value;
            const proveedor = document.getElementById('excel-proveedor').value;

            if (!inicio || (tipo === 'rango' && !fin)) {
                Swal.showValidationMessage('Por favor selecciona las fechas');
                return false;
            }
            return { tipo, inicio, fin, proveedor };
        }
    });

    if (!formValues) return;

    const { tipo, inicio, fin, proveedor } = formValues;
    const esRango = (tipo === 'rango');

    Swal.fire({
        title: 'Generando Excel...',
        text: esRango ? `${inicio} hasta ${fin}` : inicio,
        allowOutsideClick: false,
        didOpen: () => Swal.showLoading(),
        background: '#1e293b',
        color: '#fff'
    });

    let query = SupabaseClient.supabase
        .from('fletes')
        .select(`
            *,
            vehiculo:vehiculos(placa, conductor)
        `);

    if (esRango) {
        query = query.gte('fecha', inicio).lte('fecha', fin);
    } else {
        query = query.eq('fecha', inicio);
    }

    if (proveedor) {
        if (proveedor === 'UNILEVER-FAMILIA') {
            query = query.in('proveedor', ['UNILEVER', 'FAMILIA', 'UNILEVER-FAMILIA']);
        } else if (proveedor === 'ALPINA-FLEISCHMANN') {
            query = query.in('proveedor', ['ALPINA', 'FLEISCHMANN', 'ALPINA-FLEISCHMANN']);
        } else {
            query = query.eq('proveedor', proveedor);
        }
    } else {
        // Filtro "Todos los Proveedores" respeta el contexto de la empresa
        if (esTAT) {
            query = query.in('proveedor', ['UNILEVER', 'FAMILIA', 'POLAR', 'UNILEVER-FAMILIA']);
        } else if (role !== 'caja') {
            // Contexto TYM (excluyendo caja que ve todo)
            query = query.in('proveedor', ['ALPINA', 'FLEISCHMANN', 'ZENU', 'ALPINA-FLEISCHMANN']);
        }
    }

    const { data: fletes, error } = await query.order('fecha', { ascending: true });

    if (error || !fletes || fletes.length === 0) {
        return Swal.fire("Info", `No hay datos para exportar en el periodo ${inicio} ${esRango ? 'al ' + fin : ''}`, "info");
    }

    // Mapear datos incluyendo NOMBRE CONTRATISTA
    const datosMapeados = fletes.map(f => {
        // Aplanar datos del vehículo para compatibilidad
        const placa = f.vehiculo?.placa || f.placa || 'N/A';
        const conductor = f.vehiculo?.conductor || f.contratista || 'N/A';

        return {
            "ID": f.id,
            "FECHA": f.fecha,
            "DIA": f.dia,
            "PROVEEDOR": (['UNILEVER', 'FAMILIA'].includes(f.proveedor)) ? 'UNILEVER-FAMILIA' : f.proveedor,
            "PLACA": placa,
            "NOMBRE CONTRATISTA": MAPA_CONTRATISTAS[placa] || 'N/A',
            "CONDUCTOR": conductor,
            "AUXILIARES": f.auxiliares || '',
            "ZONA": f.zona,
            "POBLACION": f.poblacion,
            "PLANILLA": f.no_planilla || '',
            "FACTURAS EXTRA": f.facturas_adicionales || '',
            "ADICIONAL": f.adicionales || 'No', // Nombre real en tabla fletes
            "V. NEGOCIADO": f.valor_adicional_negociacion || 0, // Nombre real en tabla fletes
            "RAZÓN": f.razon_adicional_negociacion || '', // Nombre real en tabla fletes
            "VALOR FLETE": f.precio,
            "PEDIDOS": f.no_pedidos || 0,
            "VALOR RUTA": f.valor_ruta || 0
        };
    });

    const ws = XLSX.utils.json_to_sheet(datosMapeados);
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, "Fletes");

    const nombreArchivo = esRango ? `Reporte_Fletes_${inicio}_a_${fin}.xlsx` : `Reporte_Fletes_${inicio}.xlsx`;
    XLSX.writeFile(wb, nombreArchivo);

    Swal.fire({
        icon: 'success',
        title: '¡Excel Generado!',
        text: `Se descargó el reporte correctamente`,
        timer: 2000,
        showConfirmButton: false,
        background: '#1e293b',
        color: '#fff'
    });
}

async function generarPDF() {
    // Definir opciones según la empresa
    let opcionesProveedores = '';
    const esTAT = (CURRENT_RAZON_SOCIAL === 'TAT');
    const session = CURRENT_SESSION;
    const role = (session?.profile?.rol || session?.user?.user_metadata?.rol || 'operario').toLowerCase();

    if (role === 'caja') {
        opcionesProveedores = `
            <option value="UNILEVER-FAMILIA">TAT: UNILEVER-FAMILIA</option>
            <option value="POLAR">TAT: POLAR</option>
            <option value="ZENU">TYM: ZENU</option>
            <option value="ALPINA-FLEISCHMANN">TYM: ALPINA-FLEISCHMANN</option>
        `;
    } else if (esTAT) {
        // Solo los de TAT (Unificados)
        opcionesProveedores = `
            <option value="UNILEVER-FAMILIA">UNILEVER-FAMILIA</option>
            <option value="POLAR">POLAR</option>
        `;
    } else {
        // Proveedores de TYM (Excluyendo los de TAT)
        opcionesProveedores = `
            <option value="ZENU">ZENU</option>
            <option value="ALPINA-FLEISCHMANN">ALPINA-FLEISCHMANN</option>
        `;
    }

    // Mostrar diálogo de filtros ANTES de generar
    const { value: formValues } = await Swal.fire({
        title: '📄 Configurar Reporte PDF',
        html: `
            <div style="max-width: 350px; margin: 0 auto; padding: 20px 0;">
                <div style="margin-bottom: 22px;">
                    <label for="pdf-fecha" style="display: block; text-align: center; margin-bottom: 10px; font-weight: 600; font-size: 13px;">
                        Fecha del Reporte (Obligatorio):
                    </label>
                    <input id="pdf-fecha" type="date" class="swal2-input" value="${new Date().toISOString().split('T')[0]}" required style="width: 100%; margin: 0;">
                </div>
                
                <div style="margin-bottom: 22px;">
                    <label for="pdf-proveedor" style="display: block; text-align: center; margin-bottom: 10px; font-weight: 600; font-size: 13px;">
                        Proveedor:
                    </label>
                    <select id="pdf-proveedor" class="swal2-input" style="width: 100%; margin: 0;">
                        <option value="">Todos los Proveedores</option>
                        ${opcionesProveedores}
                    </select>
                </div>

                ${role === 'caja' ? '' : `
                <div style="margin-bottom: 10px;">
                    <label for="pdf-tipo" style="display: block; text-align: center; margin-bottom: 10px; font-weight: 600; font-size: 13px;">
                        Tipo de Reporte:
                    </label>
                    <select id="pdf-tipo" class="swal2-input" style="width: 100%; margin: 0;">
                        <option value="fletes">Reporte de Fletes (Estándar)</option>
                        <option value="relacion">Relación de Planilla y Facturas</option>
                    </select>
                </div>
                ` }
            </div>
        `,
        showCancelButton: true,
        confirmButtonText: 'Generar PDF',
        cancelButtonText: 'Cancelar',
        background: '#1e293b',
        color: '#fff',
        width: '500px',
        preConfirm: () => {
            const fecha = document.getElementById('pdf-fecha').value;
            const proveedor = document.getElementById('pdf-proveedor').value;
            // Para Caja, forzamos 'relacion', para otros tomamos el valor del select
            const tipoSelect = document.getElementById('pdf-tipo');
            const tipo = tipoSelect ? tipoSelect.value : 'relacion';

            if (!fecha) {
                Swal.showValidationMessage('Por favor selecciona una fecha');
                return false;
            }

            return { fecha, proveedor, tipo };
        }
    });

    if (!formValues) return; // Usuario canceló

    const { fecha, proveedor, tipo } = formValues;

    // Filtrar datos desde la base de datos directamente
    let query = SupabaseClient.supabase
        .from('fletes')
        .select('*, vehiculo:vehiculos(placa, conductor)')
        .eq('fecha', fecha);

    if (proveedor) {
        if (proveedor === 'UNILEVER-FAMILIA') {
            query = query.in('proveedor', ['UNILEVER', 'FAMILIA', 'UNILEVER-FAMILIA']);
        } else if (proveedor === 'ALPINA-FLEISCHMANN') {
            query = query.in('proveedor', ['ALPINA', 'FLEISCHMANN', 'ALPINA-FLEISCHMANN']);
        } else {
            query = query.eq('proveedor', proveedor);
        }
    } else {
        // Filtro "Todos los Proveedores" respeta el contexto de la empresa
        if (esTAT) {
            query = query.in('proveedor', ['UNILEVER', 'FAMILIA', 'POLAR', 'UNILEVER-FAMILIA']);
        } else if (role !== 'caja') {
            // Contexto TYM (excluyendo caja que ve todo)
            query = query.in('proveedor', ['ALPINA', 'FLEISCHMANN', 'ZENU', 'ALPINA-FLEISCHMANN']);
        }
    }

    const { data: fletes, error } = await query;

    if (error || !fletes || fletes.length === 0) {
        return Swal.fire({
            icon: 'info',
            title: 'Sin Datos',
            text: `No hay fletes registrados para ${fecha}${proveedor ? ' del proveedor ' + proveedor : ''}`,
            background: '#1e293b',
            color: '#fff'
        });
    }

    const { jsPDF } = window.jspdf;
    const doc = new jsPDF({
        orientation: 'l',
        unit: 'mm',
        format: 'a4'
    });

    // Helper: Cargar imagen a Base64
    const loadImageBase64 = (url) => {
        return new Promise((resolve, reject) => {
            const img = new Image();
            img.crossOrigin = 'Anonymous';
            img.onload = () => {
                const canvas = document.createElement('canvas');
                canvas.width = img.width;
                canvas.height = img.height;
                const ctx = canvas.getContext('2d');
                ctx.drawImage(img, 0, 0);
                resolve(canvas.toDataURL(url.endsWith('png') ? 'image/png' : 'image/jpeg'));
            };
            img.onerror = reject;
            img.src = url;
        });
    };

    // --- Pre-cargar Logos ---
    const logos = {
        TYM: await loadImageBase64('../assets/img/logo_tym.png').catch(() => null),
        TAT: await loadImageBase64('../assets/img/logo_tat.jpg').catch(() => null)
    };

    const fechaImpresion = new Date().toLocaleString('es-CO');

    // --- Lógica Multi-Tabla por Proveedor ---
    // Mapeo especial para agrupar UNILEVER y FAMILIA
    const fletesMapeados = fletes.map(f => {
        // Flatten vehicle data
        const flatFlete = {
            ...f,
            placa: f.vehiculo?.placa || f.placa || 'N/A', // Try joined vehicle first, then fallback
            contratista: f.vehiculo?.conductor || f.contratista || 'N/A'
        };

        const prov = flatFlete.proveedor || 'SIN PROVEEDOR';
        if (['UNILEVER', 'FAMILIA', 'UNILEVER-FAMILIA'].includes(prov)) {
            return { ...flatFlete, _provAgrupado: 'UNILEVER-FAMILIA' };
        }
        if (['ALPINA', 'FLEISCHMANN', 'ALPINA-FLEISCHMANN'].includes(prov)) {
            return { ...flatFlete, _provAgrupado: 'ALPINA-FLEISCHMANN' };
        }
        return { ...flatFlete, _provAgrupado: prov };
    });

    const proveedoresTodos = [...new Set(fletesMapeados.map(f => f._provAgrupado))].sort();
    let finalY = 20;

    for (let i = 0; i < proveedoresTodos.length; i++) {
        const provActual = proveedoresTodos[i];
        const fletesProv = fletesMapeados.filter(f => f._provAgrupado === provActual);
        if (fletesProv.length === 0) continue;

        // Helper para dibujar el encabezado en cada página
        const dibujarHeader = (docInstance) => {
            const esTAT = provActual === 'UNILEVER-FAMILIA';
            const logoData = esTAT ? logos.TAT : logos.TYM;
            const logoFormat = esTAT ? 'JPEG' : 'PNG';
            const headerText = esTAT
                ? `PLANILLA FLETES TAT DISTRIBUCIONES DEL EJE CAFETERO SA`.toUpperCase()
                : `PLANILLA FLETES TIENDAS Y MARCAS EJE CAFETERO`.toUpperCase();
            const nitText = esTAT
                ? `NIT 901568117-1`
                : `NIT 900973929`;
            const subtituloText = esTAT
                ? `TAT - DISTRIBUCIONES DEL EJE CAFETERO SA NIT 901568117-1`
                : `TIENDAS Y MARCAS EJE CAFETERO NIT 900973929`;

            // Dibujar Logo
            if (logoData) {
                try {
                    docInstance.addImage(logoData, logoFormat, 10, esTAT ? 2 : 5, esTAT ? 25 : 20, esTAT ? 25 : 20);
                } catch (e) { }
            }

            docInstance.setFontSize(11);
            docInstance.setFont(undefined, 'bold');

            if (tipo === 'relacion') {
                docInstance.text("RELACION DE PLANILLA Y FACTURAS", 148, 12, { align: 'center' });
                docInstance.setFontSize(9);
                docInstance.text(subtituloText, 148, 18, { align: 'center' });
            } else {
                docInstance.text(headerText, 148, 12, { align: 'center' });
                docInstance.setFontSize(10);
                docInstance.text(nitText, 148, 17, { align: 'center' });
            }

            docInstance.setFont(undefined, 'normal');
            docInstance.setFontSize(8);
            docInstance.text(`Generado: ${fechaImpresion} - Fecha Reporte: ${fecha}`, 280, 22, { align: 'right' });
            docInstance.text(`Proveedor: ${provActual}`, 14, 28);
        };

        // Nueva página por proveedor si no es el primero
        if (i > 0) doc.addPage();
        finalY = 20;

        // Dibujar el primer encabezado de la tabla para este proveedor
        dibujarHeader(doc);

        let bodyData = [];
        let head = [];
        let columnStyles = {};

        if (tipo === 'relacion') {
            // ZONA | N. DE PLANILLA | FACTURAS ADICIONALES | CONDUCTOR | AUXILIAR | N. FACTURAS | VALOR RUTA
            head = [['ZONA', 'N. DE PLANILLA', 'FACTURAS ADICIONALES', 'CONDUCTOR', 'AUXILIAR', 'N. FACTURAS', 'VALOR RUTA']];
            let totalFacturas = 0, totalValorRuta = 0;

            bodyData = fletesProv.map(f => {
                const nFact = f.no_pedidos || 0;
                const vRuta = f.valor_ruta || 0;
                totalFacturas += nFact;
                totalValorRuta += vRuta;

                return [
                    f.zona || '',
                    f.no_planilla || '',
                    f.facturas_adicionales || '',
                    f.contratista || '',
                    f.auxiliares || '',
                    nFact,
                    moneyFormatter.format(vRuta)
                ];
            });

            // Fila de Totales
            bodyData.push([
                { content: 'TOTALES', colSpan: 5, styles: { fontStyle: 'bold', fillColor: [240, 240, 240], halign: 'right' } },
                { content: totalFacturas, styles: { fontStyle: 'bold', fillColor: [240, 240, 240], halign: 'center' } },
                { content: moneyFormatter.format(totalValorRuta), styles: { fontStyle: 'bold', fillColor: [240, 240, 240], halign: 'right' } }
            ]);

            columnStyles = {
                0: { cellWidth: 25 }, // ZONA
                1: { cellWidth: 35 }, // PLANILLA
                2: { cellWidth: 50 }, // FACTURAS ADIC
                3: { cellWidth: 50 }, // CONDUCTOR
                4: { cellWidth: 45 }, // AUXILIAR
                5: { cellWidth: 25, halign: 'center' }, // N. FACT
                6: { cellWidth: 47, halign: 'right' }   // VALOR RUTA (Ajustado para llenar 277mm)
            };
        } else {
            // Reporte Estándar de Fletes
            head = [['RUTA', 'PLACA', 'CONDUCTOR', 'AUXILIAR', '# PEDIDO', 'VR. PEDIDO', 'POBLACIÓN', 'VALOR FLETE', 'PARTICIPACIÓN', 'FIRMA CONDUCTOR']];
            let totalRutaProv = 0, totalFleteProv = 0, totalPedidosProv = 0;

            bodyData = fletesProv.map(f => {
                const vRuta = f.valor_ruta || 0;
                const vFlete = f.precio || 0;
                const numPed = f.no_pedidos || 0;
                totalRutaProv += vRuta; totalFleteProv += vFlete; totalPedidosProv += numPed;
                const participacion = vRuta > 0 ? ((vFlete / vRuta) * 100).toFixed(1) + '%' : '0%';

                return [
                    f.zona || '', f.placa, f.contratista, f.auxiliares || '', numPed,
                    moneyFormatter.format(vRuta), f.poblacion || '', moneyFormatter.format(vFlete),
                    participacion, ''
                ];
            });

            const pTotal = totalRutaProv > 0 ? (totalFleteProv / totalRutaProv * 100).toFixed(1) + '%' : '0%';
            bodyData.push([
                { content: 'TOTALES', colSpan: 4, styles: { fontStyle: 'bold', fillColor: [240, 240, 240], halign: 'right' } },
                { content: totalPedidosProv, styles: { fontStyle: 'bold', fillColor: [240, 240, 240] } },
                { content: moneyFormatter.format(totalRutaProv), styles: { fontStyle: 'bold', fillColor: [240, 240, 240] } },
                { content: '', styles: { fillColor: [240, 240, 240] } },
                { content: moneyFormatter.format(totalFleteProv), styles: { fontStyle: 'bold', fillColor: [240, 240, 240] } },
                { content: pTotal, styles: { fontStyle: 'bold', fillColor: [240, 240, 240] } },
                { content: '', styles: { fillColor: [240, 240, 240] } }
            ]);

            columnStyles = {
                0: { cellWidth: 25 }, // RUTA
                1: { cellWidth: 18 }, // PLACA
                2: { cellWidth: 50 }, // CONDUCTOR
                3: { cellWidth: 35 }, // AUXILIAR
                4: { cellWidth: 16, halign: 'center' }, // # PEDIDO
                5: { cellWidth: 28, halign: 'right' },  // VR. PEDIDO
                6: { cellWidth: 30 }, // POBLACIÓN
                7: { cellWidth: 28, halign: 'right' },  // VALOR FLETE
                8: { cellWidth: 22, halign: 'center' }, // PARTICIPACIÓN
                9: { cellWidth: 25 }  // FIRMA (Ajustado para evitar overflow)
            };
        }

        doc.autoTable({
            startY: 33,
            head: head,
            body: bodyData,
            theme: 'grid',
            headStyles: {
                fillColor: provActual === 'UNILEVER-FAMILIA' ? [249, 115, 22] : [41, 128, 185],
                fontSize: 7,
                halign: 'center'
            },
            bodyStyles: { fontSize: 6.5, overflow: 'linebreak', cellPadding: 1.5 },
            columnStyles: columnStyles,
            margin: { left: 10, right: 10, top: 33 }, // 'top' asegura que el salto de página no pegue la tabla al borde
            rowPageBreak: 'avoid',
            didDrawPage: (data) => {
                // Si la tabla continúa en una nueva página, redibujar el encabezado
                if (data.pageNumber > 1) {
                    dibujarHeader(doc);
                }
            }
        });

        finalY = doc.lastAutoTable.finalY;

    }

    // --- SECCIÓN: NOTAS DE NEGOCIACIÓN ---
    const negociaciones = fletes.filter(f => (f.valor_adicional_negociacion || 0) > 0);

    if (tipo === 'fletes' && negociaciones.length > 0) {
        // Verificar espacio o nueva página
        if (finalY > 230) {
            doc.addPage();
            finalY = 20;
        } else {
            finalY += 15;
        }

        doc.setFontSize(10);
        doc.setFont(undefined, 'bold');
        doc.text("NOTAS DE NEGOCIACIÓN:", 14, finalY);
        finalY += 6;

        doc.setFont(undefined, 'normal');
        doc.setFontSize(8.5);

        negociaciones.forEach(neg => {
            const placa = neg.vehiculo?.placa || neg.placa || 'N/A';
            const motivo = neg.razon_adicional_negociacion || 'Sin motivo especificado';
            const valor = moneyFormatter.format(neg.valor_adicional_negociacion);

            const texto = `• PLACA: ${placa} - MOTIVO: ${motivo} - VALOR: ${valor}`;

            // Dividir texto si es muy largo para el ancho de la página
            const splitText = doc.splitTextToSize(texto, 270);

            // Verificar si cabe en la página
            if (finalY + (splitText.length * 4) > 280) {
                doc.addPage();
                finalY = 20;
            }

            doc.text(splitText, 14, finalY);
            finalY += (splitText.length * 4) + 1;
        });
    }

    doc.save(`Reporte_Fletes_${fecha}.pdf`);

    Swal.fire({
        icon: 'success',
        title: '¡PDF Generado!',
        text: `Se descargó el reporte de ${fecha}`,
        timer: 2000,
        showConfirmButton: false,
        background: '#1e293b',
        color: '#fff'
    });
}
// ==========================================================
// 📊 GRÁFICOS (COLORFUL)
// ==========================================================
let myChart = null;
let myChart2 = null;

async function generarGraficos(providedStats = null) {
    const { session } = await SupabaseClient.auth.getSession();
    // Permitir a todos ver gráficos si están en la pestaña

    const ctx = document.getElementById("chartZonas");
    const ctx2 = document.getElementById("chartRegistros");
    if (!ctx) return;

    // OPTIMIZACIÓN: Si ya tenemos los datos (vía KPI RPC), usarlos directamente
    // De lo contrario, cargarlos (fallback)
    const stats = providedStats || await SupabaseClient.fletes.getEstadisticas();

    // Mapear campos si vienen del RPC (que usa 'zonas' para los valores)
    const valoresZonas = providedStats ? stats.zonas : stats.valoresZonas;
    const zonasCount = providedStats ? {} : stats.zonas; // El RPC no trae conteo por ahora, no se usa en el donut
    const ingresosPorDia = stats.ingresosPorDia || {};

    if (Object.keys(valoresZonas || {}).length === 0) {
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

    // --- Chart 1: Fletes por Zona (PREMIUM DOUGHNUT) ---
    const ctx1 = ctx.getContext("2d");
    if (ctx1) {
        const allZones = valoresZonas || {};
        const sortedZones = Object.entries(allZones).sort(([, a], [, b]) => b - a);

        let finalLabels = [];
        let finalData = [];
        const TOP_LIMIT = 20;

        if (sortedZones.length > TOP_LIMIT) {
            const topZones = sortedZones.slice(0, TOP_LIMIT);
            finalLabels = topZones.map(item => item[0]);
            finalData = topZones.map(item => item[1]);

            const remainingValue = sortedZones.slice(TOP_LIMIT).reduce((sum, item) => sum + item[1], 0);
            finalLabels.push("OTROS");
            finalData.push(remainingValue);
        } else {
            finalLabels = sortedZones.map(item => item[0]);
            finalData = sortedZones.map(item => item[1]);
        }

        const totalValue = finalData.reduce((a, b) => a + b, 0);

        // Paleta Vibrante & Pro Extendida (21 colores)
        const premiumColors = [
            '#3b82f6', '#10b981', '#f59e0b', '#ef4444',
            '#8b5cf6', '#06b6d4', '#ec4899', '#6366f1',
            '#14b8a6', '#f97316', '#84cc16', '#a855f7',
            '#22c55e', '#eab308', '#f43f5e', '#38bdf8',
            '#d946ef', '#4f46e5', '#fbbf24', '#00d2ff',
            'rgba(148, 163, 184, 0.4)' // Color para "OTROS"
        ];

        myChart = new Chart(ctx1, {
            type: 'doughnut',
            data: {
                labels: finalLabels,
                datasets: [{
                    data: finalData,
                    backgroundColor: premiumColors,
                    borderWidth: 0,
                    hoverOffset: 15,
                    borderRadius: 8,
                    spacing: 4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                cutout: '80%',
                plugins: {
                    legend: { display: false },
                    tooltip: {
                        backgroundColor: 'rgba(15, 23, 42, 0.95)',
                        padding: 12,
                        titleFont: { size: 13, weight: 'bold' },
                        bodyFont: { size: 12 },
                        cornerRadius: 8,
                        callbacks: {
                            label: function (context) {
                                const val = context.raw;
                                const percent = ((val / totalValue) * 100).toFixed(1);
                                return ` ${moneyFormatter.format(val)} (${percent}%)`;
                            }
                        }
                    }
                }
            },
            plugins: [{
                id: 'centerText',
                beforeDraw: function (chart) {
                    const { width, height, ctx } = chart;
                    ctx.restore();

                    // Cantidad de zonas únicas en el gráfico
                    const zonesCount = finalLabels.length;
                    const countStr = zonesCount === 1 ? "1 ZONA" : `${zonesCount} ZONAS`;

                    // Texto Principal (Cantidad)
                    ctx.font = "bold 1.4rem Inter, sans-serif";
                    ctx.textBaseline = "middle";
                    ctx.fillStyle = "#fff";
                    const textX = Math.round((width - ctx.measureText(countStr).width) / 2);
                    ctx.fillText(countStr, textX, height / 2 - 8);

                    // Subtexto (Etiqueta)
                    ctx.font = "600 0.7rem Inter, sans-serif";
                    ctx.fillStyle = "#94a3b8";
                    const subText = "DISTRIBUCIÓN";
                    const subX = Math.round((width - ctx.measureText(subText).width) / 2);
                    ctx.fillText(subText, subX, height / 2 + 15);

                    ctx.save();
                }
            }]
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

// Stat update removed
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

/**
 * Función global para limpiar base de datos (USO DEL ADMIN)
 */
window.limpiarBaseDeDatosProduction = async function () {
    const { isConfirmed } = await Swal.fire({
        title: '¿Limpiar Fletes para Producción?',
        text: 'Esta acción borrará TODOS los fletes registrados hasta ahora. Asegúrese de haber descargado los respaldos necesarios.',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#ef4444',
        cancelButtonColor: '#64748b',
        confirmButtonText: 'Sí, borrar todo',
        cancelButtonText: 'Cancelar',
        background: '#1e293b',
        color: '#fff'
    });

    if (isConfirmed) {
        Swal.fire({
            title: 'Limpiando...',
            allowOutsideClick: false,
            didOpen: () => Swal.showLoading(),
            background: '#1e293b',
            color: '#fff'
        });

        const result = await SupabaseClient.fletes.deleteAll();

        if (result.success) {
            await listarFletes(true);
            await actualizarKPI();
            await generarGraficos();

            Swal.fire({
                icon: 'success',
                title: 'Base de Datos Limpia',
                text: `Se eliminaron ${result.count} fletes correctamente. El sistema está listo para producción.`,
                background: '#1e293b',
                color: '#fff'
            });
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'No se pudo limpiar la base de datos: ' + result.error,
                background: '#1e293b',
                color: '#fff'
            });
        }
    }
}



// ==========================================================
// 🚀 INIT - DOM LOADED
// ==========================================================
document.addEventListener("DOMContentLoaded", async () => {
    try {
        console.log("🚀 FletesApp Inicializando con Supabase...");

        setupTheme(); // Init Theme
        await checkAuth();  // Init Auth & Role UI (Async)

        // Obtener el rol del usuario actual
        const session = CURRENT_SESSION;
        const role = (session?.profile?.rol || session?.user?.user_metadata?.rol || 'operario').toLowerCase();

        // OPTIMIZACIÓN: Cargar solo datos necesarios según el rol
        if (role === 'admin') {
            // Administradores cargan TODO: vehículos, fletes y KPIs
            Promise.all([
                listarVehiculos(),
                listarFletes(),
                actualizarKPI()
            ]).catch(err => {
                console.error("❌ Error cargando datos:", err);
                Swal.fire({
                    icon: 'error',
                    title: 'Error de Datos',
                    text: 'No se pudieron cargar algunos datos del dashboard.',
                    background: '#1e293b',
                    color: '#fff'
                });
            });
        } else if (role === 'operario') {
            // Operarios SOLO cargan fletes y KPIs (NO vehículos - más rápido)
            Promise.all([
                listarFletes(),
                actualizarKPI()
            ]).catch(err => {
                console.error("❌ Error cargando datos:", err);
                Swal.fire({
                    icon: 'error',
                    title: 'Error de Datos',
                    text: 'No se pudieron cargar datos del dashboard.',
                    background: '#1e293b',
                    color: '#fff'
                });
            });
            console.log("✅ Usuario 'operario' - Carga optimizada (sin vehículos)");
        } else {
            console.log("✅ Usuario 'caja' - Interfaz limpia sin datos innecesarios");
        }

        // 1. Navigation
        const tabs = document.querySelectorAll(".nav-item");
        tabs.forEach(t => {
            t.addEventListener("click", async () => {
                const target = t.dataset.tab;
                const session = CURRENT_SESSION;
                const role = (session?.profile?.rol || session?.user?.user_metadata?.rol || 'operario').toLowerCase();

                if (role === 'admin' && target === 'estadisticas') return;

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
        const throttledSearch = debounce(buscarFletes, 400);
        document.getElementById("buscarFlete")?.addEventListener("input", throttledSearch);
        document.getElementById("filtroZona")?.addEventListener("change", buscarFletes);
        document.getElementById("filtroFecha")?.addEventListener("change", buscarFletes);

        // 5. Configuración Lógica
        buscarConductorPorPlaca("placa", "contratista");
        buscarConductorPorPlaca("modal-placa", "modal-contratista");

        setupCalculators("");
        setupCalculators("modal-");

        // Autocompletado de contratista al registrar vehículo
        document.getElementById("op_placa")?.addEventListener("input", (e) => {
            const placa = e.target.value.toUpperCase().replace(/[\s-]/g, '');
            const contratistaInput = document.getElementById("op_contratista");
            if (contratistaInput && MAPA_CONTRATISTAS[placa]) {
                contratistaInput.value = MAPA_CONTRATISTAS[placa];
            }
        });

        // 7. Menu Mobile
        const menuBtn = document.getElementById("menuToggleBtn");
        const sidebar = document.querySelector(".sidebar");

        menuBtn?.addEventListener("click", (e) => {
            e.stopPropagation();
            sidebar.classList.toggle("open");
        });

        // Cerrar al clickear fuera
        document.addEventListener("click", (e) => {
            if (sidebar.classList.contains("open") && !sidebar.contains(e.target) && e.target !== menuBtn) {
                sidebar.classList.remove("open");
            }
        });

        // Cerrar al clickear opciones internas (evitando el toggle de tema)
        sidebar?.addEventListener("click", (e) => {
            if (e.target.closest(".nav-item") || e.target.closest(".action-btn") || e.target.closest(".logout-btn")) {
                sidebar.classList.remove("open");
            }
        });

    } catch (error) {
        console.error("❌ Error Crítico en inicialización:", error);
    }
});