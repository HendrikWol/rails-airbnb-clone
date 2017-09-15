class BookingsController < ApplicationController
  before_action :set_booking, only: [ :show, :edit, :update, :destroy, :change_status]
  before_action :set_apartment, only: [ :create, :destroy]

  def new
    @booking = Booking.new

  end

  def my_bookings
    @bookings = Booking.where(owner_id: current_user.id).where.not(status: 'Declined')
  end


  def my_trips
    @profile = current_user.profile
    @bookings = @profile.user.bookings.where.not(status: "Declined")

  end

  def show

  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.apartment = @apartment
    @booking.owner_id = @booking.apartment.user.id
    if @booking.save
      redirect_to show_trips_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to apartment_path(@apartment)
  end

  def change_status
    @booking.status = params[:status]
    @booking.save
    redirect_to show_trips_path
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
