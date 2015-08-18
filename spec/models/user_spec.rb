require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:invalid_user) { build(:user, :invalid) }

  context 'on validations' do
    context 'on valid' do
      it 'is valid' do
        expect(user).to be_valid
      end
    end

    context 'on invalid' do
      it 'is invalid' do
        expect(invalid_user).to be_invalid
      end
    end
  end

  context 'on roles' do
    it 'must not be empty' do
      expect(User::ROLES).not_to be_empty
    end
  end

end
