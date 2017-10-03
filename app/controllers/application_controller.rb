class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  
  layout :set_layout

  
  private

  
  def set_layout
    if user_signed_in?
      "application"
    else
      "login"
    end
  end
end
