class ArticlesController < ApplicationController

  def index
    @articles = current_user.articles
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to @article, :notice => "Request completed"
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to articles_path, :notice => "Request completed"
    else
      redirect_to articles_path, :alert => "An error occured."
    end
  end

  private
  def article_params
    params.require(:article).permit(:level, :title, :content)
  end
end