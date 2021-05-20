class RemovePostImageFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :post_image, :integer
  end
end
