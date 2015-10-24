class NoticesController < ApplicationController
  before_action :find_notice, except: [:index, :new, :create]

  def index
    @notices = Notice.all.order(id: :desc)
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)
    @notice.publication_time = Time.now

    if @notice.save
      redirect_to notices_path, notice: 'Salvo com sucesso!'
    else
      render :new, alert: 'Falha ao salvar!'
    end
  end

  def show
    render :show, layout: false if request.xhr?
  end

  def edit; end

  def update
    if @notice.update(notice_params)
      redirect_to notices_path, notice: 'Atualizado com sucesso'
    else
      render :edit, alert: 'Falha ao atualizar'
    end
  end

  def destroy
    message = if @notice.destroy
      { notice: 'Excluido com sucesso!' }
    else
      { altert: 'Falha ao excluir!' }
    end

    redirect_to notices_path, message
  end

  private
  def notice_params
    params.require(:notice).permit(
      :publication_time, :reference, :reduced_description,
      :description, :title, course_ids: []
    )
  end

  def find_notice
    @notice = Notice.find(params[:id])
  end
end
