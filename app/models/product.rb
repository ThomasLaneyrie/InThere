class Product < ApplicationRecord
  belongs_to :category
  has_many :product_carts
  has_many :carts, through: :product_carts
  has_many :comments
  has_many :product_wishlists
  has_many :wishlists, through: :product_wishlists

  def self.ransackable_attributes(auth_object = nil)
    ["description", "price", "title", "color", "brand"]
  end

  def to_param
    title
  end
  
  def average_note
    comments.average(:note).to_f.round(1)
  end
end
