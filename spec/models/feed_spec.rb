require 'rails_helper'

RSpec.describe Feed, type: :model do
  describe "public class methods" do

    context "responds to its methods" do
      it "responds to 'service'" do
        expect(Feed).to respond_to(:service)
      end

      it "responds to 'combined_feed'" do
        expect(Feed).to respond_to(:combined_feed)
        expect(Feed).to respond_to(:individual_feed)
      end
    end

    context "executes methods correctly" do
      context "self.service" do
        it "responds with a TwitterService object" do
          service = Feed.service

          expect(service.class).to eq(TwitterService)
        end
      end

      context "self.combined_feed" do
        it "responds with " do
          VCR.use_cassette('feed#combined_feed') do
            feed = Feed.combined_feed(["SenCoryGardner", "RepDianaDeGette", "SenBennetCo"], 9)

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
      end

      context "self.individual_feed" do
        it "responds with " do
          VCR.use_cassette('feed#individual_feed') do
            feed = Feed.individual_feed("RepDianaDeGette", 9)

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