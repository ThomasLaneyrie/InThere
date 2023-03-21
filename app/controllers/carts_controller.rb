class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show]
  before_action :cart_belongs_to_you?, only: [:show]
  before_action :is_your_current_cart?, only: [:show]

  def show
    @cart = Cart.find(params[:id])
    @render_cart = false
  end
 
  def create
    Cart.find_by(user_id: current_user.id)   
    if @cart.nil?
      @cart = Cart.create(user_id: current_user.id)
    end		
  end
end
