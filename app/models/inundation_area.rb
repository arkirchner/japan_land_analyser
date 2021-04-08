class InundationArea < ApplicationRecord
    def self.as_mvt
      select('ST_AsMVT(mvtgeom.*) mvt').take.mvt
    end

    scope :as_mvtgeom, ->(z, x, y) do
      from(in_tile(z, x, y).select(<<~SELECT.squish), :mvtgeom)
        ST_AsMVTGeom(ST_Transform(geom, 3857),
                     ST_Transform(ST_TileEnvelope(#{z}, #{x}, #{y}), 3857))
      SELECT
    end

    scope :in_tile, ->(z, x, y) do
      where(
        'ST_Intersects(ST_Transform(ST_TileEnvelope(:z, :x, :y), 4326), geom)',
        z: z, x: x, y: y
      )
    end
end
