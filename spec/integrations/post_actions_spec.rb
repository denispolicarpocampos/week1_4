require "rails_helper"

feature "post actions" do
    
  given(:user) { create(:user) }
  given(:followed_user) { create(:user) }
  given!(:tweet) { create(:tweet, user: followed_user) }
  given!(:connection) { create(:connection, user: user, followee_id: followed_user.id) }

  background {
    login_as user
  }

  it "like and unlike one" do
    visit timelines_path
    expect(page).to have_content("Tweets")

    expect {
      click_on "Like (#{tweet.likes.count})"
    }.to change(tweet.likes, :count).by(1)

    expect {
      click_on "Unlike (#{tweet.likes.count})"
    }.to change(tweet.likes, :count).by(-1)
  end


  it "retweet one" do
    visit timelines_path
    expect(page).to have_content("Tweets")

    expect {
      click_on "Retweet (#{Tweet.where(retweeted_from: tweet).count})"
    }.to change(Tweet.where(retweeted_from: tweet), :count).by(1)
  end
end
