/* ==========================================================
   ?? Mï¿½DULO GESTIï¿½N DE PLANILLAS
   FletesApp ï¿½ js/modules/planillas.js
   ==========================================================
   Roles que usan este mï¿½dulo:
     ï¿½ cargador      ? sube Excel, gestiona planillas cargadas
     ï¿½ programador   ? asigna planillas a fletes, desasigna facturas
     ï¿½ cajera_plan   ? visualiza kanban de 4 estados (solo lectura + cambio de estado)
     ï¿½ admin         ? acceso completo a todo
   ========================================================== */

'use strict';

// -- Estado local del mï¿½dulo --------------------------------
let PL_CACHE          = [];   // Cache de planillas
let PL_FACTURAS_MODAL = [];   // Facturas del modal activo
let PL_ID_MODAL       = null; // Planilla abierta en modal
let PL_ROLE           = null; // Rol del usuario ('admin'|'cargador'|'programador'|'cajera_plan')
let PL_INITIALIZED    = false;

const PL_ESTADOS = ['TRANSITORIA', 'DESPACHADA', 'CUADRADA'];

const PL_ESTADO_META = {
    'TRANSITORIA':    { color: '#f59e0b', bg: 'rgba(245,158,11,0.12)',  icon: 'ri-time-line',            label: 'TRANSITORIA'    },
    'DESPACHADA':     { color: '#8b5cf6', bg: 'rgba(139,92,246,0.12)', icon: 'ri-truck-line',            label: 'DESPACHADA'     },
    'CUADRADA':       { color: '#10b981', bg: 'rgba(16,185,129,0.12)', icon: 'ri-checkbox-circle-line',  label: 'CUADRADA'       },
};

const moneyFmt = new Intl.NumberFormat('es-CO', { style: 'currency', currency: 'COP', minimumFractionDigits: 0 });
const fmt = v => moneyFmt.format(v || 0);

// -- Inicializaciï¿½n -----------------------------------------
async function inicializarModuloPlanillas() {
    if (PL_INITIALIZED) { await cargarPlanillas(); return; }
    PL_ROLE = (window.CURRENT_ROLE || 'cargador').toLowerCase();
    PL_INITIALIZED = true;

    // Fijar fecha de hoy en el filtro
    const hoy = new Date().toISOString().split('T')[0];
    const fFecha = document.getElementById('pl-filtro-fecha');
    if (fFecha) fFecha.value = hoy;

    // Mostrar/ocultar secciones segï¿½n rol
    _aplicarVisibilidadRol();

    // Listeners de filtros
    document.getElementById('pl-filtro-estado')?.addEventListener('change',   cargarPlanillas);
    document.getElementById('pl-filtro-fecha')?.addEventListener('change',    cargarPlanillas);
    document.getElementById('pl-filtro-proveedor')?.addEventListener('change',cargarPlanillas);
    document.getElementById('pl-filtro-busqueda')?.addEventListener('input',  _debounce(cargarPlanillas, 350));

    await cargarPlanillas();
}

function _aplicarVisibilidadRol() {
    const role = PL_ROLE;
    // Secciï¿½n de carga de Excel solo para cargador y admin
    const secCarga = document.getElementById('pl-sec-carga');
    if (secCarga) secCarga.style.display = (['admin','cargador'].includes(role)) ? 'block' : 'none';

    // Secciï¿½n de programaciï¿½n solo para programador y admin
    const secProg = document.getElementById('pl-sec-programacion');
    if (secProg) secProg.style.display = (['admin','programador'].includes(role)) ? 'block' : 'none';

    // Kanban: oculto para cajera (usa vista simplificada)
    const secKanban = document.getElementById('pl-sec-kanban');
    if (secKanban) secKanban.style.display = (role === 'cajera_plan') ? 'none' : 'block';

    // Vista simplificada cajera
    const secCajera = document.getElementById('pl-sec-cajera');
    if (secCajera) secCajera.style.display = (role === 'cajera_plan') ? 'block' : 'none';

    // Tabla de facturas sueltas visible para cargador, programador y admin
    const secSueltas = document.getElementById('pl-sec-sueltas');
    if (secSueltas) secSueltas.style.display = (['admin','cargador','programador'].includes(role)) ? 'block' : 'none';

    // Filtros del kanban: ocultar para cajera
    const secFiltros = document.getElementById('pl-sec-filtros');
    if (secFiltros) secFiltros.style.display = (role === 'cajera_plan') ? 'none' : 'block';

    // Tabla resumen: ocultar para cajera
    const secTablaResumen = document.getElementById('pl-sec-tabla-resumen');
    if (secTablaResumen) secTablaResumen.style.display = (role === 'cajera_plan') ? 'none' : 'block';
}

// -- Carga y Renderizado Principal --------------------------
async function cargarPlanillas() {
    const filtros = {
        estado:    document.getElementById('pl-filtro-estado')?.value    || '',
        fecha:     document.getElementById('pl-filtro-fecha')?.value     || '',
        proveedor: document.getElementById('pl-filtro-proveedor')?.value || '',
        busqueda:  document.getElementById('pl-filtro-busqueda')?.value  || '',
    };

    // Limpiar filtros vacï¿½os
    Object.keys(filtros).forEach(k => { if (!filtros[k]) delete filtros[k]; });

    _mostrarLoadingKanban(true);

    const result = await SupabaseClient.planillas.getAll(filtros);
    if (!result.success) {
        _mostrarErrorKanban('Error al cargar planillas. Revisa la consola.');
        return;
    }

    PL_CACHE = result.data;
    _renderKanban(PL_CACHE);
    _renderTabla(PL_CACHE);
    await _actualizarKPIs();
    await _renderFacturasSueltas();
}

// -- Kanban -------------------------------------------------
function _renderKanban(planillas) {
    PL_ESTADOS.forEach(estado => {
        const col  = document.getElementById(`pl-col-${_estadoId(estado)}`);
        const cnt  = document.getElementById(`pl-cnt-${_estadoId(estado)}`);
        if (!col) return;

        const grupo = planillas.filter(p => p.estado === estado);
        if (cnt) cnt.textContent = grupo.length;

        col.innerHTML = grupo.length === 0
            ? `<div class="pl-kanban-empty"><i class="ri-inbox-line"></i><span>Sin planillas</span></div>`
            : grupo.map(p => _cardPlanilla(p)).join('');
    });
    _mostrarLoadingKanban(false);
}

function _cardPlanilla(p) {
    const meta      = PL_ESTADO_META[p.estado] || PL_ESTADO_META['TRANSITORIA'];
    const factTotal = p.planilla_facturas?.length || 0;
    const factAsig  = p.planilla_facturas?.filter(f => f.asignada)?.length || 0;
    const canEdit   = ['admin','cargador','programador'].includes(PL_ROLE);
    const canDelete = ['admin','cargador'].includes(PL_ROLE);
    const canMove   = ['admin','programador','cajera_plan'].includes(PL_ROLE);

    const siguienteEstado = PL_ESTADOS[PL_ESTADOS.indexOf(p.estado) + 1] || null;
    const anteriorEstado  = PL_ESTADOS[PL_ESTADOS.indexOf(p.estado) - 1] || null;

    // Datos de cuadre (si ya estï¿½ CUADRADA)
    const esCuadrada = p.estado === 'CUADRADA';
    const infoCuadre = esCuadrada && p.valor_cuadrado
        ? `<div style="margin-top:8px; padding:7px 10px; background:rgba(16,185,129,0.08);
                       border:1px solid rgba(16,185,129,0.2); border-radius:7px;">
               <div style="font-size:0.7rem; color:#94a3b8; text-transform:uppercase; margin-bottom:3px;">
                   Cuadre confirmado
               </div>
               <div style="display:flex; justify-content:space-between; flex-wrap:wrap; gap:4px;">
                   <span style="color:#10b981; font-weight:700; font-size:0.85rem;">
                       ${fmt(p.valor_cuadrado)}
                   </span>
                   ${p.cuadrado_por ? `<span style="font-size:0.75rem; color:#94a3b8;">${p.cuadrado_por}</span>` : ''}
               </div>
               ${p.obs_cuadre ? `<div style="font-size:0.75rem; color:#94a3b8; margin-top:3px; font-style:italic;">
                   "${p.obs_cuadre}"</div>` : ''}
           </div>`
        : '';

    return `
    <div class="pl-card glass-card" id="plcard-${p.id}" data-id="${p.id}" data-estado="${p.estado}">
        <div class="pl-card-header">
            <span class="pl-badge-planilla">${p.no_planilla}</span>
            <span class="pl-estado-chip" style="background:${meta.bg}; color:${meta.color}; border-color:${meta.color}40;">
                <i class="${meta.icon}"></i> ${meta.label}
            </span>
        </div>

        <div class="pl-card-info">
            <div class="pl-info-row"><i class="ri-calendar-line"></i> <span>${p.fecha || 'ï¿½'}</span></div>
            ${p.zona ? `<div class="pl-info-row"><i class="ri-map-pin-line"></i> <span>${p.zona}</span></div>` : ''}
            ${p.placa
                ? `<div class="pl-info-row">
                       <i class="ri-truck-line"></i>
                       <span class="badge-plate" style="font-size:0.75rem;">${p.placa}</span>
                       ${p.conductor ? `<span style="font-size:0.8rem;color:var(--text-muted);">${p.conductor}</span>` : ''}
                   </div>`
                : `<div class="pl-info-row" style="color:#f59e0b;">
                       <i class="ri-alert-line"></i> <span style="font-size:0.8rem;">Sin vehï¿½culo asignado</span>
                   </div>`}
            ${p.poblacion ? `<div class="pl-info-row"><i class="ri-map-2-line"></i> <span style="font-size:0.8rem;">${p.poblacion}</span></div>` : ''}
            <div class="pl-info-row"><i class="ri-file-list-3-line"></i>
                <span>${factAsig} / ${factTotal} facturas asignadas</span>
            </div>
            <div class="pl-info-row price-cell"><i class="ri-money-dollar-circle-line"></i>
                <span>${fmt(p.valor_total)}</span>
            </div>
            ${p.proveedor ? `<div class="pl-info-row"><i class="ri-store-2-line"></i> <span style="font-size:0.8rem;">${p.proveedor}</span></div>` : ''}
        </div>

        ${factTotal !== factAsig ? `
        <div class="pl-facturas-sueltas-alert">
            <i class="ri-alert-line"></i> ${factTotal - factAsig} factura(s) suelta(s)
        </div>` : ''}

        ${infoCuadre}

        <div class="pl-card-actions">
            <button class="pl-btn-action pl-btn-detail" onclick="abrirDetallePlanilla('${p.id}')" title="Ver facturas">
                <i class="ri-eye-line"></i> Detalle
            </button>
            ${canMove && anteriorEstado ? `
            <button class="pl-btn-action pl-btn-retroceder" onclick="cambiarEstadoPlanilla('${p.id}','${anteriorEstado}')" title="Retroceder estado">
                <i class="ri-arrow-left-line"></i>
            </button>` : ''}
            ${canMove && siguienteEstado ? `
            <button class="pl-btn-action pl-btn-avanzar" onclick="cambiarEstadoPlanilla('${p.id}','${siguienteEstado}')" title="Avanzar a ${siguienteEstado}">
                <i class="ri-arrow-right-line"></i> ${siguienteEstado}
            </button>` : ''}
            ${canDelete ? `
            <button class="pl-btn-action pl-btn-eliminar" onclick="eliminarPlanillaUI('${p.id}','${p.no_planilla}')" title="Eliminar">
                <i class="ri-delete-bin-line"></i>
            </button>` : ''}
        </div>
    </div>`;
}

// -- Tabla resumida -----------------------------------------
function _renderTabla(planillas) {
    const tbody = document.getElementById('pl-tabla-body');
    if (!tbody) return;

    if (planillas.length === 0) {
        tbody.innerHTML = `<tr><td colspan="8" style="text-align:center;padding:24px;color:var(--text-muted);">
            <i class="ri-inbox-line"></i> Sin planillas para los filtros aplicados</td></tr>`;
        return;
    }

    tbody.innerHTML = planillas.map(p => {
        const meta = PL_ESTADO_META[p.estado] || PL_ESTADO_META['TRANSITORIA'];
        return `<tr>
            <td><span class="badge-plate" style="font-size:0.75rem;">${p.no_planilla}</span></td>
            <td>${p.fecha || 'ï¿½'}</td>
            <td>${p.zona || 'ï¿½'}</td>
            <td>${p.proveedor || 'ï¿½'}</td>
            <td>${p.placa ? `<span class="badge-plate" style="font-size:0.7rem;">${p.placa}</span>` : '<span style="color:var(--text-muted)">Sin asignar</span>'}</td>
            <td style="text-align:center;">${p.total_facturas || 0}</td>
            <td class="price-cell">${fmt(p.valor_total)}</td>
            <td>
                <span class="pl-estado-chip" style="background:${meta.bg};color:${meta.color};border-color:${meta.color}40;font-size:0.75rem;">
                    <i class="${meta.icon}"></i> ${meta.label}
                </span>
            </td>
        </tr>`;
    }).join('');
}

// -- KPIs ---------------------------------------------------
async function _actualizarKPIs() {
    const result = await SupabaseClient.planillas.getKPIs();
    if (!result.success) return;

    const counts = result.data;
    PL_ESTADOS.forEach(e => {
        const el = document.getElementById(`pl-kpi-${_estadoId(e)}`);
        if (el) el.textContent = counts[e] || 0;
    });

    // KPI total
    const total = Object.values(counts).reduce((a, b) => a + b, 0);
    const elTot = document.getElementById('pl-kpi-total');
    if (elTot) elTot.textContent = total;

    // Valor total de planillas en cache
    const valorTotal = PL_CACHE.reduce((s, p) => s + (parseFloat(p.valor_total) || 0), 0);
    const elValor = document.getElementById('pl-kpi-valor');
    if (elValor) elValor.textContent = fmt(valorTotal);
}

// -- Modal Detalle / Facturas -------------------------------
async function abrirDetallePlanilla(planillaId) {
    PL_ID_MODAL = planillaId;
    const planilla = PL_CACHE.find(p => p.id === planillaId);
    if (!planilla) return;

    PL_FACTURAS_MODAL = planilla.planilla_facturas || [];

    // Cabecera del modal
    document.getElementById('pl-modal-no-planilla').textContent  = planilla.no_planilla;
    document.getElementById('pl-modal-fecha').textContent        = planilla.fecha || 'ï¿½';
    document.getElementById('pl-modal-zona').textContent         = planilla.zona || 'ï¿½';
    document.getElementById('pl-modal-proveedor').textContent    = planilla.proveedor || 'ï¿½';
    document.getElementById('pl-modal-total-fact').textContent   = planilla.total_facturas || 0;
    document.getElementById('pl-modal-valor').textContent        = fmt(planilla.valor_total);

    const meta = PL_ESTADO_META[planilla.estado] || PL_ESTADO_META['TRANSITORIA'];
    const chipEl = document.getElementById('pl-modal-estado-chip');
    if (chipEl) {
        chipEl.textContent  = planilla.estado;
        chipEl.style.color  = meta.color;
        chipEl.style.background = meta.bg;
        chipEl.style.borderColor = meta.color + '40';
    }

    // Secciï¿½n de programaciï¿½n (solo para programador/admin)
    const secProgModal = document.getElementById('pl-modal-sec-prog');
    if (secProgModal) {
        secProgModal.style.display = (['admin','programador'].includes(PL_ROLE)) ? 'block' : 'none';
        if (planilla.placa) {
            document.getElementById('pl-modal-placa').value     = planilla.placa;
            document.getElementById('pl-modal-conductor').value = planilla.conductor || '';
        }
    }

    // Render de facturas
    _renderFacturasModal(PL_FACTURAS_MODAL);

    // Mostrar modal
    document.getElementById('pl-modal-overlay').classList.add('visible');
}

