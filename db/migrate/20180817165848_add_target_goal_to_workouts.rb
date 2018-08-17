class AddTargetGoalToWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :target_goal, :string
  end
end
