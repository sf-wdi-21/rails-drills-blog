class UsersController < ApplicationController

  before_action :require_login, only: :show

  #
  # GET /user/new
  #
  def new
    @user = User.new
  end

  #
  # GET /user/:id
  #
  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  #
  # POST /users
  #
  def create
    @user = User.new user_params
    if @user.valid?
      @user.save
      login @user
      redirect_to @user, flash: { success: "Welcome, #{@user.email}" }
    else
      # TODO: pass through user.errors.messages
      flash.now[:danger] = "Please fix these errors: #{@user.errors.messages}"
      render :new
    end
  end

  #
  # PUT /users/:id
  #
  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      redirect_to user_path(@user)
    else
      @errors = @user.errors.messages
      render :edit
    end
  end

  #
  # DELETE /user/:id
  #
  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :email_confirmation, :password, :password_confirmation)
  end

end

