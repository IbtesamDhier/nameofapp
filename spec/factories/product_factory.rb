FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "product #{n}" }
    sequence(:description) { |n| "product description #{n}" }
    sequence(:colour) { |n| "product colour #{n}" }
    price 50
  end
end