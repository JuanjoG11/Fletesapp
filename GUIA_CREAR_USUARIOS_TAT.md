# Guía: Crear Usuarios TAT

Esta guía explica cómo crear usuarios para la razón social **TAT** (Transportes, Almacenes y Talleres).

## Proceso Completo

### Paso 1: Crear Usuario en Supabase Authentication

1. Ve a tu proyecto en [Supabase Dashboard](https://app.supabase.com)
2. Click en **Authentication** en el menú lateral
3. Click en **Users**
4. Click en **Add User** → **Create new user**
5. Completa el formulario:
   - **Email**: `usuario@tat.com`
   - **Password**: Contraseña segura
   - **Email Confirm**: ✅ Marcar como confirmado
6. Click en **Create User**

### Paso 2: Asignar Razón Social TAT

Ahora debes actualizar la tabla `usuarios` para asignar la empresa correcta:

1. Ve a **SQL Editor** en Supabase
2. Ejecuta el siguiente comando:

```sql
UPDATE public.usuarios 
SET razon_social = 'TAT', 
    rol = 'operario',  -- Cambia a 'admin' si necesitas admin de TAT
    nombre = 'Nombre del Usuario'
WHERE email = 'usuario@tat.com';
```

### Paso 3: Verificar Configuración

Verifica que el usuario se creó correctamente:

```sql
SELECT 
    email, 
    nombre, 
    rol, 
    razon_social,
    created_at
FROM public.usuarios 
WHERE email = 'usuario@tat.com';
```

**Resultado esperado:**
```
email             | nombre           | rol      | razon_social | created_at
usuario@tat.com   | Nombre Usuario   | operario | TAT         | 2024-12-30...
```

## ¿Qué Verá el Usuario TAT?

Una vez que el usuario inicie sesión, automáticamente verá:

### ✅ Funcionalidad TAT
- **Proveedores:** Solo UNILEVER y FAMILIA
- **Zonas UNILEVER:** MXEJ1301, MXEJ1300, MNEJ1300-TSS, TEJ1300-TEJ1308, TEJ1400-TEJ1405, MXEJ1400-MXEJ1402, MNEJ1400-MNEJ1401
- **Zonas FAMILIA:** FC01, FC02, FC03, FC04
- **Vehículos:** Solo vehículos registrados con `razon_social='TAT'`
- **Fletes:** Solo fletes creados por usuarios TAT
- **Estadísticas:** KPIs calculados solo con datos de TAT

### ❌ Aislamiento
- **NO** verá datos de TYM (usuarios, fletes, vehículos)
- **NO** podrá acceder a proveedores TYM (ALPINA, ZENU, POLAR)
- **NO** podrá ver zonas TYM

## Crear Administrador TAT

Para crear un usuario con permisos de admin en TAT:

```sql
UPDATE public.usuarios 
SET razon_social = 'TAT', 
    rol = 'admin',  -- Admin de TAT
    nombre = 'Admin TAT'
WHERE email = 'admin@tat.com';
```

Los **admins de TAT** podrán:
- ✅ Gestionar vehículos TAT
- ✅ Editar/eliminar fletes TAT
- ✅ Ver estadísticas TAT
- ❌ NO pueden acceder a panel de gestión (solo lectura desde Supabase)

## Crear Vehículos para TAT

Los vehículos también deben estar asignados a TAT:

### Opción 1: Desde SQL (Migración masiva)

```sql
-- Crear vehículos para TAT
INSERT INTO public.vehiculos (placa, conductor, modelo, razon_social, activo)
VALUES 
    ('TAT001', 'Conductor 1', 'Camión', 'TAT', true),
    ('TAT002', 'Conductor 2', 'Van', 'TAT', true),
    ('TAT003', 'Conductor 3', 'Camión', 'TAT', true);
```

### Opción 2: Desde la Aplicación

1. Iniciar sesión como usuario TAT (operario o admin)
2. Ir a **Nuevo Vehículo**
3. Registrar vehículo normalmente
4. El vehículo se creará automáticamente con `razon_social = 'TAT'`

## Troubleshooting

### ❌ Usuario no ve proveedores TAT

**Problema:** El usuario ve proveedores TYM o ningún proveedor

**Solución:**
```sql
-- Verificar razon_social
SELECT email, razon_social FROM public.usuarios WHERE email = 'usuario@tat.com';

-- Si es NULL o 'TYM', corregir:
UPDATE public.usuarios SET razon_social = 'TAT' WHERE email = 'usuario@tat.com';
```

### ❌ No puede ver vehículos

**Problema:** El listado de vehículos está vacío

**Solución:** Los vehículos TAT deben ser creados específicamente para TAT. Verificar:

```sql
SELECT placa, conductor, razon_social 
FROM public.vehiculos 
WHERE razon_social = 'TAT';
```

Si no hay vehículos, crear algunos según Opción 1 arriba.

### ❌ Error de permisos al crear flete

**Problema:** "No tiene permisos para crear flete"

**Causas comunes:**
1. Usuario no tiene `razon_social` asignado
2. RLS policies no actualizadas

**Solución:**
```sql
-- Re-ejecutar script de migración
-- Ver migration_multi_tenant.sql sección 4
```

## Resumen Rápido

```bash
# 1. Crear en Auth
Supabase → Authentication → Users → Add User

# 2. Asignar TAT
UPDATE usuarios SET razon_social='TAT', rol='operario' WHERE email='...';

# 3. Verificar
SELECT * FROM usuarios WHERE email='...';

# 4. Usuario listo para usar ✅
```

---

**Importante:** Todos los cambios de razón social deben hacerse desde Supabase SQL Editor. La aplicación solo **lee** esta información, no la modifica.
