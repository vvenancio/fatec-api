class Admin::UsersController < Admin::BaseController

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

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end

end
