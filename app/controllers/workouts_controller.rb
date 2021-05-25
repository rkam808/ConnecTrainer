class WorkoutsController < ApplicationController

  skip_after_action :verify_authorized, only: [:show, :index, :new]
  before_action :set_workout, only: [:edit, :update, :destroy]

  def index
    @workouts = policy_scope(Workout).all
  end

  def show
    @workout = Workout.find(params[:id])
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
    params.require(:workout).permit(:category, :account_type)
  end
end
