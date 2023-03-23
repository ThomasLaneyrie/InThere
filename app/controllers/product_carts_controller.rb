class ProductCartsController < ApplicationController

  def destroy
    @product_cart = ProductCart.find(params[:id])
    @product_cart.destroy
    redirect_to cart_path(@product_cart.cart)
  end

  def add_quantity
    @product_cart = ProductCart.find(params[:id])
    @product_cart.quantity += 1
    # @product_cart.save
    # redirect_to cart_path(@product_cart.cart)
    respond_to do |format|
      if @product_cart.save
        format.turbo_stream { render turbo_stream: turbo_stream.update('all_product_carts', @product_cart) }
      end 
    end
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