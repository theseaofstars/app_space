class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email:params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "欢迎来到App Space"
      log_in user
      redirect_to user_path(user)
    else
      flash.now[:danger] = "邮箱或密码输入错误"
      render 'sessions/new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
