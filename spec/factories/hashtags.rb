FactoryGirl.define do
  factory :hashtag do
    sequence(:content) { |n| "somehash_#{n}" }
  end
end  
