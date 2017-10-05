require "devise"

module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in create(:user)
    end
  end
end


module FeatureMacros
  def login_user
    let(:login_user) { create(:user) }
    background(:each) do
      login_as login_user
    end
  end
end


RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.extend ControllerMacros, type: :controller
  config.extend FeatureMacros, type: :feature
end


