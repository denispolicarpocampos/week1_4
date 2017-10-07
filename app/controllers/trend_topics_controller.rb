class TrendTopicsController < ApplicationController
  def index
    @trend_topics = Hashtag.joins(:tweets).group("hashtags.content").order("COUNT(tweets.id) DESC")
                    .pluck("hashtags.content, COUNT(tweets.id)").to_h
  end
end
