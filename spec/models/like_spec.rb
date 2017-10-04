require "rails_helper"

RSpec.describe Like do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:tweet) }
end
