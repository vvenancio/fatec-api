class Admin::UsersController < Admin::BaseController
  before_action :find_user, except: [:new, :create, :index]
  before_action :find_roles, except: :show
  before_action :cannot_be_self_destroyed!, only: :destroy

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: 'Salvo com sucesso!'
    else
      render :new, alert: 'Falha ao salvar!'
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(update_params)
      redirect_to admin_user_path, notice: 'Atualizado com sucesso!'
    else
      render :edit, alert: 'Falha ao atualizar!'
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: 'Excluído com sucesso!'
    else
      redirect_to admin_users_path, alert: 'Falha ao excluír!'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end

  def update_params
    params.require(:user).permit(:name, :email, :role)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def find_roles
    @roles = User.roles.keys
  end

  def cannot_be_self_destroyed!
    redirect_to admin_users_path,
                alert: 'Falha ao excluír!' if current_user.id == @user.id
  end
end
