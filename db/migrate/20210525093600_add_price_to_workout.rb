class AddPriceToWorkout < ActiveRecord::Migration[6.0]
  def change
    add_column :workouts, :price, :integer
  end
end
