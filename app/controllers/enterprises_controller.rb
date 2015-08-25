class EnterprisesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_enterprise, except: [:new, :create, :index]

  def index
    @enterprises = Enterprise.all
  end

  def new
    @enterprise = Enterprise.new
  end

  def create
    @enterprise = Enterprise.new(enterprise_params)

    if @enterprise.save
      redirect_to enterprises_path, notice: 'Salvo com sucesso!'
    else
      render :new, alert: 'Falha ao salvar!'
    end
  end

  def show; end

  def edit; end

  def update
    if @enterprise.update(enterprise_params)
      redirect_to enterprises_path, notice: 'Atualizado com sucesso!'
    else
      render :edit, alert: 'Falha ao atualizar'
    end
  end

  def destroy
    if @enterprise.destroy
      redirect_to enterprises_path, notice: 'Excluído com sucesso!'
    else
      redirect_to enterprises_path, alert: 'Falha ao excluir!'
    end
  end

  private
  def enterprise_params
    params.require(:enterprise).permit(:fantasy_name, :corporate_name, :site)
  end

  def find_enterprise
    @enterprise = Enterprise.find(params[:id])
  end
end
