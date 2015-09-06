require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#errors_for' do
    let(:invalid_user) { build(:user, name: nil) }

    context 'given an invalid model' do

      it 'renders the error list' do
        invalid_user.valid?
        html = errors_for(invalid_user)
        expect(html).to include "Name can't be blank"
      end
    end
  end
end
