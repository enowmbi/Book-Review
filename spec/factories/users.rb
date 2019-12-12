FactoryBot.define do
  factory :user do
   password {"password1"}
   sequence(:email){|n| "john_doe_#{n}@example.com"}   
  end
end
