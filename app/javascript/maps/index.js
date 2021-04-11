import mapboxgl from "!mapbox-gl";

document.addEventListener("DOMContentLoaded", () => {
  mapboxgl.accessToken = process.env.MAPBOX_KEY;

  const map = new mapboxgl.Map({
    container: "map",
    center: [130.4, 33.59],
    style: 'http://localhost:3000/tile_style',
    zoom: 9
  });
});
