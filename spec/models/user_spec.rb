require 'rails_helper'

RSpec.describe User, type: :model do

  let(:oauth_response) {
    $oauth_response = OmniAuth::AuthHash.new(
      {
        "provider"=>"twitter",
        "uid"=>"2975056012",
        "info"=>
        {
          "nickname"=>"adamcaron_",
          "name"=>"Adam Caron",
          "email"=>nil,
          "location"=>"Denver, CO",
          "image"=>"http://pbs.twimg.com/profile_images/634476865172828161/_CNlNT--_normal.jpg",
          "description"=>"Developer and Designer of Software;\nLover of anything that benefits people",
          "urls"=> {
            "Website"=>nil,
            "Twitter"=>"https://twitter.com/adamcaron_"
          }
        },
        "credentials"=> {
          "token"=> Figaro.env.APP_OWNER_TWITTER_TOKEN
        }
      }
    )
  }

  describe "public class methods" do
    context "responds to its methods" do
      it "responds to 'find_or_create_by'" do
        expect(User).to respond_to(:find_or_create_by)
      end
    end

    context "executes methods correctly" do
      context "self.find_or_create_by" do
        it "finds or creates user by oauth data" do
          user = User.find_or_create_from_auth(oauth_response)

          expect(user.uid).to eq("2975056012")
          expect(user.provider).to eq("twitter")
          expect(user.nickname).to eq("adamcaron_")
        end
      end
    end
  end
end

