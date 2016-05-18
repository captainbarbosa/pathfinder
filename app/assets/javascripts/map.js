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

        // Center on map markers by creating an array of their coordinates
        markerCoordinates = [];

        mapMarkers.data.features.forEach(function(feature) {
          markerCoordinates.push(feature.geometry.coordinates);
        });

        if (markerCoordinates.length > 1) {
          map.fitBounds(markerCoordinates, {padding: 80});
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
