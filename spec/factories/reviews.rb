FactoryBot.define do
  factory :review do
    rating { 1 }
    comment { "MyText" }
    book { nil }
  end
end
