FactoryGirl.define do
  factory :tweet do
    content "My tweet"
    user
  end

  factory :tweet_with_hashtag, class: Tweet do
    content "Tweet with #hashtag"
    user
  end

end
