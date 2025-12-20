    -- ============================================
    -- 🛠️ REPARACIÓN UNIVERSAL - FLETESAPP
    -- ============================================
    -- Este script REPARA tu base de datos y la sincroniza con la App.
    -- Copia esto, pégalo en el SQL EDITOR de Supabase y dale a RUN.

    -- 1. EXTENSIONES
    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

    -- 2. TABLA USUARIOS (Garantizar estructura)
    CREATE TABLE IF NOT EXISTS public.usuarios (
        id UUID PRIMARY KEY,
        email TEXT UNIQUE NOT NULL,
        nombre TEXT NOT NULL,
        rol TEXT NOT NULL CHECK (rol IN ('admin', 'operario')),
        created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
        updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
    );

    -- 3. TABLA VEHICULOS
    CREATE TABLE IF NOT EXISTS public.vehiculos (
        id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
        placa TEXT UNIQUE NOT NULL,
        conductor TEXT NOT NULL,
        capacidad TEXT,
        modelo TEXT,
        activo BOOLEAN DEFAULT TRUE,
        created_by UUID REFERENCES public.usuarios(id) ON DELETE SET NULL,
        created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
        updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
    );

    -- 4. TABLA FLETES
    CREATE TABLE IF NOT EXISTS public.fletes (
        id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
        vehiculo_id UUID REFERENCES public.vehiculos(id) ON DELETE SET NULL,
        user_id UUID REFERENCES public.usuarios(id) ON DELETE SET NULL,
        fecha DATE NOT NULL,
        dia TEXT,
        contratista TEXT NOT NULL,
        zona TEXT NOT NULL,
        poblacion TEXT,
        valor_ruta NUMERIC(12, 2) DEFAULT 0,
        precio NUMERIC(12, 2) NOT NULL,
        adicionales TEXT,
        no_pedidos INTEGER DEFAULT 0,
        auxiliares TEXT,
        no_auxiliares INTEGER DEFAULT 0,
        created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
        updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
    );

    -- 5. SINCRONIZACIÓN DE PERFILES (Trigger automático)
    CREATE OR REPLACE FUNCTION handle_new_user()
    RETURNS TRIGGER AS $$
    BEGIN
        -- Primero intentamos eliminar cualquier perfil huérfano con el mismo email
        -- para evitar conflictos de UNIQUE (email)
        DELETE FROM public.usuarios WHERE email = NEW.email AND id != NEW.id;

        INSERT INTO public.usuarios (id, email, nombre, rol)
        VALUES (
            NEW.id,
            NEW.email,
            COALESCE(NEW.raw_user_meta_data->>'nombre', 'Usuario Nuevo'),
            COALESCE(NEW.raw_user_meta_data->>'rol', 'operario') -- Por seguridad, por defecto operario
        ) ON CONFLICT (id) DO UPDATE SET 
            email = EXCLUDED.email,
            nombre = EXCLUDED.nombre,
            rol = EXCLUDED.rol;
        RETURN NEW;
    END;
    $$ LANGUAGE plpgsql SECURITY DEFINER;

    DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
    CREATE TRIGGER on_auth_user_created
        AFTER INSERT ON auth.users
        FOR EACH ROW EXECUTE FUNCTION handle_new_user();

    -- 6. SEGURIDAD (Permitir todo a usuarios logueados para pruebas)
    ALTER TABLE public.usuarios ENABLE ROW LEVEL SECURITY;
    ALTER TABLE public.vehiculos ENABLE ROW LEVEL SECURITY;
    ALTER TABLE public.fletes ENABLE ROW LEVEL SECURITY;

    DROP POLICY IF EXISTS "Acceso total autenticados" ON public.usuarios;
    CREATE POLICY "Acceso total autenticados" ON public.usuarios FOR ALL USING (auth.role() = 'authenticated');

    DROP POLICY IF EXISTS "Acceso total autenticados" ON public.vehiculos;
    CREATE POLICY "Acceso total autenticados" ON public.vehiculos FOR ALL USING (auth.role() = 'authenticated');

    DROP POLICY IF EXISTS "Acceso total autenticados" ON public.fletes;
    CREATE POLICY "Acceso total autenticados" ON public.fletes FOR ALL USING (auth.role() = 'authenticated');

    -- 7. VISTA PARA LA APP (Vital para listar fletes)
    DROP VIEW IF EXISTS public.vista_fletes_completos;
    CREATE OR REPLACE VIEW public.vista_fletes_completos AS
    SELECT 
        f.*,
        v.placa,
        v.conductor,
        v.modelo as vehiculo_modelo,
        u.nombre as creado_por
    FROM public.fletes f
    LEFT JOIN public.vehiculos v ON f.vehiculo_id = v.id
    LEFT JOIN public.usuarios u ON f.user_id = u.id;

    -- 8. REPARACIÓN MANUAL INMEDIATA (Crea perfiles para usuarios existentes)
    -- Primero limpiamos perfiles sin dueño en Auth
    DELETE FROM public.usuarios WHERE id NOT IN (SELECT id FROM auth.users);

    -- Luego insertamos/actualizamos perfiles para todos los de Auth
    INSERT INTO public.usuarios (id, email, nombre, rol)
    SELECT 
        id, 
        email, 
        COALESCE(raw_user_meta_data->>'nombre', 'Usuario de Auth'),
        COALESCE(raw_user_meta_data->>'rol', 'operario')
    FROM auth.users
    ON CONFLICT (id) DO UPDATE SET 
        email = EXCLUDED.email,
        rol = COALESCE(public.usuarios.rol, EXCLUDED.rol);

    -- 9. DATOS DE PRUEBA (Para ver si carga algo)
    INSERT INTO public.vehiculos (placa, conductor, modelo)
    VALUES ('PRUEBA-1', 'Conductor Demo', '2024')
    ON CONFLICT (placa) DO NOTHING;

    -- ============================================
    -- SCRIPT COMPLETADO ✅
    -- ============================================
    -- Verifica que las tablas se crearon correctamente:
    -- SELECT table_name FROM information_schema.tables 
    -- WHERE table_schema = 'public';
