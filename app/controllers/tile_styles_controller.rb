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
                 id: 'hoges',
                 type: 'fill',
                 source: 'hoges',
                 :"source-layer" => 'default',
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
               hoges: { type: 'vector', url: 'http://localhost:3000/tile_json' }
             }
           }
  end
end
