class Hashtag < ApplicationRecord

  include PgSearch
  multisearchable against: [:content]

  has_many :tweet_hashtags
  has_many :tweets, through: :tweet_hashtags

  def card_content
    %W{ ##{self.content} }
  end
end
