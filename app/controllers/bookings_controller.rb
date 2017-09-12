class BookingsController < ApplicationController
  before_action :set_booking, only: [ :show, :edit, :update, :destroy]
  before_action :set_apartment, only: [ :create, :destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    # we need to attach the user and the appartment to the booking
    @booking.user = current_user
    # apartments/2/bookings
    @booking.apartment = @apartment
    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to apartment_path(@apartment)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_apartment
    @apartment = Apartment.find(params[:apartment_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :status)
  end
end
