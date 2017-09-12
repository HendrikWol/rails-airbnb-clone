class AmenitiesController < ApplicationController
  before_action :set_apartment

  def create
    amenity = Amenity.new(amenity_params)
    amenity.apartment = @apartment
    amenity.save
    redirect_to apartment_path(@apartment)
  end

  def update
    amenity = Amenity.new(amenity_params)
    amenity.apartment = @apartment
    amenity.update
    redirect_to apartment_path(@apartment)
  end

  private

  def amenity_params
    params.require(:amenity).permit(:wifi, :kitchen, :gym, :pool, :tv, :pets_allowed, :smoking_allowed, :shampoo, :air_condition, :heating, :hair_dryer)
  end

  def set_apartment
    @apartment = Apartment.find(params[:apartment_id])
  end
end
