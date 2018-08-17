class RemoveSharedWorkoutsFromWorkouts < ActiveRecord::Migration[5.2]
  def change
    remove_column :workouts, :shared_workout_id, :boolean
  end
end
