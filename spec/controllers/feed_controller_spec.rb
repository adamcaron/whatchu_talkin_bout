require 'rails_helper'

RSpec.describe FeedController, type: :controller do
  scenario "user cannot see feed unless logged in" do
    visit feed_path

    expect(current_path).to eq(root_path)
  end

  scenario "#combined_feed" do
    VCR.use_cassette("feed_controller#combined_feed") do
      login_user!


# stub_request(:get, 'https://api.twitter.com/1.1/search/tweets.json').
#   to_return(:status => 200, :body => "", :headers => {})

# stub_request(:any, "https://api.twitter.com/")
# Net::HTTP.get("https://api.twitter.com/", "/")

      get :combined_feed, format: :json,
                          number_of_tweets: 9,
                          legislator_twitter_handles: ["SenCoryGardner", "RepDianaDeGette", "SenBennetCo"]

      expect(a_request(:get, "https://api.twitter.com/")).to have_been_made
    end
  end
end