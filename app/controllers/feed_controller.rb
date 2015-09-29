class FeedController < ApplicationController
  def show
    redirect_to root_path unless current_user
  end

  def combined_feed
    feed_length = params[:number_of_tweets]
    legislators = params[:legislator_twitter_handles]
    render json: Feed.combined_feed(feed_length, legislators)
  end
end
