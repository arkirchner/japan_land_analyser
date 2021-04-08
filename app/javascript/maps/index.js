import mapboxgl from "!mapbox-gl";

// const osmStyle = {
//   version: 8,
//   sources: {
//     OSM: {
//       type: "raster",
//       tiles: ["http://a.tile.openstreetmap.org/{z}/{x}/{y}.png"],
//       tileSize: 256
//     }
//   },
//   layers: [
//     {
//       id: "OSM",
//       type: "raster",
//       source: "OSM",
//       minzoom: 0,
//       maxzoom: 22
//     }
//   ]
// };

// const hogeStyle = {
//   version: 8,
//   layers: [
//     {
//       id: "hoges",
//       type: "fill",
//       source: "hoges",
//       "source-layer": "default",
//       layout: {},
//       paint: {
//         "fill-color": "#088",
//         "fill-opacity": 0.8
//       }
//     }
//   ],
//   sources: {
//     hoges: {
//       type: 'vector',
//       url: 'http://localhost:3000/tile_json'
//     }
//   },
// };

document.addEventListener("DOMContentLoaded", () => {
  mapboxgl.accessToken = process.env.MAPBOX_KEY;
  const map = new mapboxgl.Map({
    container: "map",
    center: [130.4, 33.59],
    style: 'http://localhost:3000/tile_style',
    zoom: 9
  });

  // map.on("load", () => {
  //   map.addSource("hoges", {
  //     type: "vector",
  //     tiles: ["http://localhost:3000/tiles/{z}/{x}/{y}.mvt"],
  //     promoteId: "id",
  //   });

  //   map.addLayer({
  //     id: "hoges",
  //     type: "fill",
  //     source: "hoges",
  //     "source-layer": "default",
  //     layout: {},
  //     paint: {
  //       "fill-color": "#088",
  //       "fill-opacity": 0.8
  //     }
  //   });
  // });
});
