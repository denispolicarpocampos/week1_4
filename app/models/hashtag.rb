class Hashtag < ApplicationRecord

  include PgSearch
  multisearchable against: [:content]

  belongs_to :tweet
end
