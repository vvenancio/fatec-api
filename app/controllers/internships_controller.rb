class InternshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @internships = Internship.all.includes([:enterprise, :courses])

    respond_to do |format|
      format.json { render json: @internships.order('internships.id desc').to_json(include: [:enterprise, :courses]) }
    end
  end

end
