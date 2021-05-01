class UsersController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.where("user_id = ?", current_user.id).order("created_at DESC").paginate(:page => params[:page], :per_page=>3)
    @user = current_user
    @users = User.all
  end

  def show
    @articles = Article.where(:user_id => params[:id]).order("created_at DESC").paginate(:page => params[:page], :per_page=>3)
    @user = User.find(params[:id])
    @users = User.all
  end
end