function cerrarModalPlanilla() {
    document.getElementById('pl-modal-overlay').classList.remove('visible');
    PL_ID_MODAL      = null;
    PL_FACTURAS_MODAL = [];
}

function _renderFacturasModal(facturas) {
    const tbody = document.getElementById('pl-modal-facturas-body');
    if (!tbody) return;

    const canToggle = ['admin','programador','cajera_plan','cajera','caja'].includes(PL_ROLE);

    if (facturas.length === 0) {
        tbody.innerHTML = `<tr><td colspan="7" style="text-align:center;color:var(--text-muted);padding:20px;">
            Sin facturas registradas</td></tr>`;
        const chkAll = document.getElementById('pl-modal-chk-all');
        if (chkAll) { chkAll.checked = false; chkAll.indeterminate = false; }
        return;
    }

    tbody.innerHTML = facturas.map(f => `
        <tr id="frow-${f.id}" class="${f.asignada ? '' : 'pl-fila-suelta'}">
            <td style="text-align:center;">
                ${canToggle ? `<label class="pl-toggle-wrap">
                    <input type="checkbox" ${f.asignada ? 'checked' : ''} onchange="toggleFacturaUI('${f.id}', this.checked)">
                    <span class="pl-toggle-slider"></span>
                </label>` : (f.asignada ? '<i class="ri-checkbox-circle-line" style="color:#10b981"></i>' : '<i class="ri-close-circle-line" style="color:#ef4444"></i>')}
            </td>
            <td><strong>${f.no_factura}</strong></td>
            <td>${f.fecha_entrega || 'ï¿½'}</td>
            <td>${f.zona || 'ï¿½'}</td>
            <td class="price-cell">${fmt(f.valor_bruto)}</td>
            <td class="price-cell">${fmt(f.valor_factura)}</td>
            <td class="price-cell">${fmt(f.valor_total)}</td>
        </tr>`).join('');

    // Actualizar estado del checkbox principal del header
    const chkAll = document.getElementById('pl-modal-chk-all');
    if (chkAll) {
        const asigCount = facturas.filter(f => f.asignada).length;
        chkAll.checked = asigCount === facturas.length && facturas.length > 0;
        chkAll.indeterminate = asigCount > 0 && asigCount < facturas.length;
    }

    // Resumen al pie
    const asig       = facturas.filter(f => f.asignada).length;
    const sueltas    = facturas.length - asig;
    const sumAsig    = facturas.filter(f => f.asignada).reduce((s,f) => s + (f.valor_total || 0), 0);
    const sumSueltas = facturas.filter(f => !f.asignada).reduce((s,f) => s + (f.valor_total || 0), 0);
    const elResumen  = document.getElementById('pl-modal-resumen-fact');
    if (elResumen) {
        elResumen.innerHTML = `
            <span style="color:#10b981"><i class="ri-checkbox-circle-line"></i> ${asig} asignadas (${fmt(sumAsig)})</span>
            ${sueltas > 0 ? `<span style="color:#ef4444"><i class="ri-alert-line"></i> ${sueltas} sueltas (${fmt(sumSueltas)})</span>` : ''}
            <span style="color:var(--text-muted)">Total planilla: ${fmt(facturas.reduce((s,f)=>s+(f.valor_total||0),0))}</span>`;
    }
}

// -- Marcar / desmarcar todas las facturas en el modal de detalle -
async function marcarTodasFacturasModal(asignada) {
    if (!PL_FACTURAS_MODAL || !PL_FACTURAS_MODAL.length) return;
    const canToggle = ['admin','programador','cajera_plan','cajera','caja'].includes(PL_ROLE);
    if (!canToggle) return;

    const ids = PL_FACTURAS_MODAL.map(f => f.id);

    // Actualizar en memoria local y UI de inmediato
    PL_FACTURAS_MODAL.forEach(f => f.asignada = asignada);
    _renderFacturasModal(PL_FACTURAS_MODAL);

    // Actualizar en base de datos en lote
    const res = await SupabaseClient.planillas.toggleFacturasBatch(ids, asignada);
    if (!res.success) {
        Swal.fire({ icon:'error', title:'Error', text:'No se pudo actualizar el estado de las facturas.', background:'#1e293b', color:'#fff' });
        return;
    }

    // Actualizar cache de la planilla y tarjeta en kanban
    const planilla = PL_CACHE.find(p => p.id === PL_ID_MODAL);
    if (planilla && planilla.planilla_facturas) {
        planilla.planilla_facturas.forEach(f => f.asignada = asignada);
        const cardEl = document.getElementById(`plcard-${PL_ID_MODAL}`);
        if (cardEl) cardEl.outerHTML = _cardPlanilla(planilla);
    }
}

// -- Toggle de factura (asignar / desasignar) ---------------
async function toggleFacturaUI(facturaId, asignada) {
    const result = await SupabaseClient.planillas.toggleFactura(facturaId, asignada);
    if (!result.success) {
        Swal.fire({ icon:'error', title:'Error', text:'No se pudo actualizar la factura.', background:'#1e293b', color:'#fff' });
        return;
    }
    // Actualizar en cache local
    const f = PL_FACTURAS_MODAL.find(x => x.id === facturaId);
    if (f) f.asignada = asignada;

    const fila = document.getElementById(`frow-${facturaId}`);
    if (fila) {
        if (asignada) fila.classList.remove('pl-fila-suelta');
        else          fila.classList.add('pl-fila-suelta');
    }

    // Actualizar resumen del modal
    _renderFacturasModal(PL_FACTURAS_MODAL);

    // Actualizar card en kanban
    const planilla = PL_CACHE.find(p => p.id === PL_ID_MODAL);
    if (planilla) {
        const fi = planilla.planilla_facturas?.find(x => x.id === facturaId);
        if (fi) fi.asignada = asignada;
        const cardEl = document.getElementById(`plcard-${PL_ID_MODAL}`);
        if (cardEl) cardEl.outerHTML = _cardPlanilla(planilla);
    }
}

// -- Cambio de estado ---------------------------------------
// -- Cambio de estado ---------------------------------------
async function cambiarEstadoPlanilla(planillaId, nuevoEstado) {
    const planilla = PL_CACHE.find(p => p.id === planillaId);
    if (!planilla) return;

    const meta = PL_ESTADO_META[nuevoEstado];

    // -- Flujo especial para CUADRADA: la cajera confirma el cuadre --
    if (nuevoEstado === 'CUADRADA') {
        const moneyFmtC = new Intl.NumberFormat('es-CO', { style:'currency', currency:'COP', minimumFractionDigits:0 });
        const facturas  = (planilla.planilla_facturas || []).map(f => ({ ...f }));

        // Estado local de los checks: por defecto true si no estï¿½ desasignada
        const estadoChecks = {};
        facturas.forEach(f => {
            estadoChecks[f.id] = f.asignada !== false;
        });

        const calcularTotalesModal = () => {
            let cantCuadradas = 0;
            let sumCuadradas = 0;
            let cantNoCuadradas = 0;
            let sumNoCuadradas = 0;
            const noCuadradasList = [];

            facturas.forEach(f => {
                const val = parseFloat(f.valor_total || 0);
                if (estadoChecks[f.id]) {
                    cantCuadradas++;
                    sumCuadradas += val;
                } else {
                    cantNoCuadradas++;
                    sumNoCuadradas += val;
                    noCuadradasList.push(f);
                }
            });

            return { cantCuadradas, sumCuadradas, cantNoCuadradas, sumNoCuadradas, noCuadradasList };
        };

        const { value: formValues, isConfirmed } = await Swal.fire({
            title: '?? Cuadre de Planilla',
            width: '740px',
            html: `
                <div style="text-align:left;font-size:0.86rem;">
                    <div style="padding:12px 14px;background:rgba(16,185,129,0.08);border:1px solid rgba(16,185,129,0.25);border-radius:10px;margin-bottom:14px;">
                        <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:8px;">
                            <span><i class="ri-file-list-2-line"></i> Planilla: <strong style="font-family:monospace;font-size:0.95rem;">${planilla.no_planilla}</strong></span>
                            <span><i class="ri-calendar-line"></i> ${planilla.fecha || 'ï¿½'}</span>
                            ${planilla.placa ? `<span><i class="ri-truck-line"></i> <strong>${planilla.placa}</strong></span>` : ''}
                            <span style="color:#10b981;font-weight:700;"><i class="ri-money-dollar-circle-line"></i> ${moneyFmtC.format(planilla.valor_total)}</span>
                        </div>
                    </div>

                    <!-- Barra de herramientas: Marcar / Desmarcar todas -->
                    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:8px;flex-wrap:wrap;gap:6px;">
                        <label style="font-size:0.75rem;font-weight:700;color:#94a3b8;text-transform:uppercase;display:flex;align-items:center;gap:6px;">
                            <i class="ri-file-check-line" style="color:#10b981;font-size:1rem;"></i> Facturas a verificar (${facturas.length})
                        </label>
                        <div style="display:flex;gap:8px;">
                            <button type="button" id="swal-btn-marcar-todas" style="padding:5px 12px;font-size:0.75rem;background:rgba(16,185,129,0.15);color:#10b981;border:1px solid rgba(16,185,129,0.35);border-radius:6px;cursor:pointer;font-weight:700;display:inline-flex;align-items:center;gap:4px;">
                                <i class="ri-checkbox-line"></i> Marcar todas
                            </button>
                            <button type="button" id="swal-btn-desmarcar-todas" style="padding:5px 12px;font-size:0.75rem;background:rgba(239,68,68,0.12);color:#ef4444;border:1px solid rgba(239,68,68,0.35);border-radius:6px;cursor:pointer;font-weight:700;display:inline-flex;align-items:center;gap:4px;">
                                <i class="ri-checkbox-blank-line"></i> Desmarcar todas
                            </button>
                        </div>
                    </div>

                    <!-- Lista de facturas interactiva -->
                    <div id="swal-facturas-list" style="max-height:210px;overflow-y:auto;background:#0b1324;border:1px solid rgba(255,255,255,0.08);border-radius:8px;padding:6px;margin-bottom:12px;">
                        ${facturas.length === 0 ? '<div style="text-align:center;padding:16px;color:#94a3b8;">Sin facturas registradas en esta planilla</div>' :
                          facturas.map(f => {
                            const isChecked = estadoChecks[f.id];
                            return `
                            <div class="swal-fact-row" id="swal-frow-${f.id}" data-id="${f.id}"
                                 style="display:flex;align-items:center;justify-content:space-between;padding:7px 10px;margin-bottom:4px;border-radius:6px;background:${isChecked ? 'rgba(16,185,129,0.06)' : 'rgba(239,68,68,0.06)'};border:1px solid ${isChecked ? 'rgba(16,185,129,0.2)' : 'rgba(239,68,68,0.2)'};transition:0.15s;">
                                <label style="display:flex;align-items:center;gap:10px;cursor:pointer;flex-grow:1;margin:0;">
                                    <input type="checkbox" class="swal-fact-chk" data-id="${f.id}" ${isChecked ? 'checked' : ''} style="width:16px;height:16px;accent-color:#10b981;cursor:pointer;">
                                    <span style="font-family:monospace;font-weight:700;font-size:0.88rem;color:${isChecked ? '#f8fafc' : '#94a3b8'};">
                                        ${f.no_factura}
                                    </span>
                                    ${f.zona ? `<span style="font-size:0.72rem;color:#64748b;background:rgba(255,255,255,0.05);padding:2px 6px;border-radius:4px;">${f.zona}</span>` : ''}
                                </label>
                                <div style="display:flex;align-items:center;gap:10px;">
                                    <span class="swal-status-badge" style="font-size:0.72rem;padding:2px 7px;border-radius:4px;font-weight:600;background:${isChecked ? 'rgba(16,185,129,0.15)' : 'rgba(239,68,68,0.15)'};color:${isChecked ? '#10b981' : '#ef4444'};">
                                        ${isChecked ? 'Cuadra' : 'No cuadra'}
                                    </span>
                                    <span style="font-weight:700;font-size:0.9rem;color:${isChecked ? '#10b981' : '#ef4444'};font-family:monospace;min-width:90px;text-align:right;">
                                        ${moneyFmtC.format(f.valor_total || 0)}
                                    </span>
                                </div>
                            </div>`;
                        }).join('')}
                    </div>

                    <!-- Resumen en vivo de Cuadre -->
                    <div style="display:grid;grid-template-columns:1fr 1fr;gap:10px;margin-bottom:14px;">
                        <div style="padding:10px 12px;background:rgba(16,185,129,0.09);border:1px solid rgba(16,185,129,0.25);border-radius:8px;">
                            <div style="font-size:0.7rem;color:#94a3b8;text-transform:uppercase;font-weight:600;">Facturas Cuadradas (<span id="swal-cnt-cuadradas">0</span>)</div>
                            <div id="swal-total-cuadradas" style="font-size:1.1rem;font-weight:800;color:#10b981;margin-top:2px;">$ 0</div>
                        </div>
                        <div style="padding:10px 12px;background:rgba(239,68,68,0.07);border:1px solid rgba(239,68,68,0.22);border-radius:8px;">
                            <div style="font-size:0.7rem;color:#94a3b8;text-transform:uppercase;font-weight:600;">No Cuadradas / Desmarcadas (<span id="swal-cnt-nocuadradas">0</span>)</div>
                            <div id="swal-total-nocuadradas" style="font-size:1.1rem;font-weight:800;color:#ef4444;margin-top:2px;">$ 0</div>
                        </div>
                    </div>

                    <div style="margin-bottom:12px;">
                        <label style="display:flex;justify-content:space-between;margin-bottom:5px;color:#94a3b8;font-size:0.78rem;font-weight:600;">
                            <span>VALOR RECIBIDO (confirmaciï¿½n) <span style="color:#ef4444;">*</span></span>
                            <span id="swal-btn-auto-val" style="font-size:0.74rem;color:#10b981;cursor:pointer;font-weight:600;" title="Restaurar al total de facturas cuadradas">
                                <i class="ri-magic-line"></i> Reajustar al total cuadrado
                            </span>
                        </label>
                        <input id="swal-valor-cuadre" type="text"
                               placeholder="${moneyFmtC.format(planilla.valor_total)}"
                               style="width:100%;padding:10px 14px;background:#0f172a;border:1px solid rgba(16,185,129,0.35);
                                      color:#10b981;border-radius:8px;font-size:1.05rem;font-weight:700;
                                      font-family:inherit;outline:none;box-sizing:border-box;">
                    </div>

                    <div>
                        <label style="display:block;margin-bottom:5px;color:#94a3b8;font-size:0.78rem;font-weight:600;">
                            OBSERVACIï¿½N (opcional)
                        </label>
                        <textarea id="swal-obs-cuadre" rows="2"
                                  placeholder="Ej: Recibido completo..."
                                  style="width:100%;padding:8px 12px;background:#0f172a;
                                         border:1px solid rgba(255,255,255,0.08);color:#f8fafc;
                                         border-radius:8px;font-family:inherit;font-size:0.85rem;
                                         resize:vertical;outline:none;box-sizing:border-box;"></textarea>
                    </div>
                </div>`,
            showCancelButton: true,
            confirmButtonText: '<i class="ri-checkbox-circle-line"></i> Confirmar Cuadre',
            cancelButtonText:  'Cancelar',
            confirmButtonColor: '#10b981',
            background: '#1e293b', color: '#fff',
            focusConfirm: false,
            didOpen: () => {
                const valInput = document.getElementById('swal-valor-cuadre');
                const obsInput = document.getElementById('swal-obs-cuadre');
                let userEditedObs = false;

                obsInput?.addEventListener('input', () => { userEditedObs = true; });

                const refrescarVista = (actualizarInputValor = true) => {
                    const { cantCuadradas, sumCuadradas, cantNoCuadradas, sumNoCuadradas, noCuadradasList } = calcularTotalesModal();

                    const elCntC = document.getElementById('swal-cnt-cuadradas');
                    const elTotC = document.getElementById('swal-total-cuadradas');
                    const elCntN = document.getElementById('swal-cnt-nocuadradas');
                    const elTotN = document.getElementById('swal-total-nocuadradas');
                    if (elCntC) elCntC.textContent = cantCuadradas;
                    if (elTotC) elTotC.textContent = moneyFmtC.format(sumCuadradas);
                    if (elCntN) elCntN.textContent = cantNoCuadradas;
                    if (elTotN) elTotN.textContent = moneyFmtC.format(sumNoCuadradas);

                    if (actualizarInputValor && valInput) {
                        valInput.value = moneyFmtC.format(sumCuadradas);
                    }

                    if (!userEditedObs && obsInput) {
                        if (noCuadradasList.length > 0) {
                            const desc = noCuadradasList.map(f => `#${f.no_factura} (${moneyFmtC.format(f.valor_total || 0)})`).join(', ');
                            obsInput.value = `No cuadraron ${noCuadradasList.length} factura(s): ${desc}`;
                        } else {
                            obsInput.value = 'Cuadre completo sin novedades.';
                        }
                    }
                };

                // Listeners checks
                document.querySelectorAll('.swal-fact-chk').forEach(chk => {
                    chk.addEventListener('change', (e) => {
                        const fid = e.target.getAttribute('data-id');
                        const isChecked = e.target.checked;
                        estadoChecks[fid] = isChecked;

                        const row = document.getElementById(`swal-frow-${fid}`);
                        if (row) {
                            row.style.background = isChecked ? 'rgba(16,185,129,0.06)' : 'rgba(239,68,68,0.06)';
                            row.style.borderColor = isChecked ? 'rgba(16,185,129,0.2)' : 'rgba(239,68,68,0.2)';
                            const badge = row.querySelector('.swal-status-badge');
                            if (badge) {
                                badge.textContent = isChecked ? 'Cuadra' : 'No cuadra';
                                badge.style.background = isChecked ? 'rgba(16,185,129,0.15)' : 'rgba(239,68,68,0.15)';
                                badge.style.color = isChecked ? '#10b981' : '#ef4444';
                            }
                        }
                        refrescarVista(true);
                    });
                });

                // Marcar todas
                document.getElementById('swal-btn-marcar-todas')?.addEventListener('click', () => {
                    facturas.forEach(f => estadoChecks[f.id] = true);
                    document.querySelectorAll('.swal-fact-chk').forEach(c => {
                        c.checked = true;
                        const fid = c.getAttribute('data-id');
                        const row = document.getElementById(`swal-frow-${fid}`);
                        if (row) {
                            row.style.background = 'rgba(16,185,129,0.06)';
                            row.style.borderColor = 'rgba(16,185,129,0.2)';
                            const badge = row.querySelector('.swal-status-badge');
                            if (badge) {
                                badge.textContent = 'Cuadra';
                                badge.style.background = 'rgba(16,185,129,0.15)';
                                badge.style.color = '#10b981';
                            }
                        }
                    });
                    refrescarVista(true);
                });

                // Desmarcar todas
                document.getElementById('swal-btn-desmarcar-todas')?.addEventListener('click', () => {
                    facturas.forEach(f => estadoChecks[f.id] = false);
                    document.querySelectorAll('.swal-fact-chk').forEach(c => {
                        c.checked = false;
                        const fid = c.getAttribute('data-id');
                        const row = document.getElementById(`swal-frow-${fid}`);
                        if (row) {
                            row.style.background = 'rgba(239,68,68,0.06)';
                            row.style.borderColor = 'rgba(239,68,68,0.2)';
                            const badge = row.querySelector('.swal-status-badge');
                            if (badge) {
                                badge.textContent = 'No cuadra';
                                badge.style.background = 'rgba(239,68,68,0.15)';
                                badge.style.color = '#ef4444';
                            }
                        }
                    });
                    refrescarVista(true);
                });

                // Botï¿½n reajustar al total cuadrado
                document.getElementById('swal-btn-auto-val')?.addEventListener('click', () => {
                    const { sumCuadradas } = calcularTotalesModal();
                    if (valInput) valInput.value = moneyFmtC.format(sumCuadradas);
                });

                refrescarVista(true);
            },
            preConfirm: () => {
                const valStr  = document.getElementById('swal-valor-cuadre')?.value || '';
                const obs     = document.getElementById('swal-obs-cuadre')?.value?.trim() || '';
                const valNum  = parseFloat(valStr.replace(/[^0-9]/g, '')) || 0;
                if (!valStr.trim()) {
                    Swal.showValidationMessage('Ingresa el valor recibido para confirmar el cuadre');
                    return false;
                }
                const cuadradasIds = [];
                const noCuadradasIds = [];
                facturas.forEach(f => {
                    if (estadoChecks[f.id]) cuadradasIds.push(f.id);
                    else noCuadradasIds.push(f.id);
                });
                return { valorRecibido: valNum, observacion: obs, cuadradasIds, noCuadradasIds };
            },
        });

        if (!isConfirmed || !formValues) return;

        // Actualizar estado de las facturas en base de datos en lote
        if (formValues.noCuadradasIds?.length > 0) {
            await SupabaseClient.planillas.toggleFacturasBatch(formValues.noCuadradasIds, false);
        }
        if (formValues.cuadradasIds?.length > 0) {
            await SupabaseClient.planillas.toggleFacturasBatch(formValues.cuadradasIds, true);
        }

        // Actualizar estado en memoria local de las facturas
        (planilla.planilla_facturas || []).forEach(f => {
            f.asignada = !formValues.noCuadradasIds.includes(f.id);
        });

        // Guardar cuadre con los datos extra
        const result = await SupabaseClient.planillas.updateEstado(planillaId, 'CUADRADA', {
            cuadrado_por:    window.CURRENT_SESSION?.profile?.nombre || 'Cajera',
            valor_cuadrado:  formValues.valorRecibido,
            obs_cuadre:      formValues.observacion || null,
            fecha_cuadre:    new Date().toISOString().split('T')[0],
        });

        if (!result.success) {
            Swal.fire({ icon:'error', title:'Error al cuadrar',
                text: result.error || 'No se pudo registrar el cuadre.',
                background:'#1e293b', color:'#fff' });
            return;
        }

        const moneyFmtC2 = new Intl.NumberFormat('es-CO', { style:'currency', currency:'COP', minimumFractionDigits:0 });
        planilla.estado = 'CUADRADA';
        planilla.valor_cuadrado = formValues.valorRecibido;
        planilla.cuadrado_por   = window.CURRENT_SESSION?.profile?.nombre || 'Cajera';
        planilla.obs_cuadre     = formValues.observacion || null;
        planilla.fecha_cuadre   = new Date().toISOString().split('T')[0];

        _renderKanban(PL_CACHE);
        _renderTabla(PL_CACHE);
        await _actualizarKPIs();
        if (typeof cargarResumenCuadre === 'function') {
            await cargarResumenCuadre();
        }

        const noCuadTot = formValues.noCuadradasIds?.length || 0;
        Swal.fire({
            icon: 'success',
            title: '? Planilla Cuadrada',
            html: `<strong>${planilla.no_planilla}</strong> cuadrada correctamente.<br>
                   <span style="color:#10b981;font-weight:700;">
                       ${moneyFmtC2.format(formValues.valorRecibido)}
                   </span> recibidos.<br>
                   ${noCuadTot > 0 ? `<small style="color:#ef4444;">${noCuadTot} factura(s) marcada(s) como no cuadradas/sueltas.</small><br>` : ''}
                   ${formValues.observacion ? `<small style="color:#94a3b8;">"${formValues.observacion}"</small>` : ''}`,
            timer: 3000, showConfirmButton: true, confirmButtonText: 'Listo',
            background: '#1e293b', color: '#fff'
        });
        return;
    }

    // -- Flujo normal para los demï¿½s estados ----------------
    const confirmStd = await Swal.fire({
        title: `ï¿½Cambiar a ${nuevoEstado}?`,
        html: `Planilla <strong>${planilla.no_planilla}</strong> pasarï¿½ a estado <strong style="color:${meta.color}">${nuevoEstado}</strong>`,
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: 'Sï¿½, cambiar',
        cancelButtonText: 'Cancelar',
        background: '#1e293b', color: '#fff',
        confirmButtonColor: meta.color,
    });
    if (!confirmStd.isConfirmed) return;

    const result = await SupabaseClient.planillas.updateEstado(planillaId, nuevoEstado);
    if (!result.success) {
        Swal.fire({ icon:'error', title:'Error', text:'No se pudo actualizar el estado.', background:'#1e293b', color:'#fff' });
        return;
    }

    planilla.estado = nuevoEstado;
    _renderKanban(PL_CACHE);
    _renderTabla(PL_CACHE);
    await _actualizarKPIs();

    Swal.fire({
        icon: 'success',
        title: 'Estado actualizado',
        text: `Planilla ${planilla.no_planilla} ? ${nuevoEstado}`,
        timer: 1800, showConfirmButton: false,
        background: '#1e293b', color: '#fff'
    });
}

