require "rails_helper"

RSpec.describe TweetHashtag do
  it { is_expected.to belong_to(:tweet) }
  it { is_expected.to belong_to(:hashtag) }
end
