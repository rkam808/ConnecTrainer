class BookingsController < ApplicationController

skip_after_action :verify_authorized, only: [:new]



  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to workouts_path
    else
      redirect_to workout_path(@booking.workout)
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
    params.require(:booking).permit(:comment, :date_time, :workout_id)
  end
end
