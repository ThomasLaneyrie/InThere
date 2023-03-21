json.extract! product, :id, :title, :description, :price, :{5-2}, :image_url, :created_at, :updated_at
json.url product_url(product, format: :json)
