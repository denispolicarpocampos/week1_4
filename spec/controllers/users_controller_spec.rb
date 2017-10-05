require "rails_helper"

RSpec.describe UsersController do
  
  login_user

  describe "GET #show" do
    let(:user) { create(:user) }
  
    it "renders :show template" do
      get :show, params: { id: user.id }
      expect(response).to render_template :show
    end

    it "returns status 200" do
      get :show, params: { id: user.id }
      expect(response.status).to eq 200
    end
  end
end
