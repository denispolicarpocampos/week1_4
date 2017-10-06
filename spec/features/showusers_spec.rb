require 'rails_helper'

RSpec.feature "Test users/id #show" do

  describe "follow and unfollow an user" do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
    end

    it "follow" do
      login_as(@user, scope: :user)
      visit user_path(@user2)
      expect{ find_link('Follow').click }.to change(Connection, :count).by(+1)
    end

    it "unfollow" do
      follow = FactoryGirl.create(:connection, user: @user)
      login_as(@user, scope: :user)
      visit user_path(follow.followee_id)
      expect{ find_link('Unfollow').click }.to change(Connection, :count).by(-1)
    end

  end

  describe "Tweet on the view" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @tweet = FactoryGirl.create(:tweet, user: @user)
    end

    it "tweet of current user" do
      login_as(@user, scope: :user)
      expect{ find("#new_tweet").have_content 'My tweet'}
    end

  end
end
