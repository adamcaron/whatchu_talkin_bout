class FeedController < ApplicationController
  def show
    redirect_to root_path unless current_user
  end
end
