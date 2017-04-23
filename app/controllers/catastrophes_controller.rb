class CatastrophesController < ApplicationController
  def show
    @catastrophe = Catastrophe.find(params[:id])
    @lat, @lng = @catastrophe.lat, @catastrophe.lng
  end
end
