require "rails_helper"

RSpec.describe Tweet do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:hashtags) }
  it { is_expected.to have_many(:likes) }
  it { is_expected.to validate_presence_of :content }
  it { is_expected.to validate_length_of(:content).is_at_most(140) }
end
