// ==========================================================
// 🔌 SUPABASE CLIENT - Singleton para Fletesapp
// ==========================================================
// Cliente de conexión a Supabase con funciones helper reutilizables

// ⚠️ IMPORTANTE: Reemplaza estos valores con tus credenciales reales
// Obtén estos valores en: Supabase Dashboard → Settings → API
const SUPABASE_URL = 'https://culezzzujkwjpdlalfzi.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN1bGV6enp1amt3anBkbGFsZnppIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYxNzQ2NTIsImV4cCI6MjA4MTc1MDY1Mn0.qKp2IrOQW0YaPvSmIsmSFxcnFB_vPd2D0A6VzZJAhe8';

// 1. Verificar si la librería de Supabase está cargada
if (!window.supabase || !window.supabase.createClient) {
    Swal.fire({
        icon: 'error',
        title: 'Error de Conexión',
        text: 'No se pudo cargar la librería de Supabase. Revisa tu conexión.',
        background: '#1e293b',
        color: '#fff'
    });
}

// 2. Crear cliente de Supabase
const _supabase = window.supabase ? window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY) : null;

// ==========================================================
// 🔐 FUNCIONES DE AUTENTICACIÓN
// ==========================================================

/**
 * Registrar nuevo usuario
 * @param {string} email - Email del usuario
 * @param {string} password - Contraseña
 * @param {string} nombre - Nombre completo
 * @param {string} rol - 'admin' o 'operario'
 * @returns {Promise<{success: boolean, user?: object, error?: string}>}
 */
async function registrarUsuario(email, password, nombre, rol = 'operario') {
    try {
        const { data: authData, error: authError } = await _supabase.auth.signUp({
            email,
            password,
            options: {
                data: {
                    nombre: nombre,
                    rol: rol
                }
            }
        });

        if (authError) throw authError;

        return { success: true, user: authData.user };
    } catch (error) {
        console.error('Error al registrar usuario:', error);
        return { success: false, error: error.message };
    }
}

/**
 * Iniciar sesión
 * @param {string} email - Email del usuario
 * @param {string} password - Contraseña
 * @returns {Promise<{success: boolean, user?: object, error?: string}>}
 */
async function iniciarSesion(email, password) {
    try {
        if (!_supabase) throw new Error('El cliente de Supabase no está inicializado.');

        const { data, error } = await _supabase.auth.signInWithPassword({
            email,
            password
        });

        if (error) throw error;

        // Obtener datos adicionales del usuario
        const { data: userData, error: userError } = await _supabase
            .from('usuarios')
            .select('*')
            .eq('id', data.user.id)
            .single();

        if (userError) throw userError;

        return { success: true, user: userData };
    } catch (error) {
        console.error('Error al iniciar sesión:', error);
        return { success: false, error: error.message };
    }
}

/**
 * Cerrar sesión
 * @returns {Promise<{success: boolean, error?: string}>}
 */
async function cerrarSesion() {
    try {
        const { error } = await _supabase.auth.signOut();
        if (error) throw error;
        return { success: true };
    } catch (error) {
        console.error('Error al cerrar sesión:', error);
        return { success: false, error: error.message };
    }
}

/**
 * Obtener sesión actual
 * @returns {Promise<{user?: object, session?: object}>}
 */
async function obtenerSesionActual() {
    try {
        if (!_supabase) return { user: null, session: null };

        const { data: { session } } = await _supabase.auth.getSession();

        if (!session) return { user: null, session: null };

        // Obtener datos del usuario
        const { data: userData } = await _supabase
            .from('usuarios')
            .select('*')
            .eq('id', session.user.id)
            .single();

        return { user: userData, session };
    } catch (error) {
        console.error('Error al obtener sesión:', error);
        return { user: null, session: null };
    }
}

// ==========================================================
// 🚗 FUNCIONES DE VEHÍCULOS
// ==========================================================

// Helper interno para obtener la empresa del usuario actual
async function _getRazonSocialUsuario() {
    try {
        const { data: { session } } = await _supabase.auth.getSession();
        if (!session) return null;

        const { data: user } = await _supabase
            .from('usuarios')
            .select('razon_social')
            .eq('id', session.user.id)
            .single();

        return user?.razon_social;
    } catch (e) {
        console.error('Error obteniendo razon_social:', e);
        return null;
    }
}

/**
 * Obtener todos los vehículos activos (Filtrado por Empresa)
 * @returns {Promise<Array>}
 */
