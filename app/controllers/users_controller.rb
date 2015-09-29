class UsersController < ApplicationController

  before_action :require_login, only: [:show, :edit, :destroy]
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :auth_user?, only: :edit

  # GET /users/new
  def new
    @user = User.new
    @title = "Sign up"
  end

  # GET /users/:id
  def show
  end

  # GET /users/:id/edit
  def edit
    @title = 'Edit profile'
  end

  # POST /users
  def create
    @user = User.new user_params
    if @user.save
      login @user
      redirect_to @user, flash: { success: "Welcome, #{@user.first_name}!" }
    else
      flash.now[:danger] = "Please fix these errors: #{@user.errors.messages}"
      render :new
    end
  end

  # PATCH /users/:id
  def update
    if @user.update user_params
      redirect_to user_path(@user),
        flash: { success: "Changes saved" }
    else
      flash.now[:danger] = "Please fix these errors: #{@user.errors.messages}"
      render :edit
    end
  end

  # DELETE /user/:id
  def destroy
    logout
    @user.destroy
    redirect_to root_path,
        flash: { info: "Fine.  We didn't like you anyway."}
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
      :email_confirmation, :password, :password_confirmation, :avatar)
  end

  def find_user
    @user = User.find params[:id]
  end

  def auth_user?
    # layout: false prevents the application layout page from loading
    # returning false/true stops/allows the action
    unless current_user.id == params[:id]
      render file: 'public/401.html', status: 401, layout: false
      false
    else
      true
    end
  end

end

