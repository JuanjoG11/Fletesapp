-- ==========================================================
-- 🚗 CARGA DE DATOS ACTUALIZADOS DE VEHÍCULOS (FEB 11, 2026)
-- ==========================================================

-- Función temporal para limpiar y convertir fechas de Excel o texto a DATE
-- Se usa DO block para que sea seguro y no deje rastro si se desea, 
-- pero aquí lo haremos directo con una expresión CASE para máxima compatibilidad.

WITH raw_data AS (
    SELECT * FROM (VALUES
        ('PEK019', '16050157', 'esperanza velez', 'Tabares Uribe Jose Miguel', '16050157', '3218533935', 'Tabares Uribe Jose Miguel', '10012141035', '45961', '45939', '46220', '46220', '45814', '46011', '16050157', 'Afiliado', 'no tiene', 'SI'),
        ('WHN317', '42153026', 'Gonzalez Vasquez Angie', 'Parra Velez Humberto', '10117470', '3116192831', 'Gonzales Velasquez Angie', '866001', '46176', '46189', '46318', '46046', '46120', '46408', '10117470', 'Afiliado', 'no tiene', 'SI'),
        ('WHM896', '10003489', 'CATERINE DIAZ', 'Cuellar Alexander', '10003489', '3127853129', 'Cuellar Alexander', '45993', '46010', '46109', '46016', NULL, '46283', '45992', '10003489', 'Presenta soporte', 'no tiene', 'SI'),
        ('ERK303', '10131524', 'Mejia Rosmira', 'Alarcon Jorge Eliecer', '10105531', '3002780055', 'Mejia Rosima', '10015601035', '46079', '46076', '46158', '28/02/2026', '46031', '47346', '10105531', 'Presenta soporte', 'no tiene', 'SI'),
        ('TMZ674', '1002730727', 'RICARDO TORO', 'RICARDO TORO', '1002730727', '3127856453', 'JHON WILSON GIRALDO', '10027083759', '45943', '46169', '45813', '45870', '45819', '49056', '10027083759', 'Presenta soporte', NULL, 'SI'),
        ('TJX795', '71263221', 'Quintero Plaza Andres Felipe', 'JAIR GOMEZ HINCAPIE', '10.123.260', '3015446571', 'Quintero Plaza Andres Felipe', '46326', '46320', '46065', '45902', NULL, '46172', '46598', '1088025054', NULL, NULL, NULL),
        ('SMH182', '71263221', 'Quintero Plaza Andres Felipe', 'Hernan Antonio Parra Palacio', '10085210', '3245560581', 'Quintero Plaza Andres Felipe', '10024014456', '46053', '46248', '46415', '45981', '46172', '48613', '10085210', 'Presenta soporte', 'no tiene', 'SI'),
        ('XVI496', '1151956079', 'HECTOR JOAQUIN RUIZ', 'HECTOR JOAQUIN RUIZ', '4348182', '3223879443', 'HECTOR JOAQUIN RUIZ', NULL, '46333', '46336', '46060', '46294', '46290', '46401', NULL, NULL, '45314', 'SI'),
        ('VZD334', '9860418', 'JULIAN CUELLAR ESCALANTE', 'JULIAN CUELLAR ESCALANTE', '9860418', '3108396644', 'JULIAN CUELLAR ESCALANTE', '10017911841', '46217', '46242', '46109', '46016', '46109', '47242', NULL, NULL, 'no tiene', 'SI'),
        ('WFV015', '1088018442', 'Daniela Lopez diaz', 'johnny grajales', '1088031659', '3023198097', 'Daniela Lopez diaz', '10027594337', '46233', '46219', '45955', '45988', '46168', '49070', '1088018442', 'Presenta soporte', 'no tiene', 'SI'),
        ('ESU446', '10018353', 'Alejandro Pulgarin Restrepo', 'Alejandro Pulgarin Restrepo', '10018353', '3137365423', 'Alejandro Pulgarin Restrepo', '10029365390', '46189', '46192', '46049', '46262', '46207', '47187', '1088018442', 'Presenta soporte', 'no tiene', 'SI'),
        ('SPQ814', '18515061', 'John James Largo Aristizabal', 'Velasco Marin Carlos Alberto', '10016439', '322 5279197', 'Velasco Marin Carlos Alberto', '10008389727', '46284', '46419', '46336', '46077', '46337', '49176', '10016439', 'Afiliado', 'no tiene', 'SI'),
        ('EST067', '10130824', 'Campiño Carlos Arturo', 'Rivillas Campiño Jorge Alberto', '10130824', '3138334196', 'carlos arturo campiño', '10019409483', '46301', '46417', '46413', '46127', '46059', '49038', '10130824', 'Presenta soporte', 'no tiene', 'SI'),
        ('TTL256', '71263221', 'Quintero Plaza Andres Felipe', 'yimerson garcia', '1088025054', '3044715908', 'Quintero Plaza Andres Felipe', '10013870041', '46068', '46063', '46231', '46050', '46067', '48112', '1053836327', NULL, NULL, NULL),
        ('TNH494', '10136046', 'Mejia Amariles Adalberto', 'Mejia Amariles Adalberto', '10136046', '3207107918', 'Mejia Amariles Adalberto', '10024630611', '46422', '46177', '46173', '45960', '46184', '46270', '10136046', 'Afiliado', 'no tiene', 'SI'),
        ('WTN748', '1097727193', 'DIEGO ALEJANDRO RATIVA RESTREPO', 'DIEGO ALEJANDRO RATIVA RESTREPO', '1097727193', '3126447852', 'DIEGO ALEJANDRO RATIVA RESTREPO', '10030511530', '46076', '46372', '46126', '46135', '46269', '46479', '1097727193', NULL, 'no tiene', 'SI'),
        ('EQY944', '1087989339', 'Cristancho Villada Gover Alberto', 'Cristancho Villada Gover Alberto', '1087989339', '3243927244', 'Cristancho Villada Gover Alberto', NULL, '46239', '46385', '46225', '46223', '46224', '48090', '1087989339', 'Afiliado', 'no', NULL),
        ('SQB119', '18505707', 'CARLOS ARTURO CASTAÑO CHARLARCA', 'CARLOS ARTURO CASTAÑO CHARLARCA', '18505707', '3016369459', 'CARLOS ARTURO CASTAÑO CHARLARCA', '10003345488', '46223', '46214', '46205', '46082', '46206', '46527', '18505707', 'PRESENTA SOPORTE', 'NO', 'SI'),
        ('PSU120', '94403520', 'ANGEL OSWALDO IBARRA DIAZ', 'DIANA PATRICIA MARIN AGUIRRE', '42138209', '3014725661', 'ANGEL OSWALDO IBARRA DIAZ', '10017064017', '46179', '45955', NULL, '45955', '46231', NULL, NULL, NULL, NULL, NULL),
        ('ESZ454', '1192800977', 'SANTIAGO MARIN RUIZ', 'SANTIAGO MARIN RUIZ', '1192800977', NULL, 'SANTIAGO MARIN RUIZ', '10035692899', NULL, NULL, '46045', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
        ('LUM993', '1088338716', 'CRISTIAN ANDRES GIRALDO GONZALEZ', 'JUAN CARLOS LASSO', '1108828516', '3245937879', 'CRISTIAN ANDRES GIRALDO GONZALEZ', '10028718223', '46103', '46103', '46352', '46210', '46383', '49504', '1108828516', NULL, NULL, 'si'),
        ('CRZ810', '24325753', 'Jose Danilo Diaz zapata', 'Jose Danilo Diaz zapata', '10223674', '3187896177', 'Jose Danilo Diaz zapata', '731811', '13685660', '46011', '45972', '46119', '45976', '46121', '10223674', NULL, 'NO TIENE', NULL),
        ('EYX091', '16090637', 'Carlos andres Gomez Villa', 'Carlos andres Gomez Villa', '16090637', '3104135901', 'Carlos andres Gomez Villa', '10030173306', '16090637', '46363', '46350', '46336', '46382', '46374', '16090637', NULL, 'NO TIENE', NULL),
        ('KOL802', '16090637', 'CARLOS ANDRES GOMEZ VILLA', 'LUIS ALEJANDRO CALDERON GIRALDO', '1058820749', '3147689362', 'Carlos andres Gomez Villa', '10036180793', '46295', '46282', '46413', '46134', '46408', '49206', '1087998185', NULL, NULL, NULL),
        ('WHN436', '16597510', 'NELSON CARE BERTINI', 'JOHN MAURICIO DIAZ HIDALGO', '75098274', '3128458680', 'Nelson Care Bertini', NULL, '45968', '46067', NULL, NULL, NULL, '49049', NULL, NULL, NULL, NULL),
        ('SLI587', '1024516570', 'ANGELA MARCELA GARZON BEDOYA', 'MIGUEL ANTONIO GONZALEZ', '79416688', '3219049412', 'ANGELA MARCELA GARZON BEDOYA', NULL, '46039', '46079', '46261', '46170', '44995', '46374', NULL, NULL, NULL, NULL),
        ('WHM622', '18.518.858', 'CARLOS ARTURO VELEZ HERRERA', 'CARLOS ARTURO VELEZ HERRERA', '18.518.858', '3136465633', 'CARLOS ARTURO VELEZ HERRERA', '10027287905', '18.518.858', '45946', '46092', '46274', '45952', NULL, NULL, NULL, NULL, NULL),
        ('WHN489', '9.872.314', 'GILBERTO ANDRES CARDONA HERRERA', 'GILBERTO ANDRES CARDONA HERRERA', '9.872.314', '3136527772', 'GILBERTO ANDRES CARDONA HERRERA', '10022044453', '9.872.314', '46098', '45967', '45980', '45959', NULL, NULL, NULL, NULL, NULL),
        ('WLC133', '18.510.538', 'GABRIEL EDUARDO PEREZ REDONDO', 'JULIAN GIRALDO QUICENO', '18.591.633', '3143778804', 'GABRIEL EDUARDO PEREZ REDONDO', '10030201516', '42.107.762', '46423', '46075', '46414', '46229', NULL, NULL, NULL, NULL, NULL),
        ('VBP660', '4.380.357', 'CARLOS ALBERTO MOLINA HERNANDEZ', 'RUBEN ALFONSO RESTREPO ZAPATA', '16.233.774', '3217451051', 'CARLOS ALBERTO MOLINA HERNANDEZ', '10026012593', '4.380.357', '46213', '46217', '46248', '45988', NULL, NULL, NULL, NULL, NULL),
        ('SWN905', '18.511.171', 'LEONARDO ECHEVERRY RAMIREZ', 'LEONARDO ECHEVERRY RAMIREZ', '18.511.171', '3216736605', 'LEONARDO ECHEVERRY RAMIREZ', '10022363089', '16.233.774', '46049', '46044', '46047', '45993', NULL, NULL, NULL, NULL, NULL),
        ('SPO480', '18.509.768', 'HERNANDO MONTES VELASQUEZ', 'HERNANDO MONTES VELASQUEZ', '18.509.768', '3152799562', 'HERNANDO MONTES VELASQUEZ', '10021217375', '18.509.768', '46248', '46247', '45988', '46097', NULL, NULL, NULL, NULL, NULL),
        ('PED694', '2471480', 'LUIS DENIS RAMIREZ ACEVEDO', 'LUIS DENIS RAMIREZ ACEVEDO', '2471480', '3214252473', 'LUIS DENIS RAMIREZ ACEVEDO', NULL, NULL, NULL, NULL, '45995', NULL, NULL, NULL, NULL, NULL, NULL),
        ('ZOC960', '16801769', 'WILSON LEMOS', 'WILSON LEMOS', '16801769', '3105385325', 'WILSON LEMOS', '10021493320', '16801769', '46192', '46175', '46365', '46090', NULL, NULL, NULL, NULL, NULL)
    ) AS t(placa, doc_contratista, contratista, conductor, cedula_conductor, telefono_conductor, titular_contrato, licencia_transito, soat, tecnomecanica, inspeccion, fumigacion, bpm, licencia_venc, num_licencia, arl, examenes, eps)
),
parsed_data AS (
    SELECT 
        UPPER(REPLACE(REPLACE(placa, ' ', ''), '-', '')) as placa,
        doc_contratista,
        contratista,
        conductor,
        cedula_conductor,
        telefono_conductor,
        titular_contrato,
        licencia_transito,
        num_licencia,
        arl,
        eps,
        -- Conversión de fechas Excel/Texto
        CASE 
            WHEN soat ~ '^[0-9]+$' THEN DATE '1899-12-30' + (soat::INT)
            WHEN soat ~ '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN TO_DATE(soat, 'DD/MM/YYYY')
            ELSE NULL 
        END as soat_vencimiento,
        CASE 
            WHEN tecnomecanica ~ '^[0-9]+$' THEN DATE '1899-12-30' + (tecnomecanica::INT)
            WHEN tecnomecanica ~ '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN TO_DATE(tecnomecanica, 'DD/MM/YYYY')
            ELSE NULL 
        END as tecnomecanica_vencimiento,
        CASE 
            WHEN inspeccion ~ '^[0-9]+$' THEN DATE '1899-12-30' + (inspeccion::INT)
            WHEN inspeccion ~ '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN TO_DATE(inspeccion, 'DD/MM/YYYY')
            ELSE NULL 
        END as inspeccion_sanitaria_vencimiento,
        CASE 
            WHEN fumigacion ~ '^[0-9]+$' THEN DATE '1899-12-30' + (fumigacion::INT)
            WHEN fumigacion ~ '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN TO_DATE(fumigacion, 'DD/MM/YYYY')
            ELSE NULL 
        END as fumigacion_vencimiento,
        CASE 
            WHEN bpm ~ '^[0-9]+$' THEN DATE '1899-12-30' + (bpm::INT)
            WHEN bpm ~ '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN TO_DATE(bpm, 'DD/MM/YYYY')
            ELSE NULL 
        END as carnet_bpm_vencimiento,
        CASE 
            WHEN licencia_venc ~ '^[0-9]+$' THEN DATE '1899-12-30' + (licencia_venc::INT)
            WHEN licencia_venc ~ '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN TO_DATE(licencia_venc, 'DD/MM/YYYY')
            ELSE NULL 
        END as licencia_conduccion_vencimiento,
        CASE 
            WHEN examenes ~ '^[0-9]+$' THEN DATE '1899-12-30' + (examenes::INT)
            WHEN examenes ~ '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN TO_DATE(examenes, 'DD/MM/YYYY')
            ELSE NULL 
        END as examenes_medicos_vencimiento
    FROM raw_data
)
INSERT INTO vehiculos (
    placa, razon_social, doc_contratista, contratista, conductor, cedula_conductor, 
    telefono_conductor, titular_contrato, licencia_transito, 
    soat_vencimiento, tecnomecanica_vencimiento, inspeccion_sanitaria_vencimiento, 
    fumigacion_vencimiento, carnet_bpm_vencimiento, licencia_conduccion_vencimiento, 
    num_licencia_conduccion, arl_afiliacion, examenes_medicos_vencimiento, eps_afiliacion,
    activo
)
SELECT 
    pd.placa, 
    rs.nombre as razon_social,
    pd.doc_contratista, 
    pd.contratista, 
    COALESCE(pd.conductor, 'CONDUCTOR DESCONOCIDO') as conductor, 
    pd.cedula_conductor, 
    pd.telefono_conductor, 
    pd.titular_contrato, 
    pd.licencia_transito, 
    pd.soat_vencimiento, 
    pd.tecnomecanica_vencimiento, 
    pd.inspeccion_sanitaria_vencimiento, 
    pd.fumigacion_vencimiento, 
    pd.carnet_bpm_vencimiento, 
    pd.licencia_conduccion_vencimiento, 
    pd.num_licencia, 
    pd.arl, 
    pd.examenes_medicos_vencimiento, 
    pd.eps,
    TRUE
FROM parsed_data pd
CROSS JOIN (SELECT unnest(ARRAY['TYM', 'TAT']) as nombre) rs
ON CONFLICT (placa, razon_social) DO UPDATE SET
    doc_contratista = EXCLUDED.doc_contratista,
    contratista = EXCLUDED.contratista,
    conductor = EXCLUDED.conductor,
    cedula_conductor = EXCLUDED.cedula_conductor,
    telefono_conductor = EXCLUDED.telefono_conductor,
    titular_contrato = EXCLUDED.titular_contrato,
    licencia_transito = EXCLUDED.licencia_transito,
    soat_vencimiento = COALESCE(EXCLUDED.soat_vencimiento, vehiculos.soat_vencimiento),
    tecnomecanica_vencimiento = COALESCE(EXCLUDED.tecnomecanica_vencimiento, vehiculos.tecnomecanica_vencimiento),
    inspeccion_sanitaria_vencimiento = COALESCE(EXCLUDED.inspeccion_sanitaria_vencimiento, vehiculos.inspeccion_sanitaria_vencimiento),
    fumigacion_vencimiento = COALESCE(EXCLUDED.fumigacion_vencimiento, vehiculos.fumigacion_vencimiento),
    carnet_bpm_vencimiento = COALESCE(EXCLUDED.carnet_bpm_vencimiento, vehiculos.carnet_bpm_vencimiento),
    licencia_conduccion_vencimiento = COALESCE(EXCLUDED.licencia_conduccion_vencimiento, vehiculos.licencia_conduccion_vencimiento),
    num_licencia_conduccion = EXCLUDED.num_licencia_conduccion,
    arl_afiliacion = EXCLUDED.arl_afiliacion,
    examenes_medicos_vencimiento = COALESCE(EXCLUDED.examenes_medicos_vencimiento, vehiculos.examenes_medicos_vencimiento),
    eps_afiliacion = EXCLUDED.eps_afiliacion;
