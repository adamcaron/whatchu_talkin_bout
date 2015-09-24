require 'rails_helper'

RSpec.describe Legislator, type: :model do

  it "has access to the Sunlight service" do
    service = Legislator.service

    expect(service.class).to eq(SunlightService)
  end

  it "returns all legislators for a zipcode" do
    VCR.use_cassette('legislator_test#returns_all_by_zipcode') do
      legislators = Legislator.where(zip: "80202")
      legislator  = legislators.first

      expect(legislators.count).to eq(3)
      expect(legislator.class).to eq(Legislator)
      expect(legislator).to respond_to(:title)
      expect(legislator).to respond_to(:first_name)
      expect(legislator).to respond_to(:last_name)
    end
  end

  it "returns all legislators for a latlong location" do
    VCR.use_cassette('legislator_test#returns_all_by_latlong') do
      legislators = Legislator.where(latitude: "39.7256539", longitude: "-104.9653993")
      legislator  = legislators.first

      expect(legislators.count).to eq(3)
      expect(legislator.class).to eq(Legislator)
      expect(legislator).to respond_to(:title)
      expect(legislator).to respond_to(:first_name)
      expect(legislator).to respond_to(:last_name)
    end
  end
end