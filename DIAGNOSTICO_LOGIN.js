// ==========================================================
// 🚨 SCRIPT DE DIAGNÓSTICO Y REPARACIÓN - FLETESAPP
// ==========================================================
// Copia y pega esto en la consola (F12) de index.html

async function diagnostico() {
    console.log('🔍 Iniciando diagnóstico de Supabase...');

    if (!window.supabaseClient) {
        console.error('❌ Error: El cliente de Supabase no está cargado.');
        return;
    }

    const sc = window.supabaseClient;

    // 💡 TIP: Si el dominio "fletesapp.com" falla, intenta con un email real (ej: tu_correo@gmail.com)
    // Cambia el valor de testEmail abajo si es necesario.
    let testEmail = 'admin@fletesapp.com';
    const testPass = 'admin123';

    console.log(`📡 Probando con el correo: ${testEmail}`);

    try {
        // Intentar registrar (si no existe lo crea, si existe nos dirá)
        const res = await sc.registrarUsuario(testEmail, testPass, 'Administrador Final', 'admin');

        if (res.success) {
            console.log('✅ USUARIO CREADO CON ÉXITO. Ahora intenta loguearte en la página.');
        } else if (res.error && (res.error.includes('invalid') || res.error.includes('format'))) {
            console.error('❌ ERROR DE VALIDACIÓN:', res.error);
            console.log('💡 TIP: Supabase está rechazando este correo.');
            console.log('👉 Por favor, edita la línea 17 de este script con un correo real (ej: tu_correo@gmail.com) y vuelve a correrlo.');
        } else if (res.error && res.error.includes('already registered')) {
            console.log('⚠️ El usuario ya existe en Supabase Auth.');
            console.log('🔑 Intentando login de prueba...');

            const loginRes = await sc.iniciarSesion(testEmail, testPass);
            if (loginRes.success) {
                console.log('✅ LOGIN EXITOSO. El sistema funciona correctamente.');
                console.log(`👉 Puedes entrar ahora con ${testEmail} / ${testPass}`);
            } else {
                console.error('❌ LOGIN FALLIDO:', loginRes.error);
                if (loginRes.error.includes('Email not confirmed')) {
                    console.error('🔴 ATENCIÓN: Debes desactivar "Confirm email" en el Dashboard de Supabase.');
                    console.log('Pasos: Authentication -> Providers -> Email -> Desactivar "Confirm email" -> Save');
                } else if (loginRes.error.includes('Invalid login credentials')) {
                    console.error('🔴 ATENCIÓN: La contraseña registrada es diferente.');
                    console.log('💡 Tip: Borra el usuario desde el Dashboard → Authentication → Users y corre este script de nuevo.');
                }
            }
        } else {
            console.error('❌ Error no controlado:', res.error);
        }
    } catch (e) {
        console.error('💥 Error fatal en el diagnóstico:', e);
    }
}

diagnostico();
