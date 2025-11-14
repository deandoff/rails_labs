class SessionsController < ApplicationController
  before_action :require_no_user, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Добро пожаловать!"
      redirect_back_or about_path
    else
      flash.now[:danger] = "Неверная комбинация email/пароля"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def require_no_user
    if logged_in?
      flash[:danger] = "Вы уже вошли в систему"
      redirect_to root_path
    end
  end
end