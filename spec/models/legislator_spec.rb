require 'rails_helper'

RSpec.describe Legislator, type: :model do

  # let(:legislator) { $legislator = Legislator.new }

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

  # describe "public class methods" do
  #   context "responds to its methods" do
  #     it { expect(factory_instance).to respond_to(:public_method_name) }
  #     it { expect(factory_instance).to respond_to(:public_method_name) }
  #   end

  #   context "executes methods correctly" do
  #     context "self.method name" do
  #       it "does what it's supposed to..."
  #         expect(factory_instance.method_to_test).to eq(value_you_expect)
  #       end
  #     end
  #   end
  # end

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