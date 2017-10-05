FactoryGirl.define do
  factory :user do
    email "email@teste.com" 
    sequence(:username) { |n| "teste#{n}" }
    name "Teste"
    password "123456"
    password_confirmation "123456"
  end
end
