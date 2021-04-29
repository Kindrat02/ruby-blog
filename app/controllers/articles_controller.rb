class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all.order("created_at DESC")
    @article = Article.new
  end


  def show
    @article = Article.find(params[:id])
  end


  def new
    @article = current_user.article.build
  end


  def create
    @article = current_user.article.build(article_params)

    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end


  def edit
    @article = Article.find(params[:id])
  end


  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end


  private
    def article_params
      params.require(:article).permit(:title, :body)
    end

end
