/* ==========================================================
   🔧 FIX: Agregar ELKIN GARCIA OCAMPO a fletes ERK303
   donde no_auxiliares = 2 pero solo aparece ROVINSON TORRES RIVERA
   Total: 17 registros
   ========================================================== */

UPDATE fletes
SET auxiliares = auxiliares || ', ELKIN GARCIA OCAMPO'
WHERE id IN (
    'a0274b80-0da4-4b8f-8dad-7b47eb07e0af',
    'ccfbab39-72a2-4278-9dcc-f73dcda006ab',
    'a583151b-c168-4656-97b0-1713fbda2531',
    'd6f5f103-44ed-4777-aef6-bc71b9c04efe',
    '88e6a932-8167-4cd5-aa92-8408a7b46ce4',
    'cec330a1-1a64-41bc-84fb-f4731720651c',
    '8751c3bf-89b3-4c90-aa92-fcf95ed9caa6',
    '98c92e4b-6029-44fc-8be7-5cad486c08fe',
    '3cec170f-f8a6-4ca0-99c6-7dc2eb1f4da7',
    'ebd46216-5305-4ef5-b6ec-95113bbb8f74',
    '17baec43-1d20-4eea-984b-c9b9930f3b6a',
    'a3ef62bd-e8fa-4fa1-92dd-0f48889f4d79',
    '59d9bc07-fb24-4275-b232-12b2104a289f',
    'c731342e-a117-4f63-b267-d60f80b11a3b',
    '0f40dc91-b281-434f-83ac-540b6ef520a5',
    'fb2a6db8-e908-464d-84d5-4719c69a9a0e',
    '64f08ef8-d718-4ca4-9e4c-0ee5ce76f672'
);

/* Verificación */
SELECT fecha, placa, auxiliares, no_auxiliares
FROM fletes
WHERE id IN (
    'a0274b80-0da4-4b8f-8dad-7b47eb07e0af',
    'ccfbab39-72a2-4278-9dcc-f73dcda006ab',
    'a583151b-c168-4656-97b0-1713fbda2531',
    'd6f5f103-44ed-4777-aef6-bc71b9c04efe',
    '88e6a932-8167-4cd5-aa92-8408a7b46ce4',
    'cec330a1-1a64-41bc-84fb-f4731720651c',
    '8751c3bf-89b3-4c90-aa92-fcf95ed9caa6',
    '98c92e4b-6029-44fc-8be7-5cad486c08fe',
    '3cec170f-f8a6-4ca0-99c6-7dc2eb1f4da7',
    'ebd46216-5305-4ef5-b6ec-95113bbb8f74',
    '17baec43-1d20-4eea-984b-c9b9930f3b6a',
    'a3ef62bd-e8fa-4fa1-92dd-0f48889f4d79',
    '59d9bc07-fb24-4275-b232-12b2104a289f',
    'c731342e-a117-4f63-b267-d60f80b11a3b',
    '0f40dc91-b281-434f-83ac-540b6ef520a5',
    'fb2a6db8-e908-464d-84d5-4719c69a9a0e',
    '64f08ef8-d718-4ca4-9e4c-0ee5ce76f672'
)
ORDER BY fecha;
