class HomeController < ApplicationController
  def landing
  end

  def welcome
    render :landing unless current_user
  end

  def search_results

  end

  def discussion

  end
end
