class ArticlesController < ApplicationController

  before_action :require_login
  before_action :find_user, only: [:new, :create]

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /users/:user_id/articles/new
  def new
    @article = Article.new
  end

  # GET /articles/:id
  def show
    @article = Article.find params[:id]
  end

  # GET /articles/:id/edit
  def edit
    @article = Article.find params[:id]
  end

  # POST /users/:user_id/articles
  def create
    @article = Article.new article_params
    if @article.save
      @user.articles << @article
      redirect_to article_path(@article)
    else
      flash.now[:warning] = "Something went wrong"
      render :new
    end
  end

  # PATCH /articles/:id
  def update
    @article = Article.find params[:id]
    if @article.update_attributes article_params
      redirect_to user_article_path(@user, @article)
    else
      @errors = @article.errors.messages
      render :edit
    end
  end

  # DELETE /articles/:id
  def destroy
    Article.find(params[:id]).destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_user
    @user = User.find params[:user_id]
  end

end
