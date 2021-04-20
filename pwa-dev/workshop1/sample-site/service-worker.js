
// 1.1 - Caching Important PWA files for offline use.
const cacheName="pwaCache";
const appFiles=[
  "/manifest.json",
  "/scripts.js",
  "/css/stylesheet.css",
  "/images/yes.gif",
  "/index.html"
];




self.addEventListener("install",(installing)=>{
    console.log("Service Worker: I am being installed, hello world!");
    
    // 1.1 - Cache the files via install event.
    installing.waitUntil(
      caches.open(cacheName).then((cache)=>{
        console.log("Service Worker: Caching important offline files");
        return cache.addAll(appFiles);
      })
    );

  });
  
  self.addEventListener("activate",(activating)=>{	
    console.log("Service Worker: All systems online, ready to go!");
  });
  

  self.addEventListener("fetch",(fetching)=>{   
    console.log("Service Worker: User threw a ball, I need to fetch it!");

    fetching.respondWith( //respond fetch with...

      // a match in the fetch request! then...
      caches.match(fetching.request.url).then((response)=>{

        // fetching the resources...
        console.log("Service Worker: Fetching resource "+fetching.request.url);

        // return response OR fetch request (offline no url?) then...
        return response||fetch(fetching.request).then((response)=>{

          // the fetch request is not available in cache.
          console.log("Service Worker: Resource "+fetching.request.url+" not available in cache");
          // returns cache then...
          return caches.open(cacheName).then((cache)=>{
            // caching new resource?...
              console.log("Service Worker: Caching (new) resource "+fetching.request.url);
              cache.put(fetching.request,response.clone());
            return response;
          });
        }).catch(function(){      
          console.log("Service Worker: Fetching online failed, HAALLPPPP!!!");
          //Do something else with the request (respond with a different cached file)

        })
      })
    );


  });
  
  self.addEventListener("push",(pushing)=>{
      console.log("Service Worker: I received some push data, but because I am still very simple I don't know what to do with it :(");
  })
  
  