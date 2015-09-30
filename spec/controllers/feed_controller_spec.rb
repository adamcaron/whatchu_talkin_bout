require 'rails_helper'

RSpec.describe FeedController, type: :controller do
  context "user not logged in" do
    it "doesn't show the feed" do
      visit feed_path

      expect(current_path).to eq(root_path)
    end
  end

  context "#create" do
    it "returns a combined feed for multiple legislators" do
      VCR.use_cassette("feed_controller#create_combined_feed") do
        get :create,
              format:      :json,
              feed_length: 9,
              handles:     ["SenCoryGardner", "RepDianaDeGette", "SenBennetCo"]

        tweets = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:success)
        expect(tweets.count).to be(9)
        expect(tweets.first.keys).to eq([
              :profile_img,
              :user_name,
              :user_handle,
              :profile_url,
              :text])
      end
    end

    it "returns an individual feed for one legislator" do
      VCR.use_cassette("feed_controller#create_individual_feed") do
        get :create,
              format:      :json,
              feed_length: 9,
              handles:     ["RepDianaDeGette"]

        tweets = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:success)
        expect(tweets.count).to be(9)
        expect(tweets.first.keys).to eq([
              :profile_img,
              :user_name,
              :user_handle,
              :profile_url,
              :text])
        expect(tweets.each { |tweet| tweet[:user_handle] == "RepDianaDeGette" })
      end
    end
  end

  # scenario "#individual_feed" do
  #   VCR.use_cassette("feed_controller#individual_feed") do
  #     get :combined_feed,
  #           format:      :json,
  #           feed_length: 9,
  #           handle:     "RepDianaDeGette"

  #     tweets = JSON.parse(response.body, symbolize_names: true)

  #     expect(response).to have_http_status(:success)
  #     expect(tweets.count).to be(9)
  #     expect(tweets.first.keys).to eq([
  #           :profile_img,
  #           :user_name,
  #           :user_handle,
  #           :profile_url,
  #           :text])
  #     expect(tweets.each { |tweet| tweet[:user_handle] == "RepDianaDeGette" })
  #   end
  # end
end