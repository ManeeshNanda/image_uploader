class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.text :image_url
      t.text :tagline
      t.date :created_date

      t.timestamps
    end
  end
end
