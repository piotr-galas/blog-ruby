# Manage articles heart of blog
class ArticlesController < ApplicationController
  before_action :set_article, only: [:destroy, :edit, :update, :show]
  before_action :forbiden_not_owner, only: [:update, :edit, :destroy]

  def index
    @filter = FilterArticleService.new(params)
    @articles = @filter.filter(Article.count_comment)
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.author = current_user

    if @article.save
      redirect_to @article, notice: 'Author was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def edit
  end

  def update
    @article.update(article_params)
    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path(@article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :tag_list, :image)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def owner?(article)
    article.author == current_user
  end

  def forbiden_not_owner
    return if owner? @article
    redirect_back_not_owner
  end
end
