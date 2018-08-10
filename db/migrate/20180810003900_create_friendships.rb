class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end

    add_foreign_key :friendships, :users, column: :friend_id
  end
end
