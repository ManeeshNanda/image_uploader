class AddUserIdAndAlbumIdToImage < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :user_id, :integer, :foreign_key => true
    add_column :images, :album_id, :integer, :foreign_key => true
  end
end
