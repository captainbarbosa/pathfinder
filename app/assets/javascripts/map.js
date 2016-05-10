// Start doing things only when DOM is ready
$(document).ready(function() {

  mapboxgl.accessToken = 'pk.eyJ1IjoibmJiMTI4MDUiLCJhIjoiMUlFVjZWVSJ9.jeNyiaRq8MCHlXSlGQZIHA';

  // Initialize basemap
  var map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/nbb12805/cio1vac0f0007ahm4q0xl9d34',
      center: [ -77.03656196594238,  38.89769637048576],
      zoom: 10
  });
  
});
