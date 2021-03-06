class CommentsController < ApplicationController

  def index
    @article = Article.find(params[:article_id])
    @comments = Comment.where("article_id = ?", params[:article_id]).order("created_at ASC")
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

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
