/* ==========================================================
   MÓDULO: APIS EXTERNAS — ConsigControl + Devoluciones App
   Archivo: js/modules/external-apis.js

   Consulta dos proyectos Supabase externos para enriquecer
   el cuadre de caja con:
     • Consignaciones (ConsigControl): valor total + cantidad
     • Devoluciones (Devoluciones App): valor total

   Match por nombre de auxiliar (ilike) y fecha (DATE).
   ========================================================== */

'use strict';

// ── Credenciales ConsigControl ───────────────────────────────
var CONSIG_URL  = 'https://zlhbvmlylzxeovtkedws.supabase.co';
var CONSIG_KEY  = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpsaGJ2bWx5bHp4ZW92dGtlZHdzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzY5NzM2OTYsImV4cCI6MjA5MjU0OTY5Nn0.59M2v9iJhcG4BA7NMxQzmIEY1rzSSDu3l1ChzPXa7ZM';

// ── Credenciales Devoluciones App ────────────────────────────
var DEVOL_URL   = 'https://olrfvydwyndqquxmtuho.supabase.co';
var DEVOL_KEY   = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9scmZ2eWR3eW5kcXF1eG10dWhvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc5MDE3NDUsImV4cCI6MjA4MzQ3Nzc0NX0.ui2jMr8-rG-bsFgeSea6ZpYks6utVClVGcQLq9Ptxn8';

// ── Helper: fetch genérico a Supabase REST ───────────────────
/**
 * Hace GET a la API REST de un proyecto Supabase externo.
 * @param {string} baseUrl  - URL base del proyecto
 * @param {string} apiKey   - anon key
 * @param {string} endpoint - path + query string (ej: "consignaciones?select=valor&auxiliar_name=ilike.*JUAN*")
 * @returns {Promise<Array>} Array de filas o [] en caso de error
 */
async function _fetchExternal(baseUrl, apiKey, endpoint) {
    try {
        var url = baseUrl + '/rest/v1/' + endpoint;
        var res = await fetch(url, {
            headers: {
                'apikey':        apiKey,
                'Authorization': 'Bearer ' + apiKey,
                'Content-Type':  'application/json',
            }
        });
        if (!res.ok) {
            console.warn('[ExternalAPIs] HTTP ' + res.status + ' en ' + url);
            return [];
        }
        return await res.json();
    } catch (e) {
        console.error('[ExternalAPIs] Error de red:', e);
        return [];
    }
}

// ── ConsigControl ────────────────────────────────────────────
/**
 * Trae todas las consignaciones del día, agrupadas por auxiliar_name.
 * Devuelve un Map: nombreUPPER → { valor_total, cantidad }
 *
 * Lógica día por día:
 *   - estado 'Pendiente' → se filtra por created_at del día
 *     (la consignación fue enviada ese día y aún no se cuadra)
 *   - estado 'Cuadrado'  → se filtra por fecha_cuadrado del día
 *     (puede haber sido enviada otro día pero cuadrada hoy)
 *
 * Así el cuadre de cada fecha siempre refleja exactamente
 * lo que le corresponde a ese día.
 *
 * @param {string} fecha - 'YYYY-MM-DD'
 * @returns {Promise<Map<string, {valor_total:number, cantidad:number}>>}
 */
async function fetchConsignacionesDia(fecha) {
    // Colombia está en UTC-5. Supabase guarda en UTC.
    // Para cubrir todo el día colombiano: desde las 05:00 UTC hasta las 04:59 UTC del día siguiente.
    var desdeUTC = fecha + 'T05:00:00';          // medianoche Colombia = 05:00 UTC
    var hastaUTC = fecha + 'T28:59:59';          // Supabase acepta rangos amplios; usamos +1 día
    // Alternativa robusta: filtrar el DATE en UTC y aceptar ±1 día de margen
    var desdeDia = fecha + 'T00:00:00';
    var hastaDia = fecha + 'T23:59:59';

    // Pendientes del día: created_at dentro del día
    var endpointPendientes = 'consignaciones'
        + '?select=auxiliar_name,valor,estado'
        + '&estado=eq.Pendiente'
        + '&created_at=gte.' + encodeURIComponent(desdeDia)
        + '&created_at=lte.' + encodeURIComponent(hastaDia)
        + '&limit=500';

    // Cuadradas ese día: fecha_cuadrado dentro del día
    var endpointCuadradas = 'consignaciones'
        + '?select=auxiliar_name,valor,estado'
        + '&estado=eq.Cuadrado'
        + '&fecha_cuadrado=gte.' + encodeURIComponent(desdeDia)
        + '&fecha_cuadrado=lte.' + encodeURIComponent(hastaDia)
        + '&limit=500';

    var [pendientes, cuadradas] = await Promise.all([
        _fetchExternal(CONSIG_URL, CONSIG_KEY, endpointPendientes),
        _fetchExternal(CONSIG_URL, CONSIG_KEY, endpointCuadradas),
    ]);

    var todasDelDia = [...pendientes, ...cuadradas];

    // Agrupar por nombre (normalizado a mayúsculas)
    var mapa = new Map();
    todasDelDia.forEach(function(row) {
        var nombre = (row.auxiliar_name || '').trim().toUpperCase();
        if (!nombre || nombre === 'TYM') return; // excluir entradas genéricas
        var actual = mapa.get(nombre) || { valor_total: 0, cantidad: 0 };
        actual.valor_total += parseFloat(row.valor) || 0;
        actual.cantidad    += 1;
        mapa.set(nombre, actual);
    });

    return mapa;
}

