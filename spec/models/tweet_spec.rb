require "rails_helper"

RSpec.describe Tweet do
  subject { create(:tweet) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:hashtags) }
  it { is_expected.to have_many(:likes) }
  it { is_expected.to validate_presence_of :content }
  it { is_expected.to validate_length_of(:content).is_at_most(140) }
  it { is_expected.to be_kind_of(PgSearch) } 

  it "returns :card_content" do
    expect(subject.card_content).to eq [subject.content]
  end
end
