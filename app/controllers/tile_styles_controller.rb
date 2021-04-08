class TileStylesController < ApplicationController
  def show
    render json: {
             version: 8,
             layers: [
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
               hoges: { type: 'vector', url: 'http://localhost:3000/tile_json' }
             }
           }
  end
end