async function obtenerVehiculos() {
    try {
        const razonSocial = await _getRazonSocialUsuario();
        let query = _supabase
            .from('vehiculos')
            .select('*')
            .order('placa', { ascending: true });

        // Aplicar filtro de empresa si existe (AISLAMIENTO ESTRICTO)
        if (razonSocial) {
            query = query.eq('razon_social', razonSocial.toUpperCase());
        }

        const { data, error } = await query;

        if (error) throw error;
        return { success: true, data: data || [] };
    } catch (error) {
        console.error('Error al obtener vehículos:', error);
        return { success: false, data: [], error: error.message };
    }
}

/**
 * Buscar vehículo por placa
 * @param {string} placa - Placa del vehículo
 * @returns {Promise<object|null>}
 */
async function buscarVehiculoPorPlaca(placa) {
    try {
        // No filtramos por razon_social aquí estrictamente para permitir validaciones globales si se requiere,
        // pero idealmente RLS lo manejará.
        const { data, error } = await _supabase
            .from('vehiculos')
            .select('*')
            .eq('placa', placa.toUpperCase().replace(/[\s-]/g, ''))
            .single();

        if (error && error.code !== 'PGRST116') throw error;
        return { success: true, data };
    } catch (error) {
        console.error('Error al buscar vehículo:', error);
        return { success: false, data: null, error: error.message };
    }
}

/**
 * Crear nuevo vehículo
 * @param {object} vehiculoData - Datos del vehículo
 * @returns {Promise<{success: boolean, data?: object, error?: string}>}
 */
async function crearVehiculo(vehiculoData) {
    try {
        const { data: session } = await _supabase.auth.getSession();

        // Obtener razon social para asignarla al vehículo
        const razonSocial = await _getRazonSocialUsuario() || 'TYM';

        const { data, error } = await _supabase
            .from('vehiculos')
            .insert([{
                ...vehiculoData,
                placa: vehiculoData.placa.toUpperCase().replace(/[\s-]/g, ''),
                created_by: session?.session?.user?.id,
                razon_social: razonSocial // Asignar empresa automáticamente
            }])
            .select()
            .single();

        if (error) throw error;
        return { success: true, data };
    } catch (error) {
        console.error('Error al crear vehículo:', error);
        return { success: false, error: error.message };
    }
}

/**
 * Importar múltiples vehículos (Bulk Insert)
 * @param {Array} vehiculos - Lista de vehículos
 * @returns {Promise<{success: boolean, count?: number, error?: string}>}
 */
async function importarVehiculos(vehiculos) {
    try {
        const { data: sessionData } = await _supabase.auth.getSession();
        const userId = sessionData?.session?.user?.id;
        const razonSocial = await _getRazonSocialUsuario() || 'TYM';

        const dataToInsert = vehiculos.map(v => {
            if (!v.placa) return null; // Saltar registros sin placa
            return {
                placa: String(v.placa).toUpperCase().replace(/[\s-]/g, ''),
                conductor: v.conductor || 'Sin Conductor',
                modelo: v.modelo || 'Estándar',
                activo: true,
                created_by: userId,
                razon_social: razonSocial
            };
        }).filter(v => v !== null); // Eliminar nulos

        const { data, error } = await _supabase
            .from('vehiculos')
            .upsert(dataToInsert, { onConflict: 'placa' })
            .select();

        if (error) throw error;
        return { success: true, count: data.length };
    } catch (error) {
        console.error('Error al importar vehículos:', error);
        return { success: false, error: error.message };
    }
}

/**
 * Actualizar vehículo
 * @param {string} vehiculoId - ID del vehículo
 * @param {object} vehiculoData - Datos a actualizar
 * @returns {Promise<{success: boolean, error?: string}>}
 */
async function actualizarVehiculo(vehiculoId, vehiculoData) {
    try {
        const { error } = await _supabase
            .from('vehiculos')
            .update(vehiculoData)
            .eq('id', vehiculoId);

        if (error) throw error;
        return { success: true };
    } catch (error) {
        console.error('Error al actualizar vehículo:', error);
        return { success: false, error: error.message };
    }
}

// ==========================================================
// 🚚 FUNCIONES DE FLETES
// ==========================================================

/**
 * Obtener todos los fletes con información de vehículos (Filtrado por Empresa)
 * @param {object} filtros - Filtros opcionales {zona, fecha, busqueda}
 * @returns {Promise<Array>}
 */