// -- Guardar programaciï¿½n (placa/conductor desde modal) -----
async function guardarProgramacionPlanilla() {
    if (!PL_ID_MODAL) return;
    const placa     = document.getElementById('pl-modal-placa')?.value?.toUpperCase().trim() || '';
    const conductor = document.getElementById('pl-modal-conductor')?.value?.trim() || '';

    if (!placa) {
        Swal.fire({ icon:'warning', title:'Placa requerida', text:'Ingresa la placa del vehï¿½culo asignado.', background:'#1e293b', color:'#fff' });
        return;
    }

    // Buscar conductor en flota si no fue ingresado
    let conductorFinal = conductor;
    if (!conductorFinal) {
        const res = await SupabaseClient.vehiculos.getByPlaca(placa, window.CURRENT_RAZON_SOCIAL);
        conductorFinal = res?.data?.conductor || '';
    }

    const result = await SupabaseClient.planillas.updateEstado(PL_ID_MODAL, 'DESPACHADA', {
        placa:            placa,
        conductor:        conductorFinal,
        fecha_programacion: new Date().toISOString().split('T')[0],
        programado_por:   window.CURRENT_SESSION?.profile?.nombre || 'Sistema',
    });

    if (!result.success) {
        Swal.fire({ icon:'error', title:'Error', text:'No se pudo guardar la programaciï¿½n.', background:'#1e293b', color:'#fff' });
        return;
    }

    // Actualizar cache
    const planilla = PL_CACHE.find(p => p.id === PL_ID_MODAL);
    if (planilla) {
        planilla.placa     = placa;
        planilla.conductor = conductorFinal;
        planilla.estado    = 'DESPACHADA';
    }

    cerrarModalPlanilla();
    _renderKanban(PL_CACHE);
    _renderTabla(PL_CACHE);
    await _actualizarKPIs();

    Swal.fire({
        icon: 'success', title: 'ï¿½Programado!',
        html: `Planilla asignada a <strong>${placa}</strong>. Estado: <strong>DESPACHADA</strong>`,
        timer: 2000, showConfirmButton: false, background: '#1e293b', color: '#fff'
    });
}

// -- Eliminar planilla --------------------------------------
async function eliminarPlanillaUI(planillaId, noPlanilla) {
    const confirm = await Swal.fire({
        title: 'ï¿½Eliminar planilla?',
        html: `Se eliminarï¿½ la planilla <strong>${noPlanilla}</strong> y todas sus facturas.<br><small style="color:#94a3b8">Esta acciï¿½n no se puede deshacer.</small>`,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Eliminar',
        cancelButtonText: 'Cancelar',
        background: '#1e293b', color: '#fff',
        confirmButtonColor: '#ef4444',
    });
    if (!confirm.isConfirmed) return;

    const result = await SupabaseClient.planillas.delete(planillaId);
    if (!result.success) {
        Swal.fire({ icon:'error', title:'Error', text:'No se pudo eliminar la planilla.', background:'#1e293b', color:'#fff' });
        return;
    }

    PL_CACHE = PL_CACHE.filter(p => p.id !== planillaId);
    _renderKanban(PL_CACHE);
    _renderTabla(PL_CACHE);
    await _actualizarKPIs();

    Swal.fire({
        icon:'success', title:'Eliminada', text:`Planilla ${noPlanilla} eliminada.`,
        timer: 1600, showConfirmButton: false, background:'#1e293b', color:'#fff'
    });
}

// -- Facturas Sueltas ---------------------------------------
async function _renderFacturasSueltas() {
    const tbody = document.getElementById('pl-sueltas-body');
    if (!tbody) return;

    const result = await SupabaseClient.planillas.getFacturasSueltas();
    if (!result.success || result.data.length === 0) {
        tbody.innerHTML = `<tr><td colspan="6" style="text-align:center;padding:20px;color:var(--text-muted);">
            <i class="ri-checkbox-circle-line" style="color:#10b981"></i> Sin facturas sueltas</td></tr>`;
        const badge = document.getElementById('pl-badge-sueltas');
        if (badge) badge.style.display = 'none';
        return;
    }

    const badge = document.getElementById('pl-badge-sueltas');
    if (badge) {
        badge.textContent = result.data.length;
        badge.style.display = 'inline-flex';
    }

    tbody.innerHTML = result.data.map(f => `
        <tr>
            <td><strong>${f.no_factura}</strong></td>
            <td>${f.fecha_entrega || 'ï¿½'}</td>
            <td>${f.zona || 'ï¿½'}</td>
            <td>${f.planilla?.no_planilla || 'ï¿½'}</td>
            <td class="price-cell">${fmt(f.valor_total)}</td>
            <td>
                ${['admin','programador'].includes(PL_ROLE)
                    ? `<button class="btn-icon edit" onclick="reasignarFactura('${f.id}')" title="Reasignar a planilla">
                        <i class="ri-arrow-go-back-line"></i>
                       </button>`
                    : '<span style="color:var(--text-muted);font-size:0.8rem;">Solo lectura</span>'}
            </td>
        </tr>`).join('');
}

async function reasignarFactura(facturaId) {
    const result = await SupabaseClient.planillas.toggleFactura(facturaId, true);
    if (result.success) {
        await cargarPlanillas();
        Swal.fire({ icon:'success', title:'Reasignada', text:'Factura reasignada a su planilla.', timer:1500, showConfirmButton:false, background:'#1e293b', color:'#fff' });
    }
}

// -- Carga de Excel -----------------------------------------
function setupDropZonaPlanillas() {
    const dropZone = document.getElementById('pl-dropzone');
    const fileInput = document.getElementById('pl-file-input');
    if (!dropZone || !fileInput) return;

    // Click en zona
    dropZone.addEventListener('click', () => fileInput.click());

    // Drag & Drop
    dropZone.addEventListener('dragover', e => { e.preventDefault(); dropZone.classList.add('pl-dz-active'); });
    dropZone.addEventListener('dragleave', () => dropZone.classList.remove('pl-dz-active'));
    dropZone.addEventListener('drop', e => {
        e.preventDefault();
        dropZone.classList.remove('pl-dz-active');
        const file = e.dataTransfer.files[0];
        if (file) procesarArchivoExcel(file);
    });

    // Input file
    fileInput.addEventListener('change', e => {
        const file = e.target.files[0];
        if (file) procesarArchivoExcel(file);
        fileInput.value = '';
    });
}

