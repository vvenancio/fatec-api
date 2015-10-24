require 'rails_helper'

RSpec.describe NoticesController, type: :controller do
  let(:user) { create(:user) }
  let!(:notice) { create(:notice) }

  before { sign_in user }

  context 'GET #index' do
    let(:notices) { create_list(:notice, 3) << notice }
    before { get :index }

    it 'assigns all notices' do
      expect(assigns(:notices)).to match_array(notices)
    end

    context 'on view' do
      render_views

      it 'renders index template' do
        expect(response).to render_template(:index)
      end
    end
  end

  context 'GET #new' do
    before { get :new }

    it 'instantiates a new notice' do
      expect(assigns(:notice)).to be_a_new(Notice)
    end

    context 'on view' do
      render_views

      it 'renders new template' do
        expect(response).to render_template(:new)
      end
    end
  end

  context 'POST #create' do
    context 'params' do
      it do
        is_expected.to permit(
          :publication_time, :reference, :reduced_description,
          :description, :title, course_ids: []
        ).for(:create, params: {
            notice: attributes_for(:notice).merge(
              course_ids: notice.courses.map { |course| course.id }
            )
          }
        )
      end
    end

    context 'on successfull create' do
      it 'persist the new notice' do
        expect do
          post :create, notice: attributes_for(:notice).merge(
            course_ids: notice.courses.map { |course| course.id }
          )

          expect(response).to redirect_to notices_path
        end.to change(Notice, :count).by(1)
      end
    end

    context 'on failure' do
      it 'renders new template' do
        expect do
          post :create, notice: attributes_for(:notice).merge(
            course_ids: []
          )

          expect(response).to render_template(:new)
        end.to change(Notice, :count).by(0)
      end
    end
  end

  context 'GET #show' do
    before { get :show, id: notice.id }

    it 'assigns notice' do
      expect(assigns(:notice)).not_to be_nil
    end

    context 'on view' do
      render_views

      it 'renders the show template' do
        expect(response).to render_template(:show)
      end

      context 'given a xhr request' do
        before { xhr :get, :show, id: notice.id }

        it 'renders no layout' do
          expect(response).to render_template(layout: false)
        end
      end
    end
  end

  context 'GET #edit' do
    before { get :edit, id: notice.id }

    it 'assigns notice' do
      expect(assigns(:notice)).not_to be_nil
    end

    context 'on view' do
      render_views

      it 'renders the edit template' do
        expect(response).to render_template(:edit)
      end
    end
  end

  context 'PATCH #update' do
    context 'on successfull' do
      it 'updates notice title' do
        patch :update, id: notice, notice: { title: 'PAC' }
        notice.reload
        expect(notice.title).to eq('PAC')
      end

      it 'update notice courses' do
        patch :update, id: notice, notice: { course_ids: [notice.courses.first.id] }
        element_not_present = notice.courses.select { |e| e.name = 'PM' }
        notice.reload
        expect(notice.courses).not_to include(element_not_present)
      end
    end

    context 'on failure' do
      it 'renders the edit template' do
        patch :update, id: notice, notice: { course_ids: [] }

        expect(response).to render_template(:edit)
      end
    end
  end

  context 'DELETE #destroy' do
    it 'redirects to notices_path' do
      expect do
        delete :destroy, id: notice

        expect(response).to redirect_to notices_path()
      end.to change(Notice, :count).by(-1)
    end
  end
end
