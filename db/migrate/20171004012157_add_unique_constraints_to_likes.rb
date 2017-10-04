class AddUniqueConstraintsToLikes < ActiveRecord::Migration[5.1]
  def change
    add_index :likes, [:user_id, :tweet_id], unique: true
  end
end
