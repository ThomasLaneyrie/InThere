class ProductWishlistsController < ApplicationController
  def destroy
    @product_wishlist = ProductWishlist.find(params[:id])
    @product_wishlist.destroy
    flash[:info] = "Produit retiré de votre wishlist"
    redirect_back(fallback_location: root_path)
  end
end
