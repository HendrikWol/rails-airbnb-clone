class ApartmentsController < ApplicationController
   before_action :set_apartment, only: [:show, :edit, :update, :destroy]

  def index
    @apartments = Apartment.all.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@apartments) do |apartment, marker|
      marker.lat apartment.latitude
      marker.lng apartment.longitude
    end
  end

  def my_listings
    @apartments = current_user.apartments
    @bookings = Booking.where(owner_id: current_user.id)
  end

  def show
    @review = Review.new

    @apartment_coordinates = { lat: @apartment.latitude, lng: @apartment.longitude }
    @booking = Booking.new

    reviews = @apartment.reviews.map { |r| r.rating }
    @average = reviews.reduce(:+) / reviews.size

  end

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.user = current_user
    if @apartment.save
      redirect_to apartments_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @apartment.update(params[:apartment])
    redirect_to apartment_path(@apartment)
  end

  def destroy
    @apartment.destroy
    redirect_to apartments_path
  end

  private

  def set_apartment
    @apartment = Apartment.find(params[:id])
  end

  def apartment_params
    params.require(:apartment).permit(:name, :description, :address, :city, :country, :price, :apartment_type, :number_of_guests, :number_of_beds, :number_of_bedrooms, :number_of_bathrooms, :checkin_time, :checkout_time, :photo, :photo_cache)
  end
end
