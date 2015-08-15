require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:course) { create(:course) }
  let(:invalid_course) { build(:course, :invalid) }

  context 'on validations' do
    context 'on valid' do
      it 'is valid' do
        expect(course).to be_valid
      end

      it 'is persisted' do
        expect(course).to be_persisted
      end
    end

    context 'on invalid' do
      it 'is invalid' do
        expect(invalid_course).to be_invalid
      end

      it 'is not persisted' do
        expect(invalid_course).not_to be_persisted
      end
    end
  end
end
