class CreateCartedExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :carted_exercises do |t|
      t.integer :user_id
      t.integer :exercise_id
      t.integer :workout_id
      t.string :status

      t.timestamps
    end
  end
end
