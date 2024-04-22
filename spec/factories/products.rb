FactoryBot.define do
  factory :product do
    sequence(:description) { |n| "Product #{n}" }
    #description { Faker::Commerce.product_name }
    price { Faker::Commerce.price }
    category 
  end
end
