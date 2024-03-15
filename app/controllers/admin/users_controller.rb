class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destory
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "退会しました。"
    redirect_to :root
  end

  private
   def user_params
    params.require(:user).permit(:name, :profile_image)
   end

end
