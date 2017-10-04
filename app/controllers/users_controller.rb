class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @connection = current_user.connections.where(followee: @user)
  end
end
