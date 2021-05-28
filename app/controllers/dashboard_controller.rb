class DashboardController < ApplicationController

  def index
    @outgoing_requests = policy_scope(current_user.bookings).all
    @my_workouts = policy_scope(current_user.workouts).all
    @pending_requests = []
      if @my_workouts.count > 0
        @my_workouts.each do |workout|
          workout.bookings.each do |booking|
          if booking.status == "pending"
            @pending_requests << workout
          end
        end
      end
      @pending_requests
     end
  end
end
