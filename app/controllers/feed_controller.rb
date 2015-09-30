class FeedController < ApplicationController
  def show
    redirect_to root_path unless current_user
  end

  def combined_feed
    render json: Feed.combined_feed(params[:feed_length], params[:handles])
  end

  def individual_feed
    render json: Feed.individual_feed(params[:feed_length], params[:handle])
  end
end
