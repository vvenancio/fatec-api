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
  end

  context 'GET #show' do
    render_views
    before { get :show, enterprise_id: internship.enterprise, id: internship }

    it 'renders show template' do
      expect(response).to render_template(:show)
    end
  end
end
