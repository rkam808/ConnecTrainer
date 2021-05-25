class AddDescriptionToWorkout < ActiveRecord::Migration[6.0]
  def change
    add_column :workouts, :description, :text
  end
end
