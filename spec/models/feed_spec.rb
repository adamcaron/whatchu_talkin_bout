require 'rails_helper'

RSpec.describe Feed, type: :model do

  # let(:oauth_response) {
  #   $oauth_response = OmniAuth::AuthHash.new(
  #     {
  #       "provider"=>"twitter",
  #       "uid"=>"2975056012",
  #       "info"=>
  #       {
  #         "nickname"=>"adamcaron_",
  #         "name"=>"Adam Caron",
  #         "email"=>nil,
  #         "location"=>"Denver, CO",
  #         "image"=>"http://pbs.twimg.com/profile_images/634476865172828161/_CNlNT--_normal.jpg",
  #         "description"=>"Developer and Designer of Software;\nLover of anything that benefits people",
  #         "urls"=> {
  #           "Website"=>nil,
  #           "Twitter"=>"https://twitter.com/adamcaron_"
  #         }
  #       },
  #       "credentials"=> {
  #         "token"=> Figaro.env.APP_OWNER_TWITTER_TOKEN
  #       }
  #     }
  #   )
  # }

  # describe "public class methods" do
  #   context "responds to its methods" do
  #     it "responds to 'service'" do
  #       expect(Feed).to respond_to(:service)
  #     end

  #     it "responds to 'combined_feed'" do
  #       expect(Feed).to respond_to(:combined_feed)
  #     end
  #   end

  #   context "executes methods correctly" do
  #     context "self.service" do
  #       it "responds with a TwitterService object" do
  #         service = Feed.service

  #         expect(service.class).to eq(TwitterService)
  #       end
  #     end

  #     context "self.combined_feed" do
  #       it "responds with " do
  #         VCR.use_cassette('feed#combined_feed') do
  #           login_user!

  #           feed = Feed.combined_feed(9, ["SenCoryGardner", "RepDianaDeGette", "SenBennetCo"])

  #           expect(a_request(:get, "www.example.com").
  #             with(:query => hash_including({
  #               "number_of_tweets" => 9,
  #               legislator_twitter_handles => ["SenCoryGardner", "RepDianaDeGette", "SenBennetCo"]
  #               }))).to have_been_made
  #         end
  #       end
  #     end
  #   end
  # end
end