json.extract! product, :id, :name, :price, :qty, :desc, :image_url, :created_at, :updated_at
json.url product_url(product, format: :json)
