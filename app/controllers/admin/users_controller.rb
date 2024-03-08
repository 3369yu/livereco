class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def destory
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "退会しました。"
    redirect_to :root
  end
  
end
