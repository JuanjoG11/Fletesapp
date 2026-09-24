/* ==========================================================
   MÓDULO: CUADRE DE CAJA DIARIO — VISTA TABLA TIPO EXCEL
   Archivo: js/modules/cuadre_caja.js

   Funcionalidad:
   - Tabla inline editable con todas las columnas del Excel
   - Navegación con Tab entre celdas
   - Cálculo automático de TOTAL y DIF en tiempo real
   - Guardado en lote (todas las planillas en 1 clic)
   - Auto-guardado cada 60 segundos
   - PDF igual al formato TYM
   - Totales de columna en pie de tabla
   ========================================================== */

'use strict';

// ── Estado local del módulo ──────────────────────────────────
var CC = {
    data:      [],        // planillas cargadas
    cambios:   {},        // { planillaId: { campo: valor, ... } }
    fecha:     '',
    autoSaveTimer: null,
    guardando: false,
};

// ── Formateo ────────────────────────────────────────────────
var _fmtCC = new Intl.NumberFormat('es-CO', { minimumFractionDigits: 0, maximumFractionDigits: 0 });
var _fmtCC2 = new Intl.NumberFormat('es-CO', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
function _n(v)   { var s=(String(v||'')).replace(/\./g,'').replace(',','.').replace(/[^0-9.-]/g,''); return parseFloat(s)||0; }
function _fmt(v) { return _n(v) === 0 ? '' : _fmtCC2.format(_n(v)); }
function _fmtTotal(v) { return _fmtCC2.format(_n(v)); }

// ── Columnas de desglose (orden igual al Excel) ──────────────
var CC_COLS = [
    { key: 'cuadre_planilla_transitoria', label: 'PLAN.\nTRANS.',  tipo: 'texto',  w: 60  },
    { key: 'cuadre_fact_transitoria',     label: 'FACT\nTRANS.',   tipo: 'texto',  w: 60  },
    { key: 'cuadre_devolucion',           label: 'DEVOLU-\nCIÓN',  tipo: 'num',    w: 72  },
    { key: 'cuadre_vales',                label: 'VALES',           tipo: 'num',    w: 65  },
    { key: 'cuadre_descuento_nomina',     label: 'DESC.\nNÓMINA',  tipo: 'num',    w: 68  },
    { key: 'cuadre_consignaciones',       label: 'CONSIG-\nNACIONES', tipo: 'num', w: 80  },
    { key: 'cuadre_consignaciones_alpina',label: 'CONSIG.\nALPINA', tipo: 'num',   w: 72  },
    { key: 'cuadre_no_consignaciones',    label: '# CONSIG.',       tipo: 'texto', w: 55  },
    { key: 'cuadre_efectivo',             label: 'EFECTIVO',         tipo: 'num',   w: 72  },
    { key: 'cuadre_monedas',              label: 'MONEDAS',          tipo: 'num',   w: 65  },
    { key: 'cuadre_credito',              label: 'CRÉDITO',          tipo: 'num',   w: 65  },
    { key: 'cuadre_sobrante_caja',        label: 'SOBRANTE\nCAJA',  tipo: 'num',   w: 68  },
    { key: 'cuadre_retefuente',           label: 'RETE-\nFUENTE',   tipo: 'num',   w: 65  },
    { key: 'cuadre_ajuste_peso',          label: 'AJ.\nPESO',       tipo: 'num',   w: 58  },
    { key: 'cuadre_ajuste_peso_ing',      label: 'AJ.PESO\nING.',   tipo: 'num',   w: 62  },
    { key: 'cuadre_otros_gastos',         label: 'OTROS\nGASTOS',   tipo: 'num',   w: 65  },
];

// ── Calcular TOTAL de una fila ───────────────────────────────
function _calcTotal(p) {
    return _n(p.cuadre_devolucion)
         + _n(p.cuadre_consignaciones)
         + _n(p.cuadre_consignaciones_alpina)
         + _n(p.cuadre_efectivo)
         + _n(p.cuadre_monedas)
         + _n(p.cuadre_credito)
         + _n(p.cuadre_sobrante_caja)
         + _n(p.cuadre_retefuente)
         + _n(p.cuadre_ajuste_peso)
         + _n(p.cuadre_ajuste_peso_ing)
         + _n(p.cuadre_otros_gastos);
}

// ── Inicializar módulo ────────────────────────────────────────
function inicializarCuadreCaja() {
    var fechaEl = document.getElementById('pl-cajera-fecha');
    if (fechaEl && !fechaEl.value) {
        fechaEl.value = new Date().toISOString().split('T')[0];
    }
    CC.fecha = (fechaEl && fechaEl.value) || new Date().toISOString().split('T')[0];
    // Arrancar siempre en vista Tarjetas
    if (typeof ccCambiarVista === 'function') ccCambiarVista('cards');
}
window.inicializarCuadreCaja = inicializarCuadreCaja;

// ── Cargar datos y renderizar tabla ──────────────────────────
async function cargarTablaCuadre() {
    CC.fecha = document.getElementById('pl-cajera-fecha')?.value
               || new Date().toISOString().split('T')[0];

    var wrap = document.getElementById('cc-tabla-wrap');
    if (!wrap) return;

    wrap.innerHTML = '<div style="text-align:center;padding:60px 20px;color:var(--text-muted);">'
        + '<i class="ri-loader-4-line rotate" style="font-size:2.5rem;"></i>'
        + '<p style="margin-top:12px;">Cargando planillas del ' + CC.fecha + '…</p></div>';

    // Traer DESPACHADAS y CUADRADAS del día
    var [resDes, resCuad] = await Promise.all([
        SupabaseClient.planillas.getAll({ estado: 'DESPACHADA', fecha: CC.fecha }),
        SupabaseClient.planillas.getAll({ estado: 'CUADRADA',   fecha: CC.fecha }),
    ]);

    var despachadas = resDes.success  ? (resDes.data  || []) : [];
    var cuadradas   = resCuad.success ? (resCuad.data || []) : [];
    CC.data    = [...despachadas, ...cuadradas];
    CC.cambios = {};

    // Actualizar también el PL_CACHE de planillas.js
    if (typeof PL_CACHE !== 'undefined') {
        window.PL_CACHE = CC.data;
    }

    if (!CC.data.length) {
        wrap.innerHTML = '<div style="text-align:center;padding:60px 20px;color:var(--text-muted);">'
            + '<i class="ri-inbox-line" style="font-size:3rem;opacity:0.35;"></i>'
            + '<p style="margin-top:14px;font-size:1rem;">Sin planillas para el ' + CC.fecha + '</p></div>';
        _actualizarKpisCuadre();
        _toggleBotonesExportCuadre(false);
        return;
    }

    _renderTabla();
    _actualizarKpisCuadre();
    _iniciarAutoSave();
    _toggleBotonesExportCuadre(true);
}
window.cargarTablaCuadre = cargarTablaCuadre;

// ── Renderizar tabla ─────────────────────────────────────────
function _renderTabla() {
    var wrap = document.getElementById('cc-tabla-wrap');
    if (!wrap) return;

    var meses = ['ENERO','FEBRERO','MARZO','ABRIL','MAYO','JUNIO',
                 'JULIO','AGOSTO','SEPTIEMBRE','OCTUBRE','NOVIEMBRE','DICIEMBRE'];
    var fechaObj = new Date(CC.fecha + 'T12:00:00');
    var mesLabel = meses[fechaObj.getMonth()];

    // ── Estilos de la tabla ──────────────────────────────────
    var thStyle  = 'padding:5px 4px;font-size:0.62rem;font-weight:700;text-transform:uppercase;'
                 + 'background:#0f2744;color:#93c5fd;border:1px solid #1e3a5f;white-space:pre-line;'
                 + 'text-align:center;vertical-align:middle;line-height:1.2;position:sticky;top:0;z-index:2;';
    var tdFixStyle = 'padding:4px 6px;font-size:0.75rem;border:1px solid #1e3a5f;white-space:nowrap;'
                   + 'background:#0d1e36;';
    var inputStyle = 'width:100%;padding:3px 5px;background:transparent;border:none;outline:none;'
                   + 'color:#f8fafc;font-family:monospace;font-size:0.78rem;text-align:right;'
                   + 'box-sizing:border-box;';
    var inputTextStyle = inputStyle.replace('text-align:right','text-align:center');

    // ── Construir cabecera ───────────────────────────────────
    var thead = '<thead><tr>'
        + '<th style="' + thStyle + 'width:150px;min-width:150px;">AUXILIAR TAT</th>'
        + '<th style="' + thStyle + 'width:60px;">RUTA</th>'
        + '<th style="' + thStyle + 'width:90px;"># PLANILLA</th>'
        + '<th style="' + thStyle + 'width:35px;">' + mesLabel.substring(0,3) + '</th>'
        + '<th style="' + thStyle + 'width:55px;">CUADRE</th>'
        + '<th style="' + thStyle + 'width:90px;color:#34d399;">TOTAL\nCUADRE</th>';

    CC_COLS.forEach(function(col) {
        thead += '<th style="' + thStyle + 'width:' + col.w + 'px;min-width:' + col.w + 'px;">'
               + col.label + '</th>';
    });

    thead += '<th style="' + thStyle + 'width:90px;color:#fbbf24;">TOTAL</th>'
           + '<th style="' + thStyle + 'width:70px;color:#f87171;">DIF</th>'
           + '</tr></thead>';

    // ── Construir filas ──────────────────────────────────────
    var tbody = '<tbody>';
    CC.data.forEach(function(p, idx) {
        var esCuadrada = p.estado === 'CUADRADA';
        var rowBg      = esCuadrada ? 'background:rgba(16,185,129,0.07);' : '';
        var totalFila  = _calcTotal(p);
        var cuadre     = _n(p.valor_cuadrado);
        var dif        = cuadre - totalFila;
        var difColor   = Math.abs(dif) < 1 ? '#10b981' : dif > 0 ? '#3b82f6' : '#ef4444';
        var auxNombre  = p.auxiliares ? p.auxiliares.split(',')[0].trim() : (p.conductor || '');

        tbody += '<tr id="cc-row-' + p.id + '" data-id="' + p.id + '" style="' + rowBg + '">';

        // Columnas fijas
        tbody += '<td style="' + tdFixStyle + 'max-width:150px;overflow:hidden;text-overflow:ellipsis;" title="' + auxNombre + '">'
               + '<span style="font-size:0.75rem;font-weight:600;color:#e2e8f0;">' + auxNombre + '</span></td>';
        tbody += '<td style="' + tdFixStyle + 'text-align:center;font-family:monospace;color:#94a3b8;">' + (p.zona || '') + '</td>';
        tbody += '<td style="' + tdFixStyle + 'text-align:center;font-family:monospace;font-weight:700;color:#f8fafc;">' + (p.no_planilla || '') + '</td>';
        tbody += '<td style="' + tdFixStyle + 'text-align:center;color:#94a3b8;font-size:0.72rem;">' + mesLabel.substring(0,3) + '</td>';
        tbody += '<td style="' + tdFixStyle + 'text-align:center;font-size:0.72rem;color:#94a3b8;">'
               + (p.cuadre_tipo || (esCuadrada ? 'MANUAL' : '—')) + '</td>';

        // TOTAL CUADRE (editable — valor_cuadrado)
        tbody += '<td style="' + tdFixStyle + 'background:rgba(16,185,129,0.12);padding:0;" class="cc-cell">'
               + '<input type="text" class="cc-input" data-id="' + p.id + '" data-key="valor_cuadrado" '
               + 'data-tipo="num" data-idx="' + idx + '" data-col="0" '
               + 'value="' + (_n(p.valor_cuadrado) === 0 ? '' : _fmtCC2.format(_n(p.valor_cuadrado))) + '" '
               + 'placeholder="0" style="' + inputStyle + 'color:#34d399;font-weight:700;font-size:0.82rem;">'
               + '</td>';

        // Columnas de desglose
        CC_COLS.forEach(function(col, ci) {
            var val = p[col.key];
            var displayVal = col.tipo === 'num'
                ? (_n(val) === 0 ? '' : _fmtCC2.format(_n(val)))
                : (val || '');
            tbody += '<td style="' + tdFixStyle + 'padding:0;" class="cc-cell">'
                   + '<input type="text" class="cc-input" data-id="' + p.id + '" data-key="' + col.key + '" '
                   + 'data-tipo="' + col.tipo + '" data-idx="' + idx + '" data-col="' + (ci + 1) + '" '
                   + 'value="' + displayVal + '" placeholder="' + (col.tipo === 'num' ? '0' : '') + '" '
                   + 'style="' + (col.tipo === 'num' ? inputStyle : inputTextStyle) + '">'
                   + '</td>';
        });

        // TOTAL calculado (solo lectura)
        tbody += '<td id="cc-total-' + p.id + '" style="' + tdFixStyle
               + 'text-align:right;font-weight:700;color:#fbbf24;font-family:monospace;">'
               + (totalFila === 0 ? '' : _fmtTotal(totalFila)) + '</td>';

        // DIF (solo lectura)
        tbody += '<td id="cc-dif-' + p.id + '" style="' + tdFixStyle
               + 'text-align:right;font-weight:700;font-family:monospace;color:' + difColor + ';">'
               + (cuadre === 0 ? '' : (Math.abs(dif) < 1 ? '0' : _fmtCC2.format(dif))) + '</td>';

        tbody += '</tr>';
    });

    // Fila de totales
    tbody += _filaTotales();
    tbody += '</tbody>';

    wrap.innerHTML = '<div style="overflow-x:auto;border-radius:10px;border:1px solid #1e3a5f;">'
                   + '<table id="cc-tabla" style="border-collapse:collapse;width:100%;min-width:1400px;">'
                   + thead + tbody
                   + '</table></div>';

    _bindEventos();
}

// ── Fila de totales ─────────────────────────────────────────
function _filaTotales() {
    var totCuadre = CC.data.reduce(function(s,p){ return s+_n(p.valor_cuadrado); }, 0);
    var totales   = {};
    CC_COLS.forEach(function(col) {
        totales[col.key] = col.tipo === 'num'
            ? CC.data.reduce(function(s,p){ return s+_n(p[col.key]); }, 0)
            : '';
    });
    var totTotal = CC.data.reduce(function(s,p){ return s+_calcTotal(p); }, 0);
    var totDif   = totCuadre - totTotal;
    var difColor = Math.abs(totDif) < 1 ? '#10b981' : totDif > 0 ? '#3b82f6' : '#ef4444';

    var tdT = 'padding:5px 6px;font-size:0.72rem;font-weight:800;border:1px solid #1e3a5f;'
            + 'background:#0a1628;white-space:nowrap;';

    var html = '<tr id="cc-row-totales" style="border-top:2px solid #3b82f6;">'
        + '<td colspan="5" style="' + tdT + 'color:#60a5fa;text-align:right;letter-spacing:0.5px;'
        + 'text-transform:uppercase;font-size:0.68rem;">TOTALES</td>'
        + '<td style="' + tdT + 'text-align:right;color:#34d399;font-family:monospace;">'
        + (totCuadre === 0 ? '' : _fmtTotal(totCuadre)) + '</td>';

    CC_COLS.forEach(function(col) {
        var v = totales[col.key];
        html += '<td id="cc-tot-' + col.key + '" style="' + tdT
              + 'text-align:' + (col.tipo === 'num' ? 'right' : 'center')
              + ';color:#94a3b8;font-family:monospace;">'
              + (col.tipo === 'num' && v !== 0 ? _fmtTotal(v) : '') + '</td>';
    });

    html += '<td id="cc-tot-total" style="' + tdT + 'text-align:right;color:#fbbf24;font-family:monospace;">'
          + (totTotal === 0 ? '' : _fmtTotal(totTotal)) + '</td>';
    html += '<td id="cc-tot-dif" style="' + tdT + 'text-align:right;font-family:monospace;color:' + difColor + ';">'
          + (totCuadre === 0 ? '' : (Math.abs(totDif) < 1 ? '0' : _fmtCC2.format(totDif))) + '</td>';
    html += '</tr>';
    return html;
}

// ── Bind eventos de inputs ───────────────────────────────────
function _bindEventos() {
    var tabla = document.getElementById('cc-tabla');
    if (!tabla) return;

    tabla.addEventListener('focusin', function(e) {
        if (e.target.classList.contains('cc-input')) {
            e.target.select();
            e.target.style.background = 'rgba(99,102,241,0.18)';
            e.target.style.outline    = '2px solid #6366f1';
        }
    });

    tabla.addEventListener('focusout', function(e) {
        if (e.target.classList.contains('cc-input')) {
            e.target.style.background = 'transparent';
            e.target.style.outline    = 'none';
            _procesarCambio(e.target, true); // true = formatear al salir
        }
    });

    tabla.addEventListener('input', function(e) {
        if (e.target.classList.contains('cc-input')) {
            _procesarCambio(e.target, false); // false = solo actualizar datos, NO reformatear
        }
    });

        // Tab / Shift+Tab y Enter para navegar entre celdas
    tabla.addEventListener('keydown', function(e) {
        if (!e.target.classList.contains('cc-input')) return;

        if (e.key === 'Tab' || e.key === 'Enter') {
            e.preventDefault();
            _procesarCambio(e.target, true);
            _navegarSiguiente(e.target, e.shiftKey);
        }
        if (e.key === 'Escape') { e.target.blur(); }

        // Flechas — navegar entre celdas en cualquier dirección
        if (e.key === 'ArrowRight') {
            e.preventDefault();
            _procesarCambio(e.target, true);
            _navegarSiguiente(e.target, false);
        }
        if (e.key === 'ArrowLeft') {
            e.preventDefault();
            _procesarCambio(e.target, true);
            _navegarSiguiente(e.target, true);
        }
        if (e.key === 'ArrowDown' || e.key === 'ArrowUp') {
            e.preventDefault();
            _procesarCambio(e.target, true);
            var idx  = parseInt(e.target.dataset.idx);
            var col  = parseInt(e.target.dataset.col);
            var next = idx + (e.key === 'ArrowDown' ? 1 : -1);
            var sel  = tabla.querySelector('.cc-input[data-idx="' + next + '"][data-col="' + col + '"]');
            if (sel) { sel.focus(); sel.select(); }
        }
    });
}

function _navegarSiguiente(input, reverse) {
    var inputs = Array.from(document.querySelectorAll('#cc-tabla .cc-input'));
    var ci     = inputs.indexOf(input);
    var next   = reverse ? ci - 1 : ci + 1;
    if (next >= 0 && next < inputs.length) {
        inputs[next].focus();
        inputs[next].select();
    }
}

// ── Procesar cambio en un input ──────────────────────────────
function _procesarCambio(input, formatear) {
    var id   = input.dataset.id;
    var key  = input.dataset.key;
    var tipo = input.dataset.tipo;
    var raw  = input.value.trim();

    // Parsear valor — limpiar puntos de miles y convertir coma decimal
    var valor = tipo === 'num' ? _n(raw) : raw;

    // Actualizar objeto en CC.data
    var p = CC.data.find(function(x){ return x.id === id; });
    if (!p) return;

    // Solo registrar cambio si el valor realmente difiere del guardado en DB
    var valorOriginal = tipo === 'num' ? _n(p[key]) : (p[key] || '');
    var valorNuevo    = valor;
    var cambioReal    = String(valorOriginal) !== String(valorNuevo);

    p[key] = valorNuevo;

    if (cambioReal) {
        if (!CC.cambios[id]) CC.cambios[id] = {};
        CC.cambios[id][key] = valorNuevo;
    }

    // Formatear display SOLO al salir del campo (focusout, Tab, Enter, flechas)
    // Durante la escritura (evento input) NO reformatear para no corromper la entrada
    if (formatear && tipo === 'num') {
        input.value = valorNuevo === 0 ? '' : _fmtCC2.format(valorNuevo);
    }

    // Recalcular TOTAL y DIF de la fila
    _recalcFila(id);

    // Recalcular totales de columna
    _recalcTotales();

    // Actualizar KPIs
    _actualizarKpisCuadre();

    // Marcar fila como modificada solo si hay cambio real
    if (cambioReal) {
        var row = document.getElementById('cc-row-' + id);
        if (row) {
            row.dataset.dirty    = '1';
            row.style.borderLeft = '3px solid #f59e0b';
        }
        _mostrarPendientes(true);
    }
}

function _recalcFila(id) {
    var p = CC.data.find(function(x){ return x.id === id; });
    if (!p) return;
    var totalFila = _calcTotal(p);
    var cuadre    = _n(p.valor_cuadrado);
    var dif       = cuadre - totalFila;
    var difColor  = Math.abs(dif) < 1 ? '#10b981' : dif > 0 ? '#3b82f6' : '#ef4444';

    var tdTot = document.getElementById('cc-total-' + id);
    var tdDif = document.getElementById('cc-dif-' + id);
    if (tdTot) tdTot.textContent = totalFila === 0 ? '' : _fmtTotal(totalFila);
    if (tdDif) {
        tdDif.textContent = cuadre === 0 ? '' : (Math.abs(dif) < 1 ? '0' : _fmtCC2.format(dif));
        tdDif.style.color = difColor;
    }
}

function _recalcTotales() {
    // Totales por columna
    CC_COLS.forEach(function(col) {
        if (col.tipo !== 'num') return;
        var tot = CC.data.reduce(function(s,p){ return s+_n(p[col.key]); }, 0);
        var el  = document.getElementById('cc-tot-' + col.key);
        if (el) el.textContent = tot === 0 ? '' : _fmtTotal(tot);
    });
    // Total general y dif global
    var totCuadre = CC.data.reduce(function(s,p){ return s+_n(p.valor_cuadrado); }, 0);
    var totTotal  = CC.data.reduce(function(s,p){ return s+_calcTotal(p); }, 0);
    var totDif    = totCuadre - totTotal;
    var difColor  = Math.abs(totDif) < 1 ? '#10b981' : totDif > 0 ? '#3b82f6' : '#ef4444';
    var elTot = document.getElementById('cc-tot-total');
    var elDif = document.getElementById('cc-tot-dif');
    if (elTot) elTot.textContent = totTotal === 0 ? '' : _fmtTotal(totTotal);
    if (elDif) {
        elDif.textContent = totCuadre === 0 ? '' : (Math.abs(totDif) < 1 ? '0' : _fmtCC2.format(totDif));
        elDif.style.color = difColor;
    }
}

// ── KPIs ─────────────────────────────────────────────────────
function _actualizarKpisCuadre() {
    var total    = CC.data.length;
    var cuadradas = CC.data.filter(function(p){ return _n(p.valor_cuadrado) > 0; }).length;
    var sumCuadre = CC.data.reduce(function(s,p){ return s+_n(p.valor_cuadrado); }, 0);
    var sumTotal  = CC.data.reduce(function(s,p){ return s+_calcTotal(p); }, 0);
    var difGlobal = sumCuadre - sumTotal;

    _setKpi('cc-kpi-total',    total);
    _setKpi('cc-kpi-cuadradas', cuadradas);
    _setKpi('cc-kpi-sum',      sumCuadre === 0 ? '—' : '$' + _fmtCC.format(sumCuadre));
    var difEl = document.getElementById('cc-kpi-dif');
    if (difEl) {
        difEl.textContent = sumCuadre === 0 ? '—' : (Math.abs(difGlobal) < 1 ? '✓ Cuadra' : _fmtCC2.format(difGlobal));
        difEl.style.color = Math.abs(difGlobal) < 1 ? '#10b981' : difGlobal > 0 ? '#3b82f6' : '#ef4444';
    }
}
function _setKpi(id, val) {
    var el = document.getElementById(id);
    if (el) el.textContent = val;
}

// ── Indicador de cambios pendientes ─────────────────────────
function _mostrarPendientes(hay) {
    var btn = document.getElementById('cc-btn-guardar');
    if (!btn) return;
    var cant = Object.keys(CC.cambios).length;
    btn.innerHTML = hay && cant > 0
        ? '<i class="ri-save-3-line"></i> Guardar todo (' + cant + ' cambios)'
        : '<i class="ri-save-3-line"></i> Guardar todo';
    btn.style.background = hay && cant > 0
        ? 'linear-gradient(135deg,#f59e0b,#d97706)'
        : 'linear-gradient(135deg,#10b981,#059669)';
}

// ── Guardar todo en lote ─────────────────────────────────────
async function guardarCuadreLote() {
    if (CC.guardando) return;
    var ids = Object.keys(CC.cambios);
    if (!ids.length) {
        Swal.fire({ icon: 'info', title: 'Sin cambios pendientes', timer: 1500,
            showConfirmButton: false, background: '#1e293b', color: '#fff' });
        return;
    }

    CC.guardando = true;
    var btn = document.getElementById('cc-btn-guardar');
    if (btn) { btn.disabled = true; btn.innerHTML = '<i class="ri-loader-4-line rotate"></i> Guardando…'; }

    var errores = 0;
    for (var i = 0; i < ids.length; i++) {
        var planillaId = ids[i];
        var cambio     = CC.cambios[planillaId];
        var p          = CC.data.find(function(x){ return x.id === planillaId; });
        if (!p) continue;

        // Si tiene valor_cuadrado > 0 lo marcamos CUADRADA, si no dejamos el estado actual
        var nuevoEstado = _n(p.valor_cuadrado) > 0 ? 'CUADRADA' : p.estado;

        // Añadir campos de auditoría si se está cuadrando
        if (nuevoEstado === 'CUADRADA' && !p.cuadrado_por) {
            cambio.cuadrado_por  = (window.CURRENT_SESSION && window.CURRENT_SESSION.profile
                                    && window.CURRENT_SESSION.profile.nombre) || 'Cajera';
            cambio.fecha_cuadre  = CC.fecha;
            cambio.cuadre_tipo   = 'MANUAL';
        }

        var res = await SupabaseClient.planillas.updateEstado(planillaId, nuevoEstado, cambio);
        if (res.success) {
            // Limpiar marca de fila
            var row = document.getElementById('cc-row-' + planillaId);
            if (row) { row.style.borderLeft = ''; delete row.dataset.dirty; }
            p.estado = nuevoEstado;
            delete CC.cambios[planillaId];
        } else {
            errores++;
            console.error('Error guardando planilla', planillaId, res.error);
        }
    }

    CC.guardando = false;
    if (btn) { btn.disabled = false; }
    _mostrarPendientes(false);

    if (errores === 0) {
        // Toast de éxito sutil
        var toast = Swal.mixin({ toast: true, position: 'top-end', showConfirmButton: false,
            timer: 2500, timerProgressBar: true, background: '#1e293b', color: '#fff' });
        toast.fire({ icon: 'success', title: '✅ Cuadre guardado correctamente' });
    } else {
        Swal.fire({ icon: 'warning', title: errores + ' error(es) al guardar',
            text: 'Revisa la consola para más detalle.',
            background: '#1e293b', color: '#fff' });
    }

    // Actualizar PL_CACHE
    if (typeof window.PL_CACHE !== 'undefined') window.PL_CACHE = CC.data;
}
window.guardarCuadreLote = guardarCuadreLote;

// ── Auto-save cada 60 segundos ────────────────────────────────
function _iniciarAutoSave() {
    if (CC.autoSaveTimer) clearInterval(CC.autoSaveTimer);
    CC.autoSaveTimer = setInterval(function() {
        if (Object.keys(CC.cambios).length > 0 && !CC.guardando) {
            guardarCuadreLote();
        }
    }, 60000);
}

// ── PDF ───────────────────────────────────────────────────────
function generarPDFCuadreCajaTabla() {
    if (!CC.data.length) {
        Swal.fire({ icon: 'warning', title: 'Sin datos',
            text: 'Carga primero las planillas del día.',
            background: '#1e293b', color: '#fff' });
        return;
    }
    // Reutiliza exportarPDFCuadreCaja del módulo planillas.js
    // pero inyecta los datos actuales
    window._CUADRE_DATA = CC.data;
    if (typeof exportarPDFCuadreCaja === 'function') {
        exportarPDFCuadreCaja();
    } else {
        Swal.fire({ icon: 'error', title: 'PDF no disponible',
            text: 'Recarga la página.', background: '#1e293b', color: '#fff' });
    }
}
window.generarPDFCuadreCajaTabla = generarPDFCuadreCajaTabla;

// ── Exportar Excel ────────────────────────────────────────────
function exportarExcelCuadre() {
    if (!CC.data.length || typeof XLSX === 'undefined') return;
    var meses = ['ENERO','FEBRERO','MARZO','ABRIL','MAYO','JUNIO',
                 'JULIO','AGOSTO','SEPTIEMBRE','OCTUBRE','NOVIEMBRE','DICIEMBRE'];
    var mes = meses[new Date(CC.fecha+'T12:00:00').getMonth()];

    var rows = CC.data.map(function(p) {
        var totalFila = _calcTotal(p);
        var dif = _n(p.valor_cuadrado) - totalFila;
        var obj = {
            'AUXILIAR TAT': p.auxiliares ? p.auxiliares.split(',')[0].trim() : (p.conductor||''),
            'RUTA':         p.zona || '',
            '# DE PLANILLA':p.no_planilla || '',
            [mes]:          '2',
            'CUADRE':       p.cuadre_tipo || 'MANUAL',
            'TOTAL CUADRE': _n(p.valor_cuadrado),
        };
        CC_COLS.forEach(function(col) {
            obj[col.label.replace(/\n/g,' ')] = col.tipo === 'num' ? _n(p[col.key]) : (p[col.key]||'');
        });
        obj['TOTAL'] = totalFila;
        obj['DIF']   = Math.abs(dif) < 1 ? 0 : dif;
        return obj;
    });

    var wb = XLSX.utils.book_new();
    var ws = XLSX.utils.json_to_sheet(rows);
    XLSX.utils.book_append_sheet(wb, ws, 'Cuadre');
    XLSX.writeFile(wb, 'Cuadre_Caja_TYM_' + CC.fecha + '.xlsx');
}
window.exportarExcelCuadre = exportarExcelCuadre;

// ── Mostrar/ocultar botones Excel y PDF según si hay datos ───
function _toggleBotonesExportCuadre(visible) {
    var d = visible ? 'flex' : 'none';
    var btnExcel = document.getElementById('cc-btn-excel');
    var btnPdf   = document.getElementById('cc-btn-pdf');
    if (btnExcel) btnExcel.style.display = d;
    if (btnPdf)   btnPdf.style.display   = d;
}
window._toggleBotonesExportCuadre = _toggleBotonesExportCuadre;
