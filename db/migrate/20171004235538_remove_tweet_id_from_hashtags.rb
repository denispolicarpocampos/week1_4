class RemoveTweetIdFromHashtags < ActiveRecord::Migration[5.1]
  def change
    remove_column :hashtags, :tweet_id, :integer
  end
end
