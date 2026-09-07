/* ==========================================================
   📋 MÓDULO GESTIÓN DE PLANILLAS
   FletesApp — js/modules/planillas.js
   ==========================================================
   Roles que usan este módulo:
     · cargador      → sube Excel, gestiona planillas cargadas
     · programador   → asigna planillas a fletes, desasigna facturas
     · cajera_plan   → visualiza kanban de 4 estados (solo lectura + cambio de estado)
     · admin         → acceso completo a todo
   ========================================================== */

'use strict';

// ── Estado local del módulo ────────────────────────────────
let PL_CACHE          = [];   // Cache de planillas
let PL_FACTURAS_MODAL = [];   // Facturas del modal activo
let PL_ID_MODAL       = null; // Planilla abierta en modal
let PL_ROLE           = null; // Rol del usuario ('admin'|'cargador'|'programador'|'cajera_plan')
let PL_INITIALIZED    = false;

const PL_ESTADOS = ['TRANSITORIA', 'POR DESPACHAR', 'DESPACHADA', 'CUADRADA'];

const PL_ESTADO_META = {
    'TRANSITORIA':    { color: '#f59e0b', bg: 'rgba(245,158,11,0.12)',  icon: 'ri-time-line',            label: 'TRANSITORIA'    },
    'POR DESPACHAR':  { color: '#3b82f6', bg: 'rgba(59,130,246,0.12)',  icon: 'ri-send-plane-line',      label: 'POR DESPACHAR'  },
    'DESPACHADA':     { color: '#8b5cf6', bg: 'rgba(139,92,246,0.12)', icon: 'ri-truck-line',            label: 'DESPACHADA'     },
    'CUADRADA':       { color: '#10b981', bg: 'rgba(16,185,129,0.12)', icon: 'ri-checkbox-circle-line',  label: 'CUADRADA'       },
};

const moneyFmt = new Intl.NumberFormat('es-CO', { style: 'currency', currency: 'COP', minimumFractionDigits: 0 });
const fmt = v => moneyFmt.format(v || 0);

// ── Inicialización ─────────────────────────────────────────
async function inicializarModuloPlanillas() {
    if (PL_INITIALIZED) { await cargarPlanillas(); return; }
    PL_ROLE = (window.CURRENT_ROLE || 'cargador').toLowerCase();
    PL_INITIALIZED = true;

    // Fijar fecha de hoy en el filtro
    const hoy = new Date().toISOString().split('T')[0];
    const fFecha = document.getElementById('pl-filtro-fecha');
    if (fFecha) fFecha.value = hoy;

    // Mostrar/ocultar secciones según rol
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
    // Sección de carga de Excel solo para cargador y admin
    const secCarga = document.getElementById('pl-sec-carga');
    if (secCarga) secCarga.style.display = (['admin','cargador'].includes(role)) ? 'block' : 'none';

    // Sección de programación solo para programador y admin
    const secProg = document.getElementById('pl-sec-programacion');
    if (secProg) secProg.style.display = (['admin','programador'].includes(role)) ? 'block' : 'none';

    // Kanban siempre visible
    const secKanban = document.getElementById('pl-sec-kanban');
    if (secKanban) secKanban.style.display = 'block';

    // Tabla de facturas sueltas visible para cargador, programador y admin
    const secSueltas = document.getElementById('pl-sec-sueltas');
    if (secSueltas) secSueltas.style.display = (['admin','cargador','programador'].includes(role)) ? 'block' : 'none';
}

