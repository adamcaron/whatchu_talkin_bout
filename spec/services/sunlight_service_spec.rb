require "rails_helper"

RSpec.describe SunlightService, :type => :model do
  let(:service) { $service = SunlightService.new }

  it "returns legislators by zip code" do
    VCR.use_cassette('sunlight_service_test#returns_legislators_by_zip_code') do
      legislators = service.legislators(zip: "80202")
      legislator  = legislators.first

      assert legislator.keys.include?(:in_office)
      assert legislator.keys.include?(:party)
      assert legislator.keys.include?(:state_name)
      assert legislator.keys.include?(:chamber)
      assert legislator.keys.include?(:first_name)
      assert legislator.keys.include?(:last_name)
    end
  end

  it "returns legislators by lat / long location" do
    VCR.use_cassette('sunlight_service_test#returns_legislators_by_lat_long') do
      legislators = service.legislators(latitude: "39.7256539", longitude: "-104.9653993")
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