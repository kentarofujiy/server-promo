document.addEventListener("turbolinks:load", function(){
    
    var map = new GMaps({
        div: '#map',
        lat: -22.9045491,	
        lng: -47.0502439
    });
    
    window.map = map;
    
    var pois = JSON.parse(document.querySelector("#map").dataset.pois);
    window.pois = pois;
    
    var bounds = new google.maps.LatLngBounds();
    pois.forEach(function(poi) {
        if (poi.latitude && poi.longitude) {
        var marker = map.addMarker ({
            lat:  poi.latitude,
            lng: poi.longitude,
            title:  poi.address,
            infoWindow: { 
            content: `<p>${poi.name}
            <h3>${poi.string}</h3>
            <a href='/pois/${poi.id}'>${poi.address}</a>
            </p>`
        }
        });
       // bounds.extend(marker.position);
        }
    });
    // map.fitBounds(bounds);
    
//     map.drawRoute({
//   origin: [-22.9045491, -47.0502439],
//   destination: [-22.8902546, -47.0488902],
//   travelMode: 'driving',
//   strokeColor: '#131540',
//   strokeOpacity: 0.6,
//   strokeWeight: 6
// });
    
    // var l = document.querySelector("#map").dataset.l;
    //     if (l) {
    //         var latlng = l.split(',');
    //         var southWest = new google.maps.LatLng(latlng[0], latlng[1]);
    //         var northEast = new google.maps.LatLng(latlng[2], latlng[3]);
    //         var bounds = new google.maps.LatLngBounds(southWest, northEast);
    //         map.fitBounds(bounds);
    //         } else {
    //             map.fitZoom();
    //         }
    
      var l = document.querySelector("#map").dataset.l;
  if (l) {
    var latlngs   = l.split(',');
    var southWest = new google.maps.LatLng(latlngs[0], latlngs[1]);
    var northEast = new google.maps.LatLng(latlngs[2], latlngs[3]);
    var bounds    = new google.maps.LatLngBounds(southWest, northEast);
    map.fitBounds(bounds, 0);
  } else {
    map.fitZoom();
  }

            
    document.querySelector("#redo-search").addEventListener("click", function(e){
        e.preventDefault();
  
        var bounds = map.getBounds();
        var location = bounds.getSouthWest().toUrlValue() + "," + bounds.getNorthEast().toUrlValue();
        
          Turbolinks.visit(`/pois?l=${location}`);
    });
});