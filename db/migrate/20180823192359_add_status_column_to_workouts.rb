class AddStatusColumnToWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_column :exercise_workouts, :status, :string
  end
end
