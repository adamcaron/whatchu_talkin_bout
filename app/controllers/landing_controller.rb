class LandingController < ApplicationController
  def show
    redirect_to feed_path if current_user
  end

  # def landing
  # end

  # def welcome
  #   render :landing unless current_user
  # end

  # def search_results

  # end

  # def discussion

  # end
end
