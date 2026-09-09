/* ==========================================================
   MIGRACIÓN: Roles cargador_alpina y cargador_fleischmann
   Ejecutar en Supabase SQL Editor
   ==========================================================
   Agrega dos roles especializados de cargador:
     - cargador_alpina      → solo puede subir planillas ALPINA
     - cargador_fleischmann → solo puede subir planillas FLEISCHMANN

   El proveedor se bloquea automáticamente al iniciar sesión;
   no puede seleccionar otro desde la UI.
   ========================================================== */

-- 1. Actualizar constraint de roles para incluir los nuevos
ALTER TABLE usuarios DROP CONSTRAINT IF EXISTS usuarios_rol_check;

ALTER TABLE usuarios
    ADD CONSTRAINT usuarios_rol_check
    CHECK (rol IN (
        'admin',
        'operario',
        'caja',
        'cargador',
        'cargador_alpina',
        'cargador_fleischmann',
        'programador',
        'cajera_plan',
        'aprobador'
    ));

-- 2. Verificar constraint actualizado
SELECT
    conname,
    pg_get_constraintdef(oid) AS definicion
FROM pg_constraint
WHERE conrelid = 'usuarios'::regclass
  AND conname = 'usuarios_rol_check';

-- 3. (Opcional) Crear usuarios de ejemplo — ajusta email/password
-- Para crear desde SQL necesitas insertar en auth.users vía la UI de Supabase
-- o usar el endpoint de admin. Aquí solo queda documentado el INSERT de perfil:
--
-- INSERT INTO usuarios (id, nombre, rol, razon_social)
-- VALUES
--   ('<uuid-del-usuario-auth>', 'Cargadora Alpina',       'cargador_alpina',      'TYM'),
--   ('<uuid-del-usuario-auth>', 'Cargadora Fleischmann',  'cargador_fleischmann', 'TYM');
