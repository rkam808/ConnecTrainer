class BookingsController < ApplicationController

skip_after_action :verify_authorized, only: [:new]



  def create
    @booking = Booking.new(booking_params)
    # @workout = Workout.find(params[:workout_id])
    # @booking.workout = @workout
    @booking.user = current_user
    raise
    authorize @booking
    if @booking.save
      redirect_to workouts_path
    else
      redirect_to
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
    params.require(:booking).permit(:comment, :date_time)
  end
end
