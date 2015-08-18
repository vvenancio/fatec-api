require 'rails_helper'

RSpec.describe Enterprise, type: :model do
  let(:enterprise) { create(:enterprise) }

  context 'on validations' do
    it 'is valid' do
      expect(enterprise).to be_valid
    end

    context 'on invalid' do
      invalid_enterprise = nil

      after { expect(invalid_enterprise).to be_invalid }

      it 'requires a fantasy_name' do
        invalid_enterprise = build(:enterprise, fantasy_name: nil)
      end

      it 'requires a corporate_name' do
        invalid_enterprise = build(:enterprise, corporate_name: nil)
      end
    end
  end
end
