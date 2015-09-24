class LandingController < ApplicationController
  def show
    redirect_to feed_path if current_user
  end
end
