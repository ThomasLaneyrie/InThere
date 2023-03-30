class Admin::OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :check_if_admin

    def index
        @orders = Order.all
    end

    def show
        @order = Order.find(params[:id])
        @cart = @order.cart
    end

    def destroy
        order = Order.find(params[:id])
        order.destroy
        redirect_to admin_orders_path, notice: "order #{order.id} has been deleted."
      end
end