// ── Devoluciones App ─────────────────────────────────────────
/**
 * Trae todas las devoluciones del día, agrupadas por user_name (de la tabla routes).
 * Devuelve un Map: nombreUPPER → { valor_total }
 *
 * La relación es:
 *   return_items.route_id → routes.id → routes.user_name
 *
 * Supabase permite hacer el join directamente con PostgREST:
 *   return_items?select=total,routes(user_name)
 *
 * Filtramos por created_at del día (hora UTC, cubre todo el día colombiano).
 *
 * @param {string} fecha - 'YYYY-MM-DD'
 * @returns {Promise<Map<string, {valor_total:number}>>}
 */
async function fetchDevolucionesDia(fecha) {
    var desdeDia = fecha + 'T00:00:00';
    var hastaDia = fecha + 'T23:59:59';

    // JOIN embebido de PostgREST: return_items con su route
    var endpoint = 'return_items'
        + '?select=total,routes(user_name)'
        + '&created_at=gte.' + encodeURIComponent(desdeDia)
        + '&created_at=lte.' + encodeURIComponent(hastaDia)
        + '&limit=1000';

    var rows = await _fetchExternal(DEVOL_URL, DEVOL_KEY, endpoint);

    console.log('[ExternalAPIs] Devoluciones raw (' + fecha + '):', rows.length, 'registros');

    // Agrupar por user_name del route
    var mapa = new Map();
    rows.forEach(function(row) {
        // PostgREST devuelve el join como objeto embebido
        var nombre = '';
        if (row.routes && !Array.isArray(row.routes) && row.routes.user_name) {
            nombre = row.routes.user_name.trim().toUpperCase();
        } else if (Array.isArray(row.routes) && row.routes[0] && row.routes[0].user_name) {
            nombre = row.routes[0].user_name.trim().toUpperCase();
        }
        if (!nombre) return;
        var actual = mapa.get(nombre) || { valor_total: 0 };
        actual.valor_total += parseFloat(row.total) || 0;
        mapa.set(nombre, actual);
    });

    console.log('[ExternalAPIs] Devoluciones agrupadas (' + fecha + '):', mapa.size, 'auxiliares');
    return mapa;
}

// ── Función principal: enriquecer planillas ──────────────────
/**
 * Dado un array de planillas y una fecha, consulta ambas APIs
 * y agrega a cada planilla:
 *   p._ext_consig_valor    → suma de consignaciones del auxiliar
 *   p._ext_consig_cantidad → número de consignaciones
 *   p._ext_devol_valor     → suma de devoluciones del auxiliar
 *   p._ext_cargado         → true (indica que ya se enriqueció)
 *
 * El match se hace buscando si el nombre en la API externa
 * contiene el nombre del auxiliar de Fletesapp (o viceversa),
 * para tolerar diferencias menores de escritura.
 *
 * @param {Array}  planillas - CC.data
 * @param {string} fecha     - 'YYYY-MM-DD'
 * @returns {Promise<void>}
 */
