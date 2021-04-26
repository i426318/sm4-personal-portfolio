
// 1.1 - Caching Important PWA files for offline use.
// beating heart of a pwa.

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
  console.log('Intercepting fetch req for: ' + e.request.url);
  e.respondWith(
    caches.match(e.request).then(response => {
      return response || fetch(e.request);
    })
  )

});



self.addEventListener("push", (pushing) => {
  console.log("lets do some push push...");

  if(pushing.data){
    pushdata=JSON.parse(pushing.data.text());		
    console.log("Service Worker: I received this:",pushdata);

    if((pushdata["title"]!="")&&(pushdata["message"]!="")){			
      const options={ body:pushdata["message"] }
      self.registration.showNotification(pushdata["title"],options);
      console.log("Service Worker: I made a notification for the user");
    } else {
      console.log("Service Worker: I didn't make a notification for the user, not all the info was there :(");			
    }
  }
})

self.addEventListener("notificationclick",function(clicking){
  const pageToOpen="/scripts.js";
	const promiseChain=clients.openWindow(pageToOpen);
	event.waitUntil(promiseChain);
});