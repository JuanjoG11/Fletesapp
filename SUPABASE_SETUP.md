# 🚀 Guía de Configuración de Supabase para Fletesapp

Esta guía te ayudará a configurar Supabase paso a paso para migrar tu aplicación de localStorage a una base de datos en la nube.

## Paso 1: Crear Cuenta en Supabase

1. Ve a [https://supabase.com](https://supabase.com)
2. Haz clic en **"Start your project"** o **"Sign Up"**
3. Puedes registrarte con:
   - GitHub (recomendado)
   - Google
   - Email

## Paso 2: Crear Nuevo Proyecto

1. Una vez dentro, haz clic en **"New Project"**
2. Completa la información:
   - **Name**: `fletesapp` (o el nombre que prefieras)
   - **Database Password**: Crea una contraseña segura (guárdala, la necesitarás)
   - **Region**: Selecciona `South America (São Paulo)` (más cercano a Colombia)
   - **Pricing Plan**: Selecciona **Free** (hasta 500MB gratis)
3. Haz clic en **"Create new project"**
4. Espera 2-3 minutos mientras se crea el proyecto

## Paso 3: Obtener Credenciales

1. En tu proyecto, ve al menú lateral y haz clic en **⚙️ Settings**
2. Luego haz clic en **API**
3. Copia los siguientes valores:

   📋 **Project URL** (ejemplo: `https://abcdefgh.supabase.co`)
   
   📋 **anon public** key (es una clave larga que comienza con `eyJ...`)

4. **IMPORTANTE**: Guarda estos valores en un lugar seguro

## Paso 4: Ejecutar Script SQL

1. En el menú lateral de Supabase, haz clic en **🔨 SQL Editor**
2. Haz clic en **"New query"**
3. Abre el archivo `supabase-setup.sql` de tu proyecto
4. Copia TODO el contenido del archivo
5. Pégalo en el editor SQL de Supabase
6. Haz clic en **"Run"** (esquina inferior derecha)
7. Deberías ver el mensaje: ✅ **"Success. No rows returned"**

## Paso 5: Configurar Variables de Entorno

1. En tu proyecto Fletesapp, crea un archivo llamado `.env` (copia de `.env.example`)
2. Pega tus credenciales:

```
SUPABASE_URL=https://TU-PROYECTO.supabase.co
SUPABASE_ANON_KEY=eyJ...tu-clave-larga...
```

3. Reemplaza los valores con los que copiaste en el Paso 3

## Paso 6: Verificar Tablas Creadas

1. En Supabase, ve a **📊 Table Editor** (menú lateral)
2. Deberías ver 3 tablas:
   - ✅ `usuarios`
   - ✅ `vehiculos`
   - ✅ `fletes`
3. Haz clic en cada una para verificar las columnas

## Paso 7: Actualizar el Código

1. Abre el archivo `supabase-client.js`
2. Busca esta sección:

```javascript
const SUPABASE_URL = 'TU_URL_AQUI';
const SUPABASE_ANON_KEY = 'TU_ANON_KEY_AQUI';
```

3. Reemplaza con tus credenciales reales

## Paso 8: Migrar Datos Existentes

1. Abre `dashboard.html` en tu navegador
2. Abre la consola del navegador (F12)
3. Ejecuta el script de migración incluido
4. Verifica en Supabase que los datos se importaron correctamente

## Paso 9: Probar la Aplicación

1. Cierra sesión de la aplicación actual
2. Vuelve a `index.html`
3. Crea un nuevo usuario de prueba
4. Ingresa con las credenciales
5. Verifica que puedes:
   - Ver vehículos
   - Crear fletes
   - Ver estadísticas
   - Exportar reportes

## 🔒 Seguridad

- ✅ **Row Level Security (RLS)** ya está configurado
- ✅ Las políticas de acceso están activas:
  - Admin: puede gestionar vehículos
  - Operario: puede crear y editar sus propios fletes
- ⚠️ Nunca compartas tu `SUPABASE_ANON_KEY` públicamente

## 🆘 Solución de Problemas

### Error: "Invalid API key"
- Verifica que copiaste correctamente la `anon public` key
- Asegúrate de no incluir espacios adicionales

### Error: "Failed to fetch"
- Verifica tu conexión a internet
- Confirma que la URL del proyecto es correcta

### No aparecen los datos
- Ve a Supabase → Table Editor
- Verifica que las tablas tienen datos
- Revisa la consola del navegador para errores

## 📞 Soporte

Si tienes problemas:
1. Revisa los logs en la consola del navegador (F12)
2. Verifica los logs en Supabase → Logs
3. Consulta la documentación: [https://supabase.com/docs](https://supabase.com/docs)
