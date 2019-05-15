class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.text :name
      t.date :created_date

      t.timestamps
    end
  end
end
