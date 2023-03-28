class Product < ApplicationRecord
  belongs_to :category
  has_many :product_carts
  has_many :carts, through: :product_carts

  def self.ransackable_attributes(auth_object = nil)
    ["description", "price", "title", "color", "brand"]
  end

  def to_param
    title
  end
end
