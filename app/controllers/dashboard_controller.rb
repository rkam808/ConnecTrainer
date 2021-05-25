class DashboardController < ApplicationController

  def index
    # @outgoing_requests = policy_scope(Booking).all
    @my_workouts = policy_scope(current_user.workouts).all
  end
end
