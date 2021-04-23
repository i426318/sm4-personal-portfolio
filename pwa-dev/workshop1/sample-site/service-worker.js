
// 1.1 - Caching Important PWA files for offline use.
var cacheName = "pwaCache";
var appFiles = [
  "/manifest.json",
  "/scripts.js",
  "/stylesheet.css",
  "/index.html",
  "/logo.png",
  "/yes.gif",
  "/service-worker.js"
];



// install phase. One-time.
self.addEventListener("install", e => {
  console.log("Service Worker: I am being installed, hello world!");

  // 1.1 - Cache the files via install event.
  e.waitUntil( // taking a promise.

    // opening a cache in our dir.
    // then, we have the 'cache' Object.
    caches.open(cacheName).then(cache => {
      console.log("Service Worker: Caching important offline files");
      // passing through list of assets.
      return cache.addAll(appFiles);
    }).catch(e => {
      console.log("caching failed with error msg: " + e);
    })
  );

});


self.addEventListener("activate", (activating) => {
  console.log("Service Worker: All systems online, ready to go!");
});


// fetch listener. This will run once we have a 'fetch' event.

self.addEventListener("fetch", e => {
  console.log('Intercepting fetch req for: ${e.request.url}');
  e.respondWith(
    caches.match(e.request).then(response => {
      return response || fetch(e.request);
    })
  )

});



self.addEventListener("push", (pushing) => {
  console.log("Service Worker: I received some push data, but because I am still very simple I don't know what to do with it :(");
})

