require "rails_helper"

RSpec.describe TrendTopicsController do
  
  login_user
  let(:hashtag_1) { create(:hashtag) }
  let(:hashtag_2) { create(:hashtag) }
  let!(:hashtah_2_tweets) { create_list(:tweet_hashtag, 3, hashtag: hashtag_2) } 
  let!(:hashtag_1_tweets) { create_list(:tweet_hashtag, 5, hashtag: hashtag_1) }

  describe "GET #index" do
    it "renders template :index" do
      get :index
      expect(response).to render_template :index
    end

    it "assigns :hastags ordered by utilization" do
      get :index
      expect(assigns(:trend_topics)).to eq({ "#{hashtag_1.content}" => 5, "#{hashtag_2.content}" => 3 })
    end
  end
end
