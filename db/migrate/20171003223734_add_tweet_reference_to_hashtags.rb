class AddTweetReferenceToHashtags < ActiveRecord::Migration[5.1]
  def change
    add_reference :hashtags, :tweet, foreign_key: true
  end
end
