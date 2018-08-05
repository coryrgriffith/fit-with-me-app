class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :title
      t.string :type
      t.string :target_muscle
      t.string :required_equipment
      t.string :difficulty_level

      t.timestamps
    end
  end
end
