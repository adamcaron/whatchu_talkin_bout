require 'rails_helper'

RSpec.describe FeedController, type: :controller do
  scenario "user cannot see feed unless logged in" do
    visit feed_path

    expect(current_path).to eq(root_path)
  end

  scenario "#combined_feed" do
    VCR.use_cassette("feed_controller#combined_feed") do
      get :combined_feed, format: :json,
                          number_of_tweets: 9,
                          legislator_twitter_handles: ["SenCoryGardner", "RepDianaDeGette", "SenBennetCo"]

      json_tweets = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(json_tweets.count).to be(9)
      expect(json_tweets.first.keys).to eq([
        :profile_img,
        :user_name,
        :user_handle,
        :profile_url,
        :text])
    end
  end
end