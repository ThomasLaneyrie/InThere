class ProductCart < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  
  # Calcul du total de la product_cart, le reste dans le modele cart
  def total_price
    self.quantity * self.product.price
  end  
end
