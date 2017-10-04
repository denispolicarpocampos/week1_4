class Hashtag < ApplicationRecord

  include PgSearch
  multisearchable against: [:content]

  belongs_to :tweet

  def card_content
    "##{self.content}"
  end
end
