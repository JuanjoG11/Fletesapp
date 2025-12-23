# Guía: Gestión Manual de Roles en Supabase

Si prefieres crear los usuarios directamente desde el panel de Supabase (Authentication), sigue estos pasos para configurar sus roles:

## Paso 1: Crear el usuario en Authentication
1. Ve a **Authentication** -> **Users**.
2. Haz clic en **Add User** -> **Create new user**.
3. Ingresa el Email y Password.

## Paso 2: Asignar el Rol en la Tabla `usuarios`
El sistema tiene un disparador (trigger) que crea automáticamente un perfil en la tabla `public.usuarios` con el rol **operario** por defecto.

Para cambiarlo a **admin**:
1. Ve a **Table Editor** en Supabase.
2. Selecciona la tabla `usuarios`.
3. Busca la fila del nuevo usuario (puedes guiarte por el email).
4. Cambia el valor de la columna `rol` de `operario` a `admin`.
5. (Opcional) Cambia el `nombre` para que aparezca correctamente en el saludo.

## Paso 3: Usar SQL (Más rápido)
Si prefieres, puedes ejecutar esto en el **SQL Editor** de Supabase:

```sql
UPDATE public.usuarios 
SET rol = 'admin', nombre = 'Tu Nombre Admin' 
WHERE email = 'tu-email@ejemplo.com';
```

---
**¿Por qué es así?**
Supabase guarda el email/clave en su sistema interno (`auth.users`), pero la aplicación consulta la tabla `public.usuarios` para saber si el usuario es Admin u Operario y así mostrar las pestañas correspondientes.
