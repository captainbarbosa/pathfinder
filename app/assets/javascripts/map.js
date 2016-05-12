// Start doing things only when DOM is ready
$(document).ready(function() {

    mapboxgl.accessToken = 'pk.eyJ1IjoibmJiMTI4MDUiLCJhIjoiMUlFVjZWVSJ9.jeNyiaRq8MCHlXSlGQZIHA';

    // Initialize basemap
    var map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/outdoors-v9',
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
          map.fitBounds(markerCoordinates, {padding: 50});
        } else {
          map.flyTo({center: markerCoordinates[0], zoom: 12});
        }

        // Add marker styling
        map.addLayer({
            "id": "markers",
            "type": "symbol",
            "source": "markers",
            "layout": {
                "icon-image": "{marker-symbol}-15",
                "text-field": "{title}",
                "text-font": ["Open Sans Semibold", "Arial Unicode MS Bold"],
                "text-offset": [0, 0.6],
                "text-anchor": "top"
            }
        });
    });
});
