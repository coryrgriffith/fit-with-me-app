class CreateUserFitGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :user_fit_groups do |t|
      t.integer :user_id
      t.integer :fit_group_id

      t.timestamps
    end
  end
end
