// ==========================================================
// 🔄 SCRIPT DE MIGRACIÓN DE DATOS - localStorage → Supabase
// ==========================================================
// Este script migra tus datos existentes de localStorage a Supabase
// INSTRUCCIONES: Ejecutar desde la consola del navegador (F12)

/**
 * PASO 1: Abrir dashboard.html en el navegador
 * PASO 2: Abrir consola (F12 → Console)
 * PASO 3: Copiar y pegar este script completo
 * PASO 4: Ejecutar con Enter
 * PASO 5: Verifica en Supabase que los datos se importaron
 */

(async function migrarDatos() {
    console.log('🚀 Iniciando migración de datos a Supabase...\n');

    // Verificar que Supabase esté disponible
    if (!window.supabaseClient) {
        console.error('❌ Error: supabase-client.js no está cargado');
        return;
    }

    const {
        supabase,
        registrarUsuario,
        crearVehiculo,
        crearFlete,
        buscarVehiculoPorPlaca
    } = window.supabaseClient;

    const resultados = {
        usuarios: { creados: 0, errores: 0 },
        vehiculos: { creados: 0, errores: 0, omitidos: 0 },
        fletes: { creados: 0, errores: 0 }
    };

    try {
        // ==========================================================
        // PASO 1: Crear Usuario Administrador Inicial
        // ==========================================================
        console.log('📝 Paso 1: Creando usuario administrador...');

        const adminResult = await registrarUsuario(
            'admin_fletes@gmail.com',
            'admin123',
            'Administrador',
            'admin'
        );

        if (adminResult.success) {
            console.log('✅ Usuario admin creado exitosamente');
            resultados.usuarios.creados++;
        } else if (adminResult.error.includes('already registered')) {
            console.log('⚠️ Usuario admin ya existe (omitido)');
        } else {
            console.error('⚠️ Error creando admin:', adminResult.error);
            resultados.usuarios.errores++;
        }

        // Crear usuario operario de prueba
        const operarioResult = await registrarUsuario(
            'operario_fletes@gmail.com',
            'operario123',
            'Operario Logístico',
            'operario'
        );

        if (operarioResult.success) {
            console.log('✅ Usuario operario creado exitosamente');
            resultados.usuarios.creados++;
        } else if (operarioResult.error.includes('already registered')) {
            console.log('⚠️ Usuario operario ya existe (omitido)');
        } else {
            console.error('⚠️ Error creando operario:', operarioResult.error);
            resultados.usuarios.errores++;
        }

        // ==========================================================
        // PASO 2: Migrar Vehículos
        // ==========================================================
        console.log('\n🚗 Paso 2: Migrando vehículos...');

        const flotaLocal = JSON.parse(localStorage.getItem('flota')) || [];
        console.log(`   Encontrados ${flotaLocal.length} vehículos en localStorage`);

        for (const vehiculo of flotaLocal) {
            // Verificar si ya existe
            const existe = await buscarVehiculoPorPlaca(vehiculo.placa);

            if (existe) {
                console.log(`   ⏭️ Vehículo ${vehiculo.placa} ya existe (omitido)`);
                resultados.vehiculos.omitidos++;
                continue;
            }

            const resultado = await crearVehiculo({
                placa: vehiculo.placa,
                conductor: vehiculo.conductor,
                capacidad: vehiculo.capacidad || 'N/A',
                modelo: vehiculo.modelo || 'Estándar',
                activo: true
            });

            if (resultado.success) {
                console.log(`   ✅ Vehículo ${vehiculo.placa} migrado`);
                resultados.vehiculos.creados++;
            } else {
                console.error(`   ❌ Error migrando vehículo ${vehiculo.placa}:`, resultado.error);
                resultados.vehiculos.errores++;
            }
        }

        // ==========================================================
        // PASO 3: Migrar Fletes
        // ==========================================================
        console.log('\n📦 Paso 3: Migrando fletes...');

        const fletesLocal = JSON.parse(localStorage.getItem('fletes')) || [];
        console.log(`   Encontrados ${fletesLocal.length} fletes en localStorage`);

        for (const flete of fletesLocal) {
            // Buscar vehículo correspondiente
            const vehiculo = await buscarVehiculoPorPlaca(flete.placa);

            if (!vehiculo) {
                console.warn(`   ⚠️ Vehículo ${flete.placa} no encontrado, creando...`);
                // Crear vehículo si no existe
                await crearVehiculo({
                    placa: flete.placa,
                    conductor: flete.contratista,
                    capacidad: 'N/A',
                    modelo: 'N/A',
                    activo: true
                });
            }

            // Buscar de nuevo para obtener el ID
            const vehiculoActualizado = await buscarVehiculoPorPlaca(flete.placa);

            const resultado = await crearFlete({
                vehiculo_id: vehiculoActualizado?.id,
                fecha: flete.fecha,
                dia: flete.dia || '',
                contratista: flete.contratista,
                zona: flete.zona,
                poblacion: flete.poblacion || 'Pereira',
                valor_ruta: flete.valorRuta || 0,
                precio: flete.precio,
                adicionales: flete.adicionales || 'No',
                no_pedidos: parseInt(flete.noPedidos) || 0,
                auxiliares: flete.auxiliares || '',
                no_auxiliares: parseInt(flete.noAux) || 0
            });

            if (resultado.success) {
                console.log(`   ✅ Flete migrado (${flete.placa} - ${flete.fecha})`);
                resultados.fletes.creados++;
            } else {
                console.error(`   ❌ Error migrando flete:`, resultado.error);
                resultados.fletes.errores++;
            }
        }

        // ==========================================================
        // RESUMEN FINAL
        // ==========================================================
        console.log('\n' + '='.repeat(60));
        console.log('📊 RESUMEN DE MIGRACIÓN');
        console.log('='.repeat(60));
        console.log('👥 Usuarios:');
        console.log(`   ✅ Creados: ${resultados.usuarios.creados}`);
        console.log(`   ❌ Errores: ${resultados.usuarios.errores}`);

        console.log('\n🚗 Vehículos:');
        console.log(`   ✅ Creados: ${resultados.vehiculos.creados}`);
        console.log(`   ⏭️ Omitidos: ${resultados.vehiculos.omitidos}`);
        console.log(`   ❌ Errores: ${resultados.vehiculos.errores}`);

        console.log('\n📦 Fletes:');
        console.log(`   ✅ Creados: ${resultados.fletes.creados}`);
        console.log(`   ❌ Errores: ${resultados.fletes.errores}`);

        console.log('\n' + '='.repeat(60));

        const totalExito = resultados.usuarios.creados +
            resultados.vehiculos.creados +
            resultados.fletes.creados;

        const totalErrores = resultados.usuarios.errores +
            resultados.vehiculos.errores +
            resultados.fletes.errores;

        if (totalErrores === 0) {
            console.log('✅ ¡PROCESO COMPLETADO EXITOSAMENTE!');
            console.log(`   ${totalExito} registros procesados sin errores`);
            console.log('\n👉 Si creaste los usuarios, ahora puedes iniciar sesión.');
            console.log('👉 Si ya iniciaste sesión, tus datos ya están en la nube.');
        } else {
            console.log('⚠️ PROCESO COMPLETADO CON ALGUNOS ERRORES');
            console.log(`   ${totalExito} registros exitosos`);
            console.log(`   ${totalErrores} registros con errores`);
        }

        console.log('\n🔍 Verifica los datos en Supabase:');
        console.log('   Dashboard → Table Editor → vehiculos/fletes');
        console.log('='.repeat(60) + '\n');

        // Opcional: Hacer backup de localStorage antes de limpiar
        console.log('💾 Creando backup de localStorage...');
        const backup = {
            timestamp: new Date().toISOString(),
            flota: flotaLocal, // Corregido: flotaLocal
            fletes: fletesLocal
        };
        localStorage.setItem('backup_pre_migration', JSON.stringify(backup));
        console.log('✅ Backup guardado en localStorage con key: "backup_pre_migration"');

    } catch (error) {
        console.error('❌ Error fatal durante la migración:', error);
        console.log('\n⚠️ El proceso se detuvo. Tus datos en localStorage están seguros.');
    }
})();

