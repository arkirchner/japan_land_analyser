class TileJson
  def to_h
    {
      attribution: '',
      bounds: [-180, -85.0511, 180, 85.0511],
      center: [0, 0, 0],
      format: 'mvt',
      id: 'default',
      maskLevel: 8,
      maxzoom: 14,
      minzoom: 0,
      name: 'Custom Vector Tiles',
      scheme: 'xyz',
      tilejson: '2.0.0',
      tiles: %w[http://localhost:3000/tiles/{z}/{x}/{y}.mvt],
      vector_layers: [
        {
          description: 'world borders.',
          fields: {},
          geometry: 'polygon',
          id: 'default',
          minzoom: 0
        }
      ]
    }
  end
end
