class SessionsController < ApplicationController

  #
  # GET /login
  #
  def new
    render :new
  end

  #
  # POST /sessions
  #
  def create
    user = User.confirm(user_params)
    if user
      login(user)
      redirect_to user_path(user)
    else
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
