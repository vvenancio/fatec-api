FactoryGirl.define do
  factory :internship do
    enterprise
    publication_time { Time.now }
    start_date { Time.now }
    end_date { Time.now }
    requirements 'Inglês fluente'
    semester 1
    benefits 'Bolsa auxílio de R$ 300,00'
    observation nil
    title 'STARTER GFT'

    after(:build) do |internship|
      ['ADS', 'PM'].each do |course|
        internship.courses << create(:course, name: course)
      end
    end
  end
end
