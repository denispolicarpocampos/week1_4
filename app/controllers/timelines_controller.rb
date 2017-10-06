class TimelinesController < ApplicationController
  def index
    @tweet = current_user.tweets.new
    tweets_of_user = current_user.connections.pluck(:followee_id) << current_user.id
    @tweets = Tweet.where(user_id: tweets_of_user).order(:created_at)
  end
end
