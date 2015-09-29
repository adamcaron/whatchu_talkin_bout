class FeedController < ApplicationController
  def show
    redirect_to root_path unless current_user
  end

  def combined_feed
    number_of_tweets = params[:number_of_tweets]
    render json: Feed.combined_feed(number_of_tweets)
  end
end
