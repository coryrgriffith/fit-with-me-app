class RemoveSharedWorkoutIdFromFitGroupsAndAddNameToFitGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :fit_groups, :shared_workout_id, :integer

    add_column :fit_groups, :name, :string
  end
end
