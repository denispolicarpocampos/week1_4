require "rails_helper"

RSpec.describe PostsController do

  login_user
  let(:back) { timelines_path }
  before { request.env['HTTP_REFERER'] = back }

  context "POST #create" do
    let(:tweet) { attributes_for(:tweet) }

    it "redirect_back to timeline" do
      post :create, params: { tweet: { content: tweet[:content] } }
      expect(response).to redirect_to(back)
    end


    it "current_user tweets must be increased" do
      expect {
        post :create, params: { tweet: { content: tweet[:content] } }
      }.to change(subject.current_user.tweets, :count).by(1)
    end
  end

  context "POST #create with hashtag must be " do
    let(:tweet_with_hashtag) { attributes_for(:tweet_with_hashtag) }

    it "save new relationship whith the hashtag" do
      expect {
        post :create, params: { tweet: { content: tweet_with_hashtag[:content] } }
      }.to change(TweetHashtag.all, :count).by(1)
    end

    it "save the hashtag" do
      expect {
        post :create, params: { tweet: { content: tweet_with_hashtag[:content] } }
      }.to change(Hashtag.where(content: "hashtag"), :count).by(1)
    end
  end


  context "POST #like" do
    
    let(:tweet) { create(:tweet) }

    it "increase Tweet likes" do
      expect {
        post :like, params: { id: tweet.id }
      }.to change(tweet.likes, :count).by(1)
    end
  end


  context "DELETE #unlike" do

    let(:tweet) { create(:tweet) }
    let!(:like) { create(:like, tweet: tweet, user: subject.current_user) }

    it "decrease Tweet likes" do
      expect {
        delete :unlike, params: { id: tweet.id }
      }.to change(tweet.likes, :count).by(-1)
    end
  end


  context "POST #retweet" do
    let(:tweet) { create(:tweet) }

    it "increses retweets count" do
      expect {
        post :retweet, params: { id: tweet.id }
      }.to change(Tweet.where(retweeted_from: tweet), :count).by(1)
    end
  end


end