async function obtenerFletes(filtros = {}) {
    try {
        const razonSocial = await _getRazonSocialUsuario();

        let query = _supabase
            .from('fletes')
            .select(`
                *,
                vehiculo:vehiculos(placa, conductor, modelo)
            `)
            .order('created_at', { ascending: false });

        // Filtrar por empresa (AISLAMIENTO ESTRICTO)
        if (razonSocial) {
            const rs = razonSocial.toUpperCase();
            if (rs === 'TAT') {
                // TAT ve sus fletes Y los de Polar (que están en TYM)
                query = query.or(`razon_social.eq.TAT,proveedor.eq.POLAR`);
            } else {
                // TYM ve sus fletes (incluyendo Polar)
                query = query.eq('razon_social', 'TYM');
            }
        } else {
            // Seguridad: Si no hay empresa, no devolver nada
            query = query.eq('razon_social', 'NINGUNA');
        }

        if (filtros.zona) query = query.eq('zona', filtros.zona);
        if (filtros.fecha) query = query.eq('fecha', filtros.fecha);

        const { data, error } = await query;
        if (error) throw error;
        return { success: true, data: data || [] };
    } catch (error) {
        console.error('Error al obtener fletes:', error);
        return { success: false, data: [], error: error.message };
    }
}

/**
 * Crear nuevo flete
 * @param {object} fleteData - Datos del flete
 * @returns {Promise<{success: boolean, data?: object, error?: string}>}
 */
async function crearFlete(fleteData) {
    try {
        const { data: session } = await _supabase.auth.getSession();
        let razonSocial = await _getRazonSocialUsuario() || 'TYM';

        // LÓGICA ESPECIAL: Polar siempre queda en TYM
        if (fleteData.proveedor === 'POLAR') {
            razonSocial = 'TYM';
        }

        const { data, error } = await _supabase
            .from('fletes')
            .insert([{
                ...fleteData,
                user_id: session?.session?.user?.id,
                razon_social: razonSocial // Asignar empresa (TYM para Polar)
            }])
            .select(`
                *,
                vehiculo:vehiculos(placa, conductor)
            `)
            .single();

        if (error) throw error;
        return { success: true, data };
    } catch (error) {
        console.error('Error al crear flete:', error);
        return { success: false, error: error.message };
    }
}

/**
 * Actualizar flete existente
 * @param {string} fleteId - ID del flete
 * @param {object} fleteData - Datos actualizados
 * @returns {Promise<{success: boolean, data?: object, error?: string}>}
 */
async function actualizarFlete(fleteId, fleteData) {
    try {
        const { data, error } = await _supabase
            .from('fletes')
            .update(fleteData)
            .eq('id', fleteId)
            .select()
            .single();

        if (error) throw error;
        return { success: true, data };
    } catch (error) {
        console.error('Error al actualizar flete:', error);
        return { success: false, error: error.message };
    }
}

/**
 * Eliminar flete
 * @param {string} fleteId - ID del flete
 * @returns {Promise<{success: boolean, error?: string}>}
 */
async function eliminarFleteDB(fleteId) {
    try {
        const { error } = await _supabase
            .from('fletes')
            .delete()
            .eq('id', fleteId);

        if (error) throw error;
        return { success: true };
    } catch (error) {
        console.error('Error al eliminar flete:', error);
        return { success: false, error: error.message };
    }
}

// ==========================================================
// 📊 FUNCIONES DE ESTADÍSTICAS
// ==========================================================

/**
 * Obtener KPIs del dashboard (Filtrado por Empresa)
 * @returns {Promise<object>}
 */
async function obtenerKPIs() {
    try {
        const razonSocial = await _getRazonSocialUsuario();

        let queryTotal = _supabase
            .from('fletes')
            .select('*', { count: 'exact', head: true });

        if (razonSocial) {
            const rs = razonSocial.toUpperCase();
            if (rs === 'TAT') {
                // TAT ve sus fletes Y los de Polar (que están en TYM)
                queryTotal = queryTotal.or(`razon_social.eq.TAT,proveedor.eq.POLAR`);
            } else {
                // TYM ve sus fletes (incluyendo Polar)
                queryTotal = queryTotal.eq('razon_social', 'TYM');
            }
        }

        const { count: totalFletes, error: e1 } = await queryTotal;
        if (e1) throw e1;

        const fechaActual = new Date();
        const primerDiaMes = new Date(fechaActual.getFullYear(), fechaActual.getMonth(), 1).toISOString().split('T')[0];

        let queryMes = _supabase
            .from('fletes')
            .select('precio')
            .gte('fecha', primerDiaMes);

        if (razonSocial) {
            const rs = razonSocial.toUpperCase();
            if (rs === 'TAT') {
                queryMes = queryMes.or(`razon_social.eq.TAT,proveedor.eq.POLAR`);
            } else {
                queryMes = queryMes.eq('razon_social', 'TYM');
            }
        }

        const { data: fletesDelMes, error: e2 } = await queryMes;
        if (e2) throw e2;

        const ingresosMes = fletesDelMes?.reduce((sum, f) => sum + parseFloat(f.precio || 0), 0) || 0;

        let queryVehiculos = _supabase
            .from('vehiculos')
            .select('*', { count: 'exact', head: true })
            .eq('activo', true);

        if (razonSocial) queryVehiculos = queryVehiculos.eq('razon_social', razonSocial.toUpperCase());

        const { count: vehiculosActivos, error: e3 } = await queryVehiculos;
        if (e3) throw e3;

        return {
            totalFletes: totalFletes || 0,
            ingresosMes: ingresosMes,
            vehiculosActivos: vehiculosActivos || 0
        };
    } catch (error) {
        console.error('❌ Error al obtener KPIs de Supabase:', error);
        throw error; // Propagar para que el dashboard lo detecte
    }
}

