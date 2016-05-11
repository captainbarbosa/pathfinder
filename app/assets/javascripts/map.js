// Start doing things only when DOM is ready
$(document).ready(function() {

    mapboxgl.accessToken = 'pk.eyJ1IjoibmJiMTI4MDUiLCJhIjoiMUlFVjZWVSJ9.jeNyiaRq8MCHlXSlGQZIHA';

    // Initialize basemap
    var map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/outdoors-v9',
        center: [-77.03656196594238, 38.89769637048576],
        zoom: 10
    });

    map.on('load', function() {
        map.addSource("markers", {
            "type": "geojson",
            "data": {
                "type": "FeatureCollection",
                "features": activities
            }
        });

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
