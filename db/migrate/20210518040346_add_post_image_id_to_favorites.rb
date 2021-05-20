class AddPostImageIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :post_image_id, :integer
  end
end
