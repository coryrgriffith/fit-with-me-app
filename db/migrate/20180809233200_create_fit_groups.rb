class CreateFitGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :fit_groups do |t|
      t.integer :shared_workout_id
      t.integer :captain_id

      t.timestamps
    end
  end
end