async function procesarArchivoExcel(file) {
    if (!file.name.match(/\.(xlsx|xls|csv)$/i)) {
        Swal.fire({ icon:'warning', title:'Archivo invï¿½lido', text:'Solo se aceptan archivos .xlsx, .xls o .csv', background:'#1e293b', color:'#fff' });
        return;
    }

    Swal.fire({ title:'Procesando archivo...', allowOutsideClick:false, didOpen:()=>Swal.showLoading(), background:'#1e293b', color:'#fff' });

    try {
        const buffer  = await file.arrayBuffer();
        const wb      = XLSX.read(buffer, { type: 'array', cellDates: true });
        const sheet   = wb.Sheets[wb.SheetNames[0]];
        const rows    = XLSX.utils.sheet_to_json(sheet, { defval: '' });

        if (!rows.length) throw new Error('El archivo estï¿½ vacï¿½o o no tiene datos vï¿½lidos.');

        // Detectar columnas (case-insensitive, acepta variaciones)
        const colMap = _detectarColumnas(rows[0]);
        if (!colMap.factura || !colMap.planilla) throw new Error('No se encontraron columnas "Factura" y "Planilla" en el archivo.');

        // Agrupar por planilla
        const grupos = {};
        rows.forEach(row => {
            const noPlanilla = String(row[colMap.planilla] || '').trim();
            const noFactura  = String(row[colMap.factura]  || '').trim();
            if (!noPlanilla || !noFactura) return;

            if (!grupos[noPlanilla]) grupos[noPlanilla] = { facturas: [], zona: '', fecha: '' };

            const zona  = colMap.zona  ? String(row[colMap.zona]  || '').trim() : '';
            const fecha = colMap.fecha ? _parseFecha(row[colMap.fecha]) : '';

            if (zona  && !grupos[noPlanilla].zona)  grupos[noPlanilla].zona  = zona;
            if (fecha && !grupos[noPlanilla].fecha) grupos[noPlanilla].fecha = fecha;

            grupos[noPlanilla].facturas.push({
                no_factura:    noFactura,
                fecha_entrega: fecha || grupos[noPlanilla].fecha,
                zona:          zona  || grupos[noPlanilla].zona,
                valor_bruto:   colMap.vlrBruto   ? parseFloat(String(row[colMap.vlrBruto]  || '0').replace(',','.')) : 0,
                valor_factura: colMap.vlrFactura ? parseFloat(String(row[colMap.vlrFactura]|| '0').replace(',','.')) : 0,
                valor_total:   colMap.valorTotal ? parseFloat(String(row[colMap.valorTotal]|| '0').replace(',','.')) : 0,
            });
        });

        Swal.close();

        // Mostrar preview
        _mostrarPreviewExcel(grupos, file.name);

    } catch (err) {
        console.error('Error procesando Excel:', err);
        Swal.fire({ icon:'error', title:'Error al procesar', text: err.message, background:'#1e293b', color:'#fff' });
    }
}

function _detectarColumnas(primerRow) {
    const claves = Object.keys(primerRow).map(k => ({ original: k, norm: k.toLowerCase().replace(/[\s_]/g,'') }));
    const find = (...terms) => claves.find(c => terms.some(t => c.norm.includes(t)))?.original || null;

    return {
        factura:    find('factura','invoice','fact'),
        planilla:   find('planilla','plan'),
        fecha:      find('fecha','date','entrega'),
        zona:       find('zona','zone'),
        vlrBruto:   find('bruto','vlrbruto','valorbruto','gross'),
        vlrFactura: find('vlrfactura','valorfactura','facturado'),
        valorTotal: find('total','valortotal','neto'),
    };
}

function _parseFecha(val) {
    if (!val) return '';
    if (val instanceof Date) return val.toISOString().split('T')[0];
    const s = String(val).trim();
    // YYYY-MM-DD
    if (/^\d{4}-\d{2}-\d{2}/.test(s)) return s.substring(0,10);
    // DD/MM/YYYY
    const m = s.match(/^(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{2,4})$/);
    if (m) {
        const y = m[3].length === 2 ? '20' + m[3] : m[3];
        return `${y}-${m[2].padStart(2,'0')}-${m[1].padStart(2,'0')}`;
    }
    return '';
}

function _mostrarPreviewExcel(grupos, nombreArchivo) {
    const planillasKeys = Object.keys(grupos);
    const totalFacturas = planillasKeys.reduce((s, k) => s + grupos[k].facturas.length, 0);

    const preview = document.getElementById('pl-preview-container');
    const previewInfo = document.getElementById('pl-preview-info');
    const previewTabla = document.getElementById('pl-preview-tabla-body');
    if (!preview) return;

    if (previewInfo) previewInfo.innerHTML = `
        <span><i class="ri-file-excel-2-line" style="color:#22c55e"></i> <strong>${nombreArchivo}</strong></span>
        <span><i class="ri-file-list-3-line"></i> <strong>${planillasKeys.length}</strong> planillas</span>
        <span><i class="ri-receipt-line"></i> <strong>${totalFacturas}</strong> facturas en total</span>`;

    if (previewTabla) {
        previewTabla.innerHTML = planillasKeys.map(key => {
            const g = grupos[key];
            const valorTotal = g.facturas.reduce((s, f) => s + (f.valor_total || f.valor_factura || 0), 0);
            return `<tr>
                <td><span class="badge-plate" style="font-size:0.8rem;">${key}</span></td>
                <td>${g.fecha || 'ï¿½'}</td>
                <td>${g.zona || 'ï¿½'}</td>
                <td style="text-align:center;">${g.facturas.length}</td>
                <td class="price-cell">${fmt(valorTotal)}</td>
            </tr>`;
        }).join('');
    }

    // Guardar referencia para confirmar
    preview.dataset.grupos = JSON.stringify(grupos);
    preview.style.display = 'block';
    document.getElementById('pl-dropzone').style.display = 'none';
}

function cancelarCargaExcel() {
    const preview = document.getElementById('pl-preview-container');
    if (preview) { preview.style.display = 'none'; preview.dataset.grupos = ''; }
    const dropzone = document.getElementById('pl-dropzone');
    if (dropzone) dropzone.style.display = 'flex';
}

async function confirmarCargaExcel() {
    const preview = document.getElementById('pl-preview-container');
    if (!preview?.dataset?.grupos) return;

    let grupos;
    try { grupos = JSON.parse(preview.dataset.grupos); } catch { return; }

    const proveedor = document.getElementById('pl-carga-proveedor')?.value || 'ALPINA';
    const planillasKeys = Object.keys(grupos);

    Swal.fire({
        title: `Cargando ${planillasKeys.length} planillas...`,
        html: '<div id="swal-progress" style="margin-top:10px;font-size:0.9rem;color:#94a3b8;">Iniciando...</div>',
        allowOutsideClick: false,
        didOpen: () => Swal.showLoading(),
        background: '#1e293b', color: '#fff'
    });

    let exitosas = 0, errores = 0;

    for (let i = 0; i < planillasKeys.length; i++) {
        const key = planillasKeys[i];
        const g   = grupos[key];
        const progressEl = document.getElementById('swal-progress');
        if (progressEl) progressEl.textContent = `Procesando ${i+1}/${planillasKeys.length}: Planilla ${key}`;

        const planillaData = {
            no_planilla: key,
            fecha:       g.fecha || new Date().toISOString().split('T')[0],
            zona:        g.zona  || '',
            proveedor:   proveedor,
            estado:      'TRANSITORIA',
            cargado_por: window.CURRENT_SESSION?.profile?.nombre || 'Sistema',
        };

        const result = await SupabaseClient.planillas.create(planillaData, g.facturas);
        if (result.success) exitosas++;
        else { errores++; console.error('Error planilla', key, result.error); }
    }

    cancelarCargaExcel();
    await cargarPlanillas();

    Swal.fire({
        icon: errores === 0 ? 'success' : 'warning',
        title: errores === 0 ? 'ï¿½Carga completada!' : 'Carga con errores',
        html: `<strong style="color:#10b981">${exitosas}</strong> planillas cargadas correctamente.
               ${errores > 0 ? `<br><strong style="color:#ef4444">${errores}</strong> con errores (ver consola).` : ''}`,
        background: '#1e293b', color: '#fff'
    });
}

// -- Helpers ------------------------------------------------
function _estadoId(estado) {
    return estado.toLowerCase().replace(/ /g, '-');
}

function _mostrarLoadingKanban(show) {
    PL_ESTADOS.forEach(e => {
        const col = document.getElementById(`pl-col-${_estadoId(e)}`);
        if (!col) return;
        if (show) col.innerHTML = `<div class="pl-kanban-empty"><i class="ri-loader-4-line rotate"></i><span>Cargando...</span></div>`;
    });
}

function _mostrarErrorKanban(msg) {
    PL_ESTADOS.forEach(e => {
        const col = document.getElementById(`pl-col-${_estadoId(e)}`);
        if (col) col.innerHTML = `<div class="pl-kanban-empty" style="color:#ef4444"><i class="ri-error-warning-line"></i><span>${msg}</span></div>`;
    });
}

function _debounce(fn, ms) {
    let t; return (...args) => { clearTimeout(t); t = setTimeout(() => fn(...args), ms); };
}

// -- Exponer globalmente ------------------------------------
window.inicializarModuloPlanillas = inicializarModuloPlanillas;
window.cargarPlanillas            = cargarPlanillas;
window.abrirDetallePlanilla       = abrirDetallePlanilla;
window.cerrarModalPlanilla        = cerrarModalPlanilla;
window.cambiarEstadoPlanilla      = cambiarEstadoPlanilla;
window.eliminarPlanillaUI         = eliminarPlanillaUI;
window.toggleFacturaUI            = toggleFacturaUI;
window.marcarTodasFacturasModal   = marcarTodasFacturasModal;
window.reasignarFactura           = reasignarFactura;
window.guardarProgramacionPlanilla= guardarProgramacionPlanilla;
window.procesarArchivoExcel       = procesarArchivoExcel;
window.confirmarCargaExcel        = confirmarCargaExcel;
window.cancelarCargaExcel         = cancelarCargaExcel;
window.setupDropZonaPlanillas     = setupDropZonaPlanillas;

// ==========================================================
// ?? INICIALIZADORES POR TAB SEPARADO
// ==========================================================

// Tab: Carga de Planillas
async function inicializarModuloCarga() {
    PL_ROLE = (window.CURRENT_ROLE || 'cargador').toLowerCase();
    setupDropZonaPlanillas();
    await cargarPlanillasCarga();
}

// Tab: Programaciï¿½n
async function inicializarModuloProgramacion() {
    PL_ROLE = (window.CURRENT_ROLE || 'programador').toLowerCase();
    const hoy = new Date().toISOString().split('T')[0];
    const fFecha = document.getElementById('pl-prog-filtro-fecha');
    if (fFecha && !fFecha.value) fFecha.value = hoy;
    await cargarPlanillasProgramacion();
    await _renderFacturasSueltas();
}


// Tab: Estado / Kanban
async function inicializarModuloEstado() {
    PL_ROLE = (window.CURRENT_ROLE || 'cajera_plan').toLowerCase();
    const hoy = new Date().toISOString().split('T')[0];

    // Aplicar visibilidad de secciones segun rol
    _aplicarVisibilidadRol();

    if (PL_ROLE === 'cajera_plan') {
        // Vista simplificada para cajera
        const fCajera = document.getElementById('pl-cajera-fecha');
        if (fCajera && !fCajera.value) fCajera.value = hoy;
        document.getElementById('pl-cajera-fecha')?.addEventListener('change', _cargarVistaCajera);
        document.getElementById('pl-cajera-btn-refresh')?.addEventListener('click', _cargarVistaCajera);
        await _cargarVistaCajera();
        return;
    }

    // Vista estandar (admin, programador, etc.)
    const fFecha = document.getElementById('pl-filtro-fecha');
    if (fFecha && !fFecha.value) fFecha.value = hoy;

    const fCuadre = document.getElementById('pl-cuadre-fecha');
    if (fCuadre && !fCuadre.value) fCuadre.value = hoy;

    document.getElementById('pl-filtro-estado')?.addEventListener('change',    cargarPlanillas);
    document.getElementById('pl-filtro-fecha')?.addEventListener('change',     cargarPlanillas);
    document.getElementById('pl-filtro-proveedor')?.addEventListener('change', cargarPlanillas);
    document.getElementById('pl-filtro-busqueda')?.addEventListener('input',   _debounce(cargarPlanillas, 350));

    await cargarPlanillas();

    if (PL_ROLE === 'admin') {
        await cargarResumenCuadre();
    }
}

// -- Carga del historial en tab "Carga Planillas" ----------
async function cargarPlanillasCarga() {
    const tbody = document.getElementById('pl-historial-body');
    if (!tbody) return;
    tbody.innerHTML = `<tr><td colspan="8" style="text-align:center;padding:20px;color:var(--text-muted);">
        <i class="ri-loader-4-line rotate"></i> Cargando...</td></tr>`;

    const result = await SupabaseClient.planillas.getAll({});
    if (!result.success) { tbody.innerHTML = `<tr><td colspan="8" style="text-align:center;color:#ef4444;">Error al cargar</td></tr>`; return; }

    if (result.data.length === 0) {
        tbody.innerHTML = `<tr><td colspan="8" style="text-align:center;padding:24px;color:var(--text-muted);">Sin planillas cargadas</td></tr>`;
        return;
    }

    const moneyFmtL = new Intl.NumberFormat('es-CO', { style: 'currency', currency: 'COP', minimumFractionDigits: 0 });
    tbody.innerHTML = result.data.map(p => {
        const meta = PL_ESTADO_META[p.estado] || PL_ESTADO_META['TRANSITORIA'];
        const canDel = ['admin','cargador'].includes(PL_ROLE);
        return `<tr>
            <td><span class="badge-plate" style="font-size:0.8rem;">${p.no_planilla}</span></td>
            <td>${p.fecha || 'ï¿½'}</td>
            <td>${p.zona || 'ï¿½'}</td>
            <td>${p.proveedor || 'ï¿½'}</td>
            <td style="text-align:center;">${p.total_facturas || 0}</td>
            <td class="price-cell">${moneyFmtL.format(p.valor_total || 0)}</td>
            <td><span class="pl-estado-chip" style="background:${meta.bg};color:${meta.color};border-color:${meta.color}40;font-size:0.75rem;">
                <i class="${meta.icon}"></i> ${meta.label}
            </span></td>
            <td style="text-align:center;">
                ${canDel ? `<button class="btn-icon delete" onclick="eliminarPlanillaUI('${p.id}','${p.no_planilla}')" title="Eliminar">
                    <i class="ri-delete-bin-line"></i></button>` : 'ï¿½'}
            </td>
        </tr>`;
    }).join('');
}

