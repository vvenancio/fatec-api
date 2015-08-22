FactoryGirl.define do
  factory :user do
    name 'Jubileu'
    sequence(:email) { |num| "email#{num}@teste.com" }
    password '12345678'
    role :operator

    trait :invalid do
      name nil
    end

    trait :admin do
      role :admin
    end
  end
end