// ── Carga y Renderizado Principal ──────────────────────────
async function cargarPlanillas() {
    const filtros = {
        estado:    document.getElementById('pl-filtro-estado')?.value    || '',
        fecha:     document.getElementById('pl-filtro-fecha')?.value     || '',
        proveedor: document.getElementById('pl-filtro-proveedor')?.value || '',
        busqueda:  document.getElementById('pl-filtro-busqueda')?.value  || '',
    };

    // Limpiar filtros vacíos
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

// ── Kanban ─────────────────────────────────────────────────
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

    // Datos de cuadre (si ya está CUADRADA)
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
            <div class="pl-info-row"><i class="ri-calendar-line"></i> <span>${p.fecha || '—'}</span></div>
            ${p.zona ? `<div class="pl-info-row"><i class="ri-map-pin-line"></i> <span>${p.zona}</span></div>` : ''}
            ${p.placa
                ? `<div class="pl-info-row">
                       <i class="ri-truck-line"></i>
                       <span class="badge-plate" style="font-size:0.75rem;">${p.placa}</span>
                       ${p.conductor ? `<span style="font-size:0.8rem;color:var(--text-muted);">${p.conductor}</span>` : ''}
                   </div>`
                : `<div class="pl-info-row" style="color:#f59e0b;">
                       <i class="ri-alert-line"></i> <span style="font-size:0.8rem;">Sin vehículo asignado</span>
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

// ── Tabla resumida ─────────────────────────────────────────
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
            <td>${p.fecha || '—'}</td>
            <td>${p.zona || '—'}</td>
            <td>${p.proveedor || '—'}</td>
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

// ── KPIs ───────────────────────────────────────────────────
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

// ── Modal Detalle / Facturas ───────────────────────────────
async function abrirDetallePlanilla(planillaId) {
    PL_ID_MODAL = planillaId;
    const planilla = PL_CACHE.find(p => p.id === planillaId);
    if (!planilla) return;

    PL_FACTURAS_MODAL = planilla.planilla_facturas || [];

    // Cabecera del modal
    document.getElementById('pl-modal-no-planilla').textContent  = planilla.no_planilla;
    document.getElementById('pl-modal-fecha').textContent        = planilla.fecha || '—';
    document.getElementById('pl-modal-zona').textContent         = planilla.zona || '—';
    document.getElementById('pl-modal-proveedor').textContent    = planilla.proveedor || '—';
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

    // Sección de programación (solo para programador/admin)
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

    const canToggle = ['admin','programador'].includes(PL_ROLE);

    if (facturas.length === 0) {
        tbody.innerHTML = `<tr><td colspan="7" style="text-align:center;color:var(--text-muted);padding:20px;">
            Sin facturas registradas</td></tr>`;
        return;
    }

    tbody.innerHTML = facturas.map(f => `
        <tr id="frow-${f.id}" class="${f.asignada ? '' : 'pl-fila-suelta'}">
            <td>
                ${canToggle ? `<label class="pl-toggle-wrap">
                    <input type="checkbox" ${f.asignada ? 'checked' : ''} onchange="toggleFacturaUI('${f.id}', this.checked)">
                    <span class="pl-toggle-slider"></span>
                </label>` : (f.asignada ? '<i class="ri-checkbox-circle-line" style="color:#10b981"></i>' : '<i class="ri-close-circle-line" style="color:#ef4444"></i>')}
            </td>
            <td><strong>${f.no_factura}</strong></td>
            <td>${f.fecha_entrega || '—'}</td>
            <td>${f.zona || '—'}</td>
            <td class="price-cell">${fmt(f.valor_bruto)}</td>
            <td class="price-cell">${fmt(f.valor_factura)}</td>
            <td class="price-cell">${fmt(f.valor_total)}</td>
        </tr>`).join('');

    // Resumen al pie
    const asig    = facturas.filter(f => f.asignada).length;
    const sueltas = facturas.length - asig;
    const elResumen = document.getElementById('pl-modal-resumen-fact');
    if (elResumen) {
        elResumen.innerHTML = `
            <span style="color:#10b981"><i class="ri-checkbox-circle-line"></i> ${asig} asignadas</span>
            ${sueltas > 0 ? `<span style="color:#ef4444"><i class="ri-alert-line"></i> ${sueltas} sueltas</span>` : ''}
            <span style="color:var(--text-muted)">Total: ${fmt(facturas.reduce((s,f)=>s+(f.valor_total||0),0))}</span>`;
    }
}

// ── Toggle de factura (asignar / desasignar) ───────────────
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

// ── Cambio de estado ───────────────────────────────────────
// ── Cambio de estado ───────────────────────────────────────
async function cambiarEstadoPlanilla(planillaId, nuevoEstado) {
    const planilla = PL_CACHE.find(p => p.id === planillaId);
    if (!planilla) return;

    const meta = PL_ESTADO_META[nuevoEstado];

    // ── Flujo especial para CUADRADA: la cajera confirma el cuadre ──
    if (nuevoEstado === 'CUADRADA') {
        const moneyFmtC = new Intl.NumberFormat('es-CO', { style:'currency', currency:'COP', minimumFractionDigits:0 });
        const factAsig  = planilla.planilla_facturas?.filter(f => f.asignada).length || 0;
        const factTotal = planilla.planilla_facturas?.length || 0;
        const haySueltas = factTotal > factAsig;

        const { value: formValues, isConfirmed } = await Swal.fire({
            title: '📋 Cuadre de Planilla',
            html: `
                <div style="text-align:left;font-size:0.88rem;">
                    <div style="padding:10px 14px;background:rgba(16,185,129,0.08);border:1px solid rgba(16,185,129,0.2);border-radius:8px;margin-bottom:16px;">
                        <div style="display:flex;justify-content:space-between;flex-wrap:wrap;gap:8px;">
                            <span><i class="ri-file-list-2-line"></i> Planilla: <strong style="font-family:monospace;">${planilla.no_planilla}</strong></span>
                            <span><i class="ri-calendar-line"></i> ${planilla.fecha || '—'}</span>
                            ${planilla.placa ? `<span><i class="ri-truck-line"></i> <strong>${planilla.placa}</strong></span>` : ''}
                            <span style="color:#10b981;"><i class="ri-money-dollar-circle-line"></i> <strong>${moneyFmtC.format(planilla.valor_total)}</strong></span>
                        </div>
                        ${haySueltas ? `
                        <div style="margin-top:8px;padding:6px 10px;background:rgba(245,158,11,0.1);border-radius:6px;color:#f59e0b;font-size:0.8rem;">
                            <i class="ri-alert-line"></i> ${factTotal - factAsig} factura(s) sin asignar en esta planilla
                        </div>` : ''}
                    </div>

                    <div style="margin-bottom:12px;">
                        <label style="display:block;margin-bottom:5px;color:#94a3b8;font-size:0.78rem;font-weight:600;">
                            VALOR RECIBIDO (confirmación) <span style="color:#ef4444;">*</span>
                        </label>
                        <input id="swal-valor-cuadre" type="text"
                               placeholder="${moneyFmtC.format(planilla.valor_total)}"
                               style="width:100%;padding:10px 14px;background:#0f172a;border:1px solid rgba(16,185,129,0.3);
                                      color:#10b981;border-radius:8px;font-size:1rem;font-weight:700;
                                      font-family:inherit;outline:none;">
                    </div>

                    <div>
                        <label style="display:block;margin-bottom:5px;color:#94a3b8;font-size:0.78rem;font-weight:600;">
                            OBSERVACIÓN (opcional)
                        </label>
                        <textarea id="swal-obs-cuadre" rows="2"
                                  placeholder="Ej: Recibido completo, faltó factura 737xxx..."
                                  style="width:100%;padding:8px 12px;background:#0f172a;
                                         border:1px solid rgba(255,255,255,0.08);color:#f8fafc;
                                         border-radius:8px;font-family:inherit;font-size:0.85rem;
                                         resize:vertical;outline:none;"></textarea>
                    </div>
                </div>`,
            showCancelButton: true,
            confirmButtonText: '<i class="ri-checkbox-circle-line"></i> Confirmar Cuadre',
            cancelButtonText:  'Cancelar',
            confirmButtonColor: '#10b981',
            background: '#1e293b', color: '#fff',
            focusConfirm: false,
            preConfirm: () => {
                const valStr  = document.getElementById('swal-valor-cuadre')?.value || '';
                const obs     = document.getElementById('swal-obs-cuadre')?.value?.trim() || '';
                const valNum  = parseFloat(valStr.replace(/[^0-9]/g, '')) || 0;
                if (!valStr.trim()) {
                    Swal.showValidationMessage('Ingresa el valor recibido para confirmar el cuadre');
                    return false;
                }
                return { valorRecibido: valNum, observacion: obs };
            },
        });

        if (!isConfirmed || !formValues) return;

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
        _renderKanban(PL_CACHE);
        _renderTabla(PL_CACHE);
        await _actualizarKPIs();

        Swal.fire({
            icon: 'success',
            title: '✅ Planilla Cuadrada',
            html: `<strong>${planilla.no_planilla}</strong> cuadrada correctamente.<br>
                   <span style="color:#10b981;font-weight:700;">
                       ${moneyFmtC2.format(formValues.valorRecibido)}
                   </span> recibidos.
                   ${formValues.observacion ? `<br><small style="color:#94a3b8;">${formValues.observacion}</small>` : ''}`,
            timer: 2500, showConfirmButton: false,
            background: '#1e293b', color: '#fff'
        });
        return;
    }

    // ── Flujo normal para los demás estados ────────────────
    const confirmStd = await Swal.fire({
        title: `¿Cambiar a ${nuevoEstado}?`,
        html: `Planilla <strong>${planilla.no_planilla}</strong> pasará a estado <strong style="color:${meta.color}">${nuevoEstado}</strong>`,
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: 'Sí, cambiar',
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
        text: `Planilla ${planilla.no_planilla} → ${nuevoEstado}`,
        timer: 1800, showConfirmButton: false,
        background: '#1e293b', color: '#fff'
    });
}

// ── Guardar programación (placa/conductor desde modal) ─────
async function guardarProgramacionPlanilla() {
    if (!PL_ID_MODAL) return;
    const placa     = document.getElementById('pl-modal-placa')?.value?.toUpperCase().trim() || '';
    const conductor = document.getElementById('pl-modal-conductor')?.value?.trim() || '';

    if (!placa) {
        Swal.fire({ icon:'warning', title:'Placa requerida', text:'Ingresa la placa del vehículo asignado.', background:'#1e293b', color:'#fff' });
        return;
    }

    // Buscar conductor en flota si no fue ingresado
    let conductorFinal = conductor;
    if (!conductorFinal) {
        const res = await SupabaseClient.vehiculos.getByPlaca(placa, window.CURRENT_RAZON_SOCIAL);
        conductorFinal = res?.data?.conductor || '';
    }

    const result = await SupabaseClient.planillas.updateEstado(PL_ID_MODAL, 'POR DESPACHAR', {
        placa:            placa,
        conductor:        conductorFinal,
        fecha_programacion: new Date().toISOString().split('T')[0],
        programado_por:   window.CURRENT_SESSION?.profile?.nombre || 'Sistema',
    });

    if (!result.success) {
        Swal.fire({ icon:'error', title:'Error', text:'No se pudo guardar la programación.', background:'#1e293b', color:'#fff' });
        return;
    }

    // Actualizar cache
    const planilla = PL_CACHE.find(p => p.id === PL_ID_MODAL);
    if (planilla) {
        planilla.placa     = placa;
        planilla.conductor = conductorFinal;
        planilla.estado    = 'POR DESPACHAR';
    }

    cerrarModalPlanilla();
    _renderKanban(PL_CACHE);
    _renderTabla(PL_CACHE);
    await _actualizarKPIs();

    Swal.fire({
        icon: 'success', title: '¡Programado!',
        html: `Planilla asignada a <strong>${placa}</strong>. Estado: <strong>POR DESPACHAR</strong>`,
        timer: 2000, showConfirmButton: false, background: '#1e293b', color: '#fff'
    });
}

// ── Eliminar planilla ──────────────────────────────────────
async function eliminarPlanillaUI(planillaId, noPlanilla) {
    const confirm = await Swal.fire({
        title: '¿Eliminar planilla?',
        html: `Se eliminará la planilla <strong>${noPlanilla}</strong> y todas sus facturas.<br><small style="color:#94a3b8">Esta acción no se puede deshacer.</small>`,
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

// ── Facturas Sueltas ───────────────────────────────────────
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
            <td>${f.fecha_entrega || '—'}</td>
            <td>${f.zona || '—'}</td>
            <td>${f.planilla?.no_planilla || '—'}</td>
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

// ── Carga de Excel ─────────────────────────────────────────
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
        Swal.fire({ icon:'warning', title:'Archivo inválido', text:'Solo se aceptan archivos .xlsx, .xls o .csv', background:'#1e293b', color:'#fff' });
        return;
    }

    Swal.fire({ title:'Procesando archivo...', allowOutsideClick:false, didOpen:()=>Swal.showLoading(), background:'#1e293b', color:'#fff' });

    try {
        const buffer  = await file.arrayBuffer();
        const wb      = XLSX.read(buffer, { type: 'array', cellDates: true });
        const sheet   = wb.Sheets[wb.SheetNames[0]];
        const rows    = XLSX.utils.sheet_to_json(sheet, { defval: '' });

        if (!rows.length) throw new Error('El archivo está vacío o no tiene datos válidos.');

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
                <td>${g.fecha || '—'}</td>
                <td>${g.zona || '—'}</td>
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
        title: errores === 0 ? '¡Carga completada!' : 'Carga con errores',
        html: `<strong style="color:#10b981">${exitosas}</strong> planillas cargadas correctamente.
               ${errores > 0 ? `<br><strong style="color:#ef4444">${errores}</strong> con errores (ver consola).` : ''}`,
        background: '#1e293b', color: '#fff'
    });
}

// ── Helpers ────────────────────────────────────────────────
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

// ── Exponer globalmente ────────────────────────────────────
window.inicializarModuloPlanillas = inicializarModuloPlanillas;
window.cargarPlanillas            = cargarPlanillas;
window.abrirDetallePlanilla       = abrirDetallePlanilla;
window.cerrarModalPlanilla        = cerrarModalPlanilla;
window.cambiarEstadoPlanilla      = cambiarEstadoPlanilla;
window.eliminarPlanillaUI         = eliminarPlanillaUI;
window.toggleFacturaUI            = toggleFacturaUI;
window.reasignarFactura           = reasignarFactura;
window.guardarProgramacionPlanilla= guardarProgramacionPlanilla;
window.procesarArchivoExcel       = procesarArchivoExcel;
window.confirmarCargaExcel        = confirmarCargaExcel;
window.cancelarCargaExcel         = cancelarCargaExcel;
window.setupDropZonaPlanillas     = setupDropZonaPlanillas;

// ==========================================================
// 🔀 INICIALIZADORES POR TAB SEPARADO
// ==========================================================

// Tab: Carga de Planillas
async function inicializarModuloCarga() {
    PL_ROLE = (window.CURRENT_ROLE || 'cargador').toLowerCase();
    setupDropZonaPlanillas();
    await cargarPlanillasCarga();
}

// Tab: Programación
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

    const fFecha = document.getElementById('pl-filtro-fecha');
    if (fFecha && !fFecha.value) fFecha.value = hoy;

    // Pre-llenar la fecha del resumen de cuadre con hoy
    const fCuadre = document.getElementById('pl-cuadre-fecha');
    if (fCuadre && !fCuadre.value) fCuadre.value = hoy;

    // Bind filtros del kanban
    document.getElementById('pl-filtro-estado')?.addEventListener('change',    cargarPlanillas);
    document.getElementById('pl-filtro-fecha')?.addEventListener('change',     cargarPlanillas);
    document.getElementById('pl-filtro-proveedor')?.addEventListener('change', cargarPlanillas);
    document.getElementById('pl-filtro-busqueda')?.addEventListener('input',   _debounce(cargarPlanillas, 350));

    await cargarPlanillas();

    // Si es cajera, cargar también el resumen del día automáticamente
    if (['cajera_plan', 'admin'].includes(PL_ROLE)) {
        await cargarResumenCuadre();
    }
}

// ── Carga del historial en tab "Carga Planillas" ──────────
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
            <td>${p.fecha || '—'}</td>
            <td>${p.zona || '—'}</td>
            <td>${p.proveedor || '—'}</td>
            <td style="text-align:center;">${p.total_facturas || 0}</td>
            <td class="price-cell">${moneyFmtL.format(p.valor_total || 0)}</td>
            <td><span class="pl-estado-chip" style="background:${meta.bg};color:${meta.color};border-color:${meta.color}40;font-size:0.75rem;">
                <i class="${meta.icon}"></i> ${meta.label}
            </span></td>
            <td style="text-align:center;">
                ${canDel ? `<button class="btn-icon delete" onclick="eliminarPlanillaUI('${p.id}','${p.no_planilla}')" title="Eliminar">
                    <i class="ri-delete-bin-line"></i></button>` : '—'}
            </td>
        </tr>`;
    }).join('');
}

