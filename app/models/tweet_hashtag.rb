class TweetHashtag < ApplicationRecord
  belongs_to :tweet
  belongs_to :hashtag

  def self.save_hashtags(post)
    post.content.split.each do |word|
      if word.include? "#"
        word.delete! "#"
        hashtag = Hashtag.find_or_create_by(content: word)
        TweetHashtag.create(tweet_id: post.id, hashtag_id: hashtag.id)
      end
    end
  end
end
