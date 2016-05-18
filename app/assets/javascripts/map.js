// Start doing things only when DOM is ready
$(document).ready(function() {
  if ($("#map").length > 0 ) {
    mapboxgl.accessToken = 'pk.eyJ1IjoibmJiMTI4MDUiLCJhIjoiMUlFVjZWVSJ9.jeNyiaRq8MCHlXSlGQZIHA';

    // Initialize basemap
    var map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/light-v9',
        center: [-13.7109375, 28.613459424004414],
        zoom: 1
    });

    // Load geoJSON
    var mapMarkers = {
        "type": "geojson",
        "data": {
            "type": "FeatureCollection",
            "features": activities // Coming from trips#show script tag
        }
    };

    // Do the following only when the map is loaded
    map.on('load', function() {

        // Add marker source
        map.addSource("markers", mapMarkers);

        // Begin building a bounding box from coordinates
        var markerCoordinates = [];

        mapMarkers.data.features.forEach(function(feature) {
          markerCoordinates.push(feature.geometry.coordinates);
        });

        // Collect all longitudes and put them in an array
        var longitudes = [];
        markerCoordinates.forEach(function(coordinate) {
          longitudes.push(coordinate[0]);
        });

        // Collect all latitudes and put them in an array
        var latitudes = [];
        markerCoordinates.forEach(function(coordinate) {
          latitudes.push(coordinate[1]);
        });

        // Select lowest longitude
        var lowestLong = Math.min.apply(null, longitudes);

        // Select highest longitude
        var highestLong = Math.max.apply(null, longitudes);

        // Select lowest latitude
        var lowestLat = Math.min.apply(null, latitudes);

        // Select highest latitude
        var highestLat = Math.max.apply(null, latitudes);

        var sw = new mapboxgl.LngLat(lowestLong, lowestLat);
        var ne = new mapboxgl.LngLat(highestLong, highestLat);

        // Create bounding box
        var boundingCoordinates = new mapboxgl.LngLatBounds(sw, ne);

        // Fit to bounding box if there is 1+ coordinate,
        // otherwise center on single coordinate
        if (markerCoordinates.length > 1) {
          map.fitBounds(boundingCoordinates, {padding: 100});
        } else {
          map.flyTo({center: markerCoordinates[0], zoom: 12});
        }

        // Add marker styling
        map.addLayer({
            "id": "markers",
            "type": "circle",
            "source": "markers",
            "paint": {
              "circle-radius": 7,
              "circle-color": "#E36362"
            }
        });

        map.on("click", function (e) {
            var features = map.queryRenderedFeatures(e.point, { layers: ["markers"] });

            if (!features.length) {
                return;
            }

            var feature = features[0];

            var popup = new mapboxgl.Popup()
                .setLngLat(feature.geometry.coordinates)
                .setHTML("<p class='map-activity-title'><a href='#"+feature.properties.title+"'>"+ feature.properties.title + "</a></p>" + feature.properties.date)
                .addTo(map);
        });

        map.on('mousemove', function (e) {
            var features = map.queryRenderedFeatures(e.point, { layers: ['markers'] });
            map.getCanvas().style.cursor = (features.length) ? 'pointer' : '';
        });

    });
  }
});
