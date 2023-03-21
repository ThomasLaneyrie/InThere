class ApplicationController < ActionController::Base
  before_action :initialize_cart

  def initialize_cart
    if current_user != nil
    @current_cart =	Cart.where(user_id: current_user.id).last
              
        if @current_cart == nil
          @current_cart = Cart.create(user_id: current_user.id)
        end
    end
  end

  def is_your_order?
    if (current_user.orders.include?Order.find(params[:id])) == true
      return true
    else
      flash[:danger] = "Impossible de consulter cette commande"
      redirect_to root_path
    end
  end

  def cart_belongs_to_you?
    if Cart.find(params[:id]).user == current_user
      return true
    else
      flash[:danger] = "Impossible d'accéder à ce panier, redirection vers votre panier"
      redirect_to panier_path(@current_cart.id)
    end
  end

  def is_your_current_cart?
    if @current_cart == current_user.carts.find(params[:id])
      return true
    else
      flash[:danger] = "Impossible d'accéder à un ancien panier, redirection vers votre panier actuel"
      redirect_to panier_path(@current_cart.id)
    end
  end

end
