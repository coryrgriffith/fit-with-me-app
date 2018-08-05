class ChangeColumnTypeToExercise < ActiveRecord::Migration[5.2]
  def change
    rename_column :exercises, :type, :exercise_type
  end
end
