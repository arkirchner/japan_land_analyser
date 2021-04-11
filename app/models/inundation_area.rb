class InundationArea < ApplicationRecord
  SELECT_GEOM_FOR_MVT =
    '
    ST_AsMVTGeom(ST_Transform(geom, 3857),
    ST_Transform(ST_TileEnvelope(:z, :x, :y), 3857)) AS geom, inundation_depth_id
  '.squish.freeze

  def self.as_mvt
    select("ST_AsMVT(mvtgeom.*, 'area') AS mvt").take.mvt
  end

  scope :as_mvtgeom,
        ->(z, x, y) {
          from(
            in_tile(z, x, y).select(
              sanitize_sql([SELECT_GEOM_FOR_MVT, z: z, x: x, y: y]),
            ),
            :mvtgeom,
          )
        }

  scope :in_tile,
        ->(z, x, y) {
          where(
            'ST_Intersects(ST_Transform(ST_TileEnvelope(:z, :x, :y), 4326), geom)',
            z: z,
            x: x,
            y: y,
          )
        }
end
