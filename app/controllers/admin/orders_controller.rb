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
end
