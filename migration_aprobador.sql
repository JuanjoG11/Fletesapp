/* ==========================================================
   MIGRACIÓN: Rol aprobador
   Ejecutar en Supabase SQL Editor
   ========================================================== */

-- 1. Actualizar constraint de roles para incluir 'aprobador'
ALTER TABLE usuarios DROP CONSTRAINT IF EXISTS usuarios_rol_check;
ALTER TABLE usuarios
    ADD CONSTRAINT usuarios_rol_check
    CHECK (rol IN (
        'admin',
        'operario',
        'caja',
        'cargador',
        'programador',
        'cajera_plan',
        'aprobador'
    ));

-- 2. Verificar
SELECT conname, pg_get_constraintdef(oid)
FROM pg_constraint
WHERE conrelid = 'usuarios'::regclass
  AND conname = 'usuarios_rol_check';
