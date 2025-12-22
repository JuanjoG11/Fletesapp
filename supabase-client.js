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
    console.error('❌ Error: La librería de Supabase no se cargó correctamente.');
    Swal.fire({
        icon: 'error',
        title: 'Error Crítico',
        text: 'No se pudo cargar la librería de conexión. Por favor, verifica tu conexión a internet.',
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

/**
 * Obtener todos los vehículos activos
 * @returns {Promise<Array>}
 */
async function obtenerVehiculos() {
    try {
        const { data, error } = await _supabase
            .from('vehiculos')
            .select('*')
            .order('placa', { ascending: true });

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
        const { data, error } = await _supabase
            .from('vehiculos')
            .select('*')
            .eq('placa', placa.toUpperCase())
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

        const { data, error } = await _supabase
            .from('vehiculos')
            .insert([{
                ...vehiculoData,
                placa: vehiculoData.placa.toUpperCase(),
                created_by: session?.session?.user?.id
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

        const dataToInsert = vehiculos.map(v => ({
            placa: v.placa.toUpperCase(),
            conductor: v.conductor,
            modelo: v.modelo || 'Estándar',
            activo: true,
            created_by: userId
        }));

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
 * Eliminar vehículo
 * @param {string} vehiculoId - ID del vehículo
 * @returns {Promise<{success: boolean, error?: string}>}
 */
async function eliminarVehiculo(vehiculoId) {
    try {
        const { error } = await _supabase
            .from('vehiculos')
            .delete()
            .eq('id', vehiculoId);

        if (error) throw error;
        return { success: true };
    } catch (error) {
        console.error('Error al eliminar vehículo:', error);
        return { success: false, error: error.message };
    }
}

// ==========================================================
// 🚚 FUNCIONES DE FLETES
// ==========================================================

/**
 * Obtener todos los fletes con información de vehículos
 * @param {object} filtros - Filtros opcionales {zona, fecha, busqueda}
 * @returns {Promise<Array>}
 */
async function obtenerFletes(filtros = {}) {
    try {
        let query = _supabase
            .from('fletes')
            .select(`
                *,
                vehiculo:vehiculos(placa, conductor, modelo)
            `)
            .order('fecha', { ascending: false });

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

        const { data, error } = await _supabase
            .from('fletes')
            .insert([{
                ...fleteData,
                user_id: session?.session?.user?.id
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
 * Obtener KPIs del dashboard
 * @returns {Promise<object>}
 */
async function obtenerKPIs() {
    try {
        // Total de fletes
        const { count: totalFletes } = await _supabase
            .from('fletes')
            .select('*', { count: 'exact', head: true });

        // Ingresos del mes actual
        const fechaActual = new Date();
        const primerDiaMes = new Date(fechaActual.getFullYear(), fechaActual.getMonth(), 1)
            .toISOString().split('T')[0];

        const { data: fletesDelMes } = await _supabase
            .from('fletes')
            .select('precio')
            .gte('fecha', primerDiaMes);

        const ingresosMes = fletesDelMes?.reduce((sum, f) => sum + parseFloat(f.precio || 0), 0) || 0;

        // Vehículos activos
        const { count: vehiculosActivos } = await _supabase
            .from('vehiculos')
            .select('*', { count: 'exact', head: true })
            .eq('activo', true);

        return {
            totalFletes: totalFletes || 0,
            ingresosMes: ingresosMes,
            vehiculosActivos: vehiculosActivos || 0
        };
    } catch (error) {
        console.error('Error al obtener KPIs:', error);
        return { totalFletes: 0, ingresosMes: 0, vehiculosActivos: 0 };
    }
}

/**
 * Obtener estadísticas para gráficos
 * @returns {Promise<object>}
 */
async function obtenerEstadisticas() {
    try {
        const { data: fletes } = await _supabase
            .from('fletes')
            .select('zona, precio, fecha');

        if (!fletes) return { zonas: {}, ingresosPorMes: {} };

        // Agrupar por zona
        const zonas = {};
        fletes.forEach(f => {
            zonas[f.zona] = (zonas[f.zona] || 0) + 1;
        });

        // Agrupar ingresos por mes
        const ingresosPorMes = {};
        fletes.forEach(f => {
            const mes = f.fecha.substring(0, 7); // YYYY-MM
            ingresosPorMes[mes] = (ingresosPorMes[mes] || 0) + parseFloat(f.precio || 0);
        });

        return { zonas, ingresosPorMes };
    } catch (error) {
        console.error('Error al obtener estadísticas:', error);
        return { zonas: {}, ingresosPorMes: {} };
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
        delete: eliminarVehiculo
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

// Aliases para compatibilidad con index.html y migrate-data.js
window.supabaseClient.iniciarSesion = iniciarSesion;
window.supabaseClient.registrarUsuario = registrarUsuario;
window.supabaseClient.crearVehiculo = crearVehiculo;
window.supabaseClient.importarVehiculos = importarVehiculos;
window.supabaseClient.crearFlete = crearFlete;
window.supabaseClient.buscarVehiculoPorPlaca = buscarVehiculoPorPlaca;
window.supabaseClient.obtenerSesionActual = obtenerSesionActual;
window.supabaseClient.cerrarSesion = cerrarSesion;

console.log('✅ Supabase Client inicializado correctamente (Estructura Unificada)');
