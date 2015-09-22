class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth(oauth_data)

    if user
      session[:user_id] = user.id
      redirect_to welcome_path
    else
      redirect_to landing_path
    end
  end

  private

  def oauth_data
    request.env['omniauth.auth']
  end
end