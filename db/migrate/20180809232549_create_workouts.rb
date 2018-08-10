class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.integer :shared_workout_id
      t.integer :exercise_workout_id

      t.timestamps
    end
  end
end
