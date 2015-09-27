require 'rails_helper'

RSpec.describe FeedController, type: :controller do
  scenario "user cannot see feed unless logged in" do
    visit feed_path

    expect(current_path).to eq(root_path)
  end
end
