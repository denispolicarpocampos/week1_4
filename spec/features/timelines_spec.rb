require 'rails_helper'

RSpec.feature "new tweet" do

  describe "Create a new tweet" do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
      @follow = FactoryGirl.create(:connection, user: @user, followee_id: @user2.id)
      @tweet = FactoryGirl.create(:tweet, user: @user2)

    end

    it "filling the fields and click submit" do
      login_as(@user, scope: :user)
      visit '/'
      fill_in 'content_tweet', with: 'Its just a tweet'
      expect{ click_button 'Tweet' }.to change(Tweet, :count).by(+1)
      expect{ find("#new_tweet").have_content 'Its just a tweet'}
    end

    it "filling the fields with other user" do
      login_as(@user, scope: :user)
      expect{ find("#new_tweet").have_content 'My tweet'}
    end
  end
end
