require 'rails_helper'
Capybara.default_max_wait_time = 5

RSpec.feature "new tweet" do

  let(:user) { FactoryGirl.create(:user) }

  background do
    login_as(user, scope: :user)
  end

  context "Create a new tweet" do
    it "filling the fields and click submit" do
      visit '/'
      fill_in 'content_tweet', with: 'Its just a tweet'
      expect{ click_button 'Tweet' }.to change(Tweet, :count).by(+1)
      expect{ find("#new_tweet").have_content 'Its just a tweet'}
    end
  end
end
