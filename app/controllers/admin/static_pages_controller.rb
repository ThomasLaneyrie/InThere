class Admin::StaticPagesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin

  def dashboard
    @products = Product.all
    @users = User.all
    @categories = Category.all
  end
end
