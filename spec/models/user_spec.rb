require "rails_helper"

RSpec.describe User do
  it { is_expected.to have_many(:likes_given).class_name("Like") }
  it { is_expected.to have_many(:tweets) }
  it { is_expected.to have_many(:connections) }
  it { is_expected.to have_many(:followees).through(:connections) }
end
