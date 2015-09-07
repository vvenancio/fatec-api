class Api::V1::InternshipsController < Api::V1::BaseController
  def index
    respond_with Internship.all.order('id desc')
                           .to_json(include: [:enterprise, :courses])
  end
end
