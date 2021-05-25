class WorkoutsController < ApplicationController


  def show
    @workout = Workout.find(params[:id])
  end
end
