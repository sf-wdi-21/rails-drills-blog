class ArticlesController < ApplicationController

  before_action :require_login
  before_action :find_user, only: [:new, :create]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /users/:user_id/articles/new
  def new
    @article = Article.new
    @title = 'New article'
  end

  # GET /articles/:id
  def show
    # Alchemy API
    # if @article.tags.empty? && @article.content.split.size > 100
    #   @article.get_keywords
    #   ...
    # end
  end

  # GET /articles/:id/edit
  def edit
    @user = @article.user
    @title = 'Edit article'
  end

  # POST /users/:user_id/articles
  def create
    @article = Article.new article_params
    if @article.save
      @user.articles << @article
      redirect_to article_path(@article),
        flash: { success: "Article published!" }
    else
      flash.now[:warning] = "Something went wrong"
      render :new
    end
  end

  # PATCH /articles/:id
  def update
    if @article.update article_params
      redirect_to article_path(@article),
        flash: { success: "Changes saved" }
    else
      flash.now[:danger] = "Please fix the following errors: "
      render :edit
    end
  end

  # DELETE /articles/:id
  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_user
    @user = User.find params[:user_id]
  end

  def find_article
    @article = Article.find params[:id]
  end

end
