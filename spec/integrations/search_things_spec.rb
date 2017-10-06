require "rails_helper"

feature "search things", js: true do
  login_user
  given!(:tweets) { create_list(:tweet, 3) }
  given!(:user) { create(:user, name: "James tweet") }

  it "returns items with term" do
    visit root_path
    fill_in "search_text", with: "tweet"
    find_field("search_text").native.send_key(:Enter)
    tweets.each do |tweet|
      expect(page).to have_content(tweet.content)
    end
  end


  it "doesn't returns current_user" do
    login_as user  
    visit root_path
    fill_in "search_text", with: "tweet"
    find_field("search_text").native.send_key(:Enter)
    all(".card") do |card|
      expect(card).to_not have_content(user.name)
    end
    page
  end
end
