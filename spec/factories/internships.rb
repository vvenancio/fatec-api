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
  end
end
