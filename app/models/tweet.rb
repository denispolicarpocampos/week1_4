class Tweet < ApplicationRecord
  
  include PgSearch
  multisearchable against: [:content], using: [:trigram]

  belongs_to :user
  has_many :tweet_hashtags
  has_many :hashtags, through: :tweet_hashtags
  has_many :likes
  validates :content, presence: true, length: { maximum: 140 }
  
  def card_content
    %W{ #{self.content} }
  end
end
