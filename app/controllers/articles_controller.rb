class ArticlesController < ApplicationController

  #
  # GET /articles
  # GET /users/:user_id/articles
  #
  def index
    if params[:user_id]
      @user = User.find params[:user_id]
    else
      @articles = Article.all
    end
    render :index
  end

  #
  # GET /users/:user_id/articles/new
  #
  def new
    @article = Article.new
    @user = User.find params[:user_id]
    render :new
  end

  #
  # GET /users/:user_id/articles/:id
  #
  def show
    @user = User.find params[:user_id]
    @article = Article.find params[:id]
    render :show
  end

  #
  # GET /users/:user_id/articles/:id/edit
  #
  def edit
    @user = User.find params[:user_id]
    @article = Article.find params[:id]
    render :edit
  end

  #
  # POST /users/:user_id/articles
  #
  def create
    @user = User.find params[:user_id]
    @article = Article.new article_params
    if @article.save
      redirect_to user_article_path(@user, @article)
    else
      @errors = @article.errors.messages
      render :new
    end
  end

  #
  # PUT /users/:user_id/articles/:id
  #
  def update
    @user = User.find params[:user_id]
    @article = Article.find params[:id]
    if @article.update_attributes article_params
      redirect_to user_article_path(@user, @article)
    else
      @errors = @article.errors.messages
      render :edit
    end
  end

  #
  # DELETE /users/:user_id/articles/:id
  #
  def destroy
    user = User.find params[:user_id]
    article = Article.find params[:id]
    article.destroy
    redirect_to user_articles_path(user)
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :user_id)
  end

end
