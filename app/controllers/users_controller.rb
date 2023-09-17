class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to posts_path
    else
      flash[:error] = "Failed to create the user."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    pramas.require(:user).permit(:username, :name, :email, :password)
  end
end
