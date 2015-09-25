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
          "token"=>"2975056012-JP1tm5dsc3wrsxhBFMAk8v4RmcNewtLmEEhXDuu"
        }
      }
    )
  }

  describe "public class methods" do
    context "responds to its methods" do
      it "responds to 'find_or_create_by'" do
        expect(User).to respond_to(:find_or_create_by)
      end
      # it { expect(factory_instance).to respond_to(:public_method_name) }
    end

    context "executes methods correctly" do
      context "self.find_or_create_by" do
        it "finds or creates user by oauth data" do
          user = User.find_or_create_from_auth(oauth_response)

          expect(user.uid).to eq("2975056012")
          expect(user.provider).to eq("twitter")
          expect(user.nickname).to eq("adamcaron_")
        end
        # it "does what it's supposed to..." do
        #   expect(factory_instance.method_to_test).to eq(value_you_expect)
        # end
      end
    end
  end

  # describe "public instance methods" do
  #   context "responds to its methods" do
  #     it { expect(factory_instance).to respond_to(:public_method_name) }
  #     it { expect(factory_instance).to respond_to(:public_method_name) }
  #       t.string   "chamber"
  #       t.string   "title"
  #       t.string   "first_name"
  #       t.string   "last_name"
  #       t.string   "party"
  #       t.string   "state"
  #       t.string   "statename"
  #       t.string   "twitter_id"
  #       t.string   "website"
  #       t.string   "district"
  #       t.datetime "created_at", null: false
  #       t.datetime "updated_at", null: false
  #   end

  #   context "executes methods correctly" do
  #     context "#method name" do
  #       it "does what it's supposed to..."
  #         expect(factory_instance.method_to_test).to eq(value_you_expect)
  #       end

  #       it "does what it's supposed to..."
  #         expect(factory_instance.method_to_test).to eq(value_you_expect)
  #       end
  #     end
  #   end
  # end


end

