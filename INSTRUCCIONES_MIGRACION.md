# 🚀 GUÍA FINAL: Migración de Datos y Uso

¡Todo el código ha sido actualizado! Fletesapp ahora funciona 100% con Supabase en la nube.

## Paso 1: Migrar tus datos de localStorage a la Nube

Para no perder tu información actual (vehículos y fletes), sigue estos pasos:

1. Abre tu aplicación en el navegador (`dashboard.html`).
2. Presiona **F12** para abrir las herramientas de desarrollador.
3. Ve a la pestaña **"Console"** (Consola).
4. Abre el archivo `migrate-data.js` en VS Code, **copia TODO su contenido** y pégalo en la consola del navegador.
5. Presiona **Enter**.
6. Verás un resumen detallado de cuántos vehículos y fletes se migraron. ✅

## Paso 2: Iniciar Sesión con las Nuevas Credenciales

Ve a `index.html` e ingresa con:

- **Email:** `admin@fletesapp.com`
- **Contraseña:** `admin123`

O si eres operario:
- **Email:** `operario@fletesapp.com`
- **Contraseña:** `operario123`

## ✅ ¿Qué cambió ahora?

1. **Persistencia Real:** Los datos ya no se borran al limpiar el navegador.
2. **Multi-usuario:** Puedes abrir la app en diferentes computadoras y verás los mismos datos.
3. **Seguridad:** Los operarios solo pueden editar sus propios fletes.
4. **Respaldo:** Automáticamente se creó un backup en tu `localStorage` llamado `backup_pre_migration` por seguridad.

---
### 💡 Recomendación Extra
Una vez verifiques que tus datos están en Supabase (viendo el Dashboard), puedes ejecutar `limpiarLocalStorage()` en la consola para borrar los datos locales antiguos y evitar confusiones.

**¿Ves tus datos migrados correctamente?** 🚀
