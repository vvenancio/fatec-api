require 'rails_helper'

RSpec.describe Api::V1::CoursesController, type: :controller do
  context 'GET #index' do
    before { get :index, format: :json }

    it 'returns http status 200' do
      expect(response).to be_success
    end

    it 'renders all courses into json file' do
      expect(response.body).to eq(Course.all.to_json)
    end
  end
end
