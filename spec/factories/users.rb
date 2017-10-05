FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@teste.com"}
    sequence(:username) { |n| "teste#{n}" }
    name "Teste"
    password "123456"
    password_confirmation "123456"
  end
end
