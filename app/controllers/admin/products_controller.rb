class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_root_path
    flash[:success] = "Produit supprimé avec succès de la base de ventes"
  end

  def update
    @product = Product.find(params[:id])
  end

end
