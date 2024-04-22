FactoryBot.define do
  factory :customer, aliases: [:user, :father] do
    sequence(:name) { |n| "Fulano #{n}" }
    sequence(:email) { |n| "fulano_#{n}@mail.com" }
    adrdress { Faker::Address.street_address }
    # gender [ "M", "F" ].sample
    
    trait :male do
      gender { "M" }
    end

    trait :female do
      gender { "F" }
    end

    trait :customer_vip do      
      vip { true }
      days_to_pay { 30 }
    end

    trait :customer_default do      
      vip { false }
      days_to_pay { 15 }
    end

    trait :with_orthers do
      after(:create) do |customer, evaluation|
        create_list(:order, evaluation.qtt_orthers, customer: customer)
      end
    end

    transient do
      upcased { false }
      qtt_orthers { 3 }
    end

    factory :customer_with_orders, traits: [:with_orthers]
    factory :customer_male, traits: [:male]
    factory :customer_female, traits: [:female]
    factory :customer_vip, traits: [:customer_vip]
    factory :customer_default, traits: [:customer_default]
    factory :customer_male_vip, traits: [:male, :customer_vip]
    factory :customer_female_vip, traits: [:female, :customer_vip]
    factory :customer_male_default, traits: [:male, :default]
    factory :customer_female_default, traits: [:female, :default]

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
    # Callbacks 

      # after(:build)  Depois de ser criado em memoria com build ou create

      # before(:create) Antes de efetivamente salvar

      # after(:create) Depois de efetivamente salvar
    
    #end
  end
end