// ── Carga de tabla en tab "Programación" ──────────────────
async function cargarPlanillasProgramacion() {
    const tbody = document.getElementById('pl-prog-tabla-body');
    if (!tbody) return;
    tbody.innerHTML = `<tr><td colspan="9" style="text-align:center;padding:20px;color:var(--text-muted);">
        <i class="ri-loader-4-line rotate"></i> Cargando...</td></tr>`;

    const filtros = {
        estado:    document.getElementById('pl-prog-filtro-estado')?.value    || '',
        fecha:     document.getElementById('pl-prog-filtro-fecha')?.value     || '',
        proveedor: document.getElementById('pl-prog-filtro-proveedor')?.value || '',
    };
    Object.keys(filtros).forEach(k => { if (!filtros[k]) delete filtros[k]; });

    const result = await SupabaseClient.planillas.getAll(filtros);
    if (!result.success) { tbody.innerHTML = `<tr><td colspan="9" style="text-align:center;color:#ef4444;">Error al cargar</td></tr>`; return; }

    // Actualizar KPIs rápidos de programación
    const sinProg  = result.data.filter(p => p.estado === 'TRANSITORIA').length;
    const conProg  = result.data.filter(p => p.estado !== 'TRANSITORIA').length;
    const elSin = document.getElementById('pl-prog-kpi-transitoria');
    const elCon = document.getElementById('pl-prog-kpi-programadas');
    if (elSin) elSin.textContent = sinProg;
    if (elCon) elCon.textContent = conProg;

    // Guardar en cache global
    PL_CACHE = result.data;

    if (result.data.length === 0) {
        tbody.innerHTML = `<tr><td colspan="9" style="text-align:center;padding:24px;color:var(--text-muted);">Sin resultados para los filtros aplicados</td></tr>`;
        return;
    }

    const moneyFmtP = new Intl.NumberFormat('es-CO', { style: 'currency', currency: 'COP', minimumFractionDigits: 0 });
    tbody.innerHTML = result.data.map(p => {
        const meta = PL_ESTADO_META[p.estado] || PL_ESTADO_META['TRANSITORIA'];
        const canProg = ['admin','programador'].includes(PL_ROLE);
        return `<tr>
            <td><span class="badge-plate" style="font-size:0.8rem;">${p.no_planilla}</span></td>
            <td>${p.fecha || '—'}</td>
            <td>${p.zona || '—'}</td>
            <td>${p.proveedor || '—'}</td>
            <td style="text-align:center;">${p.total_facturas || 0}</td>
            <td class="price-cell">${moneyFmtP.format(p.valor_total || 0)}</td>
            <td>${p.placa ? `<span class="badge-plate" style="font-size:0.75rem;">${p.placa}</span>` : '<span style="color:var(--text-muted);font-size:0.82rem;">Sin asignar</span>'}</td>
            <td><span class="pl-estado-chip" style="background:${meta.bg};color:${meta.color};border-color:${meta.color}40;font-size:0.75rem;">
                <i class="${meta.icon}"></i> ${meta.label}
            </span></td>
            <td style="text-align:center;">
                ${canProg ? `<button class="pl-btn-action pl-btn-detail" onclick="abrirDetallePlanilla('${p.id}')" title="Ver y programar">
                    <i class="ri-edit-line"></i> Programar
                </button>` : `<button class="pl-btn-action pl-btn-detail" onclick="abrirDetallePlanilla('${p.id}')">
                    <i class="ri-eye-line"></i>
                </button>`}
            </td>
        </tr>`;
    }).join('');
}

