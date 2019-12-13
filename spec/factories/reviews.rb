FactoryBot.define do
  factory :review do
    rating { 1 }
    comment { "This is my firt comment" }
    book
    user
  end
end
