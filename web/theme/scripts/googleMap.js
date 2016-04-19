var Center=new google.maps.LatLng(50.436853, 30.5391395);
var directionsDisplay;
var map;

function initialize() {
    directionsDisplay = new google.maps.DirectionsRenderer();
    var properties = {
        center:Center,
        zoom:18,
        zoomControl: true,
        scrollwheel: false,
        mapTypeId:google.maps.MapTypeId.ROADMAP
    };

    var marker = new google.maps.Marker({
        map: map,
        draggable: true,
        animation: google.maps.Animation.DROP,
        position: {lat: 50.436853, lng: 30.5391395}
    });

    map=new google.maps.Map(document.getElementById("index-google-map"), properties);
    directionsDisplay.setMap(map);

    marker.setMap(map);

}

google.maps.event.addDomListener(window,'load',initialize);