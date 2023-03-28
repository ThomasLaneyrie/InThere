class ApplicationController < ActionController::Base
  before_action :initialize_cart
  before_action :set_q

  def set_q
    @q = Product.ransack(params[:q])
  end

  def initialize_cart
    if current_user != nil
    @current_cart =	Cart.where(user_id: current_user.id).last
              
        if @current_cart == nil
          @current_cart = Cart.create(user_id: current_user.id)
        end
    end
  end

  def is_current_user?
    if current_user == User.find(params[:id])
      return true
    else
      flash[:danger] = "Impossible de consulter un profil qui n'est pas le sien"
      redirect_to root_path
    end
  end

  def is_your_order?
    if (current_user.orders.include?Order.find(params[:id])) == true
      return true
    else
      flash[:info] = "Impossible de consulter cette commande"
      redirect_to root_path
    end
  end

  def cart_belongs_to_you?
    if Cart.find(params[:id]).user == current_user
      return true
    else
      flash[:info] = "Impossible d'accéder à ce panier, redirection vers votre panier"
      redirect_to cart_path(@current_cart.id)
    end
  end

  def is_your_current_cart?
    if @current_cart == current_user.carts.find(params[:id])
      return true
    else
      flash[:info] = "Impossible d'accéder à un ancien panier, redirection vers votre panier actuel"
      redirect_to cart_path(@current_cart.id)
    end
  end

  def check_if_admin
    @user = User.find(current_user.id)
    unless @user.is_admin == true
      redirect_to root_path
      flash[:info] = "Vous ne pouvez pas accéder à cette page, n'étant pas administrateur, désolé !"
    end
  end
  

end
