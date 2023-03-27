class Product < ApplicationRecord
  belongs_to :category
  has_many :product_carts
  has_many :carts, through: :product_carts

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "image_url", "price", "title", "top_sell", "updated_at"]
  end

  def to_param
    title
  end
end
