class ProductCartsController < ApplicationController
 
  before_action :authenticate_user!, only: [:create]

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
    chosen_product = Product.find(params[:product_id])
    current_cart = @current_cart
    if current_cart.products.include?(chosen_product)
      @product_cart = current_cart.product_carts.find_by(:product_id => chosen_product)
      @product_cart.quantity += 1
    else
      @product_cart = ProductCart.new
      @product_cart.quantity = 1
      @product_cart.cart = current_cart
      @product_cart.product = chosen_product
    end
      @product_cart.save
      redirect_to products_path
  end

end