// Exponer las nuevas funciones globalmente
window.inicializarModuloCarga         = inicializarModuloCarga;
window.inicializarModuloProgramacion  = inicializarModuloProgramacion;
window.inicializarModuloEstado        = inicializarModuloEstado;
window.cargarPlanillasCarga           = cargarPlanillasCarga;
window.cargarPlanillasProgramacion    = cargarPlanillasProgramacion;

// ==========================================================
// ✅ MÓDULO DE APROBACIONES (solo admin)
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
                    title="Aprobar → crear flete">
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
            <td><span class="badge-plate">${p.placa || '—'}</span></td>
            <td style="font-size:0.82rem;">${p.contratista || '—'}</td>
            <td>${p.fecha || '—'}</td>
            <td style="font-size:0.8rem;">${p.zona || '—'}</td>
            <td style="font-size:0.82rem;">${p.poblacion || '—'}</td>
            <td><span style="background:rgba(59,130,246,0.1);color:var(--primary);border:1px solid rgba(59,130,246,0.25);
                             padding:2px 8px;border-radius:5px;font-family:monospace;font-size:0.8rem;font-weight:700;">
                ${p.no_planilla || '—'}</span></td>
            <td style="text-align:center;">${p.no_pedidos || 0}</td>
            <td class="price-cell">${moneyFmt2.format(p.valor_ruta || 0)}</td>
            <td class="price-cell">${moneyFmt2.format(p.precio || 0)}</td>
            <td style="font-size:0.78rem;color:var(--text-muted);">${p.programado_por || '—'}</td>
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

