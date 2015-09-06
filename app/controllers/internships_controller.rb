class InternshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @internships = Internship.where("enterprise_id = ?", params[:enterprise_id])

    # respond_to do |format|
    #   format.json { render json: @internships.order('internships.id desc').to_json(include: [:enterprise, :courses]) }
    # end
  end

  def new
    @internship = Internship.new
    @internship.enterprise = Enterprise.find(params[:enterprise_id])
  end

  def create

  end

end
