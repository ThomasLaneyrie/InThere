class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin

  def index
    @products = Product.all
  end

  def edit
    @products = Product.all
  end

end

