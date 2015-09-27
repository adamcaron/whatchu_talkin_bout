require "rails_helper"

RSpec.feature "User logs in", type: :feature do
  scenario "successfully authenticates with Twitter" do
    VCR.use_cassette("user_logs_in_test#successfully_authenticates_with_twitter") do
      visit root_path
      expect(status_code).to be(200)
      expect(page).to_not have_content("Sign Out")

      login_user!
      click_link "Sign In With Twitter"

      expect(current_path).to eq(feed_path)
      expect(page).to_not have_content("Sign In With Twitter")
      expect(page).to have_content("Sign Out")
    end
  end
end