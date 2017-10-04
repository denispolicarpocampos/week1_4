require "rails_helper"

RSpec.describe Connection do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:followee).class_name("User") }

  it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:followee_id) }
end
