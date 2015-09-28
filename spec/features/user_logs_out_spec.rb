require "rails_helper"

RSpec.feature "User logs out", type: :feature do
  scenario "logout link goes to welcome page and user is logged out" do
    # VCR.use_cassette("user_logs_out_test#signout_link_goes_to_landing_page_and_user_is_logged_out") do
      visit root_path
      login_user!
      click_link "Sign In With Twitter"

      expect(page).to have_link("Sign Out")
      click_link "Sign Out"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Learn what your elected officials have been discussing.")
      expect(page).to have_link("Sign In With Twitter")
    # end
  end
end