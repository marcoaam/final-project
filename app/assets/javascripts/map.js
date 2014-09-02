/*handler = Gmaps.build('Google');
handler.buildMap({ provider: {}, internal: {id: 'map'}},  function(){
 markers = handler.addMarkers(<%=raw @hash.to_json %>);

  handler.bounds.extendWith(markers);
  handler.fitMapToBounds();
});




    var map = new GMaps({
     div: '#map',
     lat: -12.043333,
     lng: -77.028333
   });

   GMaps.geocode({
    lat: prop.latitude,
     lng: prop.longitude
     callback: function(results, status) {
       if (status == 'OK') {
         var latlng = results[0].geometry.location;
         map.setCenter(latlng.lat(), latlng.lng());
         map.addMarker({
           lat: latlng.lat(),
           lng: latlng.lng()
         });
       }
     }
   });


+ $('#map').data('latitude'), + $('#map').data('longitude'),



 handler = Gmaps.build('Google');
handler.buildMap({ provider: {}, internal: {id: 'map'}},  function(){
  markers = handler.addMarkers([
    {
      "lat": 0,
      "lng": 0,
      "picture": {
        "url": "/assets/marker.png",
        "width":  43,
        "height": 69
      },
      "infowindow": "hello!"
    }
  ]);
  handler.bounds.extendWith(markers);
  handler.fitMapToBounds();
});
*/