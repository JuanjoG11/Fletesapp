-- ==========================================================
-- ⚡ FUNCIÓN PARA OPTIMIZAR DASHBOARD (Ejecutar en Supabase SQL Editor)
-- ==========================================================
-- Esta función calcula todas las estadísticas en el servidor
-- para evitar descargar miles de registros al celular del usuario.

create or replace function obtener_kpis_dashboard(filtros jsonb default '{}'::jsonb)
returns jsonb
language plpgsql
security definer
as $$
declare
    v_total_fletes bigint;
    v_ingresos_mes numeric;
    v_vehiculos_activos bigint;
    v_zonas jsonb;
    v_ingresos_dia jsonb;
    v_fecha_inicio date;
    v_fecha_fin date;
    v_razon_social text;
begin
    -- 1. Extraer filtros
    v_razon_social := (filtros->>'razon_social');
    
    -- Por defecto mes actual si no se especifica
    v_fecha_inicio := (date_trunc('month', now()::date))::date;
    v_fecha_fin := (date_trunc('month', now()::date) + interval '1 month' - interval '1 day')::date;

    -- 2. Calcular Total Fletes (Histórico o del Mes? Dashboard suele mostrar Totales)
    -- Para KPIs "Total Fletes" usaremos el Histórico total
    select count(*) into v_total_fletes
    from fletes
    where 
        case 
            when v_razon_social = 'TAT' then razon_social = 'TAT' or proveedor = 'POLAR'
            when v_razon_social = 'TYM' then razon_social = 'TYM'
            else true 
        end;

    -- 3. Calcular Ingresos del Mes Actual
    select coalesce(sum(precio), 0) into v_ingresos_mes
    from fletes
    where fecha >= v_fecha_inicio and fecha <= v_fecha_fin
    and (
        case 
            when v_razon_social = 'TAT' then razon_social = 'TAT' or proveedor = 'POLAR'
            when v_razon_social = 'TYM' then razon_social = 'TYM'
            else true 
        end
    );

    -- 4. Vehículos Activos
    select count(*) into v_vehiculos_activos
    from vehiculos
    where activo = true
    and (
        case 
            when v_razon_social is not null then razon_social = v_razon_social
            else true
        end
    );

    -- 5. Gráfico Dona: Fletes por Zona (Valor Total Histórico o Mes?)
    -- Usualmente es útil ver el acumulado general o del año. Vamos a limitar al Año Actual para rendimiento.
    select jsonb_object_agg(zona, total) into v_zonas
    from (
        select zona, sum(precio) as total
        from fletes
        where fecha >= date_trunc('year', now()) -- Solo año actual
        and (
            case 
                when v_razon_social = 'TAT' then razon_social = 'TAT' or proveedor = 'POLAR'
                when v_razon_social = 'TYM' then razon_social = 'TYM'
                else true 
            end
        )
        group by zona
    ) t;

    -- 6. Gráfico Barras: Ingresos por Día (Mes Actual)
    select jsonb_object_agg(fecha, total) into v_ingresos_dia
    from (
        select fecha, sum(precio) as total
        from fletes
        where fecha >= v_fecha_inicio and fecha <= v_fecha_fin
        and (
            case 
                when v_razon_social = 'TAT' then razon_social = 'TAT' or proveedor = 'POLAR'
                when v_razon_social = 'TYM' then razon_social = 'TYM'
                else true 
            end
        )
        group by fecha
    ) t;

    -- Retornar todo en un solo JSON
    return jsonb_build_object(
        'totalFletes', v_total_fletes,
        'ingresosMes', v_ingresos_mes,
        'vehiculosActivos', v_vehiculos_activos,
        'zonas', coalesce(v_zonas, '{}'::jsonb),
        'ingresosPorDia', coalesce(v_ingresos_dia, '{}'::jsonb)
    );
end;
$$;
