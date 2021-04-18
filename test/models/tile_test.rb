require "test_helper"

class TileTest < ActiveSupport::TestCase
  test 'Fukuoka' do
    tile = Tile.new(point_x: 14516250.84, point_y: 3973907.74, zoom: 15)

    assert_equal tile.x, 28253
    assert_equal tile.y, 13134
  end

  # in different zoom levels
  test 'Berlin'
  test 'Rio de Janeiro'
  test 'Sydney'
  test 'Whitehorse'
end
