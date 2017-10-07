class FollowsController < ApplicationController

  def create
    @addUser = current_user.connections.new(followee_id: params[:user_id])
    if @addUser.save
      flash[:notice] = "You are following this user =)"
    else
      flash[:error] = "An error ocurrend when trying to follow this user"
    end
    redirect_back fallback_location: root_path
  end

  def destroy
    @connection = Connection.find(params[:id])
    if @connection.destroy
      flash[:notice] = "You are not following this user anymore =("
    else
      flash[:error] = "An error ocurrend when trying to unfollow this user"
    end
    redirect_back fallback_location: root_path
  end
end
