class CreateTweetHashtags < ActiveRecord::Migration[5.1]
  def change
    create_table :tweet_hashtags do |t|
      t.references :tweet
      t.references :hashtag
      t.timestamps
    end
  end
end
