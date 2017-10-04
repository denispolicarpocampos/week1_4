require "rails_helper"

RSpec.describe Connection do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:followee).class_name("User") }
end
