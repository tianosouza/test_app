FactoryBot.define do
  factory :member do
    # email { Faker::Internet.email }
    sequence(:email) { |n| "fulano_#{n}@mail.com" }
    password { '123456' }
    password_confirmation { '123456' }
    #confirmed_at { Date.today }
  end
end
