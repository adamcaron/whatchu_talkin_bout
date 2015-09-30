require 'rails_helper'

RSpec.describe Tweet, type: :model do

  let(:tweet) { $tweet = Tweet.new(fake_tweet) }

  describe "public instance methods" do
    context "responds to its methods" do
      it { expect(tweet).to respond_to(:profile_img) }
      it { expect(tweet).to respond_to(:user_name) }
      it { expect(tweet).to respond_to(:user_handle) }
      it { expect(tweet).to respond_to(:profile_url) }
      it { expect(tweet).to respond_to(:text) }
    end

    context "executes methods correctly" do
      context "#profile_img" do
        it "returns the user's profile image url" do
          expect(tweet.profile_img).to eq("http://pbs.twimg.com/profile_images/648316555093118976/mVHpRd3x_normal.jpg")
        end
      end

      context "#user_name" do
        it "returns the user's name" do
          expect(tweet.user_name).to eq("Rep. Diana DeGette")
        end
      end

      context "#user_handle" do
        it "return the user's twitter handle" do
          expect(tweet.user_handle).to eq("RepDianaDeGette")
        end
      end

      context "#profile_url" do
        it "returns the url" do
          expect(tweet.profile_url).to eq("https://twitter.com/RepDianaDeGette")
        end
      end

      context "#text" do
        it "returns the tweet body text" do
          expect(tweet.text).to eq("Met w/Sean Bradley of #Denver Metro #UrbanLeague. We talked access to education for ALL &amp;(of course) pics of our kids http://t.co/s0FeVRbokR")
        end
      end
    end
  end

  private

  def fake_tweet
    {:metadata=>{:iso_language_code=>"en", :result_type=>"recent"},
     :created_at=>"Tue Sep 29 21:57:29 +0000 2015",
     :id=>648979939463704576,
     :id_str=>"648979939463704576",
     :text=>
      "Met w/Sean Bradley of #Denver Metro #UrbanLeague. We talked access to education for ALL &amp;(of course) pics of our kids http://t.co/s0FeVRbokR",
     :source=>"<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>",
     :truncated=>false,
     :in_reply_to_status_id=>nil,
     :in_reply_to_status_id_str=>nil,
     :in_reply_to_user_id=>nil,
     :in_reply_to_user_id_str=>nil,
     :in_reply_to_screen_name=>nil,
     :user=>
      {:id=>28599820,
       :id_str=>"28599820",
       :name=>"Rep. Diana DeGette",
       :screen_name=>"RepDianaDeGette",
       :location=>"Denver, CO",
       :description=>
        "Member of Congress, Colorado's 1st Congressional District. Chief Deputy Whip & member of Energy and Commerce Committee.",
       :url=>"http://t.co/ADHTXH6MGD",
       :entities=>
        {:url=>
          {:urls=>
            [{:url=>"http://t.co/ADHTXH6MGD",
              :expanded_url=>"http://www.facebook.com/DianaDeGette",
              :display_url=>"facebook.com/DianaDeGette",
              :indices=>[0, 22]}]},
         :description=>{:urls=>[]}},
       :protected=>false,
       :followers_count=>14877,
       :friends_count=>11558,
       :listed_count=>989,
       :created_at=>"Fri Apr 03 16:41:06 +0000 2009",
       :favourites_count=>93,
       :utc_offset=>-21600,
       :time_zone=>"Mountain Time (US & Canada)",
       :geo_enabled=>false,
       :verified=>true,
       :statuses_count=>1918,
       :lang=>"en",
       :contributors_enabled=>false,
       :is_translator=>false,
       :is_translation_enabled=>false,
       :profile_background_color=>"B2DFDA",
       :profile_background_tile=>false,
       :profile_image_url=>"http://pbs.twimg.com/profile_images/648316555093118976/mVHpRd3x_normal.jpg",
       :profile_image_url_https=>"https://pbs.twimg.com/profile_images/648316555093118976/mVHpRd3x_normal.jpg",
       :profile_banner_url=>"https://pbs.twimg.com/profile_banners/28599820/1398803462",
       :profile_link_color=>"93A644",
       :profile_sidebar_border_color=>"FFFFFF",
       :profile_sidebar_fill_color=>"FFFFFF",
       :profile_text_color=>"333333",
       :profile_use_background_image=>true,
       :has_extended_profile=>false,
       :default_profile=>false,
       :default_profile_image=>false,
       :following=>false,
       :follow_request_sent=>false,
       :notifications=>false},
     :geo=>nil,
     :coordinates=>nil,
     :place=>nil,
     :contributors=>nil,
     :is_quote_status=>false,
     :retweet_count=>4,
     :favorite_count=>3,
     :entities=>
      {:hashtags=>[{:text=>"Denver", :indices=>[22, 29]}, {:text=>"UrbanLeague", :indices=>[36, 48]}],
       :symbols=>[],
       :user_mentions=>[],
       :urls=>[],
       :media=>
        [{:id=>648979934292000768,
          :id_str=>"648979934292000768",
          :indices=>[122, 144],
          :media_url=>"http://pbs.twimg.com/media/CQGjz9HUwAA4BGx.jpg",
          :media_url_https=>"https://pbs.twimg.com/media/CQGjz9HUwAA4BGx.jpg",
          :url=>"http://t.co/s0FeVRbokR",
          :display_url=>"pic.twitter.com/s0FeVRbokR",
          :expanded_url=>"http://twitter.com/RepDianaDeGette/status/648979939463704576/photo/1",
          :type=>"photo",
          :sizes=>
           {:small=>{:w=>340, :h=>191, :resize=>"fit"},
            :thumb=>{:w=>150, :h=>150, :resize=>"crop"},
            :medium=>{:w=>600, :h=>337, :resize=>"fit"},
            :large=>{:w=>1024, :h=>576, :resize=>"fit"}}}]},
     :favorited=>false,
     :retweeted=>false,
     :possibly_sensitive=>false,
     :lang=>"en"}
  end
end

