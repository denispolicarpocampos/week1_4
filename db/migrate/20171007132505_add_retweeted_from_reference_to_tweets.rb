class AddRetweetedFromReferenceToTweets < ActiveRecord::Migration[5.1]
  def change
    add_reference :tweets, :retweeted_from, foreign_key: { to_table: :tweets }
  end
end
