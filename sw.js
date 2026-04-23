const CACHE_NAME = 'fletes-app-v5';
const ASSETS_TO_CACHE = [
    './',
    './index.html',
    './css/styles.css',
    './js/app.js',
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

// Estrategia de Cache: Stale-While-Revalidate para assets, Network-First para el resto
self.addEventListener('fetch', (event) => {
    const url = new URL(event.request.url);

    // Si es app.js, usar Network-First siempre para evitar cache de precios
    if (url.pathname.endsWith('app.js')) {
        event.respondWith(
            fetch(event.request).then((response) => {
                const clonedResponse = response.clone();
                caches.open(CACHE_NAME).then((cache) => {
                    cache.put(event.request, clonedResponse);
                });
                return response;
            }).catch(() => {
                return caches.match(event.request);
            })
        );
        return;
    }

    // Si es un asset estático (CSS, Imágenes, otras Libs), usar Stale-While-Revalidate
    const isStaticAsset = ASSETS_TO_CACHE.some(asset => event.request.url.includes(asset.replace('./', ''))) ||
        url.pathname.match(/\.(css|png|jpg|jpeg|svg|woff2)$/);

    if (isStaticAsset) {
        event.respondWith(
            caches.match(event.request).then((cachedResponse) => {
                const fetchPromise = fetch(event.request).then((networkResponse) => {
                    caches.open(CACHE_NAME).then((cache) => {
                        cache.put(event.request, networkResponse.clone());
                    });
                    return networkResponse;
                });
                return cachedResponse || fetchPromise;
            })
        );
    } else {
        // Para el resto (HTML, API calls de Supabase - aunque éstas suelen ser POST/PATCH), red primero
        event.respondWith(
            fetch(event.request).catch(() => {
                return caches.match(event.request);
            })
        );
    }
});
