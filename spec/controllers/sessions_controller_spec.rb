require 'rails_helper'

RSpec.describe Devise::SessionsController, type: :controller do
  before { @request.env["devise.mapping"] = Devise.mappings[:user] }

  context 'on POST #create' do
    def redirecting_after_login_depending_user_role(user)
      post :create, user: { email: user.email, password: '12345678' }
    end

    context 'admin' do
      it 'redirects to admin dashboard after a successful login' do
        user = create(:user, :admin, password: '12345678')
        redirecting_after_login_depending_user_role(user)
        expect(response).to redirect_to admin_users_path
      end
    end

    context 'not admin' do
      it 'redirects to user dashboard after a successful login' do
        user = create(:user, password: '12345678')
        redirecting_after_login_depending_user_role(user)
        expect(response).to redirect_to courses_path
      end
    end
  end
end
