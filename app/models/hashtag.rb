class Hashtag < ApplicationRecord

  include PgSearch
  multisearchable against: [:content]

  belongs_to :tweet

  def card_content
    %W{ ##{self.content} }
  end
end
