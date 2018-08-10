class CreateExerciseWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_workouts do |t|
      t.integer :exercise_id
      t.integer :workout_id

      t.timestamps
    end
  end
end
