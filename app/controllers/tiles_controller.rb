class TilesController < ApplicationController
  def show
    zoom, x, y = params.values_at(:zoom, :x, :y).map(&:to_i)

    send_data(InundationArea.as_mvtgeom(zoom, x, y).as_mvt, type: :mvt)
  end
end
