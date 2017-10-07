require "rails_helper"

RSpec.describe User do
  subject { create(:user) }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :username }
  it { is_expected.to have_many(:likes_given).class_name("Like") }
  it { is_expected.to have_many(:tweets) }
  it { is_expected.to have_many(:connections) }
  it { is_expected.to have_many(:followees).through(:connections) }
  it { is_expected.to be_kind_of(PgSearch) }

  it "returns :card_content" do
    expect(subject.card_content).to eq ["@#{subject.username}", subject.name, subject.email]
  end
end
