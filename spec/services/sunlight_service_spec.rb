require "rails_helper"

RSpec.describe SunlightService, :type => :model do
  let(:service) { $service = SunlightService.new }

  it "returns legislators by zip code" do
    VCR.use_cassette('sunlight_service_test#returns_legislators_by_zip_code') do
      # feed_posts = service.feed(ENV["APP_OWNER_IG_TOKEN"])[:data]
      # post       = feed_posts.first

      # assert post.keys.include?(:user)
      # assert post.keys.include?(:comments)
      # assert post.keys.include?(:likes)
      # assert post.keys.include?(:tags)
      legislators = service.legislators_by_zip("80202")[:results]
      legislator  = legislators.first

      assert legislator.keys.include?(:in_office)
      assert legislator.keys.include?(:party)
      assert legislator.keys.include?(:state_name)
      assert legislator.keys.include?(:chamber)
      assert legislator.keys.include?(:first_name)
      assert legislator.keys.include?(:last_name)
    end
  end
end