// -- Carga de tabla en tab "Programaciï¿½n" ------------------
async function cargarPlanillasProgramacion() {
    const tbody = document.getElementById('pl-prog-tabla-body');
    if (!tbody) return;
    tbody.innerHTML = '<tr><td colspan="10" style="text-align:center;padding:20px;color:var(--text-muted);"><i class="ri-loader-4-line rotate"></i> Cargando...</td></tr>';

    const filtros = {
        estado:    document.getElementById('pl-prog-filtro-estado')?.value    || '',
        fecha:     document.getElementById('pl-prog-filtro-fecha')?.value     || '',
        proveedor: document.getElementById('pl-prog-filtro-proveedor')?.value || '',
    };
    Object.keys(filtros).forEach(k => { if (!filtros[k]) delete filtros[k]; });

    const result = await SupabaseClient.planillas.getAll(filtros);
    if (!result.success) { tbody.innerHTML = '<tr><td colspan="10" style="text-align:center;color:#ef4444;">Error al cargar</td></tr>'; return; }

    const sinProg = result.data.filter(p => p.estado === 'TRANSITORIA').length;
    const conProg = result.data.filter(p => p.estado !== 'TRANSITORIA').length;
    const elSin = document.getElementById('pl-prog-kpi-transitoria');
    const elCon = document.getElementById('pl-prog-kpi-programadas');
    if (elSin) elSin.textContent = sinProg;
    if (elCon) elCon.textContent = conProg;

    PL_CACHE = result.data;

    if (result.data.length === 0) {
        tbody.innerHTML = '<tr><td colspan="10" style="text-align:center;padding:24px;color:var(--text-muted);">Sin resultados para los filtros aplicados</td></tr>';
        return;
    }

    const moneyFmtP = new Intl.NumberFormat('es-CO', { style: 'currency', currency: 'COP', minimumFractionDigits: 0 });
    const canProg   = ['admin','programador'].includes(PL_ROLE);

    // Barra de accion multiple (aparece al marcar >= 1 fila)
    const tablaParent = tbody.closest('table') ? tbody.closest('table').parentElement : null;
    let barraMulti = document.getElementById('pl-prog-barra-multi');
    if (!barraMulti && canProg && tablaParent) {
        barraMulti = document.createElement('div');
        barraMulti.id = 'pl-prog-barra-multi';
        barraMulti.setAttribute('style', 'display:none;align-items:center;gap:12px;flex-wrap:wrap;padding:10px 14px;margin-bottom:10px;background:rgba(59,130,246,0.1);border:1px solid rgba(59,130,246,0.3);border-radius:10px;font-size:0.85rem;');
        barraMulti.innerHTML = '<span id="pl-prog-sel-count" style="font-weight:700;color:#3b82f6;"><i class="ri-checkbox-multiple-line"></i> 0 seleccionadas</span>'
            + '<button onclick="programarPlanillasSeleccionadas()" style="padding:6px 16px;background:#3b82f6;color:#fff;border:none;border-radius:7px;cursor:pointer;font-weight:700;font-size:0.83rem;display:inline-flex;align-items:center;gap:6px;"><i class="ri-truck-line"></i> Asignar vehiculo a seleccionadas</button>'
            + '<button onclick="_prog_deseleccionarTodas()" style="padding:6px 12px;background:rgba(255,255,255,0.06);color:#94a3b8;border:1px solid rgba(255,255,255,0.1);border-radius:7px;cursor:pointer;font-size:0.82rem;">Limpiar seleccion</button>';
        tablaParent.insertBefore(barraMulti, tbody.closest('table'));
    }

    tbody.innerHTML = result.data.map(function(p) {
        const meta = PL_ESTADO_META[p.estado] || PL_ESTADO_META['TRANSITORIA'];
        const chkCell = canProg
            ? '<td style="text-align:center;width:36px;"><input type="checkbox" class="pl-prog-chk" data-id="' + p.id + '" style="width:15px;height:15px;accent-color:#3b82f6;cursor:pointer;" onchange="_prog_actualizarBarra()"></td>'
            : '<td></td>';
        const placaCell = p.placa
            ? '<span class="badge-plate" style="font-size:0.75rem;">' + p.placa + '</span>'
            : '<span style="color:var(--text-muted);font-size:0.82rem;">Sin asignar</span>';
        const estadoChip = '<span class="pl-estado-chip" style="background:' + meta.bg + ';color:' + meta.color + ';border-color:' + meta.color + '40;font-size:0.75rem;"><i class="' + meta.icon + '"></i> ' + meta.label + '</span>';
        const accionBtn = '<button class="pl-btn-action pl-btn-detail" onclick="abrirDetallePlanilla(\'' + p.id + '\')" title="Ver detalle"><i class="ri-eye-line"></i></button>';
        return '<tr id="pl-prog-row-' + p.id + '">'
            + chkCell
            + '<td><span class="badge-plate" style="font-size:0.8rem;">' + p.no_planilla + '</span></td>'
            + '<td>' + (p.fecha || '-') + '</td>'
            + '<td>' + (p.zona  || '-') + '</td>'
            + '<td>' + (p.proveedor || '-') + '</td>'
            + '<td style="text-align:center;">' + (p.total_facturas || 0) + '</td>'
            + '<td class="price-cell">' + moneyFmtP.format(p.valor_total || 0) + '</td>'
            + '<td>' + placaCell + '</td>'
            + '<td>' + estadoChip + '</td>'
            + '<td style="text-align:center;">' + accionBtn + '</td>'
            + '</tr>';
    }).join('');
}

// Helpers de seleccion multiple
function _prog_actualizarBarra() {
    const sel   = document.querySelectorAll('.pl-prog-chk:checked');
    const barra = document.getElementById('pl-prog-barra-multi');
    const cnt   = document.getElementById('pl-prog-sel-count');
    if (!barra) return;
    const n = sel.length;
    if (n >= 1) {
        barra.style.display = 'flex';
        if (cnt) cnt.innerHTML = '<i class="ri-checkbox-multiple-line"></i> ' + n + ' planilla' + (n > 1 ? 's' : '') + ' seleccionada' + (n > 1 ? 's' : '');
    } else {
        barra.style.display = 'none';
    }
}

function _prog_deseleccionarTodas() {
    document.querySelectorAll('.pl-prog-chk').forEach(function(c) { c.checked = false; });
    _prog_actualizarBarra();
}

// Programar multiples planillas al mismo vehiculo
async function programarPlanillasSeleccionadas() {
    const checks = Array.from(document.querySelectorAll('.pl-prog-chk:checked'));
    if (!checks.length) return;

    const ids       = checks.map(function(c) { return c.dataset.id; });
    const planillas = ids.map(function(id) { return PL_CACHE.find(function(p) { return p.id === id; }); }).filter(Boolean);

    const moneyFmtM  = new Intl.NumberFormat('es-CO', { style:'currency', currency:'COP', minimumFractionDigits:0 });
    const totalValor = planillas.reduce(function(s, p) { return s + (parseFloat(p.valor_total) || 0); }, 0);
    const n = planillas.length;

    const resumenHTML = planillas.map(function(p) {
        return '<div style="display:flex;justify-content:space-between;align-items:center;padding:6px 10px;background:rgba(255,255,255,0.04);border:1px solid rgba(255,255,255,0.07);border-radius:6px;margin-bottom:4px;">'
            + '<span style="font-family:monospace;font-weight:700;color:#3b82f6;font-size:0.88rem;">' + p.no_planilla + '</span>'
            + '<span style="font-size:0.78rem;color:#94a3b8;">' + (p.zona || '-') + '</span>'
            + '<span style="font-size:0.78rem;color:#94a3b8;">' + (p.proveedor || '-') + '</span>'
            + '<span style="font-weight:700;font-size:0.85rem;color:#f8fafc;">' + moneyFmtM.format(p.valor_total || 0) + '</span>'
            + '</div>';
    }).join('');

    const labelN = n + ' planilla' + (n > 1 ? 's' : '') + ' seleccionada' + (n > 1 ? 's' : '');

    const swalResult = await Swal.fire({
        title: '<i class="ri-truck-line"></i> Asignar vehiculo',
        width: '560px',
        html: '<div style="text-align:left;font-size:0.86rem;">'
            + '<div style="margin-bottom:14px;">'
            + '<div style="font-size:0.72rem;font-weight:700;color:#94a3b8;text-transform:uppercase;margin-bottom:6px;display:flex;justify-content:space-between;">'
            + '<span><i class="ri-file-list-3-line"></i> ' + labelN + '</span>'
            + '<span style="color:#10b981;">' + moneyFmtM.format(totalValor) + '</span></div>'
            + '<div style="max-height:160px;overflow-y:auto;">' + resumenHTML + '</div></div>'
            + '<div style="margin-bottom:12px;">'
            + '<label style="display:block;margin-bottom:5px;color:#94a3b8;font-size:0.78rem;font-weight:700;text-transform:uppercase;">Placa <span style="color:#ef4444;">*</span></label>'
            + '<input id="swal-multi-placa" type="text" placeholder="Ej: SYU652" style="width:100%;padding:10px 14px;background:#0f172a;border:1px solid rgba(59,130,246,0.4);color:#f8fafc;border-radius:8px;font-size:1rem;font-weight:700;font-family:monospace;text-transform:uppercase;outline:none;box-sizing:border-box;letter-spacing:1px;">'
            + '</div>'
            + '<div>'
            + '<label style="display:block;margin-bottom:5px;color:#94a3b8;font-size:0.78rem;font-weight:700;text-transform:uppercase;">Conductor <span style="font-size:0.7rem;font-weight:400;">(opcional)</span></label>'
            + '<input id="swal-multi-conductor" type="text" placeholder="Nombre del conductor" style="width:100%;padding:10px 14px;background:#0f172a;border:1px solid rgba(255,255,255,0.1);color:#f8fafc;border-radius:8px;font-size:0.9rem;font-family:inherit;outline:none;box-sizing:border-box;">'
            + '</div></div>',
        showCancelButton:   true,
        confirmButtonText:  '<i class="ri-save-line"></i> Guardar en ' + n + ' planilla' + (n > 1 ? 's' : ''),
        cancelButtonText:   'Cancelar',
        confirmButtonColor: '#3b82f6',
        background: '#1e293b', color: '#fff',
        focusConfirm: false,
        didOpen: function() {
            const placaInput = document.getElementById('swal-multi-placa');
            const condInput  = document.getElementById('swal-multi-conductor');
            if (placaInput) {
                placaInput.addEventListener('input', async function() {
                    const v = placaInput.value.toUpperCase().replace(/\s/g, '');
                    placaInput.value = v;
                    if (v.length >= 6 && condInput && !condInput.value) {
                        const res = await SupabaseClient.vehiculos?.getByPlaca?.(v, window.CURRENT_RAZON_SOCIAL);
                        if (res && res.data && res.data.conductor) condInput.value = res.data.conductor;
                    }
                });
                placaInput.focus();
            }
        },
        preConfirm: function() {
            const placa     = (document.getElementById('swal-multi-placa')?.value     || '').toUpperCase().trim();
            const conductor = (document.getElementById('swal-multi-conductor')?.value || '').trim();
            if (!placa) { Swal.showValidationMessage('La placa es obligatoria'); return false; }
            return { placa: placa, conductor: conductor };
        },
    });

    if (!swalResult.isConfirmed || !swalResult.value) return;

    const placa            = swalResult.value.placa;
    const conductor        = swalResult.value.conductor;
    const fecha_prog       = new Date().toISOString().split('T')[0];
    const programado_por   = (window.CURRENT_SESSION && window.CURRENT_SESSION.profile && window.CURRENT_SESSION.profile.nombre) ? window.CURRENT_SESSION.profile.nombre : 'Sistema';

    Swal.fire({
        title: 'Guardando...',
        html: '<div id="swal-multi-prog" style="color:#94a3b8;font-size:0.9rem;">0 / ' + ids.length + '</div>',
        allowOutsideClick: false,
        didOpen: function() { Swal.showLoading(); },
        background: '#1e293b', color: '#fff',
    });

    let ok = 0, errores = 0;
    for (let i = 0; i < ids.length; i++) {
        const el = document.getElementById('swal-multi-prog');
        if (el) el.textContent = (i + 1) + ' / ' + ids.length;

        const res = await SupabaseClient.planillas.updateEstado(ids[i], 'DESPACHADA', {
            placa:             placa,
            conductor:         conductor,
            fecha_programacion: fecha_prog,
            programado_por:    programado_por,
        });

        if (res.success) {
            ok++;
            const p = PL_CACHE.find(function(x) { return x.id === ids[i]; });
            if (p) { p.placa = placa; p.conductor = conductor; p.estado = 'DESPACHADA'; }
        } else {
            errores++;
            console.error('Error planilla ' + ids[i] + ':', res.error);
        }
    }

    _prog_deseleccionarTodas();
    await cargarPlanillasProgramacion();

    Swal.fire({
        icon:  errores === 0 ? 'success' : 'warning',
        title: errores === 0 ? 'Listo!' : 'Parcialmente guardado',
        html:  '<strong style="color:#10b981">' + ok + '</strong> planilla' + (ok !== 1 ? 's' : '') + ' asignada' + (ok !== 1 ? 's' : '') + ' a <strong>' + placa + '</strong>.'
             + (errores > 0 ? '<br><span style="color:#ef4444;">' + errores + ' con error (ver consola).</span>' : ''),
        timer: 2500, showConfirmButton: errores > 0,
        background: '#1e293b', color: '#fff',
    });
}

// Exponer las nuevas funciones globalmente
window.inicializarModuloCarga             = inicializarModuloCarga;
window.inicializarModuloProgramacion      = inicializarModuloProgramacion;
window.inicializarModuloEstado            = inicializarModuloEstado;
window.cargarPlanillasCarga               = cargarPlanillasCarga;
window.cargarPlanillasProgramacion        = cargarPlanillasProgramacion;
window.programarPlanillasSeleccionadas    = programarPlanillasSeleccionadas;
window._prog_actualizarBarra              = _prog_actualizarBarra;
window._prog_deseleccionarTodas           = _prog_deseleccionarTodas;

// ==========================================================
// ? Mï¿½DULO DE APROBACIONES (solo admin)
// ==========================================================

const APR_ESTADO_META = {
    'PENDIENTE': { color:'#f59e0b', bg:'rgba(245,158,11,0.12)', icon:'ri-time-line',            label:'PENDIENTE' },
    'APROBADA':  { color:'#10b981', bg:'rgba(16,185,129,0.12)', icon:'ri-checkbox-circle-line', label:'APROBADA'  },
    'RECHAZADA': { color:'#ef4444', bg:'rgba(239,68,68,0.12)',  icon:'ri-close-circle-line',    label:'RECHAZADA' },
};

let APR_INIT = false;

async function cargarAprobaciones() {
    const tbody = document.getElementById('apr-tabla-body');
    if (!tbody) return;

    // Inicializar fecha si es la primera vez
    if (!APR_INIT) {
        APR_INIT = true;
        const hoy = new Date().toISOString().split('T')[0];
        const fFecha = document.getElementById('apr-filtro-fecha');
        if (fFecha && !fFecha.value) fFecha.value = hoy;
    }

    tbody.innerHTML = `<tr><td colspan="12" style="text-align:center;padding:32px;color:var(--text-muted);">
        <i class="ri-loader-4-line rotate"></i> Cargando...</td></tr>`;

    const filtros = {};
    const fFecha  = document.getElementById('apr-filtro-fecha')?.value;
    const fEstado = document.getElementById('apr-filtro-estado')?.value;
    const fProv   = document.getElementById('apr-filtro-proveedor')?.value;
    if (fFecha)  filtros.fecha     = fFecha;
    if (fEstado) filtros.estado    = fEstado;
    if (fProv)   filtros.proveedor = fProv;

    const result = await SupabaseClient.programaciones.getAll(filtros);
    if (!result.success) {
        tbody.innerHTML = `<tr><td colspan="12" style="text-align:center;color:#ef4444;padding:24px;">
            <i class="ri-error-warning-line"></i> Error al cargar programaciones</td></tr>`;
        return;
    }

    // Actualizar KPIs
    _actualizarKPIsAprobaciones(result.data);
    // Actualizar badge del nav
    _actualizarBadgeAprobaciones(result.data);

    if (result.data.length === 0) {
        tbody.innerHTML = `<tr><td colspan="12" style="text-align:center;padding:32px;color:var(--text-muted);">
            <i class="ri-inbox-line"></i> Sin programaciones para los filtros aplicados</td></tr>`;
        return;
    }

    const moneyFmt2 = new Intl.NumberFormat('es-CO', { style:'currency', currency:'COP', minimumFractionDigits:0 });

    tbody.innerHTML = result.data.map(p => {
        const meta    = APR_ESTADO_META[p.estado] || APR_ESTADO_META['PENDIENTE'];
        const isPend  = p.estado === 'PENDIENTE';
        const motivoEl = p.motivo_rechazo
            ? `<div style="font-size:0.7rem;color:#ef4444;margin-top:2px;"><i class="ri-information-line"></i> ${p.motivo_rechazo}</div>` : '';
        const aprobadoPorEl = (p.estado !== 'PENDIENTE' && p.revisado_por)
            ? `<div style="font-size:0.7rem;color:var(--text-muted);margin-top:2px;"><i class="ri-user-line"></i> ${p.revisado_por}</div>` : '';

        // Botones: solo para PENDIENTE
        const accionesEl = isPend ? `
            <button class="btn-icon" style="color:#10b981;font-size:1.1rem;"
                    onclick="aprobarProgramacionAdmin('${p.id}')"
                    title="Aprobar ? crear flete">
                <i class="ri-checkbox-circle-line"></i>
            </button>
            <button class="btn-icon" style="color:#ef4444;font-size:1.1rem;"
                    onclick="rechazarProgramacionAdmin('${p.id}','${(p.placa||'')}','${(p.no_planilla||'')}')">
                <i class="ri-close-circle-line"></i>
            </button>
            <button class="btn-icon" style="color:var(--primary);font-size:1rem;"
                    onclick="verDetalleProgramacion('${p.id}')"
                    title="Ver detalle completo">
                <i class="ri-eye-line"></i>
            </button>` : `
            <button class="btn-icon" style="color:var(--primary);font-size:1rem;"
                    onclick="verDetalleProgramacion('${p.id}')"
                    title="Ver detalle">
                <i class="ri-eye-line"></i>
            </button>`;

        return `<tr id="apr-row-${p.id}">
            <td><span class="badge-plate">${p.placa || 'ï¿½'}</span></td>
            <td style="font-size:0.82rem;">${p.contratista || 'ï¿½'}</td>
            <td>${p.fecha || 'ï¿½'}</td>
            <td style="font-size:0.8rem;">${p.zona || 'ï¿½'}</td>
            <td style="font-size:0.82rem;">${p.poblacion || 'ï¿½'}</td>
            <td><span style="background:rgba(59,130,246,0.1);color:var(--primary);border:1px solid rgba(59,130,246,0.25);
                             padding:2px 8px;border-radius:5px;font-family:monospace;font-size:0.8rem;font-weight:700;">
                ${p.no_planilla || 'ï¿½'}</span></td>
            <td style="text-align:center;">${p.no_pedidos || 0}</td>
            <td class="price-cell">${moneyFmt2.format(p.valor_ruta || 0)}</td>
            <td class="price-cell">${moneyFmt2.format(p.precio || 0)}</td>
            <td style="font-size:0.78rem;color:var(--text-muted);">${p.programado_por || 'ï¿½'}</td>
            <td>
                <span class="pl-estado-chip" style="background:${meta.bg};color:${meta.color};border-color:${meta.color}40;">
                    <i class="${meta.icon}"></i> ${meta.label}
                </span>
                ${motivoEl}
                ${aprobadoPorEl}
            </td>
            <td style="text-align:center;white-space:nowrap;">${accionesEl}</td>
        </tr>`;
    }).join('');
}