// ── Aprobar ────────────────────────────────────────────────
async function aprobarProgramacionAdmin(progId) {
    const fila = document.getElementById(`apr-row-${progId}`);
    const placa = fila?.querySelector('.badge-plate')?.textContent || '';

    const c = await Swal.fire({
        title: '¿Aprobar programación?',
        html: `Se creará el flete para <strong>${placa}</strong>.<br>
               <small style="color:#94a3b8;">Esta acción no se puede deshacer.</small>`,
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: '<i class="ri-checkbox-circle-line"></i> Sí, aprobar',
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
    // Refrescar listado de fletes si está visible
    if (typeof listarFletes === 'function') listarFletes(true);

    Swal.fire({
        icon: 'success',
        title: '¡Flete creado!',
        html: `Programación de <strong>${placa}</strong> aprobada.<br>
               El flete ya está registrado en el sistema.`,
        timer: 2500, showConfirmButton: false,
        background: '#1e293b', color: '#fff'
    });
}

// ── Rechazar ───────────────────────────────────────────────
async function rechazarProgramacionAdmin(progId, placa, noPlanilla) {
    const { value: motivo, isConfirmed } = await Swal.fire({
        title: 'Rechazar programación',
        html: `<p style="color:#94a3b8;font-size:0.88rem;margin-bottom:12px;">
                   Placa: <strong style="color:#fff;">${placa}</strong> &nbsp;·&nbsp;
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
        icon: 'info', title: 'Programación rechazada',
        text: `Se notificará al programador.`,
        timer: 1800, showConfirmButton: false,
        background: '#1e293b', color: '#fff'
    });
}

// ── Ver detalle completo en modal ──────────────────────────
async function verDetalleProgramacion(progId) {
    // Buscar en los datos ya cargados (evitar nueva petición)
    const allResult = await SupabaseClient.programaciones.getAll({});
    const p = allResult.data?.find(x => x.id === progId);
    if (!p) return;

    const moneyFmtD = new Intl.NumberFormat('es-CO', { style:'currency', currency:'COP', minimumFractionDigits:0 });
    const meta = APR_ESTADO_META[p.estado] || APR_ESTADO_META['PENDIENTE'];

    await Swal.fire({
        title: `Programación · ${p.placa}`,
        html: `
        <div style="text-align:left;font-size:0.85rem;line-height:1.8;">
            <div style="display:grid;grid-template-columns:1fr 1fr;gap:8px;margin-bottom:12px;padding:12px;background:rgba(255,255,255,0.04);border-radius:8px;">
                <div><span style="color:#94a3b8;">Placa:</span> <strong>${p.placa}</strong></div>
                <div><span style="color:#94a3b8;">Conductor:</span> ${p.contratista || '—'}</div>
                <div><span style="color:#94a3b8;">Fecha:</span> ${p.fecha}</div>
                <div><span style="color:#94a3b8;">Día:</span> ${p.dia || '—'}</div>
                <div><span style="color:#94a3b8;">Proveedor:</span> ${p.proveedor}</div>
                <div><span style="color:#94a3b8;">Zona:</span> ${p.zona}</div>
                <div><span style="color:#94a3b8;">Población:</span> ${p.poblacion}</div>
                <div><span style="color:#94a3b8;">Auxiliar:</span> ${p.auxiliares || '—'}</div>
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
                ${moneyFmtD.format(p.valor_adicional_negociacion)} — ${p.razon_adicional_negociacion}
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
                Programado por: ${p.programado_por || '—'}
                ${p.revisado_por ? ` · Revisado por: ${p.revisado_por}` : ''}
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
// 📊 RESUMEN DIARIO DE CUADRE
// ==========================================================

async function cargarResumenCuadre() {
    // Leer fecha — si está vacía usar hoy
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
                <td style="font-size:0.82rem;">${p.zona || '—'}</td>
                <td>${p.placa ? `<span class="badge-plate" style="font-size:0.7rem;">${p.placa}</span>` : '<span style="color:var(--text-muted)">—</span>'}</td>
                <td style="font-size:0.82rem;color:var(--text-muted);">${p.conductor || '—'}</td>
                <td style="text-align:right; font-weight:600;">${fmtR.format(esperado)}</td>
                <td style="text-align:right; font-weight:700; color:#10b981;">${fmtR.format(recibido)}</td>
                <td style="text-align:right; font-weight:700; color:${diffColor};">${diffStr}</td>
                <td style="font-size:0.78rem; color:var(--text-muted);">${p.cuadrado_por || '—'}</td>
                <td style="font-size:0.78rem; color:var(--text-muted); font-style:italic; max-width:160px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"
                    title="${(p.obs_cuadre || '').replace(/"/g,'&quot;')}">${p.obs_cuadre || '—'}</td>
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
        'Observación':     p.obs_cuadre || '',
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
