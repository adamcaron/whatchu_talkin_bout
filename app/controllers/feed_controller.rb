class FeedController < ApplicationController
  def show
    redirect_to root_path unless current_user
  end

  def create
    render json: Feed.create(params[:handles], params[:feed_length])
  end
end
