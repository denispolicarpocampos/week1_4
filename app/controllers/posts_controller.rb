class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update]


  def create
    @post = current_user.tweets.new(post_params)
    unless @post.save
      flash.now[:error] = "Could not create tweet"
      else
      TweetHashtag.save_hashtags(@post)
    end
    redirect_back fallback_location: root_path
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      flash.now[:error] = "Could not update tweet"
      render :edit
    end

  end

  private

    def post_params
      params.require(:tweet).permit(:content)
    end

    def set_post
      @post = current_user.tweets.find(params[:id])
    end

end
