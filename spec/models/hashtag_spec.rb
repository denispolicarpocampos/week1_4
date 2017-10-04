require "rails_helper"

RSpec.describe Hashtag do
  it { is_expected.to belong_to(:tweet) }
end
