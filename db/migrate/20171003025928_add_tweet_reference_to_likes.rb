class AddTweetReferenceToLikes < ActiveRecord::Migration[5.1]
  def change
    add_reference :likes, :tweet, foreign_key: true
  end
end
