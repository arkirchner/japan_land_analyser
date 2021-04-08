class TileJsonsController < ApplicationController
  def show
    render json: TileJson.new.to_h
  end
end
