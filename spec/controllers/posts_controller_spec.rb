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
end
