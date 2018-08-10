class CreateSharedWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :shared_workouts do |t|
      t.integer :workout_id
      t.integer :fit_group_id

      t.timestamps
    end
  end
end
