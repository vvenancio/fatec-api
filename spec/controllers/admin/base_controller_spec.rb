require 'rails_helper'

RSpec.shared_examples 'Routing Error' do

  context 'given an admin request' do
    context 'with not admin role' do
      let(:user) { create(:user) }

      before { sign_in user }

      it 'raises a routing exception' do
        expect { get :index }.to raise_error(ActionController::RoutingError)
      end
    end
  end

end