/**
 * Obtener estadísticas para gráficos (Filtrado por Empresa)
 * @returns {Promise<object>}
 */
async function obtenerEstadisticas() {
    try {
        const razonSocial = await _getRazonSocialUsuario();

        let query = _supabase
            .from('fletes')
            .select('zona, precio, fecha, proveedor');

        // Filtrar por empresa (AISLAMIENTO ESTRICTO)
        if (razonSocial) {
            const rs = razonSocial.toUpperCase();
            if (rs === 'TAT') {
                query = query.or(`razon_social.eq.TAT,proveedor.eq.POLAR`);
            } else {
                query = query.eq('razon_social', 'TYM');
            }
        } else {
            query = query.eq('razon_social', 'NINGUNA');
        }

        const { data: fletes } = await query;

        if (!fletes) return { zonas: {}, ingresosPorMes: {} };

        // Agrupar por zona (Conteo y Valor)
        const zonas = {};
        const valoresZonas = {};

        fletes.forEach(f => {
            zonas[f.zona] = (zonas[f.zona] || 0) + 1;
            valoresZonas[f.zona] = (valoresZonas[f.zona] || 0) + parseFloat(f.precio || 0);
        });

        // Agrupar ingresos por mes
        const ingresosPorMes = {};
        fletes.forEach(f => {
            const mes = f.fecha.substring(0, 7); // YYYY-MM
            ingresosPorMes[mes] = (ingresosPorMes[mes] || 0) + parseFloat(f.precio || 0);
        });

        return { zonas, ingresosPorMes, valoresZonas };
    } catch (error) {
        console.error('Error al obtener estadísticas:', error);
        return { zonas: {}, ingresosPorMes: {}, valoresZonas: {} };
    }
}

// ==========================================================
// 🔄 SUSCRIPCIONES EN TIEMPO REAL
// ==========================================================

/**
 * Suscribirse a cambios en tiempo real
 * @param {string} tabla - Nombre de la tabla ('fletes', 'vehiculos')
 * @param {function} callback - Función a ejecutar cuando hay cambios
 * @returns {object} Subscription object
 */
function suscribirseACambios(tabla, callback) {
    return _supabase
        .channel(`public:${tabla}`)
        .on('postgres_changes',
            { event: '*', schema: 'public', table: tabla },
            callback
        )
        .subscribe();
}

// Exportar funciones de manera estructurada para app.js y otros scripts
const SupabaseClientAPI = {
    supabase: _supabase,
    // Módulo de Autenticación
    auth: {
        registrar: registrarUsuario,
        login: iniciarSesion,
        logout: cerrarSesion,
        getSession: obtenerSesionActual
    },
    // Módulo de Vehículos
    vehiculos: {
        getAll: obtenerVehiculos,
        getByPlaca: buscarVehiculoPorPlaca,
        create: crearVehiculo,
        importar: importarVehiculos,
        update: actualizarVehiculo
    },
    // Módulo de Fletes
    fletes: {
        getAll: obtenerFletes,
        create: crearFlete,
        update: actualizarFlete,
        delete: eliminarFleteDB,
        getStats: obtenerKPIs,
        getEstadisticas: obtenerEstadisticas
    },
    // Utilidades
    suscribirse: suscribirseACambios
};

// Hacerlo disponible globalmente con ambos nombres para evitar errores
window.supabaseClient = SupabaseClientAPI;
window.SupabaseClient = SupabaseClientAPI;

// Aliases para compatibilidad con app.js e index.html
window.supabaseClient.iniciarSesion = iniciarSesion;
window.supabaseClient.registrarUsuario = registrarUsuario;
window.supabaseClient.crearVehiculo = crearVehiculo;
window.supabaseClient.importarVehiculos = importarVehiculos;
window.supabaseClient.crearFlete = crearFlete;
window.supabaseClient.buscarVehiculoPorPlaca = buscarVehiculoPorPlaca;
window.supabaseClient.obtenerSesionActual = obtenerSesionActual;
window.supabaseClient.cerrarSesion = cerrarSesion;
