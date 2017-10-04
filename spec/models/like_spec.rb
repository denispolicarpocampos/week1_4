require "rails_helper"

RSpec.describe Like do
  subject { create(:like) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:tweet) }

  it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:tweet_id) }
end
