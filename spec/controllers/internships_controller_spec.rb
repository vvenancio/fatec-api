require 'rails_helper'

RSpec.describe InternshipsController, type: :controller do
  let(:user) { create(:user) }
  let!(:internship) { create(:internship) }

  before { sign_in user }

  context 'GET #index' do
    let(:internships) do
      internships = [internship]
      internships
    end

    before { get :index, enterprise_id: internship.enterprise.id }

    it 'assigns all internships of its enteprise' do
      expect(assigns(:internships)).to match_array internships
    end

    context 'on view' do
      render_views

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end
  end

  context 'POST #create' do
    context 'params' do
      it do
        is_expected.to permit(
          :publication_time, :start_date, :end_date,
          :requirements, :semester, :benefits, :observation, :title,
          course_ids: []
        ).for(:create, params: {
            enterprise_id: internship.enterprise,
            internship: attributes_for(:internship).merge(
              course_ids: internship.courses.map { |course| course.id }
            )
          }
        )
      end
    end

    context 'on successfull create' do
      it 'persist the new internship' do
        expect do
          post :create, enterprise_id: internship.enterprise,
          internship: attributes_for(:internship).merge(
            course_ids: internship.courses.map { |course| course.id }
          )

          expect(response).to redirect_to enterprise_internships_path(
            internship.enterprise
          )
        end.to change(Internship, :count).by(1)
      end
    end

    context 'on failure' do
      it 'renders new template' do
        expect do
          post :create, enterprise_id: internship.enterprise,
          internship: attributes_for(:internship).merge(
            course_ids: []
          )

          expect(response).to render_template(:new)
        end.to change(Internship, :count).by(0)
      end
    end
  end

  context 'GET #show' do
    before { get :show, enterprise_id: internship.enterprise, id: internship }

    it 'assigns internship' do
      expect(assigns(:internship)).not_to be_nil
    end

    context 'on view' do
      render_views

      it 'renders show template' do
        expect(response).to render_template(:show)
      end
    end
  end

  context 'GET #edit' do
    before { get :edit, enterprise_id: internship.enterprise, id: internship }

    it 'assigns internship' do
      expect(assigns(:internship)).not_to be_nil
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
      it 'updates internships title' do
        patch :update, enterprise_id: internship.enterprise, id: internship,
        internship: { title: 'PAC' }

        internship.reload
        expect(internship.title).to eq('PAC')
      end

      it 'update internship courses' do
        patch :update, enterprise_id: internship.enterprise, id: internship,
        internship: { course_ids: [internship.courses.first.id] }
        element_not_present = internship.courses.select { |e| e.name = 'PM' }
        internship.reload
        expect(internship.courses).not_to include(element_not_present)
      end
    end

    context 'on failure' do
      it 'renders the edit template' do
        patch :update, enterprise_id: internship.enterprise, id: internship,
        internship: { course_ids: [] }

        expect(response).to render_template(:edit)
      end
    end
  end

  context 'DELETE #destroy' do
    it 'redirects to enterprise_internships_path' do
      expect do
        delete :destroy, enterprise_id: internship.enterprise, id: internship

        expect(response).to redirect_to enterprise_internships_path(
          internship.enterprise
        )
      end.to change(Internship, :count).by(-1)
    end
  end
end
