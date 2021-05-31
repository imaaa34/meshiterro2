class PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    user = current_user
    @users = user.followings
    current_user_post_images = PostImage.where(user_id: current_user.id)
    @post_images = []
    if @users.present?
      @users.each do |user|
        user_post_images = PostImage.where(user_id: user.id)
        @post_images.concat(user_post_images)
      end
    end
    @post_images.concat(current_user_post_images)
    @post_images = @post_images.sort_by!{|post_image| post_image.created_at}.reverse
    @page = Kaminari.paginate_array(@post_images).page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end
  
  def edit
    @post_image = PostImage.find(params[:id])
  end
  
  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      redirect_to post_image_path(@post_image.id)
    else
      render :edit
    end
  end

  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
