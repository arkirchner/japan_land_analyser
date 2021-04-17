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
                 paint: {
                   :"fill-color" => [
                     'match',
                     ['get', 'inundation_depth_id'],
                     1,
                     '#DFFF00',
                     2,
                     '#FFBF00',
                     3,
                     '#FFBF00',
                     4,
                     '#DE3163',
                     5,
                     '#9FE2BF',
                     6,
                     '#40E0D0',
                     7,
                     '#6495ED',
                     8,
                     '#CCCCFF',
                     9,
                     '#00FFFF',
                     10,
                     '#ADD8E6',
                     11,
                     '#87CEEB',
                     12,
                     '#008080',
                     13,
                     '#CD7F32',
                     '#FF0000'
                   ],
                   :"fill-opacity" => 0.8
                 }
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
