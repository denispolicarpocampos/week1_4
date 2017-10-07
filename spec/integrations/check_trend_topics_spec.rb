require "rails_helper"

feature "check trend topics" do
  
  login_user
  given(:hashtag_1) { create(:hashtag) }
  given(:hashtag_2) { create(:hashtag) }
  given!(:hashtah_2_tweets) { create_list(:tweet_hashtag, 3, hashtag: hashtag_2) } 
  given!(:hashtag_1_tweets) { create_list(:tweet_hashtag, 5, hashtag: hashtag_1) }


  it "returns hashtags and its appearance counting on tweets" do
    visit trend_topics_path
    expect(page).to have_content("##{hashtag_1.content}")
    expect(page).to have_content("##{hashtag_2.content}")
    expect(page).to have_content("##{hashtag_1.content} appears in 5 tweets")
    expect(page).to have_content("##{hashtag_2.content} appears in 3 tweets")
  end
end