async function enriquecerConDatosExternos(planillas, fecha) {
    if (!planillas || !planillas.length) return;

    // ── Paso 1: traer auxiliares desde tabla fletes por fecha ────
    // La tabla planillas NO tiene campo auxiliares — está en fletes.
    // Buscamos todos los fletes del día para armar un mapa placa→auxiliar.
    var mapaAuxiliarPorPlaca = new Map();
    try {
        var supabase = window.SupabaseClient && window.SupabaseClient.supabase
            ? window.SupabaseClient.supabase
            : null;
        if (supabase) {
            var { data: fletesDia } = await supabase
                .from('fletes')
                .select('placa, no_planilla, auxiliares')
                .eq('fecha', fecha)
                .not('auxiliares', 'is', null)
                .neq('auxiliares', '')
                .neq('auxiliares', 'NO APLICA');

            (fletesDia || []).forEach(function(f) {
                var aux = (f.auxiliares || '').split(',')[0].trim().toUpperCase();
                if (!aux) return;
                // Indexar por placa (clave principal)
                if (f.placa) mapaAuxiliarPorPlaca.set(f.placa.trim().toUpperCase(), aux);
                // También por no_planilla (puede haber varios números)
                if (f.no_planilla) {
                    f.no_planilla.split(/\s+/).forEach(function(np) {
                        var n = np.trim();
                        if (n) mapaAuxiliarPorPlaca.set('NP:' + n, aux);
                    });
                }
            });
            console.log('[ExternalAPIs] Auxiliares desde fletes:', mapaAuxiliarPorPlaca.size, 'entradas para', fecha);
        }
    } catch(e) {
        console.warn('[ExternalAPIs] No se pudieron cargar auxiliares desde fletes:', e);
    }

    // ── Paso 2: consultas a APIs externas en paralelo ────────────
    var [mapaConsig, mapaDevol] = await Promise.all([
        fetchConsignacionesDia(fecha),
        fetchDevolucionesDia(fecha),
    ]);

    planillas.forEach(function(p) {
        // Intentar obtener auxiliar: primero desde el campo directo,
        // luego desde el mapa fletes por placa, luego por no_planilla
        var auxFletesapp = '';
        if (p.auxiliares && p.auxiliares !== 'NO APLICA') {
            auxFletesapp = p.auxiliares.split(',')[0].trim().toUpperCase();
        }
        if (!auxFletesapp && p.placa) {
            auxFletesapp = mapaAuxiliarPorPlaca.get(p.placa.trim().toUpperCase()) || '';
        }
        if (!auxFletesapp && p.no_planilla) {
            p.no_planilla.split(/\s+/).forEach(function(np) {
                if (!auxFletesapp) auxFletesapp = mapaAuxiliarPorPlaca.get('NP:' + np.trim()) || '';
            });
        }

        // Inicializar con cero
        p._ext_consig_valor    = 0;
        p._ext_consig_cantidad = 0;
        p._ext_devol_valor     = 0;
        p._ext_cargado         = true;
        p._ext_auxiliar        = auxFletesapp; // guardar el nombre resuelto para el render

        if (!auxFletesapp) return;

        // ── Match consignaciones ─────────────────────────────
        mapaConsig.forEach(function(datos, nombreExt) {
            if (_matchNombres(auxFletesapp, nombreExt)) {
                p._ext_consig_valor    += datos.valor_total;
                p._ext_consig_cantidad += datos.cantidad;
            }
        });

        // ── Match devoluciones ───────────────────────────────
        mapaDevol.forEach(function(datos, nombreExt) {
            if (_matchNombres(auxFletesapp, nombreExt)) {
                p._ext_devol_valor += datos.valor_total;
            }
        });

        // ── Log de debug ─────────────────────────────────────
        if (p._ext_consig_valor > 0 || p._ext_devol_valor > 0) {
            console.log('[ExternalAPIs] ' + auxFletesapp
                + ' | consig: $' + p._ext_consig_valor.toLocaleString('es-CO')
                + ' (' + p._ext_consig_cantidad + ' consig.)'
                + ' | devol: $' + p._ext_devol_valor.toLocaleString('es-CO'));
        }
    });

    console.log('[ExternalAPIs] Enriquecimiento completado para ' + planillas.length + ' planillas (' + fecha + ').');
}

// ── Match flexible de nombres ────────────────────────────────
/**
 * Devuelve true si los dos nombres corresponden a la misma persona.
 * Estrategia: al menos 2 palabras significativas en común (≥4 letras).
 * Esto tolera "JHON WILSON GIRALDO" vs "JHON GIRALDO CARVAJAL".
 */
function _matchNombres(a, b) {
    if (a === b) return true;
    // Si uno contiene al otro completo
    if (a.includes(b) || b.includes(a)) return true;
    // Contar palabras significativas en común
    var palabrasA = a.split(/\s+/).filter(function(w) { return w.length >= 4; });
    var palabrasB = new Set(b.split(/\s+/).filter(function(w) { return w.length >= 4; }));
    var comunes = palabrasA.filter(function(w) { return palabrasB.has(w); });
    return comunes.length >= 2;
}

// ── Exportar al scope global ─────────────────────────────────
window.ExternalAPIs = {
    enriquecerConDatosExternos: enriquecerConDatosExternos,
    fetchConsignacionesDia:     fetchConsignacionesDia,
    fetchDevolucionesDia:       fetchDevolucionesDia,
};
