FactoryGirl.define do
  factory :user do
    name 'Jubileu'
    sequence(:email) { |num| "email#{num}@teste.com" }
    password '12345678'

    trait :invalid do
      name nil
    end
  end
end
