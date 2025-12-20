/**
 * 🛠️ DIAGNÓSTICO DE DATOS (FletesApp)
 * Copia y pega esto en la consola (F12) del Dashboard para saber qué está pasando.
 */
(async () => {
    console.log("%c🚀 Iniciando diagnóstico...", "color: #3b82f6; font-weight: bold; font-size: 14px;");

    // 1. Verificar Sesión
    const { session, user } = await window.supabaseClient.obtenerSesionActual();
    if (!session) {
        console.error("❌ No hay sesión activa de Supabase.");
    } else {
        console.log("✅ Sesión activa:", session.user.email);
        console.log("👤 Perfil DB:", user ? `Encontrado (${user.rol})` : "❌ NO ENCONTRADO en tabla usuarios");
    }

    // 2. Probar acceso a Fletes
    console.log("\n📊 Probando acceso a tabla 'fletes'...");
    const { data: fletes, error: errFletes, count } = await window.supabaseClient.supabase
        .from('fletes')
        .select('*', { count: 'exact' });

    if (errFletes) {
        console.error("❌ Error al leer fletes:", errFletes.message);
        console.log("💡 Sugerencia: Revisa las políticas RLS en Supabase.");
    } else {
        console.log(`✅ Conexión a 'fletes' exitosa. Registros encontrados: ${count || fletes.length}`);
        if (fletes.length > 0) console.log("Muestra del primer flete:", fletes[0]);
    }

    // 3. Probar Vista
    console.log("\n🔍 Probando acceso a 'vista_fletes_completos'...");
    const { data: vista, error: errVista } = await window.supabaseClient.supabase
        .from('vista_fletes_completos')
        .select('*')
        .limit(1);

    if (errVista) {
        console.error("❌ Error en la Vista:", errVista.message);
        console.log("💡 Sugerencia: Asegúrate de haber ejecutado el script SQL corregido.");
    } else {
        console.log("✅ Vista funcionando correctamente.");
    }

    console.log("\n%c--- Fin del Diagnóstico ---", "color: #3b82f6; font-weight: bold;");
})();
