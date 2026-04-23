window.importarJueves09 = async function() {
    const dataToImport = [
        { placa: "WFV015", poblacion: "MANIZALES", zona: "9552", auxiliaries: "ADRIAN MARTINEZ", pedidos: 46, valor: 6170476, planilla: "19174, 18183", proveedor: "ALPINA", conductor: "YONNI VALENCIA" },
        { placa: "TJX795", poblacion: "MANIZALES", zona: "9553", auxiliaries: "ARNULFO STERLING", pedidos: 47, valor: 4703300, planilla: "19175, 18165, 18184", proveedor: "ALPINA", conductor: "ANDRES QUINTERO" },
        { placa: "EYX091", poblacion: "NEIRA", zona: "9554", auxiliaries: "VICTOR PULGARIN, JUAN COCOMA", pedidos: 47, valor: 8196420, planilla: "19163, 18179", proveedor: "ALPINA", conductor: "CARLOS GOMEZ" },
        { placa: "SLI587", poblacion: "MANIZALES", zona: "9555", auxiliaries: "CRISTIAN OSPINA", pedidos: 56, valor: 7729985, planilla: "19176, 18186, 18118", fac: "AP594530 AP594548", proveedor: "ALPINA", conductor: "MIGUEL GONZALES" },
        { placa: "WLS478", poblacion: "MANIZALES", zona: "9556", auxiliaries: "JUAN ALZATE", pedidos: 54, valor: 6085679, planilla: "19177, 18187", fac: "AP594566-581-590-603-605-606", proveedor: "ALPINA", conductor: "HUMBERTO RINCON" },
        { placa: "KOL802", poblacion: "RIOSUCIO", zona: "9557", auxiliaries: "JUAN DELGADO, OSCAR RESTREPO", pedidos: 62, valor: 11825875, planilla: "19161, 18157", proveedor: "ALPINA", conductor: "RICARDO PINEDA" },
        { placa: "SMH182", poblacion: "SAN JOSE BELALCAZAR", zona: "9559", auxiliaries: "BRANDON BAEZ, EXTRA", pedidos: 55, valor: 11442537, planilla: "19186, 18182", proveedor: "ALPINA", conductor: "JUAN DAVID" },
        { placa: "SPU120", poblacion: "ARMENIA", zona: "9601, 7009", auxiliaries: "YEISON RENDON", pedidos: 59, valor: 9612556, planilla: "19155, 19179, 18163, 18164", proveedor: "ALPINA", conductor: "OSWALDO" },
        { placa: "EQY944", poblacion: "ARMENIA", zona: "9602, 7010", auxiliaries: "SEBASTIAN VILLADA", pedidos: 55, valor: 6174150, planilla: "19156, 19180", proveedor: "ALPINA", conductor: "GOBER CRISTANCHO" },
        { placa: "VZD334", poblacion: "ARMENIA", zona: "9603", auxiliaries: "ALEXANDER COSTAIN", pedidos: 57, valor: 5175804, planilla: "19181", proveedor: "ALPINA", conductor: "JULIAN CUELLAR" },
        { placa: "SNP761", poblacion: "ALCALA ULLOA", zona: "9604", auxiliaries: "CAMILO CONTRERAS", pedidos: 51, valor: 6890752, planilla: "19182, 18147", proveedor: "ALPINA", conductor: "JORGE SUAREZ" },
        { placa: "SXF257", poblacion: "CAICEDONIA", zona: "9605", auxiliaries: "CRISTIAN CAICEDO, RONALD ANGULO", pedidos: 57, valor: 12122215, planilla: "19157, 18171", obs: "FLETE CAICEDONIA $400.000", proveedor: "ALPINA", conductor: "FABIO RUIZ" },
        { placa: "TTL256", poblacion: "FILANDIA", zona: "9606, 9600", auxiliaries: "CRISTIAN CAMACHO", pedidos: 30, valor: 6784240, planilla: "19154, 19158, 18133", proveedor: "ALPINA", conductor: "YIMERSON GARCIA" },
        { placa: "SMO183", poblacion: "PEREIRA", zona: "9453", auxiliaries: "JUAN QUINTERO", pedidos: 49, valor: 6602144, planilla: "19165", proveedor: "ALPINA", conductor: "GABRIEL PEREZ" },
        { placa: "WFV015", poblacion: "PEREIRA", zona: "9454", auxiliaries: "ANDRES PINEDA", pedidos: 49, valor: 6581919, planilla: "19166", proveedor: "ALPINA", conductor: "YONNI VALENCIA" },
        { placa: "TMZ674", poblacion: "PEREIRA", zona: "9455", auxiliaries: "ANDRES RIOS", pedidos: 50, valor: 5194624, planilla: "19167", proveedor: "ALPINA", conductor: "RICARDO LOPEZ" },
        { placa: "MAT480", poblacion: "PEREIRA", zona: "7004TSS, 9455TSS", auxiliaries: "EDWAR ZAPATA, FABIAN VENDEDOR", pedidos: 26, valor: 4611487, obs: "SE CUADRO FLETE EN $280.000 ENTREGA DE TRANSITORIOS EN EL CENTRO Y AEROPUERTO", proveedor: "ALPINA", conductor: "ELKIN AGUIRRE" },
        { placa: "WHM317", poblacion: "PEREIRA", zona: "9457", auxiliaries: "CESAR CASTILLO", pedidos: 45, valor: 6237628, planilla: "19169, 18167", proveedor: "ALPINA", conductor: "HUMBERTO PARRA" },
        { placa: "PEK019", poblacion: "PEREIRA", zona: "9458", auxiliaries: "JHON GIRALDO", pedidos: 42, valor: 7539656, planilla: "19170", proveedor: "ALPINA", conductor: "MIGUEL TABARES" },
        { placa: "SJT873", poblacion: "PEREIRA", zona: "9459", auxiliaries: "ANDRES VILLA", pedidos: 39, valor: 5082750, planilla: "19171", proveedor: "ALPINA", conductor: "JUAN CARLOS" },
        { placa: "WLC133", poblacion: "PEREIRA", zona: "9460", auxiliaries: "EDWIN GOMEZ", pedidos: 36, valor: 4721439, planilla: "19172", proveedor: "ALPINA", conductor: "JULIAN" },
        { placa: "SPQ814", poblacion: "CARTAGO", zona: "9461", auxiliaries: "DIORLAN", pedidos: 48, valor: 6256412, planilla: "19173", fac: "FEP1179592-594-595-596TSS", proveedor: "ALPINA", conductor: "CARLOS VELASCO" },
        { placa: "WTN748", poblacion: "MARSELLA", zona: "7004", auxiliaries: "BRAHIAN VALENCIA, EXTRA", pedidos: 51, valor: 10836486, planilla: "19183, 18126, 18125", fac: "AP594932-933-934-950-977TSS", obs: "RUTA PENDIENTE POR CUADRAR", proveedor: "ALPINA", conductor: "DIEGO RATIVA" },
        { placa: "EST067", poblacion: "CARTAGO", zona: "7005", auxiliaries: "ARBEY LARGO", pedidos: 38, valor: 5122636, planilla: "19184, 18176, 18166", fac: "FEP1179586", proveedor: "ALPINA", conductor: "JORGE RIVILLAS" },
        { placa: "ERK303", poblacion: "APIA VIRGINIA", zona: "7006", auxiliaries: "ROBINSON TORRES", pedidos: 44, valor: 10166309, planilla: "19159", proveedor: "ALPINA", conductor: "JORGE ALARCON" },
        { placa: "TNH494", poblacion: "VITERBO", zona: "7007, 9451", auxiliaries: "LUIS CADAVID", pedidos: 49, valor: 8982711, planilla: "19160", obs: "TNH494 PAGAR EXTRA $60.000", proveedor: "ALPINA", conductor: "ADALBERTO MEJIA" },
        { placa: "LUM993", poblacion: "CUBA", zona: "FLEISCHMANN", auxiliaries: "DIEGO FRANCO", pedidos: 50, valor: 11287641, planilla: "18173, 18178, 18177, 18174", obs: "FLEISCHMANN CUBA VALOR DE FLETE $250.000", proveedor: "FLEISCHMANN", conductor: "CARLOS LASSO" }
    ];

    const IDS_MASTER = {
        "WFV015": "48fed713-21d7-4c73-b65d-ce29705e7b10", "TJX795": "02e1a8d7-28e1-4931-8f27-0307482145ee",
        "EYX091": "d1dbbff4-1918-4c44-b47a-37df57d78a18", "SLI587": "2b13fda6-2fc6-4564-922d-6cdafb3c2ec9",
        "WLS478": "c470c699-469a-406b-bdaa-1e69c27943f6", "KOL802": "80285cb2-95b2-49a1-b89d-a6d8339f5708",
        "SMH182": "63fa3e86-9f76-4b28-a1fe-5f0db62c9921", "SPU120": "4e0b64a2-8a93-47cc-9d85-06d63ac2767a",
        "EQY944": "8e8130e8-79e2-4e7d-9e3a-4e07fe05b234", "VZD334": "ee681711-c602-4483-a2bf-c1673f5e8c36",
        "SNP761": "96f6e564-e959-49fd-af3c-07816f1d6506", "SXF257": "3480e9b3-4936-4bcf-a18d-6879357adc06",
        "TTL256": "fb8a5129-2122-44ff-9044-ea42c59a32d7", "SMO183": "5215c2e4-da44-420c-849d-0baf991da549",
        "TMZ674": "7584e578-a480-4f5b-96ef-7fa551b173e0", "WHM317": "3786c7c0-3a34-44fd-9252-78424c2f6012",
        "PEK019": "d636897c-f243-4d7a-b5c3-a1f444f328e7", "SJT873": "0a96a183-5138-4073-9b44-4f589fea1683",
        "WLC133": "d9b94892-84b0-4fe1-9606-a60d061fdfcb", "SPQ814": "a4c224f7-c0bf-4395-b127-116ae8ef1771",
        "WTN748": "6394abfd-6bc6-4148-bc77-94f6a5b62113", "EST067": "0c5037ce-f52f-47ca-a980-3b38f2a8718c",
        "ERK303": "628ad1f6-55e7-4b44-92e9-4024657062e6", "TNH494": "6c768f3a-0ec9-4bde-9e48-5d016a2ef22c",
        "LUM993": "cdddc560-3e26-4caa-a0a3-1bb215e2dbcd"
    };

    Swal.fire({
        title: 'IMPORTACIÓN JUEVES 09',
        text: `Se procesarán ${dataToImport.length} registros. Se evitarán duplicados.`,
        icon: 'info', showCancelButton: true, background: '#1a1a1a', color: '#fff', confirmButtonText: 'Iniciar Carga'
    }).then(async (result) => {
        if (!result.isConfirmed) return;
        
        Swal.fire({ title: 'Cargando...', allowOutsideClick: false, didOpen: () => Swal.showLoading(), background: '#1a1a1a', color: '#fff' });
        
        try {
            // Obtener fletes ya cargados para este día para evitar duplicados
            const { data: existentes } = await SupabaseClient.supabase.from('fletes').select('placa, poblacion').eq('fecha', '2026-04-09');
            const duplicado = (placa, pobs) => existentes?.some(f => f.placa === placa && f.poblacion === pobs);

            let successCount = 0;
            let errorLog = [];

            for (const item of dataToImport) {
                if (duplicado(item.placa, item.poblacion)) {
                    continue;
                }

                let vehId = IDS_MASTER[item.placa.toUpperCase()];
                if (!vehId) {
                    const search = await SupabaseClient.supabase.from('vehiculos').select('id').eq('placa', item.placa.toUpperCase()).maybeSingle();
                    if (search.data) {
                        vehId = search.data.id;
                    } else {
                        const createVeh = await SupabaseClient.supabase.from('vehiculos').insert([{
                            placa: item.placa.toUpperCase(),
                            conductor: item.conductor || "CONDUCTOR PROGRAMADO",
                            proveedor: item.proveedor || "ALPINA",
                            activo: true, razon_social: "TAT"
                        }]).select('id').maybeSingle();
                        if (createVeh.data) vehId = createVeh.data.id;
                    }
                }

                if (!vehId) { errorLog.push(`${item.placa}: ID VEHÍCULO NO ENCONTRADO`); continue; }

                let precio = 0; let vAdicional = 0; let rAdicional = null;
                if (item.placa === 'SXF257') precio = 400000;
                if (item.placa === 'MAT480') precio = 280000;
                if (item.placa === 'LUM993') precio = 250000;
                if (item.placa === 'TNH494') { vAdicional = 60000; rAdicional = "Extra negociado"; }

                const res = await SupabaseClient.fletes.create({
                    placa: item.placa, vehiculo_id: vehId, contratista: item.conductor,
                    fecha: "2026-04-09", dia: "Jueves", poblacion: item.poblacion,
                    zona: item.zona, no_pedidos: item.pedidos, valor_ruta: item.valor,
                    auxiliares: item.auxiliaries, no_auxiliares: item.auxiliaries.includes(',') ? 2 : 1,
                    no_planilla: item.planilla || '-', facturas_adicionales: item.fac || '',
                    proveedor: item.proveedor, precio: precio || undefined,
                    valor_adicional_negociacion: vAdicional, razon_adicional_negociacion: rAdicional || item.obs || null,
                    adicionales: (item.fac || item.obs) ? "Si" : "No"
                });

                if (res.success) successCount++;
                else errorLog.push(`${item.placa}: ${res.error?.message || 'Error desconocido'}`);
            }

            Swal.fire({ 
                title: 'Resumen de Carga', 
                html: `<div style="text-align:left; font-size:0.85rem;">
                    <p style="color:#10b981">✅ Éxitos nuevos: ${successCount}</p>
                    ${errorLog.length > 0 ? `<p style="color:#ef4444">❌ Errores (${errorLog.length}):</p>
                    <ul style="max-height:150px; overflow-y:auto; padding-left:20px;">
                        ${errorLog.map(e => `<li>${e}</li>`).join('')}
                    </ul>` : '<p style="color:#10b981">Todo correcto.</p>'}
                </div>`,
                icon: errorLog.length === 0 ? 'success' : 'warning', 
                background: '#1a1a1a', color: '#fff' 
            });
            if (typeof listarFletes === 'function') listarFletes(true);
        } catch (err) {
            Swal.fire({ title: 'Error Crítico', text: err.message, icon: 'error', background: '#1a1a1a', color: '#fff' });
        }
    });
}
