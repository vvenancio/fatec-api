require 'rails_helper'

RSpec.describe EnterprisesController, type: :controller do
  let(:user) { create(:user) }
  let!(:enterprise) { create(:enterprise) }
  let(:enterprises) { create_list(:enterprise, 3) << enterprise }

  before { sign_in user }

  context 'GET #index' do
    before { get :index }

    it 'assigns enterprises' do
      expect(assigns(:enterprises)).to match_array(enterprises)
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

    it 'builds a new enterprise' do
      expect(assigns(:enterprise)).to be_a_new(Enterprise)
    end

    context 'given a xhr request' do
      before { xhr :get, :new }

      it 'renders no layout' do
        expect(response).to render_template(layout: false)
      end
    end

    context 'on view' do
      render_views

      it 'renders the template' do
        expect(response).to render_template(:new)
      end
    end
  end

  context 'POST #create' do
    context 'on success' do
      it 'persist a new enterprise' do
        expect do
          post :create, enterprise: attributes_for(:enterprise)
          expect(response).to redirect_to enterprises_path
        end.to change(Enterprise, :count).by(1)
      end
    end

    context 'on failure' do
      it 'do not persist an enteprise' do
        expect do
          post :create, enterprise: { fantasy_name: nil }
          expect(response).to render_template(:new)
        end.to change(Enterprise, :count).by(0)
      end
    end
  end

  context 'GET #show' do
    before { get :show, id: enterprise.id }

    it 'assigns enterprise' do
      expect(assigns(:enterprise)).not_to be_nil
    end

    context 'on view' do
      render_views

      it 'renders the template' do
        expect(response).to render_template(:show)
      end
    end
  end

  context 'GET #edit' do
    before { get :edit, id: enterprise.id }

    it 'assigns enterprise' do
      expect(assigns(:enterprise)).not_to be_nil
    end

    context 'on view' do
      render_views

      it 'renders the template' do
        expect(response).to render_template(:edit)
      end
    end
  end

  context 'POST #update' do
    context 'on success' do
      it 'updates an enterprise' do
        patch :update, id: enterprise.id, enterprise: { site: 'globo.com' }
        expect(response).to redirect_to enterprises_path
        enterprise.reload
        expect(enterprise.site).to eq('globo.com')
      end
    end

    context 'on failure' do
      it 'do not update an enterprise' do
        expect do
          patch :update, id: enterprise.id, enterprise: { fantasy_name: nil }
          expect(response).to render_template(:edit)
        end.not_to change(enterprise.reload, :fantasy_name)
      end
    end
  end

  context 'DELETE #destroy' do
    it 'destroys an enterprise' do
      expect do
        delete :destroy, id: enterprise.id
        expect(response).to redirect_to enterprises_path
      end.to change(Enterprise, :count).by(-1)
    end
  end
end
