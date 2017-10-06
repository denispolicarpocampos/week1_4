require 'rails_helper'

RSpec.feature "new tweet" do

  context "Create a new tweet" do
    it "filling the fields and click submit" do
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)
      visit '/'
      fill_in 'content_tweet', with: 'Its just a tweet'
      expect{ click_button 'Tweet' }.to change(Tweet, :count).by(+1)
      expect{ find("#new_tweet").have_content 'Its just a tweet'}
    end
  end

  context "Tweet of followed on timeline" do
    it "filling the fields with other user" do
      user = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      login_as(user, scope: :user)
      visit user_path(user2)
      find_link('Follow').click
      logout(:user)
      login_as(user2, scope: :user)
      visit '/'
      fill_in 'content_tweet', with: 'Its just a tweet'
      click_button 'Tweet'
      logout(:user)
      login_as(user, scope: :user)
      expect{ find("#new_tweet").have_content 'Its just a tweet'}
    end
  end
end
