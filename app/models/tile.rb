class Tile
  WEB_MECATOR_MAX = Math::PI * 6378137
  WEB_MECATOR_SIZE = WEB_MECATOR_MAX * 2

  attr_reader :point_x, :point_y, :zoom

  # lat: 33.5902 long: 130.4017
  # x: 14516250.84, y: 3973907.74
  # x_tile: 28253 y_tile: 13134
  def initialize(point_x:, point_y:, zoom:)
    @point_x = point_x
    @point_y = point_y
    @zoom = zoom
  end

  def x
    ((WEB_MECATOR_MAX + point_x) / tile_width).floor
  end

  def y
    ((WEB_MECATOR_MAX - point_y) / tile_width).floor
  end

  def tile_width
    WEB_MECATOR_SIZE / world_tile_size
  end

  def world_tile_size
    2 ** zoom
  end
end
