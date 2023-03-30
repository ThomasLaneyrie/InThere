class ProductWishlistsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit]
  before_action :is_current_user?, only: [:show, :edit]
  
  def destroy
    @product_wishlist = ProductWishlist.find(params[:id])
    @product_wishlist.destroy
    flash[:info] = "Produit retiré de votre wishlist"
    redirect_back(fallback_location: root_path)
  end
end
