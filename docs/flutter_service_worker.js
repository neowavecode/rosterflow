'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"apple-touch-icon.png": "22b06270985b99ebada881046abc492d",
"assets/AssetManifest.bin": "c422304d6e6b154c06b0a91bbae1830f",
"assets/AssetManifest.bin.json": "9626ca96d1aa71decbc91457d88a04fc",
"assets/AssetManifest.json": "6a7688cd7ca7959596d24b6c3186bab0",
"assets/assets/html/faq.html": "0d1f478c5e551d587eb9fae14bb7701c",
"assets/assets/html/privacy_policy.html": "c9225c82e49479ec0d6aa4f3231f9b5f",
"assets/assets/html/support.html": "5dfa163a843d8be195d6b2f80cacdb9c",
"assets/assets/html/terms_and_conditions.html": "ed1a3022aadedfbea05675b93e4b72ca",
"assets/assets/images/applebadge.png": "61b3e19cc791b5cae449c13b1a97d94e",
"assets/assets/images/fondoweb.png": "ba2c586bb0711064525522bfc3813ddc",
"assets/assets/images/googlebadge.png": "6bb864c31a553a23330a17fcec698677",
"assets/assets/images/logotipo.png": "9821eefbc7971f79be7e46363aa3bb94",
"assets/assets/images/slider/1.png": "aae73707cbe7e9d2cb9ec3c90e497688",
"assets/assets/images/slider/10.png": "e592068305572636e19119c12f050db2",
"assets/assets/images/slider/11.png": "8b4e73c94c6529e8976add92ca514719",
"assets/assets/images/slider/12.png": "b69e776e5eec9a346c7d527543f13c08",
"assets/assets/images/slider/13.png": "af1e603ec95c6ebe78c3a561f01be667",
"assets/assets/images/slider/14.png": "79d3c698fabb588c5c4a83d7993815ec",
"assets/assets/images/slider/15.png": "7afcb725556a49a6b30fc0f7fb21a023",
"assets/assets/images/slider/16.png": "e4b29c56523597b92ef406262dd91010",
"assets/assets/images/slider/17.png": "0c5198d6fa99c8362a573beb8a56833e",
"assets/assets/images/slider/2.png": "5646f37807564fc464951da59ac3dd01",
"assets/assets/images/slider/3.png": "7076883407e50fe90abb2a15ae914b82",
"assets/assets/images/slider/4.png": "e2c65d154769da19e7ff7307f440de98",
"assets/assets/images/slider/5.png": "2665c5ae8d6b2e3d7807c4805410220a",
"assets/assets/images/slider/6.png": "960ce5827578882bb4f6ace95d95408e",
"assets/assets/images/slider/7.png": "fc1062724ec6dc9581f9279b458ac83e",
"assets/assets/images/slider/8.png": "8a5846c0208a9cd9889405f88007fffa",
"assets/assets/images/slider/9.png": "5312bec0f35d829dfdccc9065c4e7b51",
"assets/assets/images/web1.png": "8b55bae26b5c63df9df7a5af07fe113d",
"assets/assets/videos/1.mp4": "da981321290d4697b9cc8a910b46a238",
"assets/assets/videos/10.mp4": "eb29892a477f8e8ee915e403d6af4809",
"assets/assets/videos/11.mp4": "25a856ed1a206bbf68022fb1b12fbd97",
"assets/assets/videos/12.mp4": "756c263fe00c8f536c609ca5770ae8dc",
"assets/assets/videos/13.mp4": "c6a864c18e5198eba557d319ecf4ea5d",
"assets/assets/videos/2.mp4": "477ca9b19e60768f5eae7d88a6775afe",
"assets/assets/videos/3.mp4": "fb2542e6029db3a8b8c1cb6056110366",
"assets/assets/videos/4.mp4": "e1f8062fec117d7dc34fd6b061bd3d49",
"assets/assets/videos/5.mp4": "d821dd387b425429bca85ee642686fb1",
"assets/assets/videos/6.mp4": "8da0d094eabfb437ca387ec1cb0b68e8",
"assets/assets/videos/7.mp4": "5588e1f2ec121c902b5deb06da942b4a",
"assets/assets/videos/8.mp4": "b4c941b183931f6f26b4c7bb48f11e0a",
"assets/assets/videos/9.mp4": "7b40ae46e465bb1a35ec37d1e80f1a19",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "72683d71a6a50ee7aa5d439a31fb61fe",
"assets/NOTICES": "8d99c73b5c104edd05f2d365c541d247",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/packages/flutter_inappwebview_web/assets/web/web_support.js": "509ae636cfdd93e49b5a6eaf0f06d79f",
"assets/packages/youtube_player_iframe/assets/player.html": "663ba81294a9f52b1afe96815bb6ecf9",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"faq.html": "185e0a0c703c715c0adc3ae8780145b3",
"favicon.png": "78fec5c0e4af4be03d9f8e21e47b109a",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "b6d0d438eb5da989224b7c4654f937fc",
"icons/Icon-192.png": "e8e552edb75960e648e2368344186e42",
"icons/Icon-512.png": "9821eefbc7971f79be7e46363aa3bb94",
"icons/Icon-maskable-192.png": "e8e552edb75960e648e2368344186e42",
"icons/Icon-maskable-512.png": "9821eefbc7971f79be7e46363aa3bb94",
"index.html": "13ea40d1792343a9f4466972a60f677e",
"/": "13ea40d1792343a9f4466972a60f677e",
"main.dart.js": "a67ef4c37f196c13234625165d8bfd4c",
"manifest.json": "35d4f52fd7e022b6de7e22967a7cf945",
"privacy_policy.html": "34d32e80428f71fc545978de874427bb",
"support.html": "5dfa163a843d8be195d6b2f80cacdb9c",
"terms_and_conditions.html": "f1caa38d5cbc3d5c12eed85279a2f7a1",
"version.json": "207999a8f51b5f7f4f946aa032aad716",
"web1.png": "8b55bae26b5c63df9df7a5af07fe113d"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