function _actualizarKPIsAprobaciones(data) {
    const hoy = new Date().toISOString().split('T')[0];
    const pend = data.filter(p => p.estado === 'PENDIENTE').length;
    const aprH = data.filter(p => p.estado === 'APROBADA'  && p.fecha === hoy).length;
    const rechH= data.filter(p => p.estado === 'RECHAZADA' && p.fecha === hoy).length;

    const elP = document.getElementById('apr-kpi-pendiente');
    const elA = document.getElementById('apr-kpi-aprobada');
    const elR = document.getElementById('apr-kpi-rechazada');
    if (elP) elP.textContent = pend;
    if (elA) elA.textContent = aprH;
    if (elR) elR.textContent = rechH;
}

function _actualizarBadgeAprobaciones(data) {
    const pend  = data.filter(p => p.estado === 'PENDIENTE').length;
    const badge = document.getElementById('badge-aprobaciones');
    if (!badge) return;
    if (pend > 0) { badge.textContent = pend; badge.style.display = 'inline-flex'; }
    else            badge.style.display = 'none';
}

// -- Aprobar ------------------------------------------------
async function aprobarProgramacionAdmin(progId) {
    const fila = document.getElementById(`apr-row-${progId}`);
    const placa = fila?.querySelector('.badge-plate')?.textContent || '';

    const c = await Swal.fire({
        title: 'ï¿½Aprobar programaciï¿½n?',
        html: `Se crearï¿½ el flete para <strong>${placa}</strong>.<br>
               <small style="color:#94a3b8;">Esta acciï¿½n no se puede deshacer.</small>`,
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: '<i class="ri-checkbox-circle-line"></i> Sï¿½, aprobar',
        cancelButtonText:  'Cancelar',
        confirmButtonColor: '#10b981',
        background: '#1e293b', color: '#fff'
    });
    if (!c.isConfirmed) return;

    Swal.fire({ title: 'Creando flete...', allowOutsideClick: false,
        didOpen: () => Swal.showLoading(), background: '#1e293b', color: '#fff' });

    const result = await SupabaseClient.programaciones.aprobar(progId);

    if (!result.success) {
        Swal.fire({ icon:'error', title:'Error al aprobar',
            text: result.error || 'No se pudo crear el flete.',
            background:'#1e293b', color:'#fff' });
        return;
    }

    await cargarAprobaciones();
    // Refrescar listado de fletes si estï¿½ visible
    if (typeof listarFletes === 'function') listarFletes(true);

    Swal.fire({
        icon: 'success',
        title: 'ï¿½Flete creado!',
        html: `Programaciï¿½n de <strong>${placa}</strong> aprobada.<br>
               El flete ya estï¿½ registrado en el sistema.`,
        timer: 2500, showConfirmButton: false,
        background: '#1e293b', color: '#fff'
    });
}

// -- Rechazar -----------------------------------------------
async function rechazarProgramacionAdmin(progId, placa, noPlanilla) {
    const { value: motivo, isConfirmed } = await Swal.fire({
        title: 'Rechazar programaciï¿½n',
        html: `<p style="color:#94a3b8;font-size:0.88rem;margin-bottom:12px;">
                   Placa: <strong style="color:#fff;">${placa}</strong> &nbsp;ï¿½&nbsp;
                   Planilla: <strong style="color:var(--primary);">${noPlanilla}</strong>
               </p>
               <textarea id="motivo-rechazo" placeholder="Motivo del rechazo (opcional)..."
                   style="width:100%;padding:10px;background:#0f172a;border:1px solid rgba(255,255,255,0.1);
                          color:#fff;border-radius:8px;font-family:inherit;font-size:0.88rem;resize:vertical;min-height:80px;">
               </textarea>`,
        showCancelButton: true,
        confirmButtonText: '<i class="ri-close-circle-line"></i> Rechazar',
        cancelButtonText: 'Cancelar',
        confirmButtonColor: '#ef4444',
        background: '#1e293b', color: '#fff',
        preConfirm: () => document.getElementById('motivo-rechazo')?.value?.trim() || 'Sin motivo especificado',
    });
    if (!isConfirmed) return;

    const result = await SupabaseClient.programaciones.rechazar(progId, motivo);
    if (!result.success) {
        Swal.fire({ icon:'error', title:'Error', text: result.error, background:'#1e293b', color:'#fff' });
        return;
    }

    await cargarAprobaciones();
    Swal.fire({
        icon: 'info', title: 'Programaciï¿½n rechazada',
        text: `Se notificarï¿½ al programador.`,
        timer: 1800, showConfirmButton: false,
        background: '#1e293b', color: '#fff'
    });
}

// -- Ver detalle completo en modal --------------------------
async function verDetalleProgramacion(progId) {
    // Buscar en los datos ya cargados (evitar nueva peticiï¿½n)
    const allResult = await SupabaseClient.programaciones.getAll({});
    const p = allResult.data?.find(x => x.id === progId);
    if (!p) return;

    const moneyFmtD = new Intl.NumberFormat('es-CO', { style:'currency', currency:'COP', minimumFractionDigits:0 });
    const meta = APR_ESTADO_META[p.estado] || APR_ESTADO_META['PENDIENTE'];

    await Swal.fire({
        title: `Programaciï¿½n ï¿½ ${p.placa}`,
        html: `
        <div style="text-align:left;font-size:0.85rem;line-height:1.8;">
            <div style="display:grid;grid-template-columns:1fr 1fr;gap:8px;margin-bottom:12px;padding:12px;background:rgba(255,255,255,0.04);border-radius:8px;">
                <div><span style="color:#94a3b8;">Placa:</span> <strong>${p.placa}</strong></div>
                <div><span style="color:#94a3b8;">Conductor:</span> ${p.contratista || 'ï¿½'}</div>
                <div><span style="color:#94a3b8;">Fecha:</span> ${p.fecha}</div>
                <div><span style="color:#94a3b8;">Dï¿½a:</span> ${p.dia || 'ï¿½'}</div>
                <div><span style="color:#94a3b8;">Proveedor:</span> ${p.proveedor}</div>
                <div><span style="color:#94a3b8;">Zona:</span> ${p.zona}</div>
                <div><span style="color:#94a3b8;">Poblaciï¿½n:</span> ${p.poblacion}</div>
                <div><span style="color:#94a3b8;">Auxiliar:</span> ${p.auxiliares || 'ï¿½'}</div>
                <div><span style="color:#94a3b8;">Pedidos:</span> ${p.no_pedidos}</div>
                <div><span style="color:#94a3b8;">Planilla:</span> <strong style="color:var(--primary);">${p.no_planilla}</strong></div>
                <div><span style="color:#94a3b8;">Valor Ruta:</span> <strong style="color:#10b981;">${moneyFmtD.format(p.valor_ruta)}</strong></div>
                <div><span style="color:#94a3b8;">Total Flete:</span> <strong style="color:#10b981;">${moneyFmtD.format(p.precio)}</strong></div>
            </div>
            ${p.facturas_seleccionadas ? `
            <div style="margin-bottom:8px;padding:8px 12px;background:rgba(59,130,246,0.07);border-radius:6px;">
                <span style="color:#94a3b8;font-size:0.78rem;">FACTURAS INCLUIDAS:</span><br>
                <span style="font-size:0.78rem;">${p.facturas_seleccionadas}</span>
            </div>` : ''}
            ${p.razon_adicional_negociacion ? `
            <div style="padding:8px 12px;background:rgba(245,158,11,0.07);border-radius:6px;">
                <span style="color:#94a3b8;font-size:0.78rem;">ADICIONAL NEGOCIADO:</span>
                ${moneyFmtD.format(p.valor_adicional_negociacion)} ï¿½ ${p.razon_adicional_negociacion}
            </div>` : ''}
            <div style="margin-top:10px;display:flex;align-items:center;gap:8px;">
                <span style="color:#94a3b8;">Estado:</span>
                <span style="display:inline-flex;align-items:center;gap:4px;padding:3px 10px;border-radius:20px;
                             font-size:0.75rem;font-weight:700;background:${meta.bg};color:${meta.color};border:1px solid ${meta.color}40;">
                    <i class="${meta.icon}"></i> ${meta.label}
                </span>
            </div>
            ${p.motivo_rechazo ? `<div style="margin-top:6px;color:#ef4444;font-size:0.8rem;"><i class="ri-information-line"></i> ${p.motivo_rechazo}</div>` : ''}
            <div style="margin-top:6px;color:#94a3b8;font-size:0.76rem;">
                Programado por: ${p.programado_por || 'ï¿½'}
                ${p.revisado_por ? ` ï¿½ Revisado por: ${p.revisado_por}` : ''}
            </div>
        </div>`,
        width: 600,
        showCloseButton: true,
        showConfirmButton: p.estado === 'PENDIENTE',
        showDenyButton: p.estado === 'PENDIENTE',
        confirmButtonText: '<i class="ri-checkbox-circle-line"></i> Aprobar',
        denyButtonText:    '<i class="ri-close-circle-line"></i> Rechazar',
        confirmButtonColor: '#10b981',
        denyButtonColor:    '#ef4444',
        background: '#1e293b', color: '#fff',
    }).then(async (res) => {
        if (res.isConfirmed)  await aprobarProgramacionAdmin(progId);
        if (res.isDenied)     await rechazarProgramacionAdmin(progId, p.placa, p.no_planilla);
    });
}

// Exponer globalmente
window.cargarAprobaciones          = cargarAprobaciones;
window.aprobarProgramacionAdmin    = aprobarProgramacionAdmin;
window.rechazarProgramacionAdmin   = rechazarProgramacionAdmin;
window.verDetalleProgramacion      = verDetalleProgramacion;

// ==========================================================
// ?? RESUMEN DIARIO DE CUADRE
// ==========================================================

async function cargarResumenCuadre() {
    // Leer fecha ï¿½ si estï¿½ vacï¿½a usar hoy
    const fechaEl = document.getElementById('pl-cuadre-fecha');
    if (fechaEl && !fechaEl.value) {
        fechaEl.value = new Date().toISOString().split('T')[0];
    }
    const fecha = fechaEl?.value || new Date().toISOString().split('T')[0];

    // Mostrar loading
    const emptyEl = document.getElementById('pl-cuadre-empty');
    const tablaWrap = document.getElementById('pl-cuadre-tabla-wrap');
    const totalesEl = document.getElementById('pl-cuadre-totales');
    const btnExport = document.getElementById('pl-btn-export-cuadre');

    if (emptyEl) emptyEl.innerHTML = `<i class="ri-loader-4-line rotate" style="font-size:1.6rem;"></i><p style="margin-top:8px;">Cargando cuadres del ${fecha}...</p>`;
    if (tablaWrap) tablaWrap.style.display = 'none';
    if (totalesEl) totalesEl.style.display = 'none';
    if (btnExport) btnExport.style.display = 'none';

    // Consultar planillas CUADRADAS de esa fecha
    const result = await SupabaseClient.planillas.getAll({ estado: 'CUADRADA', fecha });

    if (!result.success) {
        if (emptyEl) emptyEl.innerHTML = `<i class="ri-error-warning-line" style="font-size:2rem;color:#ef4444;"></i><p style="color:#ef4444;margin-top:8px;">Error al cargar el resumen.</p>`;
        return;
    }

    const cuadradas = result.data;

    if (cuadradas.length === 0) {
        if (emptyEl) {
            emptyEl.style.display = 'block';
            emptyEl.innerHTML = `<i class="ri-inbox-line" style="font-size:2rem;opacity:0.4;"></i><p style="margin-top:8px;">Sin planillas cuadradas para el ${fecha}</p>`;
        }
        return;
    }

    // Calcular totales
    const totalEsperado = cuadradas.reduce((s, p) => s + (parseFloat(p.valor_total)    || 0), 0);
    const totalRecibido = cuadradas.reduce((s, p) => s + (parseFloat(p.valor_cuadrado) || 0), 0);
    const diferencia    = totalRecibido - totalEsperado;

    // Actualizar KPI cards
    const fmtR = new Intl.NumberFormat('es-CO', { style:'currency', currency:'COP', minimumFractionDigits:0 });

    const el = (id) => document.getElementById(id);
    if (el('pl-cuadre-count'))    el('pl-cuadre-count').textContent    = cuadradas.length;
    if (el('pl-cuadre-esperado')) el('pl-cuadre-esperado').textContent = fmtR.format(totalEsperado);
    if (el('pl-cuadre-recibido')) el('pl-cuadre-recibido').textContent = fmtR.format(totalRecibido);

    const difEl = el('pl-cuadre-diferencia');
    const difCard = el('pl-cuadre-diff-card');
    if (difEl) {
        difEl.textContent = (diferencia >= 0 ? '+' : '') + fmtR.format(diferencia);
        difEl.style.color  = diferencia === 0 ? '#10b981' : diferencia > 0 ? '#3b82f6' : '#ef4444';
    }
    if (difCard) {
        difCard.style.background   = diferencia === 0
            ? 'rgba(16,185,129,0.07)' : diferencia > 0
            ? 'rgba(59,130,246,0.07)' : 'rgba(239,68,68,0.07)';
        difCard.style.borderColor  = diferencia === 0
            ? 'rgba(16,185,129,0.2)' : diferencia > 0
            ? 'rgba(59,130,246,0.2)' : 'rgba(239,68,68,0.2)';
    }

    // Renderizar tabla
    const tbody = el('pl-cuadre-body');
    if (tbody) {
        tbody.innerHTML = cuadradas.map(p => {
            const esperado  = parseFloat(p.valor_total)    || 0;
            const recibido  = parseFloat(p.valor_cuadrado) || 0;
            const diff      = recibido - esperado;
            const diffColor = diff === 0 ? '#10b981' : diff > 0 ? '#3b82f6' : '#ef4444';
            const diffStr   = (diff >= 0 ? '+' : '') + fmtR.format(diff);

            return `<tr>
                <td><span class="badge-plate" style="font-size:0.75rem;">${p.no_planilla}</span></td>
                <td style="font-size:0.82rem;">${p.zona || 'ï¿½'}</td>
                <td>${p.placa ? `<span class="badge-plate" style="font-size:0.7rem;">${p.placa}</span>` : '<span style="color:var(--text-muted)">ï¿½</span>'}</td>
                <td style="font-size:0.82rem;color:var(--text-muted);">${p.conductor || 'ï¿½'}</td>
                <td style="text-align:right; font-weight:600;">${fmtR.format(esperado)}</td>
                <td style="text-align:right; font-weight:700; color:#10b981;">${fmtR.format(recibido)}</td>
                <td style="text-align:right; font-weight:700; color:${diffColor};">${diffStr}</td>
                <td style="font-size:0.78rem; color:var(--text-muted);">${p.cuadrado_por || 'ï¿½'}</td>
                <td style="font-size:0.78rem; color:var(--text-muted); font-style:italic; max-width:160px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"
                    title="${(p.obs_cuadre || '').replace(/"/g,'&quot;')}">${p.obs_cuadre || 'ï¿½'}</td>
            </tr>`;
        }).join('');
    }

    // Mostrar todo
    if (emptyEl)   emptyEl.style.display = 'none';
    if (totalesEl) totalesEl.style.display = 'block';
    if (tablaWrap) tablaWrap.style.display = 'block';
    if (btnExport) btnExport.style.display = 'inline-flex';

    // Guardar referencia para exportar
    window._CUADRE_DATA = cuadradas;
}

