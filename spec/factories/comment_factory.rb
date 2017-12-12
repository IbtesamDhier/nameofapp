FactoryBot.define do
  factory :comment do
    sequence(:body) { |n| "comment body #{n}" }
    rating [1, 2, 3, 4, 5].sample
    user
    product
  end
end