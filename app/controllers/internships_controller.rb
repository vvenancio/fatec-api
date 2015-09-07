class InternshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @internships = Internship.where("enterprise_id = ?", params[:enterprise_id])
                             .order('id DESC')

    # respond_to do |format|
    #   format.json {
        #   render json: @internships.order('internships.id desc')
        #                            .to_json(include: [:enterprise, :courses])
        # }
    # end
  end

  def new
    @internship = Internship.new
    set_enterprise
  end

  def create
    @internship = Internship.new(internship_params)
    set_enterprise
    @internship.publication_time = Time.now

    if @internship.save
      redirect_to enterprise_internships_path(@internship.enterprise),
                  notice: 'Salvo com sucesso!'
    else
      render :new, alert: 'Falha ao salvar'
    end
  end

  def show
    @internship = Internship.find(params[:id])
  end

  private
  def internship_params
    params.require(:internship).permit(
      :publication_time, :start_date, :end_date,
      :requirements, :semester, :benefits, :observation, :title,
      :course_ids => []
    )
  end

  def set_enterprise
    @internship.enterprise = Enterprise.find(params[:enterprise_id])
  end
end
