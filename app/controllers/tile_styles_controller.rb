class TileStylesController < ApplicationController
  def show
    render json: {
             version: 8,
             layers: [
               {
                 id: 'osm',
                 type: 'raster',
                 source: 'osm',
                 minzoom: 0,
                 maxzoom: 22
               },
               {
                 id: 'inundation',
                 type: 'fill',
                 source: 'inundationArea',
                 :"source-layer" => 'area',
                 layout: {},
                 paint: { :"fill-color" => '#088', :"fill-opacity" => 0.8 }
               }
             ],
             sources: {
               osm: {
                 type: 'raster',
                 tiles: %w[http://a.tile.openstreetmap.org/{z}/{x}/{y}.png],
                 tileSize: 256
               },
               inundationArea: {
                 type: 'vector',
                 tiles: ['http://localhost:3000/tiles/{z}/{x}/{y}.mvt']
               }
             }
           }
  end
end
