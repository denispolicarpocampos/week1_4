FactoryGirl.define do
  factory :connection do
    user
    association :followee, factory: :user
  end
end
