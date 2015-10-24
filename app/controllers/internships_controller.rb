class InternshipsController < ApplicationController
  before_action :find_internship, except: [:index, :new, :create]

  def index
    @internships = Internship.where("enterprise_id = ?", params[:enterprise_id])
                             .order('id DESC')
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
    render :show, layout: false if request.xhr?
  end

  def edit; end

  def update
    if @internship.update(internship_params)
      redirect_to enterprise_internships_path(@internship.enterprise),
                  notice: 'Salvo com sucesso!'
    else
      render :edit, alert: 'Falha ao atualizar'
    end
  end

  def destroy
    message = if @internship.destroy
      { notice: 'Excluido com sucesso!' }
    else
      { altert: 'Falha ao excluir!' }
    end

    redirect_to enterprise_internships_path(@internship.enterprise), message
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

  def find_internship
    @internship = Internship.find(params[:id])
  end
end
