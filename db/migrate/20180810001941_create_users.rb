class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.integer :height
      t.integer :weight
      t.string :city
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
