class ProductCartsController < ApplicationController

  def destroy
    @product_cart = ProductCart.find(params[:id])
    @product_cart.destroy
    redirect_to cart_path(@product_cart.cart)
  end

  def add_quantity
    @product_cart = ProductCart.find(params[:id])
    @product_cart.quantity += 1
    @product_cart.save
    redirect_to cart_path(@product_cart.cart)
  end

  def reduce_quantity
    @product_cart = ProductCart.find(params[:id])
    if @product_cart.quantity > 1 
      @product_cart.quantity -= 1
      @product_cart.save
    end
    redirect_to cart_path(@product_cart.cart)
  end

  def create
    # trouver un produit et le panier courant
    chosen_product = Product.find(params[:product_id])
    current_cart = @current_cart
    # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
      if current_cart.products.include?(chosen_product)
    # Find the line_cart with the chosen_product
        @product_cart = current_cart.product_carts.find_by(:product_id => chosen_product)
    # Iterate the line_item's quantity by one
    # et initialiser la quantité à 0 avant itération
        @product_cart.quantity += 1
      else
        @product_cart = ProductCart.new
        @product_cart.quantity = 1
        @product_cart.cart = current_cart
        @product_cart.product = chosen_product
    end
  # Save and redirect to cart show path
        @product_cart.save
         redirect_to products_path
end


end
