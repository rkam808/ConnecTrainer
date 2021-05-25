class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to workouts_path
    else
      redirect_to workouts_path
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :date_time)
  end
end
