class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :require_no_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Добро пожаловать в наше приложение!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_no_user
    if logged_in?
      flash[:danger] = "Вы уже вошли в систему"
      redirect_to root_path
    end
  end
end