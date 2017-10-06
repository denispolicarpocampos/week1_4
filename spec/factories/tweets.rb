FactoryGirl.define do
  factory :tweet do
    content "My tweet"
    user
  end
end
