FactoryGirl.define do
  factory :notice do
    title 'Semana da tecnologia'
    reduced_description 'AHUSASASUSUAHUAHSDUAUSDUHASDUHDAHUS'
    description 'AUSHUASHAS'
    publication_time { Time.now }
    reference ''

    after(:build) do |internship|
      ['ADS', 'PM'].each do |course|
        internship.courses << create(:course, name: course)
      end
    end
  end
end
