class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_your_order?, only: [:show]
  
  def show
    @order = Order.find(params[:id])
    @cart = @order.cart
    @order_product_carts = @order.cart.product_carts
  end
end
