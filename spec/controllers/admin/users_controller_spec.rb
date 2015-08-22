require 'rails_helper'
require_relative 'base_controller_spec'

RSpec.describe Admin::UsersController, type: :controller do
  let(:user) { create(:user, :admin) }
  before { sign_in user }

  describe 'authentication for admin' do
    it_behaves_like 'Routing Error'
  end

  context 'GET #index' do
    before { get :index }

    let(:users_list) do
      create_list(:user, 3) << user
    end

    it 'assigns @user' do
      expect(assigns(:users)).to match_array(users_list)
    end

    context 'on view' do
      render_views

      it 'renders the template' do
        expect(response).to render_template(:index)
      end
    end
  end

  context 'GET #new' do
    before { get :new }

    it 'assigns new user' do
      expect(assigns(:user)).to be_a_new(User)
    end

    context 'on view' do
      render_views

      it 'renders the template' do
        expect(response).to render_template(:new)
      end
    end
  end

  context 'POST #create' do
    context 'params' do
      it do
        is_expected.to permit(
          :name, :email, :password, :role
          ).for(:create, params: { user: attributes_for(:user) })
      end
    end

    it 'creates a new user' do
      expect do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to admin_users_path
      end.to change(User, :count).by(1)
    end

    context 'on failure' do
      it 'does not create an user' do
        expect do
          post :create, user: attributes_for(:user, role: nil)
          expect(response).to render_template(:new)
        end.to change(User, :count).by(0)
      end
    end
  end

end
