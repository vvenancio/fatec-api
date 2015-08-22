require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:user) { create(:user) }
  let!(:course) { create(:course) }
  let(:courses) { create_list(:course, 3) }

  before { sign_in user }

  context 'when GET #index' do
    before { get :index }

    it 'assigns courses' do
      courses << course
      expect(assigns(:courses)).to match_array(courses)
    end

    context 'on view' do
      render_views
      
      it 'renders the template' do
        expect(response).to render_template(:index)
      end

        context 'when JSON request' do
          before { get :index, format: :json }

          it 'returns http status 200' do
            expect(response).to be_success
          end

          it 'renders all courses into json file' do
            expect(response.body).to eq(Course.all.to_json)
          end
        end
    end
  end

  context 'when GET #new' do
    before { get :new }

    it 'creates a new instance of course' do
      expect(assigns(:course)).to be_a_new(Course)
    end

    context 'on view' do
      render_views

      it 'renders the template' do
        expect(response).to render_template(:new)
      end
    end
  end

  context 'when POST #create' do
    it 'creates a new course' do
      expect do
        post :create, course: attributes_for(:course)
        expect(response).to redirect_to courses_path
      end.to change(Course, :count).by(1)
    end
  end

  context 'when GET #show' do 
    before { get :show, id: course.id }

    context 'on view' do
      render_views

      it 'renders the template' do
        expect(response).to render_template(:show)
      end
    end
  end

  context 'when GET #edit' do
    before { get :edit, id: course.id }

    it 'assigns course' do
      expect(assigns(:course)).not_to be_nil
    end

    context 'on view' do
      render_views

      it 'renders the template' do
        expect(response).to render_template(:edit)
      end
    end
  end

  context 'when PATCH #update' do
    before { patch :update, id: course.id, course: { name: 'Sistemas' } }

    it 'updates a course' do
      course.reload
      expect(course.name).to eq('Sistemas')
    end

    it 'redirects to courses_path' do
      expect(response).to redirect_to courses_path
    end

    context 'on failure' do
      before { patch :update, id: course.id, 
                              course: attributes_for(:course, :invalid) }

      it 'does not update a course' do
        course.reload
        expect(course.name).not_to be_nil
      end

      context 'on view' do
        render_views

        it 'renders the template' do
          expect(response).to render_template(:edit)
        end
      end
    end
  end

  context 'when DELETE #destroy' do
    it 'destroys a course' do
      expect { delete :destroy, id: course.id }.to change(Course, :count).by(-1)
      expect(response).to redirect_to courses_path
    end
  end
end
