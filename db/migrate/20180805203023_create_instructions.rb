class CreateInstructions < ActiveRecord::Migration[5.2]
  def change
    create_table :instructions do |t|
      t.text :direction
      t.integer :exercise_id

      t.timestamps
    end
  end
end
