class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update]


  def create
    @post = current_user.tweets.new(post_params)
    unless @post.save
      flash.now[:error] = "Could not create tweet"
    else
      TweetHashtag.save_hashtags(@post)
      flash[:notice] = "Tweeted! =D"
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

  
  def like
    @tweet = Tweet.find(params[:id]) 
    if @tweet.likes.create(user: current_user)
      flash[:notice] = "Tweet liked =)"
    else
      flash[:alert] = "An error ocurred when trying to like this tweet"
    end
    redirect_back fallback_location: root_path
  end


  def unlike
    @tweet = Tweet.find(params[:id]) 
    if @tweet.likes.find_by(user: current_user).destroy
      flash[:notice] = "Tweet unliked =|"
    else
      flash[:alert] = "An error ocurred when trying to unlike this tweet"
    end
    redirect_back fallback_location: root_path
  end


  def retweet
    @tweet = Tweet.find(params[:id])
    if @retweet = current_user.tweets.create(content: @tweet.content, retweeted_from_id: @tweet.id)
      flash[:notice] = "Retweeted =D"
    else
      flash[:alert] = "An error ocurred when trying to retweet this"
    end
    redirect_back fallback_location: root_path
  end


  private

    def post_params
      params.require(:tweet).permit(:content)
    end

    def set_post
      @post = current_user.tweets.find(params[:id])
    end

end
