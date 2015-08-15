require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:user) { create(:user) }
  before { sign_in user }

  context '#GET index' do
    before { get :index }

    it 'assigns courses' do
      expect(assigns(:courses)).to match_array(Course.all.to_a)
    end

    context 'on view' do
      render_views
      
      it 'renders the template' do
        expect(response).to render_template(:index)
      end
    end
  end

  context '#GET index format JSON' do
    render_views
    before { get :index, format: :json }

    it 'returns http status 200' do
      expect(response).to be_success
    end

    # it 'renders all courses into json file' do
    #   expect(response.body).to eql(json.in)
    # end
  end

end
