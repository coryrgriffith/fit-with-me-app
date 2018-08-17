class RemoveExerciseWorkoutsFromWorkouts < ActiveRecord::Migration[5.2]
  def change
    remove_column :workouts, :exercise_workout_id, :boolean
  end
end
