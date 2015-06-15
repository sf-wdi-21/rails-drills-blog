class UsersController < ApplicationController

  #
  # GET /user/new
  #
  def new
    @user = User.new
    render :new
  end

  #
  # GET /user/:id
  #
  def show
    @user = User.find params[:id]
    render :show
  end

  def edit
    @user = User.find params[:id]
    render :edit
  end

  #
  # POST /users
  #
  def create
    @user = User.new user_params
    if @user.save
      login(@user)
      redirect_to user_path(@user)
    else
      @errors = @user.errors.messages
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

