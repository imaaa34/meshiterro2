class UsersController < ApplicationController
  
  def index
    @users = User.where(is_valid: true)
  end
  
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  # フォロー機能
  def following
    @user = User.find(current_user.id)
    @users = @user.followings
    render 'show_follow'
  end
  
  def follower
    @user = User.find(current_user.id)
    @users = @user.followers
    render 'show_follower'
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
