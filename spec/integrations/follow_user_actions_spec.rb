require "rails_helper"

feature "follow user actions" do

  login_user
  let(:user) { create(:user) }
  let(:connection) { create(:connection, user: login_user) }

  context "when user is not followed" do
    scenario "click on Follow button must back to user show page" do
      visit user_path(user)
      expect(page).to have_content("Follow")
      find(".follow-button").click
      expect(page.current_path).to eq user_path(user)
      expect(page).to have_content("Unfollow")
    end

    scenario "click on Unfollow button must back to user show page" do
      visit user_path(connection.followee)
      expect(page).to have_content("Unfollow")
      find(".follow-button").click
      expect(page.current_path).to eq user_path(connection.followee)
      expect(page).to have_content("Follow")
    end
  end
end
