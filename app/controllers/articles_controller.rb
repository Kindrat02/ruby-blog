class ArticlesController < ApplicationController
  # before_action :authenticate_user!, only: []
  # before_action :set_story!, only: [:edit, :update, :destroy]
  #Подивитися на авторизацію

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.article.build
  end


  def create
    @article = current_user.article.build(article_params)

    if @article.save
      redirect_to authenticated_root_path
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
      redirect_to authenticated_root_path
    else
      render :edit
    end
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to authenticated_root_path
  end


  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
