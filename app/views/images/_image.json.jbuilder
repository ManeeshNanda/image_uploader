json.extract! image, :id, :image_url, :tagline, :created_date, :created_at, :updated_at
json.url image_url(image, format: :json)
