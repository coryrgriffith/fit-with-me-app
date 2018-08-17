class CreateUserExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :user_exercises do |t|
      t.boolean :user_id
      t.boolean :fit_group_id
      t.boolean :workout_id
      t.boolean :exercise_id
      t.string :completed

      t.timestamps
    end
  end
end
