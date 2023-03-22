class ProductCartsController < ApplicationController
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
end