// ==========================================================
// FUNCIONES ADICIONALES DE UTILIDAD
// ==========================================================

/**
 * Función para exportar backup como JSON descargable
 * Ejecuta: exportarBackup()
 */
function exportarBackup() {
    const backup = {
        timestamp: new Date().toISOString(),
        flota: JSON.parse(localStorage.getItem('flota')) || [],
        fletes: JSON.parse(localStorage.getItem('fletes')) || []
    };

    const blob = new Blob([JSON.stringify(backup, null, 2)], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `fletesapp-backup-${new Date().toISOString().split('T')[0]}.json`;
    a.click();
    URL.revokeObjectURL(url);

    console.log('✅ Backup descargado exitosamente');
}

/**
 * Función para limpiar localStorage después de migración exitosa
 * ⚠️ USAR CON PRECAUCIÓN - Solo después de verificar datos en Supabase
 * Ejecuta: limpiarLocalStorage()
 */
function limpiarLocalStorage() {
    const confirmacion = confirm(
        '⚠️ ¿Estás seguro de limpiar localStorage?\n\n' +
        'Asegúrate de que:\n' +
        '1. Los datos se migraron correctamente a Supabase\n' +
        '2. Creaste un backup con exportarBackup()\n\n' +
        'Esta acción NO es reversible.'
    );

    if (confirmacion) {
        localStorage.removeItem('flota');
        localStorage.removeItem('fletes');
        console.log('✅ localStorage limpiado (backup aún disponible)');
        console.log('💡 El backup se mantiene en: "backup_pre_migration"');
    } else {
        console.log('❌ Operación cancelada');
    }
}

console.log('\n💡 COMANDOS DISPONIBLES:');
console.log('   exportarBackup() - Descarga backup como JSON');
console.log('   limpiarLocalStorage() - Limpia datos migrados (¡PRECAUCIÓN!)\n');
