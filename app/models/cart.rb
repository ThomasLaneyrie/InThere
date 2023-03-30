class Cart < ApplicationRecord
  belongs_to :user
  has_one :order

  has_many :product_carts
  has_many :products, through: :product_carts

  def sub_total
    sum = 0
    self.product_carts.each do |product_cart|
      sum+= product_cart.total_price
    end
    return sum
  end

  def number_products
    number = 0
    self.product_carts.each do |product_cart|
      number += product_cart.quantity
    end
    return number
  end
end
