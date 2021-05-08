class CommentsController < ApplicationController

  def index
    @article = Article.find(params[:article_id])
    @comments = Comment.where("article_id = ?", params[:article_id]).order("created_at DESC")
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    puts params.inspect
    redirect_to article_comments_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_comments_path(@article)
  end

  def edit
    @comment = Comment.find(params[:id])
    @article = Article.find(params[:article_id])
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])

    if @article.update(article_params)
      redirect_to article_comments_path()
    else
      render :edit
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
