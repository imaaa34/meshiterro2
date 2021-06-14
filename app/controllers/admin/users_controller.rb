class Admin::UsersController < ApplicationController
  before_action :if_not_admin
  
  def index
    @users = User.all
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
      redirect_to admin_user_path(@user.id)
    else
      render :edit
    end
  end
  
  private
    def if_not_admin
      redirect_to root_path unless current_user.admin?
    end

    def user_params
      params.require(:user).permit(:name, :profile_image)
    end
  
end
