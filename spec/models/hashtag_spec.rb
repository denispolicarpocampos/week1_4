require "rails_helper"

RSpec.describe Hashtag do
  subject { create(:hashtag) }

  it { is_expected.to belong_to(:tweet) }
  it { is_expected.to be_kind_of(PgSearch) }

  it "returns :card_content" do
    expect(subject.card_content).to eq ["##{subject.content}"]
  end
end
