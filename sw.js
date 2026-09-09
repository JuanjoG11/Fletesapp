const CACHE_NAME = 'fletes-app-v7';
const ASSETS_TO_CACHE = [
    './',
    './index.html',
    './css/styles.css',
    './js/app.js',
    './js/supabase-client.js',
    './js/modules/planillas.js',
    './assets/img/pwa_logo.png'
];

// Instalar el Service Worker
self.addEventListener('install', (event) => {
    event.waitUntil(
        caches.open(CACHE_NAME).then((cache) => {
            return cache.addAll(ASSETS_TO_CACHE);
        })
    );
    self.skipWaiting();
});

// Activar el Service Worker
self.addEventListener('activate', (event) => {
    event.waitUntil(
        caches.keys().then((cacheNames) => {
            return Promise.all(
                cacheNames.map((cacheName) => {
                    if (cacheName !== CACHE_NAME) {
                        return caches.delete(cacheName);
                    }
                })
            );
        })
    );
    self.clients.claim();
});

// Estrategia de Cache
self.addEventListener('fetch', (event) => {
    const url = new URL(event.request.url);

    // ── IGNORAR siempre ──────────────────────────────────────────────
    // 1. Peticiones que no son GET (POST/PATCH/DELETE de Supabase)
    if (event.request.method !== 'GET') return;

    // 2. Peticiones a Supabase (API calls de datos)
    if (url.hostname.includes('supabase.co')) return;

    // 3. Peticiones a CDNs externos (no las cacheamos localmente)
    if (url.hostname.includes('cdn.jsdelivr.net') ||
        url.hostname.includes('cdnjs.cloudflare.com') ||
        url.hostname.includes('fonts.googleapis.com') ||
        url.hostname.includes('fonts.gstatic.com')) return;

    // ── app.js y modules: Network-First (siempre frescos) ───────────
    if (url.pathname.endsWith('app.js') ||
        url.pathname.includes('/js/modules/') ||
        url.pathname.endsWith('supabase-client.js')) {
        event.respondWith(
            fetch(event.request)
                .then((response) => {
                    // Solo cachear respuestas OK
                    if (response && response.status === 200 && response.type !== 'opaque') {
                        const responseClone = response.clone();
                        caches.open(CACHE_NAME).then((cache) => {
                            cache.put(event.request, responseClone);
                        });
                    }
                    return response;
                })
                .catch(() => caches.match(event.request))
        );
        return;
    }

    // ── Assets estáticos: Stale-While-Revalidate ────────────────────
    const isStaticAsset =
        url.pathname.match(/\.(css|png|jpg|jpeg|svg|woff2|ico|webp)$/) ||
        ASSETS_TO_CACHE.some(asset => event.request.url.endsWith(asset.replace('./', '')));

    if (isStaticAsset) {
        event.respondWith(
            caches.match(event.request).then((cachedResponse) => {
                const fetchPromise = fetch(event.request)
                    .then((networkResponse) => {
                        if (networkResponse && networkResponse.status === 200) {
                            const responseToCache = networkResponse.clone();
                            caches.open(CACHE_NAME).then((cache) => {
                                cache.put(event.request, responseToCache);
                            });
                        }
                        return networkResponse;
                    })
                    .catch(() => cachedResponse || null);

                if (cachedResponse) {
                    // Tenemos cache: devolvemos el cache y actualizamos en background
                    fetchPromise.catch(() => {}); // fire-and-forget, sin bloquear
                    return cachedResponse;
                }
                // No hay cache: esperamos la red
                return fetchPromise;
            })
        );
        return;
    }

    // ── HTML pages: Network-First, fallback a cache ──────────────────
    event.respondWith(
        fetch(event.request)
            .catch(() => caches.match(event.request))
    );
});