function exportarResumenCuadre() {
    const data = window._CUADRE_DATA;
    if (!data || !data.length) return;

    if (typeof XLSX === 'undefined') {
        Swal.fire({ icon:'warning', title:'XLSX no disponible', background:'#1e293b', color:'#fff' });
        return;
    }

    const fmtN = (v) => parseFloat(v) || 0;
    const rows = data.map(p => ({
        'No. Planilla':    p.no_planilla,
        'Fecha':           p.fecha,
        'Zona':            p.zona || '',
        'Placa':           p.placa || '',
        'Conductor':       p.conductor || '',
        'Valor Esperado':  fmtN(p.valor_total),
        'Valor Recibido':  fmtN(p.valor_cuadrado),
        'Diferencia':      fmtN(p.valor_cuadrado) - fmtN(p.valor_total),
        'Cuadrado por':    p.cuadrado_por || '',
        'Observaciï¿½n':     p.obs_cuadre || '',
        'Fecha Cuadre':    p.fecha_cuadre || '',
    }));

    const wb  = XLSX.utils.book_new();
    const ws  = XLSX.utils.json_to_sheet(rows);
    ws['!cols'] = [
        {wch:12},{wch:12},{wch:10},{wch:9},{wch:24},
        {wch:16},{wch:16},{wch:14},{wch:18},{wch:30},{wch:13}
    ];
    XLSX.utils.book_append_sheet(wb, ws, 'Cuadre');

    const fechaStr = document.getElementById('pl-cuadre-fecha')?.value || 'hoy';
    XLSX.writeFile(wb, `Cuadre_Planillas_${fechaStr}.xlsx`);
}

// Exponer globalmente
window.cargarResumenCuadre    = cargarResumenCuadre;
window.exportarResumenCuadre  = exportarResumenCuadre;

// ==========================================================
// VISTA SIMPLIFICADA CAJERA_PLAN
// ==========================================================

async function _cargarVistaCajera() {
    const fechaEl = document.getElementById('pl-cajera-fecha');
    const fecha   = fechaEl?.value || new Date().toISOString().split('T')[0];
    const wrap = document.getElementById('pl-cajera-wrap');
    if (!wrap) return;

    wrap.innerHTML = '<div style="text-align:center;padding:40px 20px;color:var(--text-muted);"><i class="ri-loader-4-line rotate" style="font-size:2rem;"></i><p style="margin-top:10px;">Cargando...</p></div>';

    const [resDes, resCuad] = await Promise.all([
        SupabaseClient.planillas.getAll({ estado: 'DESPACHADA', fecha }),
        SupabaseClient.planillas.getAll({ estado: 'CUADRADA',   fecha }),
    ]);

    if (!resDes.success && !resCuad.success) {
        wrap.innerHTML = '<div style="text-align:center;padding:32px;color:#ef4444;"><i class="ri-error-warning-line" style="font-size:2rem;"></i><p>Error al cargar las planillas.</p></div>';
        return;
    }

    const porCuadrar  = resDes.success  ? (resDes.data  || []) : [];
    const yaCuadradas = resCuad.success ? (resCuad.data || []) : [];
    PL_CACHE = [...porCuadrar, ...yaCuadradas];

    const totalPorCuadrar = porCuadrar.reduce((s, p)  => s + (parseFloat(p.valor_total)    || 0), 0);
    const totalYaCuadrado = yaCuadradas.reduce((s, p) => s + (parseFloat(p.valor_cuadrado) || 0), 0);
    const totalGeneral    = totalPorCuadrar + yaCuadradas.reduce((s, p) => s + (parseFloat(p.valor_total) || 0), 0);
    const todoCuadrado    = porCuadrar.length === 0 && yaCuadradas.length > 0;
    const sinPlanillas    = porCuadrar.length === 0 && yaCuadradas.length === 0;

    const kpiColor1 = porCuadrar.length > 0 ? '#f59e0b' : '#10b981';
    const kpiBg1    = porCuadrar.length > 0 ? 'rgba(245,158,11,0.1)' : 'rgba(16,185,129,0.1)';
    const kpiBdr1   = porCuadrar.length > 0 ? 'rgba(245,158,11,0.35)' : 'rgba(16,185,129,0.35)';

    wrap.innerHTML =
        '<div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(160px,1fr));gap:12px;margin-bottom:24px;">' +
          '<div style="padding:18px 16px;background:' + kpiBg1 + ';border:1px solid ' + kpiBdr1 + ';border-radius:12px;text-align:center;">' +
            '<div style="font-size:2.2rem;font-weight:900;color:' + kpiColor1 + ';line-height:1;">' + porCuadrar.length + '</div>' +
            '<div style="font-size:0.75rem;color:var(--text-muted);margin-top:4px;text-transform:uppercase;font-weight:600;">Por cuadrar</div>' +
            '<div style="font-size:0.82rem;font-weight:700;color:' + kpiColor1 + ';margin-top:4px;">' + fmt(totalPorCuadrar) + '</div>' +
          '</div>' +
          '<div style="padding:18px 16px;background:rgba(16,185,129,0.1);border:1px solid rgba(16,185,129,0.3);border-radius:12px;text-align:center;">' +
            '<div style="font-size:2.2rem;font-weight:900;color:#10b981;line-height:1;">' + yaCuadradas.length + '</div>' +
            '<div style="font-size:0.75rem;color:var(--text-muted);margin-top:4px;text-transform:uppercase;font-weight:600;">Ya cuadradas</div>' +
            '<div style="font-size:0.82rem;font-weight:700;color:#10b981;margin-top:4px;">' + fmt(totalYaCuadrado) + '</div>' +
          '</div>' +
          '<div style="padding:18px 16px;background:rgba(59,130,246,0.08);border:1px solid rgba(59,130,246,0.25);border-radius:12px;text-align:center;">' +
            '<div style="font-size:2.2rem;font-weight:900;color:#3b82f6;line-height:1;">' + (porCuadrar.length + yaCuadradas.length) + '</div>' +
            '<div style="font-size:0.75rem;color:var(--text-muted);margin-top:4px;text-transform:uppercase;font-weight:600;">Total planillas</div>' +
            '<div style="font-size:0.82rem;font-weight:700;color:#3b82f6;margin-top:4px;">' + fmt(totalGeneral) + '</div>' +
          '</div>' +
        '</div>' +
        (todoCuadrado ? '<div style="text-align:center;padding:28px 20px;background:rgba(16,185,129,0.1);border:2px solid rgba(16,185,129,0.4);border-radius:16px;margin-bottom:24px;"><div style="font-size:3rem;">&#x2705;</div><div style="font-size:1.2rem;font-weight:800;color:#10b981;margin-top:8px;">¡Todo cuadrado!</div><div style="color:var(--text-muted);font-size:0.9rem;margin-top:4px;">No quedan planillas pendientes para el ' + fecha + '.</div></div>' : '') +
        (sinPlanillas ? '<div style="text-align:center;padding:40px 20px;color:var(--text-muted);"><i class="ri-inbox-line" style="font-size:3rem;opacity:0.4;"></i><p style="margin-top:12px;font-size:1rem;">Sin planillas programadas para el ' + fecha + '.</p></div>' : '') +
        (porCuadrar.length > 0 ?
            '<div style="margin-bottom:28px;"><h3 style="color:#f59e0b;font-size:0.9rem;text-transform:uppercase;letter-spacing:1px;margin-bottom:14px;display:flex;align-items:center;gap:8px;"><i class="ri-time-line"></i> Por cuadrar (' + porCuadrar.length + ')</h3><div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(300px,1fr));gap:14px;">' +
            porCuadrar.map(function(p) { return _cardCajeraSimple(p, false); }).join('') +
            '</div></div>' : '') +
        (yaCuadradas.length > 0 ?
            '<div><h3 style="color:#10b981;font-size:0.9rem;text-transform:uppercase;letter-spacing:1px;margin-bottom:14px;display:flex;align-items:center;gap:8px;cursor:pointer;" onclick="_toggleCuadrdasHoy(this)"><i class="ri-checkbox-circle-line"></i> Cuadradas hoy (' + yaCuadradas.length + ')<i class="ri-arrow-down-s-line" id="pl-cajera-arrow-cuadradas" style="margin-left:auto;transition:transform 0.2s;"></i></h3><div id="pl-cajera-ya-cuadradas" style="display:grid;grid-template-columns:repeat(auto-fill,minmax(300px,1fr));gap:14px;">' +
            yaCuadradas.map(function(p) { return _cardCajeraSimple(p, true); }).join('') +
            '</div></div>' : '');
}

function _toggleCuadrdasHoy(headerEl) {
    var list  = document.getElementById('pl-cajera-ya-cuadradas');
    var arrow = document.getElementById('pl-cajera-arrow-cuadradas');
    if (!list) return;
    var hidden = list.style.display === 'none';
    list.style.display = hidden ? 'grid' : 'none';
    if (arrow) arrow.style.transform = hidden ? 'rotate(0deg)' : 'rotate(-90deg)';
}
window._toggleCuadrdasHoy = _toggleCuadrdasHoy;

function _cardCajeraSimple(p, esCuadrada) {
    var factTotal = (p.planilla_facturas || []).length;
    var factAsig  = (p.planilla_facturas || []).filter(function(f){ return f.asignada; }).length;
    var diff      = esCuadrada ? ((parseFloat(p.valor_cuadrado) || 0) - (parseFloat(p.valor_total) || 0)) : null;
    var bdrColor  = esCuadrada ? '#10b981' : '#f59e0b';
    var statusBg  = esCuadrada ? 'rgba(16,185,129,0.15)' : 'rgba(245,158,11,0.15)';
    var statusClr = esCuadrada ? '#10b981' : '#f59e0b';
    var statusTxt = esCuadrada ? '&#x2713; CUADRADA' : '&#x23F3; PENDIENTE';

    var diffBadge = '';
    if (diff !== null) {
        var diffBg  = diff === 0 ? 'rgba(16,185,129,0.15)' : diff > 0 ? 'rgba(59,130,246,0.15)' : 'rgba(239,68,68,0.15)';
        var diffClr = diff === 0 ? '#10b981' : diff > 0 ? '#3b82f6' : '#ef4444';
        var diffTxt = diff === 0 ? '&#x2713; Cuadra exacto' : (diff > 0 ? '+' : '') + fmt(diff);
        diffBadge = '<span style="font-size:0.72rem;font-weight:700;padding:2px 8px;border-radius:6px;background:' + diffBg + ';color:' + diffClr + ';">' + diffTxt + '</span>';
    }

    var infoCuadre = '';
    if (esCuadrada && p.valor_cuadrado) {
        infoCuadre = '<div style="margin-top:10px;padding:10px 12px;background:rgba(16,185,129,0.1);border:1px solid rgba(16,185,129,0.3);border-radius:10px;">' +
            '<div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:4px;">' +
            '<span style="font-size:0.78rem;color:#94a3b8;">Recibido:</span>' +
            '<span style="font-weight:800;color:#10b981;font-size:1rem;">' + fmt(p.valor_cuadrado) + '</span>' +
            '</div>' +
            (p.cuadrado_por ? '<div style="font-size:0.73rem;color:#64748b;margin-top:3px;">Por: ' + p.cuadrado_por + '</div>' : '') +
            (p.obs_cuadre   ? '<div style="font-size:0.73rem;color:#64748b;font-style:italic;margin-top:3px;">"' + p.obs_cuadre + '"</div>' : '') +
            '</div>';
    }

    var btnAccion = esCuadrada
        ? '<button onclick="abrirDetallePlanilla(\'' + p.id + '\')" style="width:100%;padding:10px;font-size:0.85rem;font-weight:600;background:rgba(255,255,255,0.05);color:#94a3b8;border:1px solid rgba(255,255,255,0.1);border-radius:10px;cursor:pointer;display:flex;align-items:center;justify-content:center;gap:8px;"><i class="ri-eye-line"></i> Ver detalle</button>'
        : '<button onclick="cuadrarPlanillaCajera(\'' + p.id + '\')" style="width:100%;padding:14px;font-size:1rem;font-weight:700;background:linear-gradient(135deg,#10b981,#059669);color:#fff;border:none;border-radius:10px;cursor:pointer;display:flex;align-items:center;justify-content:center;gap:10px;box-shadow:0 4px 14px rgba(16,185,129,0.4);transition:all 0.2s;" onmouseenter="this.style.transform=\'translateY(-2px)\'" onmouseleave="this.style.transform=\'translateY(0)\'"><i class="ri-checkbox-circle-line" style="font-size:1.2rem;"></i> Cuadrar planilla</button>';

    return '<div style="background:var(--glass-bg,rgba(30,41,59,0.7));backdrop-filter:blur(10px);border:1px solid ' + (esCuadrada ? 'rgba(16,185,129,0.3)' : 'rgba(245,158,11,0.3)') + ';border-left:4px solid ' + bdrColor + ';border-radius:14px;padding:18px 16px;opacity:' + (esCuadrada ? '0.85' : '1') + ';transition:box-shadow 0.2s;" onmouseenter="this.style.boxShadow=\'0 4px 20px rgba(0,0,0,0.3)\'" onmouseleave="this.style.boxShadow=\'none\'">' +
        '<div style="display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:12px;gap:8px;flex-wrap:wrap;">' +
        '<span style="font-family:monospace;font-size:1.05rem;font-weight:800;color:#f8fafc;">' + p.no_planilla + '</span>' +
        '<span style="font-size:0.72rem;padding:3px 10px;border-radius:20px;font-weight:700;background:' + statusBg + ';color:' + statusClr + ';">' + statusTxt + '</span>' +
        '</div>' +
        '<div style="display:grid;gap:6px;font-size:0.84rem;color:#cbd5e1;">' +
        '<div style="display:flex;align-items:center;gap:8px;"><i class="ri-calendar-line" style="color:var(--text-muted);width:14px;"></i><span>' + (p.fecha || '—') + '</span></div>' +
        (p.zona ? '<div style="display:flex;align-items:center;gap:8px;"><i class="ri-map-pin-line" style="color:var(--text-muted);width:14px;"></i><span>' + p.zona + '</span></div>' : '') +
        (p.placa ? '<div style="display:flex;align-items:center;gap:8px;"><i class="ri-truck-line" style="color:var(--text-muted);width:14px;"></i><span style="background:rgba(255,255,255,0.08);padding:2px 8px;border-radius:6px;font-family:monospace;font-weight:700;">' + p.placa + '</span>' + (p.conductor ? '<span style="color:#94a3b8;font-size:0.8rem;">' + p.conductor + '</span>' : '') + '</div>' : '') +
        '<div style="display:flex;align-items:center;gap:8px;"><i class="ri-file-list-3-line" style="color:var(--text-muted);width:14px;"></i><span>' + factAsig + ' / ' + factTotal + ' facturas</span></div>' +
        '<div style="display:flex;align-items:center;gap:8px;justify-content:space-between;">' +
        '<div style="display:flex;align-items:center;gap:8px;"><i class="ri-money-dollar-circle-line" style="color:var(--text-muted);width:14px;"></i><span style="font-weight:700;color:#f8fafc;font-size:0.95rem;">' + fmt(p.valor_total) + '</span></div>' +
        diffBadge +
        '</div>' +
        '</div>' +
        infoCuadre +
        '<div style="margin-top:14px;">' + btnAccion + '</div>' +
        '</div>';
}

