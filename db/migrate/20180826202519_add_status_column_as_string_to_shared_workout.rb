class AddStatusColumnAsStringToSharedWorkout < ActiveRecord::Migration[5.2]
  def change
    add_column :shared_workouts, :status, :string
  end
end
