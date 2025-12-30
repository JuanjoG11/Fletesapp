# 🚨 SOLUCIÓN URGENTE: TAT ve datos de TYM

## Problema
Usuario TAT (Sebastian Arias) está viendo TODOS los datos de TYM:
- 17 fletes de TYM
- 43 vehículos de TYM
- Estadísticas de TYM

## Causa
Las políticas RLS (Row Level Security) no están aplicadas correctamente, probablemente porque quedó una política temporal `USING (true)` que permite ver todo.

## Solución Inmediata

### Paso 1: Identificar email del usuario TAT

```sql
SELECT email, nombre, razon_social FROM public.usuarios;
```

Busca el email de Sebastian Arias / usuario TAT

### Paso 2: Ejecutar corrección

```sql
-- REEMPLAZA 'email-tat@ejemplo.com' con el email real
UPDATE public.usuarios 
SET razon_social = 'TAT'
WHERE email = 'email-tat@ejemplo.com';

-- Eliminar políticas malas
DROP POLICY IF EXISTS "Acceso temporal usuarios" ON public.usuarios;
DROP POLICY IF EXISTS "Acceso temporal fletes" ON public.fletes;
DROP POLICY IF EXISTS "Acceso temporal vehiculos" ON public.vehiculos;

-- Crear políticas correctas
CREATE POLICY "Aislamiento por empresa - fletes" 
ON public.fletes FOR ALL USING (
    razon_social = (SELECT razon_social FROM public.usuarios WHERE id = auth.uid())
);

CREATE POLICY "Aislamiento por empresa - vehiculos" 
ON public.vehiculos FOR ALL USING (
    razon_social = (SELECT razon_social FROM public.usuarios WHERE id = auth.uid())
);

-- Activar RLS
ALTER TABLE public.fletes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.vehiculos ENABLE ROW LEVEL SECURITY;
```

### Paso 3: Cerrar sesión TAT y volver a entrar

1. Usuario TAT: Cerrar sesión
2. Volver a iniciar sesión
3. **Debe ver 0 fletes, 0 vehículos, 0 estadísticas**

## Verificación

```sql
-- Como usuario TAT, esto debe retornar 0
SELECT COUNT(*) FROM public.fletes WHERE razon_social = 'TYM';

-- Como usuario TYM, esto debe retornar el total
SELECT COUNT(*) FROM public.fletes WHERE razon_social = 'TYM';
```

## Script Completo

Usa `FIX_URGENTE_AISLAMIENTO.sql` que tiene todo automatizado.
