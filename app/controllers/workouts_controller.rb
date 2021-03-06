class WorkoutsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_authorized, only: [:show, :index, :new]
  before_action :set_workout, only: [:edit, :update, :destroy]

  def index
    if params[:query].present?
       @workouts = policy_scope(Workout).all.search_by_category_and_location(params[:query])
    else
      @workouts = policy_scope(Workout).all.order('created_at DESC')
    end

    @markers = @workouts.geocoded.map do |workout|
      {
        lat: workout.latitude,
        lng: workout.longitude,
        info_window: render_to_string(partial: "info_window", locals: { workout: workout })
      }
    end
  end

  def show
    @workout = Workout.find(params[:id])
    @booking = Booking.new
    @booking.workout = @workout

    @markers = [
      {
        lat: @workout.latitude,
        lng: @workout.longitude
      }]
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user = current_user
    authorize @workout
    if @workout.save
      redirect_to workouts_path
    else
      render :show
    end
  end

  def edit

  end

  def update
    if @workout.update(workout_params)
      redirect_to workout_path(@workout)
      else
        render :edit
    end
  end

  def destroy
    @workout.destroy
    redirect_to workouts_path
  end

  private

  def set_workout
    @workout = Workout.find(params[:id].to_i)
    authorize @workout
  end

  def workout_params
    params.require(:workout).permit(:category, :account_type, :location, :name, :description, :price, :photo)
  end
end
