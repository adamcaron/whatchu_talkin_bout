require 'rails_helper'

RSpec.describe Feed, type: :model do
  describe "public class methods" do

    context "responds to its methods" do
      it "responds to 'service'" do
        expect(Feed).to respond_to(:service)
      end

      it "responds to 'create'" do
        expect(Feed).to respond_to(:create)
      end
    end

    context "executes methods correctly" do
      context "self.service" do
        it "responds with a TwitterService object" do
          service = Feed.service

          expect(service.class).to eq(TwitterService)
        end
      end

      context "self.create" do
        it "responds with a combined feed when multiple legislators are passed" do
          VCR.use_cassette('feed#create_combined_feed') do
            feed = Feed.create(["SenCoryGardner", "RepDianaDeGette", "SenBennetCo"], 9)

            expect(feed.count).to be(9)
            expect(feed.first.class).to be(Tweet)
            expect(feed.first.instance_variables).to eq([
              :@profile_img,
              :@user_name,
              :@user_handle,
              :@profile_url,
              :@text])
          end
        end

        it "responds with an individual feed when one legislator is passed" do
          VCR.use_cassette('feed#create_individual_feed') do
            feed = Feed.create(["RepDianaDeGette"], 9)

            expect(feed.count).to be(9)
            expect(feed.first.class).to be(Tweet)
            expect(feed.first.instance_variables).to eq([
              :@profile_img,
              :@user_name,
              :@user_handle,
              :@profile_url,
              :@text])
            expect(feed.each { |tweet| tweet.user_handle == "RepDianaDeGette" })
          end
        end
      end

    end

  end
end