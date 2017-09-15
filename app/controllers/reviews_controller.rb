class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_booking, only: [:create, :new]

  def index
    @apartment = Apartment.find(params[:apartment_id])
    @reviews = @apartment.reviews
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    @apartment = @booking.apartment
    @review.apartment_id = @apartment.id
    if @review.save
      redirect_to apartment_path(@apartment)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      format.html { redirect_to @review.apartment, notice: 'Review was successfully updated.' }
    else
      format.html { render :edit }
    end
  end

  def destroy
    @review.destroy
  end

  private

 def set_review
   @review = Review.find(params[:id])
 end

 def set_booking
   @booking = Booking.find(params[:booking_id])
 end

 def review_params
   params.require(:review).permit(:rating, :content)
 end

end
