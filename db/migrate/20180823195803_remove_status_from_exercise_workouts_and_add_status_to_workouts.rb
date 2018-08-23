class RemoveStatusFromExerciseWorkoutsAndAddStatusToWorkouts < ActiveRecord::Migration[5.2]
  def change
    remove_column :exercise_workouts, :status, :string

    add_column :workouts, :status, :string
  end
end
