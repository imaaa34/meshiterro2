class Admin::UsersController < ApplicationController
  before_action :if_not_admin
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    
    redirect_to root_path
  end
  
  private
    def if_not_admin
      redirect_to root_path unless current_user.admin?
    end
  
end
