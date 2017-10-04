class FollowsController < ApplicationController

  before_action :set_follow, only: [:create, :delete]

  def create
    unless @userOnFollowee?
      @addUser = current_user.connections.new(follow_params)
      if @addUser.save
        redirect_to user_path
      end
    end
  end

  def destroy
    if @userOnFollowee?
      @userOnFollowee.destroy
      redirect_to user_path
    end
  end

  private
    def follows_params
      params.require(:connection).permit(:followee)
    end

    def set_follow
      @userOnFollowee = current_user.connections.followee.find(params[:user_id])
    end
end
