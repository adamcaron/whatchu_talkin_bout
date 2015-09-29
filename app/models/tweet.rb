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
    # @timestamp    = time_ago(Time.parse(response[:created_at]))
    @text         = response[:text]
  end

  private

  # def time_ago(created_at)
  #   from_time = (Time.now - created_at).to_s
  #   time_ago_in_words(from_time)
  # end
end