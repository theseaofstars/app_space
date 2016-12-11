class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id:params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:sucess] = "欢迎来到APP Space"
      redirect_to user_path(@user)
    else
      render 'users/new'
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end


  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
