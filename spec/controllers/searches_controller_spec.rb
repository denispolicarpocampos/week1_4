require "rails_helper"

RSpec.describe SearchesController do
  
  login_user
  let!(:tweets) { create_list(:tweet, 3) }
  let!(:user) { create(:user, name: "James tweet") }
  let!(:hashtag) { create(:hashtag, content: "My little tweet") }

  context "GET #index" do 
    context "with :search_text" do
      it "render :index template" do
        get :index, params: { search_text: "tweet" }
        expect(response).to render_template(:index)
      end

      it "assigns @results" do
        get :index, params: { search_text: "tweet" }
        expect(assigns(:results).count).to eq 5
      end
    end

    context "without :search_text" do
      
      let(:back) { timelines_path }
      before { request.env['HTTP_REFERER'] = back }
      
      it "redirect_back to previous page" do
        get :index, params: { search_text: "" }
        expect(response).to redirect_to(back)
      end

      it "doesn't assigns @results" do
        get :index, params: { search_text: "" }
        expect(assigns(:results)).to be_nil
      end
    end
  end
end
