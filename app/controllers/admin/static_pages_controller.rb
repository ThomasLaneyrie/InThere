class Admin::StaticPagesController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!, :check_if_admin

  def dashboard
    @products = Product.all
    @users = User.all
    @categories = Category.all
  end

  private
  def check_if_admin
    @user = User.find(current_user.id)
    unless @user.is_admin == true
      redirect_to root_path, danger: "Vous ne pouvez pas accéder à cette page, n'étant pas administrateur, désolé !"
    end
  end
end
