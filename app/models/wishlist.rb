class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :product_wishlists
  has_many :products, through: :product_wishlists
end
