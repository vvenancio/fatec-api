require 'rails_helper'

RSpec.describe Api::V1::InternshipsController, type: :controller do
  context 'GET #index' do
    before { get :index, format: :json }

    it 'has a successfull response' do
      expect(response).to be_success
    end

    it 'renders all courses into json file' do
      expect(response.body).to eq(
        Internship.all.order('id desc').to_json(include: [:enterprise, :courses])
      )
    end
  end
end
