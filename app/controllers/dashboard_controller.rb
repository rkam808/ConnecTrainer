class DashboardController < ApplicationController
  def index
    @outgoing_requests = current_user.bookings
    @my_workouts = current_user.workouts
  end
end
