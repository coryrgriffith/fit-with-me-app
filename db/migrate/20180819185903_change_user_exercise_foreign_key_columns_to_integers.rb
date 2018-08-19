class ChangeUserExerciseForeignKeyColumnsToIntegers < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_exercises, :user_id, :boolean
    remove_column :user_exercises, :fit_group_id, :boolean
    remove_column :user_exercises, :workout_id, :boolean
    remove_column :user_exercises, :exercise_id, :boolean

    add_column :user_exercises, :user_id, :integer
    add_column :user_exercises, :fit_group_id, :integer
    add_column :user_exercises, :workout_id, :integer
    add_column :user_exercises, :exercise_id, :integer
  end
end
