class FollowsController < ApplicationController

  def create
    @addUser = current_user.connections.new(followee_id: params[:user_id])
    @addUser.save
    redirect_back fallback_location: root_path
  end

  def destroy
    @connection = Connection.find(params[:id])
    @connection.destroy
    redirect_back fallback_location: root_path
  end
end
