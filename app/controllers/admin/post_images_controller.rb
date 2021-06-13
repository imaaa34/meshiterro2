class Admin::PostImagesController < ApplicationController
  
  def index
    @post_images = PostImage.all
  end
  
  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end
  
end
