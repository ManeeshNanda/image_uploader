class ChangeDateColumnToStringInImageAndAlbum < ActiveRecord::Migration[5.1]
  def change
    change_column :images, :created_date, :string
    change_column :albums, :created_date, :string
  end
end