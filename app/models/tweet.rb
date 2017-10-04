class Tweet < ApplicationRecord
  
  include PgSearch
  multisearchable against: [:content], using: [:trigram]

  belongs_to :user
  has_many :hashtags
  has_many :likes
  validates :content, presence: true, length: { maximum: 140 }
  
  def card_content
    self.content
  end
end
