require "rails_helper"

RSpec.describe TwitterService, :type => :model do
  let(:service) { $service = TwitterService.new }

  it "returns a feed of Tweets" do
    VCR.use_cassette('twitter_service_test#returns_a_feed_of_tweets') do
      legislators = ["SenCoryGardner", "RepDianaDeGette", "SenBennetCo"]

      response = service.combined_feed(legislators)

      tweet    = response[:statuses].first
      user     = response[:statuses].first[:user]
      expect(tweet.keys).to include(
                              :user,
                              :text)
      expect(user).to       include(
                              :name,
                              :screen_name,
                              :description,
                              :location)
      expect(user[:name]).to be_a(String)
      expect(user[:screen_name]).to     be_a(String)
      expect(user[:description]).to     be_a(String)
      expect(user[:location]).to        be_a(String)
      expect(user[:name]).to_not        be(nil)
      expect(user[:screen_name]).to_not be(nil)
    end
  end
end