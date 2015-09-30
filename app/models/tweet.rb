require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper

class Tweet
  attr_reader :profile_img,
              :user_name,
              :user_handle,
              :profile_url,
              :timestamp,
              :text

  def initialize(response)
    @profile_img  = response[:user][:profile_image_url]
    @user_name    = response[:user][:name]
    @user_handle  = response[:user][:screen_name]
    @profile_url  = "https://twitter.com/#{user_handle}"
    @text         = response[:text]
  end
end