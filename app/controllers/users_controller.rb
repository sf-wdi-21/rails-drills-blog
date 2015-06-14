class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find params[:id]
    render :show
  end

  def create
    binding.pry
    user = User.create user_params
    binding.pry
    if user
      login(user)
      redirect_to user_path(user)
    else
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end