async function cuadrarPlanillaCajera(planillaId) {
    var planilla = PL_CACHE.find(function(p) { return p.id === planillaId; });
    if (!planilla) return;

    var valorEsperado = parseFloat(planilla.valor_total) || 0;
    var facturas      = (planilla.planilla_facturas || []).map(function(f) { return Object.assign({}, f); });

    // PASO 1: ingresar valor recibido
    var paso1 = await Swal.fire({
        title: '&#x1F4B5; &#xBF;Cu&#xE1;nto recibiste?',
        html: '<div style="text-align:left;font-size:0.9rem;">' +
            '<div style="padding:12px 14px;background:rgba(16,185,129,0.08);border:1px solid rgba(16,185,129,0.25);border-radius:10px;margin-bottom:18px;display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:8px;">' +
            '<span style="color:#94a3b8;font-size:0.82rem;">Planilla:</span>' +
            '<strong style="font-family:monospace;">' + planilla.no_planilla + '</strong>' +
            (planilla.placa ? '<span style="background:rgba(255,255,255,0.08);padding:2px 8px;border-radius:6px;font-family:monospace;font-weight:700;">' + planilla.placa + '</span>' : '') +
            '<span style="color:#94a3b8;font-size:0.82rem;">Valor esperado:</span>' +
            '<strong style="color:#10b981;font-size:1.05rem;">' + fmt(valorEsperado) + '</strong>' +
            '</div>' +
            '<label style="display:block;margin-bottom:8px;color:#94a3b8;font-size:0.8rem;font-weight:700;text-transform:uppercase;">Valor recibido <span style="color:#ef4444;">*</span></label>' +
            '<input id="swal-cajera-valor" type="text" value="' + fmt(valorEsperado) + '" style="width:100%;padding:14px 16px;background:#0f172a;border:2px solid rgba(16,185,129,0.4);color:#10b981;border-radius:10px;font-size:1.2rem;font-weight:800;font-family:inherit;outline:none;box-sizing:border-box;text-align:right;" oninput="this.style.borderColor=\'rgba(59,130,246,0.5)\'">' +
            '<p style="color:#64748b;font-size:0.77rem;margin-top:8px;text-align:right;"><i class="ri-information-line"></i> Si todo cuadra, deja el valor y confirma.</p>' +
            '</div>',
        showCancelButton: true,
        confirmButtonText: '<i class="ri-arrow-right-line"></i> Continuar',
        cancelButtonText:  'Cancelar',
        confirmButtonColor: '#10b981',
        background: '#1e293b', color: '#fff',
        focusConfirm: false,
        didOpen: function() {
            var inp = document.getElementById('swal-cajera-valor');
            if (inp) inp.addEventListener('focus', function() { inp.select(); });
        },
        preConfirm: function() {
            var v = (document.getElementById('swal-cajera-valor') || {}).value || '';
            if (!v.trim()) { Swal.showValidationMessage('Ingresa el valor recibido'); return false; }
            return v;
        }
    });

    if (!paso1.isConfirmed || !paso1.value) return;

    var valorRecibido = parseFloat(paso1.value.replace(/[^0-9]/g, '')) || 0;
    var diferencia    = valorRecibido - valorEsperado;
    var hasDiff       = Math.abs(diferencia) > 0;

    var cuadradasIds   = facturas.map(function(f) { return f.id; });
    var noCuadradasIds = [];
    var observacion    = hasDiff
        ? ('Diferencia de ' + fmt(Math.abs(diferencia)) + ' ' + (diferencia > 0 ? 'a favor' : 'faltante') + '.')
        : 'Cuadre completo sin novedades.';

    // PASO 2 (solo si hay diferencia y hay facturas)
    if (hasDiff && facturas.length > 0) {
        var estadoChecks = {};
        facturas.forEach(function(f) { estadoChecks[f.id] = f.asignada !== false; });

        var recalc = function() {
            var ok    = facturas.filter(function(f) { return  estadoChecks[f.id]; });
            var no    = facturas.filter(function(f) { return !estadoChecks[f.id]; });
            var sumOk = ok.reduce(function(s,f) { return s + (parseFloat(f.valor_total)||0); }, 0);
            var sumNo = no.reduce(function(s,f) { return s + (parseFloat(f.valor_total)||0); }, 0);
            var e1 = document.getElementById('swal2-cnt-ok'); if (e1) e1.textContent = ok.length;
            var e2 = document.getElementById('swal2-tot-ok'); if (e2) e2.textContent = fmt(sumOk);
            var e3 = document.getElementById('swal2-cnt-no'); if (e3) e3.textContent = no.length;
            var e4 = document.getElementById('swal2-tot-no'); if (e4) e4.textContent = fmt(sumNo);
            var obsEl = document.getElementById('swal2-obs');
            if (obsEl && !obsEl.dataset.userEdited) {
                obsEl.value = no.length > 0
                    ? ('No cuadraron ' + no.length + ' factura(s): ' + no.map(function(f) { return '#' + f.no_factura; }).join(', ') + '.')
                    : 'Cuadre completo sin novedades.';
            }
        };

        var listHtml = facturas.length === 0
            ? '<div style="text-align:center;padding:16px;color:#94a3b8;">Sin facturas registradas</div>'
            : facturas.map(function(f) {
                var chk = estadoChecks[f.id];
                return '<div class="swal2-fact-row" id="swal2-frow-' + f.id + '" style="display:flex;align-items:center;justify-content:space-between;padding:7px 10px;margin-bottom:4px;border-radius:6px;background:' + (chk ? 'rgba(16,185,129,0.06)' : 'rgba(239,68,68,0.06)') + ';border:1px solid ' + (chk ? 'rgba(16,185,129,0.2)' : 'rgba(239,68,68,0.2)') + ';">' +
                    '<label style="display:flex;align-items:center;gap:10px;cursor:pointer;flex-grow:1;margin:0;">' +
                    '<input type="checkbox" class="swal2-chk" data-id="' + f.id + '" ' + (chk ? 'checked' : '') + ' style="width:16px;height:16px;accent-color:#10b981;cursor:pointer;">' +
                    '<span style="font-family:monospace;font-weight:700;font-size:0.88rem;color:' + (chk ? '#f8fafc' : '#94a3b8') + ';">' + f.no_factura + '</span>' +
                    (f.zona ? '<span style="font-size:0.7rem;color:#64748b;background:rgba(255,255,255,0.05);padding:2px 6px;border-radius:4px;">' + f.zona + '</span>' : '') +
                    '</label>' +
                    '<span style="font-weight:700;font-size:0.88rem;color:' + (chk ? '#10b981' : '#ef4444') + ';font-family:monospace;">' + fmt(f.valor_total || 0) + '</span>' +
                    '</div>';
            }).join('');

        var paso2 = await Swal.fire({
            title: '&#x1F4CB; Revisar facturas',
            width: '700px',
            html: '<div style="text-align:left;font-size:0.86rem;">' +
                '<div style="padding:10px 14px;background:rgba(239,68,68,0.1);border:1px solid rgba(239,68,68,0.3);border-radius:8px;margin-bottom:14px;display:flex;align-items:center;gap:10px;">' +
                '<i class="ri-alert-line" style="color:#ef4444;font-size:1.3rem;"></i>' +
                '<div><span style="font-weight:700;color:#ef4444;">Diferencia de ' + fmt(Math.abs(diferencia)) + '</span>' +
                '<span style="color:#94a3b8;font-size:0.8rem;margin-left:6px;">(' + (diferencia > 0 ? 'recibiste m&#xE1;s' : 'recibiste menos') + ' de lo esperado)</span></div>' +
                '</div>' +
                '<p style="color:#94a3b8;margin-bottom:10px;font-size:0.82rem;">Desmarca las facturas que <strong>no llegaron</strong>:</p>' +
                '<div style="display:flex;gap:8px;margin-bottom:8px;">' +
                '<button type="button" id="swal2-btn-todas" style="padding:5px 12px;font-size:0.75rem;background:rgba(16,185,129,0.15);color:#10b981;border:1px solid rgba(16,185,129,0.35);border-radius:6px;cursor:pointer;font-weight:700;"><i class="ri-checkbox-line"></i> Marcar todas</button>' +
                '<button type="button" id="swal2-btn-ninguna" style="padding:5px 12px;font-size:0.75rem;background:rgba(239,68,68,0.12);color:#ef4444;border:1px solid rgba(239,68,68,0.35);border-radius:6px;cursor:pointer;font-weight:700;"><i class="ri-checkbox-blank-line"></i> Desmarcar todas</button>' +
                '</div>' +
                '<div style="max-height:200px;overflow-y:auto;background:#0b1324;border:1px solid rgba(255,255,255,0.08);border-radius:8px;padding:6px;margin-bottom:12px;">' + listHtml + '</div>' +
                '<div style="display:grid;grid-template-columns:1fr 1fr;gap:10px;margin-bottom:12px;">' +
                '<div style="padding:8px 12px;background:rgba(16,185,129,0.09);border:1px solid rgba(16,185,129,0.25);border-radius:8px;"><div style="font-size:0.68rem;color:#94a3b8;text-transform:uppercase;font-weight:600;">Cuadradas (<span id="swal2-cnt-ok">0</span>)</div><div id="swal2-tot-ok" style="font-size:1rem;font-weight:800;color:#10b981;">$ 0</div></div>' +
                '<div style="padding:8px 12px;background:rgba(239,68,68,0.07);border:1px solid rgba(239,68,68,0.22);border-radius:8px;"><div style="font-size:0.68rem;color:#94a3b8;text-transform:uppercase;font-weight:600;">No cuadradas (<span id="swal2-cnt-no">0</span>)</div><div id="swal2-tot-no" style="font-size:1rem;font-weight:800;color:#ef4444;">$ 0</div></div>' +
                '</div>' +
                '<textarea id="swal2-obs" rows="2" placeholder="Observacion..." style="width:100%;padding:8px 12px;background:#0f172a;border:1px solid rgba(255,255,255,0.08);color:#f8fafc;border-radius:8px;font-family:inherit;font-size:0.85rem;resize:vertical;outline:none;box-sizing:border-box;"></textarea>' +
                '</div>',
            showCancelButton:   true,
            confirmButtonText:  '<i class="ri-checkbox-circle-line"></i> Confirmar cuadre',
            cancelButtonText:   'Volver',
            confirmButtonColor: '#10b981',
            background: '#1e293b', color: '#fff',
            focusConfirm: false,
            didOpen: function() {
                recalc();
                var obsEl = document.getElementById('swal2-obs');
                if (obsEl) obsEl.addEventListener('input', function() { obsEl.dataset.userEdited = '1'; });

                document.querySelectorAll('.swal2-chk').forEach(function(chk) {
                    chk.addEventListener('change', function(e) {
                        var fid = e.target.getAttribute('data-id');
                        estadoChecks[fid] = e.target.checked;
                        var row = document.getElementById('swal2-frow-' + fid);
                        if (row) {
                            row.style.background  = e.target.checked ? 'rgba(16,185,129,0.06)' : 'rgba(239,68,68,0.06)';
                            row.style.borderColor = e.target.checked ? 'rgba(16,185,129,0.2)'  : 'rgba(239,68,68,0.2)';
                        }
                        recalc();
                    });
                });

                var btnTodas = document.getElementById('swal2-btn-todas');
                if (btnTodas) btnTodas.addEventListener('click', function() {
                    facturas.forEach(function(f) { estadoChecks[f.id] = true; });
                    document.querySelectorAll('.swal2-chk').forEach(function(c) { c.checked = true; var row = document.getElementById('swal2-frow-' + c.getAttribute('data-id')); if (row) { row.style.background = 'rgba(16,185,129,0.06)'; row.style.borderColor = 'rgba(16,185,129,0.2)'; } });
                    recalc();
                });
                var btnNinguna = document.getElementById('swal2-btn-ninguna');
                if (btnNinguna) btnNinguna.addEventListener('click', function() {
                    facturas.forEach(function(f) { estadoChecks[f.id] = false; });
                    document.querySelectorAll('.swal2-chk').forEach(function(c) { c.checked = false; var row = document.getElementById('swal2-frow-' + c.getAttribute('data-id')); if (row) { row.style.background = 'rgba(239,68,68,0.06)'; row.style.borderColor = 'rgba(239,68,68,0.2)'; } });
                    recalc();
                });
            },
            preConfirm: function() {
                var obs = ((document.getElementById('swal2-obs') || {}).value || '').trim();
                cuadradasIds   = facturas.filter(function(f) { return  estadoChecks[f.id]; }).map(function(f) { return f.id; });
                noCuadradasIds = facturas.filter(function(f) { return !estadoChecks[f.id]; }).map(function(f) { return f.id; });
                if (obs) observacion = obs;
                return true;
            }
        });

        if (!paso2.isConfirmed) return;
    }

    Swal.fire({ title: 'Guardando cuadre...', allowOutsideClick: false, background: '#1e293b', color: '#fff', didOpen: function() { Swal.showLoading(); } });

    if (noCuadradasIds.length > 0) await SupabaseClient.planillas.toggleFacturasBatch(noCuadradasIds, false);
    if (cuadradasIds.length   > 0) await SupabaseClient.planillas.toggleFacturasBatch(cuadradasIds,   true);

    var userName = (window.CURRENT_SESSION && window.CURRENT_SESSION.profile && window.CURRENT_SESSION.profile.nombre) || 'Cajera';
    var saveResult = await SupabaseClient.planillas.updateEstado(planillaId, 'CUADRADA', {
        cuadrado_por:   userName,
        valor_cuadrado: valorRecibido,
        obs_cuadre:     observacion || null,
        fecha_cuadre:   new Date().toISOString().split('T')[0],
    });

    if (!saveResult.success) {
        Swal.fire({ icon: 'error', title: 'Error al guardar', text: saveResult.error || 'No se pudo registrar el cuadre.', background: '#1e293b', color: '#fff' });
        return;
    }

    planilla.estado         = 'CUADRADA';
    planilla.valor_cuadrado = valorRecibido;
    planilla.cuadrado_por   = userName;
    planilla.obs_cuadre     = observacion || null;
    planilla.fecha_cuadre   = new Date().toISOString().split('T')[0];

    await _cargarVistaCajera();

    Swal.fire({
        icon: 'success',
        title: '&#x2705; &#xA1;Planilla cuadrada!',
        html: '<strong>' + planilla.no_planilla + '</strong><br><span style="color:#10b981;font-weight:800;font-size:1.15rem;">' + fmt(valorRecibido) + '</span> recibidos.<br>' +
              (Math.abs(diferencia) > 0
                  ? '<small style="color:' + (diferencia > 0 ? '#3b82f6' : '#ef4444') + ';">Diferencia: ' + (diferencia > 0 ? '+' : '') + fmt(diferencia) + '</small>'
                  : '<small style="color:#10b981;">Cuadra exacto &#x2713;</small>'),
        timer: 3500, showConfirmButton: true, confirmButtonText: 'Listo',
        background: '#1e293b', color: '#fff'
    });
}
window.cuadrarPlanillaCajera = cuadrarPlanillaCajera;
window._cargarVistaCajera    = _cargarVistaCajera;
