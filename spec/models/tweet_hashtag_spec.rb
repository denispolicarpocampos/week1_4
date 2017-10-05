require "rails_helper"

RSpec.describe Connection do
  it { is_expected.to belong_to(:tweet) }
  it { is_expected.to belong_to(:hashtag }
end
