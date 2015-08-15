FactoryGirl.define do
  factory :course do
    abreviation 'ADS'
    name 'Análise e Desenvolvimento de Sistemas'

    trait :invalid do
      name nil
    end 
  end
end