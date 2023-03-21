class Cart < ApplicationRecord
  belongs_to :user
  has_one :order

  has_many :product_carts
  has_many :products, through: :product_carts

  # suite definition pour calculer le total
  def sub_total
    sum = 0
    self.product_carts.each do |product_cart|
      sum+= product_cart.total_price
    end
    return sum
  end
end
