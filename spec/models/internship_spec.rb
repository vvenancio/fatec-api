require 'rails_helper'

RSpec.describe Internship, type: :model do
  context 'on validations' do
    let(:valid_internship) { build(:internship) }
    let(:invalid_internship) { build(:internship, title: nil) }

    context 'on associations' do
      it { is_expected.to have_and_belong_to_many(:courses) }
      it { is_expected.to belong_to(:enterprise) }
    end

    context 'on presences' do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_presence_of(:start_date) }
      it { is_expected.to validate_presence_of(:end_date) }
      it { is_expected.to validate_presence_of(:publication_time) }
      it { is_expected.to validate_presence_of(:requirements) }
      it { is_expected.to validate_presence_of(:benefits) }
      it { is_expected.to validate_presence_of(:courses) }
    end

    context 'on ivalid' do
      it 'is valid' do
        expect(valid_internship).to be_valid
      end
    end

    context 'on invalid' do
      it 'is invalid' do
        expect(invalid_internship).to be_invalid
      end
    end
  end
end
