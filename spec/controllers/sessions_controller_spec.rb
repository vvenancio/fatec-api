require 'rails_helper'

RSpec.describe Devise::SessionsController, type: :controller do
  let(:user) { create(:user) }

  context 'on POST #create' do
    context 'on admin' do
      it 'redirects to courses_path' do
        expect do
          post :create, user: attributes_for(:user)
          expect(response).to redirect_to courses_path
        end
      end
    end

    context 'on not admin' do
    end
  end

end