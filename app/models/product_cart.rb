class ProductCart < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }

  def add_quantity
    @line_cart = LineCart.find(params[:id])
    @line_cart.quantity += 1
    @line_cart.save
    redirect_to panier_path(@line_cart.cart)
  end

  def reduce_quantity
    @line_cart = LineCart.find(params[:id])
    if @line_cart.quantity > 1 
      @line_cart.quantity -= 1
      @line_cart.save
    end
    redirect_to panier_path(@line_cart.cart)
  end


  # Calcul du total de la product_cart, le reste dans le modele cart
  def total_price
    self.quantity * self.product.price
  end  
end
