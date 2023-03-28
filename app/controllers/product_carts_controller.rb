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
    respond_to do |format| 
      if @product_cart.save 
        format.turbo_stream do 
          render turbo_stream: [turbo_stream.update("number_products_cart", @current_cart.number_products), 
                                turbo_stream.replace("product_cart_#{@product_cart.id}", @product_cart)]
        end
      end 
    end
  end

  def reduce_quantity
    @product_cart = ProductCart.find(params[:id])
    if @product_cart.quantity > 1 
      @product_cart.quantity -= 1
      
    end
    respond_to do |format| 
      if @product_cart.save 
        format.turbo_stream { render turbo_stream: turbo_stream.replace("product_cart_#{@product_cart.id}", @product_cart) } 
      end 
    end
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
    
    respond_to do |format|
      if @product_cart.save 
        format.turbo_stream { render turbo_stream: turbo_stream.update("number_products_cart", @current_cart.number_products) } 
      end 
    end
  end

end
