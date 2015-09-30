require 'rails_helper'

RSpec.describe FeedController, type: :controller do
  scenario "user cannot see feed unless logged in" do
    visit feed_path

    expect(current_path).to eq(root_path)
  end

  # scenario "#combined_feed" do
  #   VCR.use_cassette("feed_controller#combined_feed") do
  #     # login_user!

  #     get :combined_feed, format: :json,
  #                         number_of_tweets: 9,
  #                         legislator_twitter_handles: ["SenCoryGardner", "RepDianaDeGette", "SenBennetCo"]

  #     expect(current_path).to eq(feed_path)
  #   end
  # end
end