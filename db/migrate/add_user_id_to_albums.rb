class AddUserIdToAlbum < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :user_id, :integer, :foreign_key => true
  end
end
