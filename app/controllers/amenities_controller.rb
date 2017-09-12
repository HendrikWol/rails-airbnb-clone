class AmenitiesController < ApplicationController

  def new

  end

  def create
    @amenity = Amenity.find(params[:id])
  end
end
