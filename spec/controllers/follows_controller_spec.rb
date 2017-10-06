require "rails_helper"

RSpec.describe FollowsController do
  
  login_user
  let(:user) { create(:user) }
  let(:back) { user_path(user) }
  before { request.env['HTTP_REFERER'] = back }
 
  context "#POST create" do
    it "redirect_back to user :show page" do
      post :create, params: { user_id: user.id }
      expect(response).to redirect_to(back) 
    end

    it "current_user connections must be increased" do
      expect {
        post :create, params: { user_id: user.id }
      }.to change(subject.current_user.connections, :count).by(1)
    end
  end

  context "#DELETE destroy" do
    
    let!(:connection) { create(:connection, followee: user, user: subject.current_user) }

    it "redirect_back to user :show page" do
      delete :destroy, params: { id: connection.id }
      expect(response).to redirect_to(back) 
    end

    it "current_user connections must be decreased" do
      expect {
        delete :destroy, params: { id: connection.id }
      }.to change(subject.current_user.connections, :count).by(-1)
    end
  end
end

